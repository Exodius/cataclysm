/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ObjectMgr.h"
#include "SpellScript.h"

enum Kezan
{
    // Buccaneers
    SPELL_ENTER_BUCCANEER           = 70016,
    SPELL_INVISIBILITY              = 90366,

    // Party spells
    SPELL_HORS_DOEUVRES             = 66913,
    SPELL_BUCKET                    = 66910,
    SPELL_BUBBLY                    = 66909,
    SPELL_DANCE                     = 66911,
    SPELL_FIREWORKS                 = 66912,
    SPELL_NPC_HORS_DOEUVRES         = 75050,
    SPELL_NPC_FIREWORKS             = 75048,
    SPELL_NPC_DANCE                 = 75046,
    SPELL_NPC_BUCKET                = 75044,
    SPELL_NPC_BUBBLY                = 75042,
    SPELL_HAPPY_PARTYGOER           = 66916,

    // Bank theft
    SPELL_VAULT_BUNNY_VEHICLE       = 67488,
    SPELL_VAULT_POWER_CORRECT       = 67493,
    SPELL_VAULT_POWER_INCORRECT     = 67494,
    SPELL_VAULT_DRILL_AURA          = 67495,
    SPELL_VAULT_EXPLOSIVE_AURA      = 67496,
    SPELL_VAULT_LISTEN_AURA         = 67497,
    SPELL_VAULT_LOCKPICK_AURA       = 67498,
    SPELL_VAULT_G_RAY_AURA          = 67499,
    SPELL_VAULT_AMAZING_G_RAY       = 67526,
    SPELL_VAULT_BLASTCRACKERS       = 67508,
    SPELL_VAULT_EAR_O_SCOPE         = 67524,
    SPELL_VAULT_INFINIFOLD_LOCKPICK = 67525,
    SPELL_VAULT_KAJAMITE_DRILL      = 67522,
    SPELL_VAULT_TIMER               = 67502,
    SPELL_VAULT_ENTER_VEHICLE       = 67476,

    // Gasbot
    SPELL_SUMMON_GASBOT             = 70252,
    SPELL_GAS_STREAM                = 70256,

    // NPCs
    NPC_BUCCANEER                   = 37114,
    NPC_KEZAN_PARTYGOER             = 35175,
    NPC_BUCCANEER_VEHICLE           = 37179,
    NPC_VAULT_VEHICLE               = 35486,
    NPC_HOT_ROD                     = 34840,

    // Quests
    QUEST_447                       = 14125,

    // GameObjects
    GAMEOBJECT_SMALL_ORE            = 195492,
};

uint32 const buccaneerSpells[] =
{
    69971, 69976, 69977, 69978, 69979, 69980, 69981, 69982,
};

uint32 const partyAuras[] =
{
    SPELL_NPC_HORS_DOEUVRES, SPELL_NPC_BUCKET, SPELL_NPC_BUBBLY, SPELL_NPC_DANCE, SPELL_NPC_FIREWORKS,
};

uint32 const partyPlayerAuras[] =
{
    SPELL_HORS_DOEUVRES, SPELL_BUCKET, SPELL_BUBBLY, SPELL_DANCE, SPELL_FIREWORKS,
};

uint32 const hommies[] =
{
    34957, 34958, 34959,
};

uint32 const hommiesAuras[2][3] =
{
    { 66403, 66404, 66405 }, // Invis auras
    { 66597, 66599, 66600 }, // NPC summon
};

uint32 const vaultAuras[] =
{
    SPELL_VAULT_DRILL_AURA, SPELL_VAULT_EXPLOSIVE_AURA, SPELL_VAULT_LISTEN_AURA, SPELL_VAULT_LOCKPICK_AURA, SPELL_VAULT_G_RAY_AURA,
};

uint32 const vaultSpells[] =
{
    SPELL_VAULT_KAJAMITE_DRILL, SPELL_VAULT_BLASTCRACKERS, SPELL_VAULT_EAR_O_SCOPE, SPELL_VAULT_INFINIFOLD_LOCKPICK, SPELL_VAULT_AMAZING_G_RAY
};

Position const buccaneerSpawnPoint = {-8286.958984f, 1484.732910f, 43.765240f, 0.0f };
Position const gasbotMovePosition = { -8422.15f, 1367.72f, 104.677f, 0.0f };

