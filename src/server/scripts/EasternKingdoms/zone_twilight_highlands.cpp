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

#include"ScriptMgr.h"
#include "Vehicle.h"
#include "Player.h"
#include "ScriptedEscortAI.h"

/*#####
## Burnin at Both Ends (28597)
#######*/

enum BBEntries
{
   QUEST_BURNIN_AT_BOTH_ENDS       = 28597,
   NPC_CANNON_POWDER               = 49143,
   CREDIT_POWDER                   = 91587
};

#define GOSSIP_POWDER "Sammle das Schwarzpulver"

class npc_cannon_powder : public CreatureScript
{
public:
    npc_cannon_powder() : CreatureScript("npc_cannon_powder") { }

    bool OnGossipHello(Player* player, Creature* creature)
    {
               if(player->GetQuestStatus(QUEST_BURNIN_AT_BOTH_ENDS)==QUEST_STATUS_INCOMPLETE)
               {
                       switch (creature->GetEntry())
                       {
                               case NPC_CANNON_POWDER:
                                       player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_POWDER, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
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
                               player->CastSpell(player, CREDIT_POWDER,0);
                               break;
                       default:
                           break;
               }

               player->CLOSE_GOSSIP_MENU();

        return true;
    }
};

enum Creatures
{
    NPC_EARTHEN_RING_GRYPHON = 45435,
};

enum Spells
{
    SPELL_RALLYING_WINDS     = 89210,
};

static const Position GryphonFlightPoint[12] =
{
    {-2550.260f, -4873.301f, 162.575f},
    {-2567.268f, -4944.182f, 144.199f},
    {-2561.632f, -5043.365f, 141.793f},
    {-2642.905f, -5097.975f, 145.460f},
    {-2749.036f, -5071.482f, 181.832f},
    {-2757.052f, -5038.688f, 173.353f},
    {-2770.489f, -4935.079f, 187.178f},
    {-2726.044f, -4910.548f, 151.792f},
    {-2696.642f, -4944.216f, 139.360f},
    {-2695.168f, -4995.539f, 123.981f},
    {-2660.867f, -5021.572f, 142.635f},
    {-2663.057f, -4982.158f, 180.082f},
};

class npc_earthen_ring_gryphon: public CreatureScript
{
    public:
    npc_earthen_ring_gryphon() : CreatureScript("npc_earthen_ring_gryphon") { }
    
    struct npc_earthen_ring_gryphonAI : public VehicleAI
    {
        npc_earthen_ring_gryphonAI(Creature *c) : VehicleAI(c) {}
        
        uint8 uiPoint;
        bool FlyDisabled;
        bool Fly;
        
        void Reset()
        {
            Fly = false;
            FlyDisabled = false;
        }
        
        void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply)
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                if(apply)
                {
                    me->SetCanFly(true);
                    me->SetSpeed(MOVE_FLIGHT, 2.0f);
                    GoToTheNextPoint();
                }
                
            }
        }
        
        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE)
            return;
            
            if (id == uiPoint && !FlyDisabled)
            {
                ++uiPoint;
                Fly = true;
            }
        }
        
        void GoToTheNextPoint()
        {
            if(!FlyDisabled)
            me->GetMotionMaster()->MovePoint(uiPoint, GryphonFlightPoint[uiPoint]);
        }
        
        void UpdateAI(uint32 diff)
        {
            if(Fly && !FlyDisabled)
            {
                GoToTheNextPoint();
                if (uiPoint >= 12)
                {
                    if(Unit *player = me->GetVehicleKit()->GetPassenger(0))
                    player->ExitVehicle(me);
                    FlyDisabled = true;
                    me->GetMotionMaster()->MoveIdle();
                    me->StopMoving();
                    me->SetVisible(false);
                    me->DisappearAndDie();
                }
                Fly = false;
            }
        }
        
    };
    
    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_earthen_ring_gryphonAI (creature);
    }
};

/*######
## npc_cayden TODO: Find correct Sound IDs
######*/

enum eCayden
{
    SAY_LETSGO          = -1000000,
    SAY_WAVE1           = -100000,
    SAY_WAVE2           = -10000,
    SAY_WAVE3           = -1000,

    QUEST_ONCE_MORE_ITF = 27648,

    NPC_TWILIGHT1       = 46183,
    NPC_TWILIGHT2       = 46144,

    SPELL_CAYDEN_CREDIT = 86417,
};

class npc_cayden : public CreatureScript
{
public:
    npc_cayden() : CreatureScript("npc_cayden") { }

    struct npc_caydenAI : public npc_escortAI
    {
        npc_caydenAI(Creature* creature) : npc_escortAI(creature) {}

        void Reset() { }

        void WaypointReached(uint32 uiPoint)
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (uiPoint)
            {
                case 1:
                    SetRun(true);
                    //DoScriptText(SAY_WAVE1, me, player);
                    DoSpawnCreature(NPC_TWILIGHT1, -10.0f, -5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    DoSpawnCreature(NPC_TWILIGHT2, -8.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 2:
                    //DoScriptText(SAY_WAVE2, me, player);
                    DoSpawnCreature(NPC_TWILIGHT1, -10.0f, -5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    DoSpawnCreature(NPC_TWILIGHT2, -8.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 3:
                    //DoScriptText(SAY_WAVE3, me, player);
                    DoSpawnCreature(NPC_TWILIGHT1, -10.0f, -5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    DoSpawnCreature(NPC_TWILIGHT2, -8.0f, 5.0f, 0.0f, 0.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 30000);
                    break;
                case 4:
                    if (player)
                        player->CastSpell(player, SPELL_CAYDEN_CREDIT, true);
                    break;
            }
        }
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_ONCE_MORE_ITF)
        {
            //DoScriptText(SAY_LETSGO, creature, player);

            if (npc_escortAI* pEscortAI = CAST_AI(npc_cayden::npc_caydenAI, creature->AI()))
                pEscortAI->Start(false, false, player->GetGUID());
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_caydenAI(creature);
    }
};

/*
* Arena Questline Twilight Highlands
* ToDo: Coming Soon
*/

enum ArenaSpells
{
    // Cadaver Collage
    SPELL_BELCH             = 88607,
    SPELL_INHALE            = 88615,
    SPELL_PLAGUE_EXPLOSION  = 88614,
    SPELL_POISON_CLOUD      = 90447,
    SPELL_REPULSIVE_KICK    = 88605,

    // Hurp derp
    SPELL_INTIMIDATING_ROAR = 91933,
    SPELL_OVERHEAD_SMASH    = 88482,
    SPELL_WHIRLWIND         = 83016,

    // Sully Kneecapper
    SPELL_CHARGE            = 88288,
    SPELL_UPPERCUT          = 80182,

    // Lord Geoffery Tulvan
    SPELL_DEATH_BY_PEASANT  = 88619,
    SPELL_UNDYING_FRENZY    = 88616,
    // SPELL_UPPERCUT (is aber oben auch schon)

    // Emberscar the Devourer
    SPELL_ACTIVATE_POOLS    = 90409,
    SPELL_FIREBALL          = 90446,
    SPELL_MAGMATIC_FAULT    = 90333
};

void AddSC_twilight_highlands()
{
    new npc_cannon_powder();
    new npc_earthen_ring_gryphon();
    new npc_cayden();
}