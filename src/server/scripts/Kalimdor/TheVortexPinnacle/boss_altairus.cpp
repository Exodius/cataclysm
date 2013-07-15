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

#include "SpellScript.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Cell.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "the_vortex_pinnacle.h"

enum Altairus
{
    // Spells
    SPELL_CHILLING_BREATH               = 88308,
    SPELL_UPWIND_OF_ALTAIRUS            = 88244, // Casted by Air Currents
    SPELL_UPWIND_OF_ALTAIRUS_TRIGGERED  = 88282,
    SPELL_DOWNWIND_OF_ALTAIRUS          = 88286,
    SPELL_TWISTER_AURA                  = 88313, // Casted by Twisters
    SPELL_CALL_THE_WIND_VISUAL          = 88772,
    SPELL_LIGHTNING_BLAST               = 88357,

    // Events
    EVENT_CHILLING_BREATH               = 1,
    EVENT_CALL_THE_WIND                 = 2,
    EVENT_DOWNWIND_OF_ALTAIRUS          = 3,
    EVENT_LIGHTNING_BLAST               = 4,

    // Texts
    EMOTE_WINDS                         = 0,
};

Position const platform = { -1240.0f, 73.0f, 734.0f, 0.0f };

class boss_altairus : public CreatureScript
{
    public:
        boss_altairus() : CreatureScript("boss_altairus")
        {
        }

        struct boss_altairusAI : public BossAI
        {
            boss_altairusAI(Creature* creature) : BossAI(creature, BOSS_ALTAIRUS)
            {
            }

            std::list<Creature*> vortexList;
            std::list<Creature*> airCurrentList;
            uint64 selectedAirCurrentGUID;

            void Reset()
            {
                _Reset();
                events.ScheduleEvent(EVENT_CALL_THE_WIND, urand(7500, 10000));
                events.ScheduleEvent(EVENT_CHILLING_BREATH, urand(20000, 30000));
                events.ScheduleEvent(EVENT_LIGHTNING_BLAST, 1000);
                selectedAirCurrentGUID = 0;
                ResetCreatures(vortexList);
                ResetCreatures(airCurrentList);
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_DOWNWIND_OF_ALTAIRUS);
                vortexList.clear();
                airCurrentList.clear();
            }

            void ResetCreatures(std::list<Creature*> list)
            {
                if (vortexList.empty())
                    return;

                for (std::list<Creature*>::const_iterator itr = list.begin(); itr != list.end(); ++itr)
                {
                    if (Creature* creature = *itr)
                    {
                        creature->RemoveAllAuras();
                        creature->AI()->EnterEvadeMode();
                    }
                }
            }

            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();

                // Get Air Currents
                me->GetCreatureListWithEntryInGrid(airCurrentList, NPC_AIR_CURRENT, 200.0f);

                // If is heroic, make the vortexes visible
                if (IsHeroic())
                {
                    me->GetCreatureListWithEntryInGrid(vortexList, NPC_TWISTER, 100.0f);
                    if (vortexList.empty())
                        return;

                    for (std::list<Creature*>::const_iterator itr = vortexList.begin(); itr != vortexList.end(); ++itr)
                    {
                        if (Creature* vortex = *itr)
                        {
                            vortex->CastSpell(vortex, SPELL_TWISTER_AURA, true);
                            vortex->GetMotionMaster()->MoveRandom(15.0f);
                        }
                    }
                }
            }

            void JustDied(Unit* /*who*/)
            {
                _JustDied();
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_DOWNWIND_OF_ALTAIRUS);
                for (std::list<Creature*>::const_iterator itr = vortexList.begin(); itr != vortexList.end(); ++itr)
                    if (Creature* vortex = *itr)
                        vortex->DespawnOrUnsummon();
                for (std::list<Creature*>::const_iterator itr = airCurrentList.begin(); itr != airCurrentList.end(); ++itr)
                    if (Creature* airCurrent = *itr)
                        airCurrent->DespawnOrUnsummon();
                vortexList.clear();
                airCurrentList.clear();

            Creature * Slipstream = me->SummonCreature(NPC_SLIPSTREAM_TWO, -1198.95f, 106.13f, 743.16f, 1.2f, TEMPSUMMON_CORPSE_DESPAWN, 0);
            Slipstream->SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_CHILLING_BREATH:
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true), SPELL_CHILLING_BREATH, true);
                            events.ScheduleEvent(EVENT_CHILLING_BREATH, urand(7500, 12500));
                            break;
                        case EVENT_CALL_THE_WIND:
                        {
                            std::list<Creature*>::iterator itr = airCurrentList.begin();
                            advance(itr, urand(0, airCurrentList.size()-1));
                            CallTheWind((*itr)->GetGUID());
                            events.ScheduleEvent(EVENT_CALL_THE_WIND, urand(10000, 15000));
                            break;
                        }
                        case EVENT_LIGHTNING_BLAST:
                            CheckPlatform();
                            events.ScheduleEvent(EVENT_LIGHTNING_BLAST, 5000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            void CallTheWind(uint64 guid)
            {
                if (Creature* airCurrent = ObjectAccessor::GetCreature(*me, guid))
                {
                    for (std::list<Creature*>::const_iterator itr = airCurrentList.begin(); itr != airCurrentList.end(); ++itr)
                        if (Creature* airCurrent = *itr)
                            airCurrent->RemoveAllAuras();
                    airCurrent->CastSpell(airCurrent, SPELL_UPWIND_OF_ALTAIRUS, true);
                    airCurrent->CastSpell(airCurrent, SPELL_CALL_THE_WIND_VISUAL, true);
                    Talk(EMOTE_WINDS);
                    DownwindOfAltairus();
                }
            }

            void DownwindOfAltairus()
            {
                Map::PlayerList const& playerList = me->GetMap()->GetPlayers();
                if (!playerList.isEmpty())
                    for (Map::PlayerList::const_iterator itr = playerList.begin(); itr != playerList.end(); ++itr)
                        if (Player* player = itr->getSource())
                            player->CastSpell(player, SPELL_DOWNWIND_OF_ALTAIRUS, true);
            }

            void CheckPlatform()
            {
                Map::PlayerList const& playerList = me->GetMap()->GetPlayers();
                if (!playerList.isEmpty())
                    for (Map::PlayerList::const_iterator itr = playerList.begin(); itr != playerList.end(); ++itr)
                        if (Player* player = itr->getSource())
                            if (player->GetDistance(platform) > 25.0f)
                                me->CastSpell(player, SPELL_LIGHTNING_BLAST, true);
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return GetVortexPinnacleAI<boss_altairusAI>(creature);
        }
};