class npc_kezan_hommies : public CreatureScript
{
    public:
        npc_kezan_hommies() : CreatureScript("npc_kezan_hommies")
        {
        }

        struct npc_kezan_hommiesAI : public ScriptedAI
        {
            npc_kezan_hommiesAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            void MoveInLineOfSight(Unit* who)
            {
                if (who && me->IsInRange(who, 0.0f, 5.0f, true) && who->GetEntry() == NPC_HOT_ROD)
                {
                    if (Player* passenger = who->GetOwner()->ToPlayer())
                    {
                        for (uint8 n = 0; n < 3; ++n)
                        {
                            if (me->GetEntry() != hommies[n])
                                continue;

                            passenger->CastSpell(passenger, hommiesAuras[1][n], true);
                            passenger->KilledMonsterCredit(me->GetEntry());
                            me->CastSpell(me, hommiesAuras[0][n], true);
                        }
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_kezan_hommiesAI(creature);
        }
};

class npc_kezan_partygoer : public CreatureScript
{
    public:
        npc_kezan_partygoer() : CreatureScript("npc_kezan_partygoer")
        {
        }

        struct npc_kezan_partygoerAI : public ScriptedAI
        {
            npc_kezan_partygoerAI(Creature* creature) : ScriptedAI(creature)
            {
                auraCheck = 150000;
                ApplyAura();
            }

            uint32 auraCheck;
            uint8 randAura;

            void UpdateAI(uint32 diff)
            {
                if (auraCheck <= diff)
                {
                    me->RemoveAurasDueToSpell(SPELL_HAPPY_PARTYGOER, me->GetGUID());
                    me->RemoveAurasDueToSpell(partyAuras[randAura]);
                    ApplyAura();
                    auraCheck = 150000;
                }
                else
                    auraCheck -= diff;
            }

            void ApplyAura()
            {
                randAura = urand(0, 4);
                me->AddAura(partyAuras[randAura], me);
            }

            void SpellHit(Unit* who, SpellInfo const* spell)
            {
                Player* player = who->ToPlayer();
                if (!player)
                    return;

                if (me->HasAura(partyAuras[randAura]) && spell->Id == partyPlayerAuras[randAura])
                {
                    player->KilledMonsterCredit(NPC_KEZAN_PARTYGOER);
                    me->RemoveAurasDueToSpell(partyAuras[randAura]);
                    me->CastSpell(me, SPELL_HAPPY_PARTYGOER, true);
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_kezan_partygoerAI(creature);
        }
};

/*class npc_kezan_vault : public CreatureScript
{
    public:
        npc_kezan_vault() : CreatureScript("npc_kezan_vault")
        {
        }

        struct npc_kezan_vaultAI : public ScriptedAI
        {
            npc_kezan_vaultAI(Creature* creature) : ScriptedAI(creature)
            {
                sLog->outInfo(LOG_FILTER_TSCR, "InitializeAI");
                //if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                //{
                //    sLog->outInfo(LOG_FILTER_TSCR, "summoner");
                //    if (me->GetCharmer())
                //    {
                //        sLog->outInfo(LOG_FILTER_TSCR, "charmer");
                //        me->RemoveCharmedBy(summoner);
                //    }
                //}
                me->IsAIEnabled = true;
            }

            uint32 startTimer;
            uint32 checkTimer;
            uint8 randomAura;

            void Reset()
            {
                sLog->outInfo(LOG_FILTER_TSCR, "Reset()");
                startTimer = 10000;
                checkTimer = 5000;
            }

            //void PassengerBoarded(Unit* who, int8 seatId, bool apply)
            //{
            //    sLog->outInfo(LOG_FILTER_TSCR, "Passenger Boarded");
            //    if (apply && who && me->GetCharmer())
            //    {
            //        sLog->outInfo(LOG_FILTER_TSCR, "charmed - before");
            //        me->RemoveCharmedBy(who);
            //        sLog->outInfo(LOG_FILTER_TSCR, "charmed - passed");
            //    }
            //}

            void ApplyRandomAura()
            {
                sLog->outInfo(LOG_FILTER_TSCR, "ApplyRandomAura");
                randomAura = urand(0, 4);
                me->AddAura(vaultAuras[randomAura], me);
            }

            void SpellHit(Unit* who, SpellInfo const* spell)
            {
                sLog->outInfo(LOG_FILTER_TSCR, "SpellHit %s, %u", who->GetName(), spell->Id);
                bool vaultSpell = false;
                for (uint8 n = 0; n < 5; ++n)
                    if (spell->Id == vaultSpells[n])
                        vaultSpell = true;
                if (!vaultSpell)
                    return;
                if (me->HasAura(vaultAuras[randomAura]) && spell->Id == vaultSpells[randomAura])
                    me->CastSpell(me, SPELL_VAULT_POWER_CORRECT, true);
                else
                    me->CastSpell(me, SPELL_VAULT_POWER_INCORRECT, true);

                me->RemoveAurasDueToSpell(vaultAuras[randomAura]);
                ApplyRandomAura();
            }

            void OnAuraRemove(AuraApplication* aurApp, AuraRemoveMode mode)
            {
                sLog->outInfo(LOG_FILTER_TSCR, "OnAuraRemove");
                if (!aurApp || aurApp->GetBase()->GetId() != SPELL_VAULT_TIMER || mode != AURA_REMOVE_BY_EXPIRE)
                    return;
                sLog->outInfo(LOG_FILTER_TSCR, "OnAuraRemove - ok");
                me->CastSpell(me, SPELL_VAULT_POWER_INCORRECT, true);
                ApplyRandomAura();
            }

            void UpdateAI(uint32 const diff)
            {
                if (startTimer <= diff)
                {
                    sLog->outInfo(LOG_FILTER_TSCR, "startTimer");
                    startTimer = 0;
                    ApplyRandomAura();
                }
                else
                {
                    sLog->outInfo(LOG_FILTER_TSCR, "else StartTimer");
                    startTimer -= diff;
                    return;
                }

                if (checkTimer <= diff)
                {
                    sLog->outInfo(LOG_FILTER_TSCR, "checkTimer");
                    me->CastSpell(me, SPELL_VAULT_POWER_INCORRECT, true);
                    checkTimer = 5000;
                }
                else
                    checkTimer -= diff;
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_kezan_vaultAI(creature);
        }
};*/

class npc_kezan_gasbot : public CreatureScript
{
    public:
        npc_kezan_gasbot() : CreatureScript("npc_kezan_gasbot")
        {
        }

        struct npc_kezan_gasbotAI : public ScriptedAI
        {
            npc_kezan_gasbotAI(Creature* creature) : ScriptedAI(creature)
            {
                me->GetMotionMaster()->MovePoint(1, gasbotMovePosition);
            }

            uint64 summonerGUID;

            void Reset()
            {
                summonerGUID = 0;
            }

            void IsSummonedBy(Unit* who)
            {
                if (who)
                    summonerGUID = who->GetGUID();
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE || id != 1)
                    return;

                me->CastSpell(me, SPELL_GAS_STREAM, true);
                me->DespawnOrUnsummon(2000);
            }

            void OnDespawn()
            {
                if (Player* summoner = ObjectAccessor::GetPlayer(*me, summonerGUID))
                    summoner->KilledMonsterCredit(me->GetEntry());
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_kezan_gasbotAI(creature);
        }
};

class spell_kezan_kill_buccaneer : public SpellScriptLoader
{
    public:
        spell_kezan_kill_buccaneer() : SpellScriptLoader("spell_kezan_kill_buccaneer")
        {
        }

        class spell_kezan_kill_buccaneer_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_kezan_kill_buccaneer_SpellScript);

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                Creature* target = GetHitCreature();
                Unit* caster = GetCaster();
                if (!caster || !target)
                    return;

                caster->DealDamage(target, target->GetHealth());
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_kezan_kill_buccaneer_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_kezan_kill_buccaneer_SpellScript();
        }
};

class spell_kezan_summon_buccaneer : public SpellScriptLoader
{
    public:
        spell_kezan_summon_buccaneer() : SpellScriptLoader("spell_kezan_summon_buccaneer")
        {
        }

        class spell_kezan_summon_buccaneer_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_kezan_summon_buccaneer_SpellScript);

            void HandleSummon(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Creature* buccaneer = caster->SummonCreature(NPC_BUCCANEER, buccaneerSpawnPoint.GetPositionX() + urand(0, 7), buccaneerSpawnPoint.GetPositionY() + urand(0, 7), buccaneerSpawnPoint.GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 5000))
                {
                    buccaneer->GetMotionMaster()->MovePoint(0, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ());
                    buccaneer->DespawnOrUnsummon(20000);
                }
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_kezan_summon_buccaneer_SpellScript::HandleSummon, EFFECT_0, SPELL_EFFECT_SUMMON);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_kezan_summon_buccaneer_SpellScript();
        }
};

