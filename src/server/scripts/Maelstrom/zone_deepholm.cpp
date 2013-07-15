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

#include "ScriptPCH.h"

class npc_elemental_energy_quest : public CreatureScript
{
    public:
        npc_elemental_energy_quest() : CreatureScript("npc_elemental_energy_quest") { }

        struct npc_elemental_energy_questAI : public ScriptedAI
        {
            npc_elemental_energy_questAI(Creature* creature) : ScriptedAI(creature) { }

            void JustDied(Unit * who)
            {
                printf("\n ! just died ! \n ");
                if (Creature * totem = GetClosestCreatureWithEntry(me, 45088, 25.0f))
                {
                    printf("\n ! casting spell on totem ! \n ");
                    //if(Player * plr = totem->GetCharmerOrOwnerPlayerOrPlayerItself())
                        totem->CastSpell(totem, 84170, true);
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_elemental_energy_questAI(creature);
        }
};

class npc_imposing_confrontation_quest : public CreatureScript
{
    public:
        npc_imposing_confrontation_quest() : CreatureScript("npc_imposing_confrontation_quest") { }

        struct npc_imposing_confrontation_questAI : public ScriptedAI
        {
            npc_imposing_confrontation_questAI(Creature* creature) : ScriptedAI(creature) { Reset(); }

            bool eventStarted;
            uint8 phase;
            int32 phaseTimer;
            uint64 initiator;

            void Reset()
            {
                eventStarted = false;
                uint8 phase = 0;
                phaseTimer = 0;
                initiator = 0;
            }

            void SpellHit(Unit* caster, const SpellInfo* spell)
            {
                if(spell->Id == 79715)
                {
                    caster->MonsterSay("Boden the Imposing. I come on behalf of the Earthen Ring. We wish your kind no harm. We seek to repair the rift between our worlds. Why do you attack us?", 0,0);
                    eventStarted = true;
                    phaseTimer = 7000;
                    initiator = caster->GetGUID();
                    me->GetMotionMaster()->MoveIdle();
                    me->SetFacingToObject(caster);
                }
            }

            void UpdateAI(uint32 diff)
            {
                if(eventStarted)
                {
                    if((phaseTimer -= diff) <= 0)
                    switch(phase++)
                    {
                        case 0:
                            me->MonsterYell("Hah! Did you mistake me for Diamant ? Or perhaps some other whimpering, compliant, stone trogg who cares?", 0,0);
                            phaseTimer = 9000;
                            break;
                        case 1:
                            me->MonsterYell("If you seek peace, relinquish the World Pillar and leave Deepholm. This is our realm. Your only welcome here shall be found underneath my stone foot.", 0,0);
                            phaseTimer = 13000;
                            break;
                        case 2:
                            if(Player * player = Unit::GetPlayer(*me, initiator))
                            {
                                me->CastSpell(player, 79843, true);
                                me->GetMotionMaster()->InitDefault();
                            }
                            Reset();
                            break;
                    }
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_imposing_confrontation_questAI(creature);
        }
};

/*#####
## Gunship Down (26245)
#######*/

enum GDEntries
{
       QUEST_GUNSHIP_DOWN          = 26245,
       NPC_UNEXPLODED_ARTILLERY    = 43044,
       NPC_SLAIN_CANNONEER         = 43032,
       NPC_CAPTAIN_SKULLSHATTER    = 43048,
       CREDIT_FIRST_OBJECT         = 43027,
       CREDIT_SECOND_OBJECT        = 43028,
       CREDIT_THIRD_OBJECT         = 43029
};

#define GOSSIP_FIRST_OBJECT        "Untersuche den ersten Hinweis..."
#define GOSSIP_SECOND_OBJECT       "Untersuche den zweiten Hinweis..."
#define GOSSIP_THIRD_OBJECT        "Untersuche den dritten Hinweis..."

class npc_objects_gunship_down : public CreatureScript
{
public:
    npc_objects_gunship_down() : CreatureScript("npc_objects_gunship_down") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
               if(player->GetQuestStatus(QUEST_GUNSHIP_DOWN)==QUEST_STATUS_INCOMPLETE)
               {
                       switch (creature->GetEntry())
                       {
                               case NPC_UNEXPLODED_ARTILLERY:
                                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_THIRD_OBJECT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                                       break;
                               case NPC_SLAIN_CANNONEER:
                                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SECOND_OBJECT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                                       break;
                               case NPC_CAPTAIN_SKULLSHATTER:
                                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_FIRST_OBJECT, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                                       break;
                               default: 
                                   break;
                       }
               }
              
               player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        
               switch (action)
               {
                       case GOSSIP_ACTION_INFO_DEF + 1:
                               player->KilledMonsterCredit(CREDIT_THIRD_OBJECT,0);
                               break;
                       case GOSSIP_ACTION_INFO_DEF + 2:
                               player->KilledMonsterCredit(CREDIT_SECOND_OBJECT,0);
                               break;
                       case GOSSIP_ACTION_INFO_DEF + 3:
                               player->KilledMonsterCredit(CREDIT_FIRST_OBJECT,0);
                               break;
                       default: 
                           break;
               }

               player->CLOSE_GOSSIP_MENU();

        return true;
    }
};

enum eQuest26861Data
{
   QUEST_A_RETURN_TO_RESTING       = 26861,

   NPC_DOOR_1_CREDIT               = 44930,
   NPC_DOOR_2_CREDIT               = 44931,
};

class spell_q26861_door_dummy : public SpellScriptLoader
{
    public:
        spell_q26861_door_dummy() : SpellScriptLoader("spell_q26861_door_dummy") { }
 