class spell_altairus_upwind_of_altairus : public SpellScriptLoader
{
    public:
        spell_altairus_upwind_of_altairus() : SpellScriptLoader("spell_altairus_upwind_of_altairus")
        {
        }

        class UpwindOfAltairusCheck
        {
            WorldObject const* _caster;
            InstanceScript* _instance;

            public:
                UpwindOfAltairusCheck(WorldObject* caster, InstanceScript* instance) : _caster(caster), _instance(instance)
                {
                }

                bool operator() (WorldObject* target)
                {
                    if (Creature* Altairus = ObjectAccessor::GetCreature(*_caster, _instance->GetData64(BOSS_ALTAIRUS)))
                        if (Altairus->IsInBetween(_caster, target, 5.0f))
                            return true;

                    return false;
                }
        };

        class spell_altairus_upwind_of_altairus_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_altairus_upwind_of_altairus_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                if (WorldObject* caster = GetCaster())
                    unitList.remove_if(UpwindOfAltairusCheck(caster, caster->GetInstanceScript()));
            }

            void Register()
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_altairus_upwind_of_altairus_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_altairus_upwind_of_altairus_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENEMY);
            }
        };

        class spell_altairus_upwind_of_altairus_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_altairus_upwind_of_altairus_AuraScript);

            void HandleEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Player* target = GetTarget()->ToPlayer())
                {
                    target->RemoveAurasDueToSpell(SPELL_DOWNWIND_OF_ALTAIRUS);
                    target->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DOWNWIND_OF_ALTAIRUS, true);
                }
            }

            void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Player* target = GetTarget()->ToPlayer())
                {
                    if (GetTargetApplication()->GetRemoveMode() != AURA_REMOVE_BY_CANCEL)
                    {
                        target->ApplySpellImmune(0, IMMUNITY_ID, SPELL_DOWNWIND_OF_ALTAIRUS, false);
                        target->CastSpell(target, SPELL_DOWNWIND_OF_ALTAIRUS, true);
                    }
                }
            }

            void Register()
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_altairus_upwind_of_altairus_AuraScript::HandleEffectRemove, EFFECT_0, SPELL_AURA_MELEE_SLOW, AURA_EFFECT_HANDLE_REAL);
                OnEffectApply += AuraEffectApplyFn(spell_altairus_upwind_of_altairus_AuraScript::HandleEffectApply, EFFECT_0, SPELL_AURA_MELEE_SLOW, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_altairus_upwind_of_altairus_AuraScript();
        }

        SpellScript* GetSpellScript() const
        {
            return new spell_altairus_upwind_of_altairus_SpellScript();
        }
};

class spell_altairus_downwind_of_altairus : public SpellScriptLoader
{
    class spell_altairus_downwind_of_altairus_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_altairus_downwind_of_altairus_AuraScript);

        void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (GetTarget()->GetTypeId() == TYPEID_PLAYER && GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_EXPIRE)
                GetTarget()->CastSpell(GetTarget(), SPELL_DOWNWIND_OF_ALTAIRUS, true);
        }

        void Register()
        {
            OnEffectRemove += AuraEffectRemoveFn(spell_altairus_downwind_of_altairus_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_MELEE_SLOW, AURA_EFFECT_HANDLE_REAL);
        }
    };

public:
    spell_altairus_downwind_of_altairus()
        : SpellScriptLoader("spell_altairus_downwind_of_altairus")
    { }

    AuraScript * GetAuraScript() const
    {
        return new spell_altairus_downwind_of_altairus_AuraScript();
    }
};

void AddSC_boss_altairus()
{
    new boss_altairus();
    new spell_altairus_upwind_of_altairus();
    new spell_altairus_downwind_of_altairus();
}
