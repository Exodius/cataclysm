/*
 * Copyright (C) 2008-2013 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
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
#include "World.h"
#include "WorldPacket.h"

/*######
## npc_loramus_thalipedes
######*/

#define GOSSIP_HELLO_LT1    "Can you help me?"
#define GOSSIP_HELLO_LT2    "Tell me your story"
#define GOSSIP_SELECT_LT1   "Please continue"
#define GOSSIP_SELECT_LT2   "I do not understand"
#define GOSSIP_SELECT_LT3   "Indeed"
#define GOSSIP_SELECT_LT4   "I will do this with or your help, Loramus"
#define GOSSIP_SELECT_LT5   "Yes"

class npc_loramus_thalipedes : public CreatureScript
{
public:
    npc_loramus_thalipedes() : CreatureScript("npc_loramus_thalipedes") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        switch (action)
        {
            case GOSSIP_ACTION_INFO_DEF+1:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(2744);
                break;

            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_LT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 21);
                player->SEND_GOSSIP_MENU(1813, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+21:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_LT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 22);
                player->SEND_GOSSIP_MENU(1814, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+22:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_LT3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 23);
                player->SEND_GOSSIP_MENU(1815, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+23:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_LT4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 24);
                player->SEND_GOSSIP_MENU(1816, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+24:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SELECT_LT5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 25);
                player->SEND_GOSSIP_MENU(1817, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+25:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(3141);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (player->GetQuestStatus(2744) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_LT1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);

        if (player->GetQuestStatus(3141) == QUEST_STATUS_INCOMPLETE)
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_HELLO_LT2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+2);

        player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};


/*####
# mob_depth_charge
####*/

enum DepthSpell
{
   SPELL_DEPTH_CHARGE_TRAP         = 38576,
};

class mob_depth_charge : public CreatureScript
{
public:
    mob_depth_charge() : CreatureScript("mob_depth_charge") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_depth_chargeAI (creature);
    }

    struct mob_depth_chargeAI : public ScriptedAI
    {
        mob_depth_chargeAI(Creature* c) : ScriptedAI(c) {}

        bool we_must_die;
        uint32 must_die_timer;

        void Reset()
        {
            me->SetUnitMovementFlags(MOVEMENTFLAG_HOVER | MOVEMENTFLAG_SWIMMING);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            we_must_die = false;
            must_die_timer = 1000;
        }

        void UpdateAI(uint32 diff)
        {
            if (we_must_die)
            {
                if (must_die_timer <= diff)
                {
                    me->DespawnOrUnsummon();
                } else must_die_timer -= diff;
            }
            return;
        }

        void MoveInLineOfSight(Unit* who)
        {
            if (!who)
                return;

            if (who->GetTypeId() == TYPEID_PLAYER && me->IsWithinDistInMap(who, 5))
            {
                DoCast(who, SPELL_DEPTH_CHARGE_TRAP);
                we_must_die = true;
                return;
            }
        }

        void AttackStart(Unit* /*who*/)
        {
        }

        void EnterCombat(Unit* /*who*/)
        {
        }
    };
};

void AddSC_azshara()
{
    new npc_loramus_thalipedes();
    new mob_depth_charge();
}