class spell_kezan_buccaneer_vehicle : public SpellScriptLoader
{
    public:
        spell_kezan_buccaneer_vehicle() : SpellScriptLoader("spell_kezan_buccaneer_vehicle")
        {
        }

        class spell_kezan_buccaneer_vehicle_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_kezan_buccaneer_vehicle_AuraScript);

            bool Load()
            {
                count = 0;
                return true;
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                if (Unit* caster = GetCaster())
                {
                    if (count < 8)
                    {
                        caster->CastSpell(caster, buccaneerSpells[count], true);
                        ++count;
                    }
                }
            }

            void Register()
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_kezan_buccaneer_vehicle_AuraScript::PeriodicTick, EFFECT_1, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

        private:
            uint8 count;
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_kezan_buccaneer_vehicle_AuraScript();
        }
};

class spell_kezan_kablooey_bomb : public SpellScriptLoader
{
    public:
        spell_kezan_kablooey_bomb() : SpellScriptLoader("spell_kezan_kablooey_bomb")
        {
        }

        class spell_kezan_kablooey_bomb_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_kezan_kablooey_bomb_SpellScript);

            void HandleActivateObject(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player* caster = GetCaster()->ToPlayer();
                GameObject* gameObject = GetHitGObj();
                if (!caster || !gameObject)
                    return;

                for (uint8 n = 0; n < 5; ++n)
                    caster->SummonGameObject(GAMEOBJECT_SMALL_ORE, caster->GetPositionX() + urand(0, 2), caster->GetPositionY() + urand(0, 2), caster->GetPositionZ(), 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0);
                gameObject->SetRespawnTime(30);
                gameObject->SetLootState(GO_JUST_DEACTIVATED);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_kezan_kablooey_bomb_SpellScript::HandleActivateObject, EFFECT_0, SPELL_EFFECT_ACTIVATE_OBJECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_kezan_kablooey_bomb_SpellScript();
        }
};