        class spell_q26861_door_dummy_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_q26861_door_dummy_SpellScript)
 
            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                if (Creature* unitTarget = GetHitCreature())
                {
                    if (Player* player = GetCaster()->ToPlayer())
                    {
                        if (player->GetQuestStatus(QUEST_A_RETURN_TO_RESTING) == QUEST_STATUS_INCOMPLETE)
                        {
                            switch (unitTarget->GetEntry())
                            {
                                 case NPC_DOOR_1_CREDIT:
                                     player->KilledMonsterCredit(NPC_DOOR_1_CREDIT, 0);
                                     break;
                                 case NPC_DOOR_2_CREDIT:
                                     player->KilledMonsterCredit(NPC_DOOR_2_CREDIT, 0);
                                     break;
                                 default:
                                     break;
                            }
                        }
                    }
                }
            }
 
            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_q26861_door_dummy_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };
 
        SpellScript* GetSpellScript() const
        {
            return new spell_q26861_door_dummy_SpellScript();
        }
};

class AreaTrigger_at_deepholm_flyover : public AreaTriggerScript
{
     public:
         AreaTrigger_at_deepholm_flyover() : AreaTriggerScript("at_deepholm_flyover") {}
    enum
    {
        QUEST_FLY_OVER             = 27008,
        NPC_GENERIC_TRIGGER        = 44839,
    };

    bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
    {
        if (player->GetQuestStatus(QUEST_FLY_OVER) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature * trigger = player->FindNearestCreature(NPC_GENERIC_TRIGGER, 15.0f))
                player->CompleteQuest(QUEST_FLY_OVER);
        }
        return true;
    }
};

enum eRicketTicker
{
    SPELL_EXPLODE = 91981,

    NPC_DEEP_CELESTITE_BUNNY = 49865,
    NPC_DEEP_AMETHYST_BUNNY = 49866,
    NPC_DEEP_GRANAT_BUNNY = 49867,
    NPC_DEEP_ALABASTER_BUNNY = 49824,

    ITEM_DEEP_CELESTITE_CRYSTAL = 65507,
    ITEM_DEEP_AMETHYST_CRYSTAL = 65508,
    ITEM_DEEP_GRANAT_CRYSTAL = 65510,
    ITEM_DEEP_ALABASTER_CRYSTAL = 65504,
};

class npc_ricket_ticker : public CreatureScript
{
public:
    npc_ricket_ticker() : CreatureScript("npc_ricket_ticker") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_ricket_tickerAI (creature);
    }

    struct npc_ricket_tickerAI : public ScriptedAI
    {
        npc_ricket_tickerAI(Creature* creature) : ScriptedAI(creature), uiExplode(NULL) { }

        uint32 uiExplode;
        Player* player;

        void Reset()
        {
            uiExplode = 0;
        }

        void IsSummonedBy(Unit* summoner)
        {
            uiExplode = 3500;
            player = summoner->ToPlayer();
        }

        void UpdateAI(uint32 diff)
        {
            if (uiExplode == NULL)
                return;

            if (uiExplode <= diff)
            {
                DoCastAOE(SPELL_EXPLODE, true);

                // Checks weather a Deep Crystal is in Range
                if (me->FindNearestCreature(NPC_DEEP_CELESTITE_BUNNY, 7.0f, true))
                        player->AddItem(ITEM_DEEP_CELESTITE_CRYSTAL, 1);

                if (me->FindNearestCreature(NPC_DEEP_AMETHYST_BUNNY, 7.0f, true))
                        player->AddItem(ITEM_DEEP_AMETHYST_CRYSTAL, 1);

                if (me->FindNearestCreature(NPC_DEEP_GRANAT_BUNNY, 7.0f, true))
                        player->AddItem(ITEM_DEEP_GRANAT_CRYSTAL, 1);

                if (me->FindNearestCreature(NPC_DEEP_ALABASTER_BUNNY, 7.0f, true))
                        player->AddItem(ITEM_DEEP_ALABASTER_CRYSTAL, 1);

                me->DespawnOrUnsummon();
            } else uiExplode -= diff;
        }
    };
};

enum eBanner
{
    NPC_STONEHEART_DEFENDER = 43138,
    SPELL_BUFF_OF_THE_STONEFATHER = 80668,
    SPELL_BANNER_HITS_GROUND = 80669,
};

class npc_stonefathers_banner : public CreatureScript
{
public:
    npc_stonefathers_banner() : CreatureScript("npc_stonefathers_banner") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_stonefathers_bannerAI (creature);
    }

    struct npc_stonefathers_bannerAI : public ScriptedAI
    {
        npc_stonefathers_bannerAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NOT_SELECTABLE);
        }

        void IsSummonedBy(Unit* summoner)
        {
            DoCastAOE(SPELL_BANNER_HITS_GROUND, true);

            std::list<Creature*> creatures;
            GetCreatureListWithEntryInGrid(creatures, me, NPC_STONEHEART_DEFENDER, 10.0f);

            if (creatures.empty())
                return;

            for (std::list<Creature*>::iterator iter = creatures.begin(); iter != creatures.end(); ++iter)
                if (!(*iter)->HasAura(SPELL_BUFF_OF_THE_STONEFATHER))
                {
                    (*iter)->CastSpell((*iter), SPELL_BUFF_OF_THE_STONEFATHER, true);
                    summoner->ToPlayer()->KilledMonsterCredit(NPC_STONEHEART_DEFENDER, 0);
                }
        }
    };
};

void AddSC_zone_deepholm()
{
    new npc_objects_gunship_down();
    new npc_elemental_energy_quest();
    new npc_imposing_confrontation_quest();
    new spell_q26861_door_dummy();
    new AreaTrigger_at_deepholm_flyover();
    new npc_ricket_ticker();
    new npc_stonefathers_banner();
}