/*class spell_kezan_vault_interact : public SpellScriptLoader
{
    public:
        spell_kezan_vault_interact() : SpellScriptLoader("spell_kezan_vault_interact")
        {
        }

        class spell_kezan_vault_interact_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_kezan_vault_interact_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                if (Player* player = GetHitPlayer())
                    player->CastSpell(player, SPELL_VAULT_BUNNY_VEHICLE, true);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_kezan_vault_interact_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_kezan_vault_interact_SpellScript();
        }
};*/

class spell_kezan_summon_gasbot : public SpellScriptLoader
{
    public:
        spell_kezan_summon_gasbot() : SpellScriptLoader("spell_kezan_summon_gasbot")
        {
        }

        class spell_kezan_summon_gasbot_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_kezan_summon_gasbot_SpellScript);

            void HandleScript(SpellEffIndex /*effIndex*/)
            {
                Player* player = GetHitPlayer();
                if (!player || (player && player->GetQuestStatus(QUEST_447) == QUEST_STATUS_COMPLETE))
                    return;

                player->CastSpell(player->GetPositionX(), player->GetPositionY(), player->GetPositionZ(), SPELL_SUMMON_GASBOT, true);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_kezan_summon_gasbot_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_kezan_summon_gasbot_SpellScript();
        }
};

void AddSC_zone_kezan()
{
    new npc_kezan_hommies();
    new npc_kezan_partygoer();
    //new npc_kezan_vault();
    new npc_kezan_gasbot();
    new spell_kezan_kill_buccaneer();
    new spell_kezan_summon_buccaneer();
    new spell_kezan_buccaneer_vehicle();
    new spell_kezan_kablooey_bomb();
    //new spell_kezan_vault_interact();
    new spell_kezan_summon_gasbot();
}
