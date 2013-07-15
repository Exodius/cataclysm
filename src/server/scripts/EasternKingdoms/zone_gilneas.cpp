/*
 * Copyright (C) 2010-2011 Project Trinity <http://www.projecttrinity.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2009 MaNGOS <http://getmangos.com/>
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

/* ScriptData
Name: Gilneas City
%Complete: 10
Comment:
Category: Gilneas
EndScriptData */

/* ContentData
TODO
EndContentData */

#include "ScriptMgr.h"
#include "SpellAuraEffects.h"
#include "Vehicle.h"

enum SoundIds
{
    SOUND_SWORD_FLESH                                  = 143,
    SOUND_SWORD_PLATE                                  = 147,
    SOUND_WORGEN_ATTACK                                = 558,
    DELAY_SOUND                                        = 500,
    DELAY_ANIMATE                                      = 2000
};

enum SpellIds
{
    SPELL_PING_GILNEAN_CROW                            = 93275,
	SPELL_WORGEN_BITE                                  = 72870,
	SPELL_PHASE_QUEST_2                                = 59073,
	SPELL_SUMMON_JOSIAH_AVERY                          = 67350,
	SPELL_GET_SHOT                                     = 67349,
	SPELL_SHOOT                                        = 6660,
	SPELL_PHASE_2                                      = 59073,
	SPELL_PHASE_4                                      = 59074,
	SPELL_SUMMON_GILNEAN_MASTIFF                       = 67807,
	SPELL_ATTACK_LURKER                                = 67805,
	SPELL_SHADOWSTALKER_STEALTH                        = 5916,
	SPELL_BARREL_KEG                                   = 69094,
	SPELL_INFECTED_BITE                                = 72872,
	SPELL_GILNEAS_CANNON_CAMERA                        = 93555,
	SPELL_CANNON_FIRE                                  = 68235,
};

enum QuestIds
{
    QUEST_THE_REBEL_LORDS_ARSENAL                      = 14159,
	QUEST_EVAC_MERC_SQUA                               = 14098,
	QUEST_LOCKDOWN                                     = 14078,
	QUEST_FROM_THE_SHADOWS                             = 14204,
	QUEST_YOU_CANT_TAKE_EM_ALONE                       = 14348,
	QUEST_SAVE_KRENNAN_ARANAS                          = 14293,
};

enum QuestKC
{
    QUEST_14348_KILL_CREDIT                            = 36233
};

enum CreatureIds
{
    NPC_LORNA_CROWLEY_P4                              = 35378, // Quest - From the Shadows
    NPC_BLOODFANG_RIPPER_P4                           = 35505, // General AI spawns
	NPC_JOSIAH_AVERY_P4                               = 35370, // NPC for worgen bite
	NPC_PRINCE_LIAM_GREYMANE                          = 34913,
    NPC_GILNEAS_CITY_GUARD                            = 34916,
    NPC_RAMPAGING_WORGEN_1                            = 34884,
    NPC_RAMPAGING_WORGEN_2                            = 35660,
    NPC_FRIGHTENED_CITIZEN_1                          = 34981,
    NPC_FRIGHTENED_CITIZEN_2                          = 35836,
	NPC_KRENNAN_ARANAS_TREE                           = 35753,
	NPC_GREYMANE_HORSE_P4                             = 35905,
    NPC_COMMANDEERED_CANNON                           = 35914,
	NPC_BLOODFANG_WORGEN                              = 35118,
	NPC_GILNEAS_CITY_GUARD_P8                         = 50474,
    NPC_AFFLICTED_GILNEAN_P8                          = 50471,
	NPC_GILNEAN_ROYAL_GUARD                           = 35232,
	NPC_SERGEANT_CLEESE                               = 35839,
	NPC_MYRIAM_SPELLWALKER                            = 35872,
};	

enum NpcTextIds
{
    SAY_JOSIAH_AVERY_1                                = 0,
	SAY_JOSIAH_AVERY_2                                = 1,
	SAY_JOSIAH_AVERY_3                                = 2,
	SAY_JOSIAH_AVERY_4                                = 3,
	SAY_JOSIAH_AVERY_5                                = 4,
	DELAY_SAY_JOSIAH_AVERY                            = 20000,
	
    SAY_JOSAIH_AVERY_TRIGGER                          = 1,
	
	SAY_PANICKED_CITIZEN_1                            = -0,
    SAY_PANICKED_CITIZEN_2                            = -1,
    SAY_PANICKED_CITIZEN_3                            = -2,
    SAY_PANICKED_CITIZEN_4                            = -3,
	SAY_PANICKED_CITIZEN_5                            = -4,
	SAY_PANICKED_CITIZEN_6                            = -5,

	
    SAY_GILNEAS_CITY_GUARD_GATE_1	                  = 0,
    SAY_GILNEAS_CITY_GUARD_GATE_2	                  = 1,
	
    SAY_PRINCE_LIAM_GREYMANE_1                        = 0,
    SAY_PRINCE_LIAM_GREYMANE_2                        = 1,
    SAY_PRINCE_LIAM_GREYMANE_3                        = 2,
    SAY_PRINCE_LIAM_GREYMANE_4                        = 0,
    SAY_PRINCE_LIAM_GREYMANE_5                        = 1,
    SAY_PRINCE_LIAM_GREYMANE_6                        = 2,
    SAY_PRINCE_LIAM_GREYMANE_7                        = 3,
	YELL_PRINCE_LIAM_GREYMANE						  = 1,
	DELAY_SAY_PRINCE_LIAM_GREYMANE                    = 2000,
	DELAY_YELL_PRINCE_LIAM_GREYMANE					  = 2000,
	
	SAY_GILNEAS_CITY_GUARD_P8                          = 1,
	
	SAY_LORD_GODFREY_P4                                = 0,
	
	SAY_KING_GENN_GREYMANE                            = 1,
	
	SAY_KRENNAN_C2                                     = 0,
	
	SAY_LORNA_CROWLEY_P4                               = 0,
	
	SAY_NPC_KRENNAN_ARANAS_TREE                        = 0,
	
};

enum Yells
{

};

#define KRENNAN_END_X                                 -1772.4172f
#define KRENNAN_END_Y                                 1430.6125f
#define KRENNAN_END_Z                                 19.79f
#define KRENNAN_END_O                                 2.79f


/*######
## npc_prince_liam_greymane_phase1
######*/

class npc_prince_liam_greymane_phase1: public CreatureScript
{
enum
    {
        DELAY_SAY_PRINCE_LIAM_GREYMANE  = 20000
    };
public:
    npc_prince_liam_greymane_phase1() :
            CreatureScript("npc_prince_liam_greymane_phase1") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_prince_liam_greymane_phase1AI(creature);
    }

    struct npc_prince_liam_greymane_phase1AI: public ScriptedAI
    {
        npc_prince_liam_greymane_phase1AI(Creature *c) : ScriptedAI(c) {}

        uint32 tSay; // Time left for say
        uint32 cSay; // Current Say

        // Evade or Respawn
        void Reset()
        {
            tSay = DELAY_SAY_PRINCE_LIAM_GREYMANE; // Reset timer
            cSay = 1;                              // Start from 1
        }

        //Timed events
        void UpdateAI(uint32 diff)
        {
            //Out of combat
            if (!me->getVictim())
            {
                //Timed say
                if (tSay <= diff)
                {
                    switch (cSay)
                    {
                        default:
                        case 1:
                             Talk(SAY_PRINCE_LIAM_GREYMANE_1);
                            cSay++;
                            break;
                        case 2:
                             Talk(SAY_PRINCE_LIAM_GREYMANE_2);
                            cSay++;
                            break;
                        case 3:
                             Talk(SAY_PRINCE_LIAM_GREYMANE_3);
                            cSay = 1; // Reset to 1
                            break;
                    }

                    tSay = DELAY_SAY_PRINCE_LIAM_GREYMANE; // Reset the timer
                }
                else
                {
                    tSay -= diff;
                }
                return;
            }
        }
    };
};

/*######
## npc_panicked_citizen
######*/

class npc_panicked_citizen : public CreatureScript
{
public:
    npc_panicked_citizen() : CreatureScript("npc_panicked_citizen") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_panicked_citizenAI (creature);
    }

    struct npc_panicked_citizenAI : public ScriptedAI
    {
        npc_panicked_citizenAI(Creature* c)
            : ScriptedAI(c)
            , tSay_panicked(urand(30000, 120000))
            , guid_panicked_nextsay(0) {}

        uint32 tEmote; //Time left for doing an emote
        uint32 tSay_panicked;
		uint32 cSay; // Current Say
        uint32 guid_panicked_nextsay; //GUID of the Panicked Citizen that will say random text, this is to prevent more than 1 npc speaking

        //Evade or Respawn
        void Reset()
        {
            if (me->GetPhaseMask() == 1)
            {
                tEmote = urand(5000, 15000); //Reset timer
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0); //Reset emote state
            }
        }

        void UpdateAI(uint32 diff)
        {
            //Out of combat and in Phase 1
            if (!me->getVictim() && me->GetPhaseMask() == 1)
            {
                //Timed emote
                if (tEmote <= diff)
                {
                    //Do random emote (1, 5, 18, 20, 430)
                    me->HandleEmoteCommand(RAND(
                        EMOTE_ONESHOT_TALK,
                        EMOTE_ONESHOT_EXCLAMATION,
                        EMOTE_ONESHOT_CRY,
                        EMOTE_ONESHOT_BEG,
                        EMOTE_ONESHOT_COWER));

                    tEmote = urand(5000, 15000); //Reset timer
                }else tEmote -= diff;

                //Randomly select an NPC to say the next random text
                if (!guid_panicked_nextsay)
                    if (urand(0, 1))
                        guid_panicked_nextsay = me->GetGUIDLow();

                //If this is the selected npc to say
                if (guid_panicked_nextsay == me->GetGUIDLow())
                {
                    //Timed say
                    if (tSay_panicked <= diff)
                    {
                    switch (cSay)
                    {
                        default:
                        case 1:
                             Talk(SAY_PANICKED_CITIZEN_1);
                            cSay++;
                            break;
                        case 2:
                             Talk(SAY_PANICKED_CITIZEN_2);
                            cSay++;
                            break;
                        case 3:
                             Talk(SAY_PANICKED_CITIZEN_1);
                            cSay++;
                            break;
                        case 4:
                             Talk(SAY_PANICKED_CITIZEN_4);
                            cSay++;
                            break;
                        case 5:
                             Talk(SAY_PANICKED_CITIZEN_4);
                            cSay++;
                            break;
                        case 6:
                             Talk(SAY_PANICKED_CITIZEN_4);
                            cSay = 1; // Reset to 1
                            break;							

                    }

                        guid_panicked_nextsay = 0; //Reset Selected next NPC
                        tSay_panicked = urand(30000, 120000); //Reset timer
                    }else tSay_panicked -= diff;
                }
            }
        }
    };
};

/*######
## npc_panicked_citizen_2
######*/

struct Waypoint
{
    uint32 pathID;
    float x, y, distance;
};

class npc_panicked_citizen_2 : public CreatureScript
{
    enum
    {
        PATHS_COUNT_PANICKED_CITIZEN        = 8,
        WAYPOINT_BASE                       = 34851000
    };

    struct npc_panicked_citizen_2AI : public ScriptedAI
    {
        npc_panicked_citizen_2AI(Creature* c) : ScriptedAI(c) {}

        bool running, onceRun;
        uint32 pathID, runDelay;
        Waypoint firstWaypoints[PATHS_COUNT_PANICKED_CITIZEN];

        void LoadWaypoints(Waypoint *waypoints)
        {
            QueryResult result;
            Field* fields = NULL;

            for(int i=0; i < PATHS_COUNT_PANICKED_CITIZEN; ++i)
            {
                result = WorldDatabase.PQuery("SELECT `id`, `position_x`, `position_y` FROM waypoint_data WHERE id = %u AND `point` = 1", WAYPOINT_BASE + i);

                fields = result->Fetch();
                waypoints[i].pathID = fields[0].GetUInt32();
                waypoints[i].x = fields[1].GetFloat();
                waypoints[i].y = fields[2].GetFloat();
                waypoints[i].distance = me->GetDistance2d(waypoints[i].x, waypoints[i].y);
            }
        }

        uint32 FindNearestPath(Waypoint *paths)
        {
            uint32 nearestPathID = 0;
            float minDist = 0;

            for (uint8 i = 0; i < PATHS_COUNT_PANICKED_CITIZEN; i ++)
            {
                if (i == 0 || minDist > paths[i].distance)
                {
                    minDist = paths[i].distance;
                    nearestPathID = paths[i].pathID;
                }
            }
            return nearestPathID;
        }

        void Reset()
        {
            me->Respawn(true);
        }

        void JustRespawned()
        {
            if (me->GetDefaultMovementType() == WAYPOINT_MOTION_TYPE)
            {
                me->SetUInt32Value(UNIT_NPC_EMOTESTATE, 0);
                runDelay = urand(2000, 8000);
                running = true;
                onceRun = true;
            }
            else running = false;
        }

        void UpdateAI(uint32 diff)
        {
            if (running)
            {
                if (runDelay <= diff && onceRun)
                {
                    LoadWaypoints(firstWaypoints);
                    pathID = FindNearestPath(firstWaypoints);
                    me->GetMotionMaster()->MovePath(pathID, false);
                    me->HandleEmoteCommand(EMOTE_ONESHOT_COWER);
                    onceRun = false;
                }
                else runDelay -= diff;
            }
        }
    };

public:
    npc_panicked_citizen_2() : CreatureScript("npc_panicked_citizen_2") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_panicked_citizen_2AI (creature);
    }
};

/*######
## npc_lieutenant_walden
######*/

class npc_lieutenant_walden : public CreatureScript
{
public:
    npc_lieutenant_walden() : CreatureScript("npc_lieutenant_walden") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lieutenant_waldenAI (creature);
    }

    struct npc_lieutenant_waldenAI : public ScriptedAI
    {
        npc_lieutenant_waldenAI(Creature* c) : ScriptedAI(c) {}

        void sQuestReward(Player* player, const Quest *quest, uint32 /*data*/)
        {
            if (quest->GetQuestId() == QUEST_LOCKDOWN && player->GetPhaseMask() == 1)
                player->SetAuraStack(SPELL_PHASE_2, player, 1); //phaseshift
        }
    };
};

/*######
## npc_gilneas_city_guard_phase1
######*/
class npc_gilneas_city_guard_phase1 : public CreatureScript
{
public:
    npc_gilneas_city_guard_phase1() : CreatureScript("npc_gilneas_city_guard_phase1") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilneas_city_guard_phase1AI (creature);
    }

    struct npc_gilneas_city_guard_phase1AI : public ScriptedAI
    {
        npc_gilneas_city_guard_phase1AI(Creature* c) : ScriptedAI(c) {}

        uint32 tSay; //Time left for say
		uint32 cSay; // Current Say

        //Evade or Respawn
        void Reset()
        {
            if (me->GetGUIDLow() == 306063)
            {
                tSay = urand(30000, 120000); //Reset timer
            }
        }

        void UpdateAI(uint32 diff)
        {
            //Out of combat and
            if (me->GetGUIDLow() == 306063)
            {
                //Timed say
                if (tSay <= diff)
                {
                    switch (cSay)
                    {
                        default:
                        case 1:
                             Talk(SAY_GILNEAS_CITY_GUARD_GATE_1);
                            cSay++;
                            break;
                        case 2:
                             Talk(SAY_GILNEAS_CITY_GUARD_GATE_2);
                            cSay = 1; // Reset to 1
                            break;							
                    }

                    tSay = urand(30000, 120000); //Reset timer
                }else tSay -= diff;
            }
        }
    };
};

/*######
## npc_gilneas_city_guard_phase2
######*/

class npc_gilneas_city_guard_phase2 : public CreatureScript
{
public:
    npc_gilneas_city_guard_phase2() : CreatureScript("npc_gilneas_city_guard_phase2") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilneas_city_guard_phase2AI (creature);
    }

    struct npc_gilneas_city_guard_phase2AI : public ScriptedAI
    {
        npc_gilneas_city_guard_phase2AI(Creature* c) : ScriptedAI(c) {}

        uint32 tAnimate, tSound, dmgCount, tSeek;
        bool playSnd;
        bool atHome;

        void Reset()
        {
            tAnimate = DELAY_ANIMATE;
            dmgCount = 0;
            tSound = DELAY_SOUND;
            playSnd = false;
            tSeek = urand(1000, 2000);
            atHome = true;
        }

        void DamageTaken(Unit* who, uint32 & /*uiDamage*/)
        {
            bool isPlayer = who->GetTypeId() == TYPEID_PLAYER;

            if (isPlayer || who->isPet())
            {
                me->getThreatManager().resetAllAggro();
                if (isPlayer)
                    who->AddThreat(me, 1.0f);
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
                dmgCount = 0;
            }
        }

        void DamageDealt(Unit* target, uint32& /*damage*/, DamageEffectType /*damaGetPositionYpe*/)
        {
            if (target->GetEntry() == NPC_RAMPAGING_WORGEN_1)
                dmgCount ++;
        }

        void UpdateAI(uint32 diff)
        {
            if (tSeek <= diff)
            {
                if ((me->isAlive()) && (!me->isInCombat() && (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 1.0f)))
                    if (Creature* enemy = me->FindNearestCreature(NPC_RAMPAGING_WORGEN_1, 16.0f, true))
                        me->AI()->AttackStart(enemy);
                tSeek = urand(1000, 2000); //optimize cpu load, seeking only sometime between 1 and 2 seconds
            }
            else tSeek -= diff;

            if (!UpdateVictim())
            {
                if (atHome)
                {
                    if (tSeek <= diff)
                    {
                        if (Creature* enemy = me->FindNearestCreature(NPC_RAMPAGING_WORGEN_1, 16.0f, true))
                            me->AI()->AttackStart(enemy);
                        tSeek = 5000;
                        atHome = false;
                    }else tSeek -= diff;
                }
                return;
            }

            if (playSnd == true)
            {
                if (tSound <= diff)
                {
                    me->PlayDistanceSound(SOUND_SWORD_FLESH);
                    tSound = DELAY_SOUND;
                    playSnd = false;
                }else tSound -= diff;
            }

            if (dmgCount < 2)
                DoMeleeAttackIfReady();
            if (Unit * victim = me->getVictim())
            {
                if (victim->GetTypeId() == TYPEID_PLAYER || victim->isPet())
                    dmgCount = 0;
                else
                {
                    if (tAnimate <= diff)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                        playSnd = true;
                        tAnimate = DELAY_ANIMATE;
                    }
                    else
                        tAnimate -= diff;
                }
            }
        }
    };
};

/*######
## npc_prince_liam_greymane_phase2
######*/

class npc_prince_liam_greymane_phase2 : public CreatureScript
{
public:
    npc_prince_liam_greymane_phase2() : CreatureScript("npc_prince_liam_greymane_phase2") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_prince_liam_greymane_phase2AI (creature);
    }

    struct npc_prince_liam_greymane_phase2AI : public ScriptedAI
    {
        npc_prince_liam_greymane_phase2AI(Creature* c) : ScriptedAI(c) {}

        uint32 tAnimate, tSound, dmgCount, tYell, tSeek;
        bool playSnd, doYell;

        void Reset()
        {
            tAnimate = DELAY_ANIMATE;
            dmgCount = 0;
            tSound = DELAY_SOUND;
            playSnd = false;
            tSeek = urand(1000, 2000);
            doYell = true;
            tYell = DELAY_YELL_PRINCE_LIAM_GREYMANE;
        }

		// There is NO phase shift here!!!!
        void DamageTaken(Unit* who, uint32 & /*uiDamage*/)
        {
            bool isPlayer = who->GetTypeId() == TYPEID_PLAYER;

            if (isPlayer || who->isPet())
            {
                me->getThreatManager().resetAllAggro();
                if (isPlayer)
                    who->AddThreat(me, 1.0f);
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
                dmgCount = 0;
            }
        }

        void DamageDealt(Unit* target, uint32& /*damage*/, DamageEffectType /*damaGetPositionYpe*/)
        {
            if (target->GetEntry() == NPC_RAMPAGING_WORGEN_1)
                ++dmgCount;
        }

        void UpdateAI(uint32 diff)
        {
            //If creature has no target
            if (!UpdateVictim())
            {
                if (tSeek <= diff)
                {
                    //Find worgen nearby
                    if (me->isAlive() && !me->isInCombat() && (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 1.0f))
                        if (Creature* enemy = me->FindNearestCreature(NPC_RAMPAGING_WORGEN_1, 16.0f, true))
                            me->AI()->AttackStart(enemy);
                    tSeek = urand(1000, 2000);//optimize cpu load
                }
                else tSeek -= diff;

                //Yell only once after Reset()
                if (doYell)
                {
                    //Yell Timer
                    if (tYell <= diff)
                    {
                        //Random yell
						Talk(YELL_PRINCE_LIAM_GREYMANE);
						tYell = urand(10000, 20000);
                        doYell = false;
                    }
                    else
                        tYell -= diff;
                }
            }
            else
            {
                //Play sword attack sound
                if (tSound <= diff)
                {
                    me->PlayDistanceSound(SOUND_SWORD_FLESH);
                    tSound = DELAY_SOUND;
                    playSnd = false;
                }

                if (playSnd == true) tSound -= diff;

                //Attack
                if (dmgCount < 2)
                    DoMeleeAttackIfReady();
                else if (me->getVictim()->GetTypeId() == TYPEID_PLAYER) dmgCount = 0;
                else if (me->getVictim()->isPet()) dmgCount = 0;
                else
                {
                    if (tAnimate <= diff)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                        playSnd = true;
                        tAnimate = DELAY_ANIMATE;
                    }
                    else
                        tAnimate -= diff;
                }

                //Stop yell timer on combat
                doYell = false;
            }
        }
    };
};


/*######
## npc_rampaging_worgen
######*/
enum eRampagingWorgen
{
    SPELL_ENRAGE        = 8599,
    CD_ENRAGE           = 30000
};

class npc_rampaging_worgen : public CreatureScript
{
    struct npc_rampaging_worgenAI : public ScriptedAI
    {
        npc_rampaging_worgenAI(Creature* c) : ScriptedAI(c) {}

        uint32 tEnrage;
        uint32 dmgCount;
        uint32 tAnimate;
        uint32 tSound;
        bool playSound, willCastEnrage;

        void Reset()
        {
            tEnrage = 0;
            dmgCount = 0;
            tAnimate = DELAY_ANIMATE;
            tSound = DELAY_SOUND;
            playSound = false;
            willCastEnrage = urand(0, 1);
        }

        void DamageDealt(Unit* target, uint32& /*damage*/, DamageEffectType /*damaGetPositionYpe*/)
        {
            if (target->GetEntry() == NPC_GILNEAS_CITY_GUARD || target->GetEntry() == NPC_PRINCE_LIAM_GREYMANE)
                ++dmgCount;
        }

        void DamageTaken(Unit* who, uint32 & /*uiDamage*/)
        {
            bool player = who->GetTypeId() == TYPEID_PLAYER;

            if (player || who->isPet())
            {
                me->getThreatManager().resetAllAggro();
                if (player)
                    who->AddThreat(me, 1.0f);
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
                dmgCount = 0;
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (willCastEnrage)
            {
                if (tEnrage <= diff)
                {
                    if (me->GetHealthPct() <= 30)
                    {
                        me->MonsterTextEmote(-106, 0);
                        DoCast(SPELL_ENRAGE);
                        tEnrage = CD_ENRAGE;
                    }
                }
                else tEnrage -= diff;
            }

            if (playSound)
            {
                if (tSound <= diff)
                {
                    me->PlayDistanceSound(SOUND_SWORD_PLATE);
                    tSound = DELAY_SOUND;
                    playSound = false;
                }else tSound -= diff;
            }

            if (dmgCount < 2)
                DoMeleeAttackIfReady();
            else if (Unit * victim = me->getVictim())
            {
                if (victim->GetTypeId() == TYPEID_PLAYER || victim->isPet())
                    dmgCount = 0;
                else
                {
                    if (tAnimate <= diff)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK_UNARMED);
                        tAnimate = DELAY_ANIMATE;
                        playSound = true;
                    }
                    else
                        tAnimate -= diff;
                }
            }
        }
    };

public:
    npc_rampaging_worgen() : CreatureScript("npc_rampaging_worgen") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_rampaging_worgenAI (creature);
    }
};

class npc_rampaging_worgen2 : public CreatureScript
{
public:
    npc_rampaging_worgen2() : CreatureScript("npc_rampaging_worgen2") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_rampaging_worgen2AI (creature);
    }

    struct npc_rampaging_worgen2AI : public ScriptedAI
    {
        npc_rampaging_worgen2AI(Creature* c) : ScriptedAI(c) {}

        uint32 tRun, tEnrage;
        bool onceRun, willCastEnrage;
        float x, y, z;

        void JustRespawned()
        {
            tEnrage = 0;
            tRun = 500;
            onceRun = true;
            x = me->m_positionX+cos(me->m_orientation)*8;
            y = me->m_positionY+sin(me->m_orientation)*8;
            z = me->m_positionZ;
            willCastEnrage = urand(0, 1);
        }

        void UpdateAI(uint32 diff)
        {
            if (tRun <= diff && onceRun)
            {
                me->GetMotionMaster()->MoveCharge(x, y, z, 8);
                onceRun = false;
            }
            else tRun -= diff;

            if (!UpdateVictim())
                return;

            if (tEnrage <= diff)
            {
                if (me->GetHealthPct() <= 30 && willCastEnrage)
                {
                    me->MonsterTextEmote(-106, 0);
                    DoCast(me, SPELL_ENRAGE);
                    tEnrage = CD_ENRAGE;
                }
            }
            else tEnrage -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

/*######
## go_merchant_square_door
######*/

#define DOOR_TIMER                                    30*IN_MILLISECONDS
#define SUMMON1_TTL                                   300000	

class go_merchant_square_door : public GameObjectScript
{
public:
    go_merchant_square_door() : GameObjectScript("go_merchant_square_door"), aPlayer(NULL) {}

    float x, y, z, wx, wy, angle, tQuestCredit;
    bool opened;
    uint8 spawnKind;
    Player* aPlayer;
    GameObject* go;
    uint32 DoorTimer;

    bool OnGossipHello(Player* player, GameObject* go)
    {
        if (player->GetQuestStatus(QUEST_EVAC_MERC_SQUA) == QUEST_STATUS_INCOMPLETE && go->GetGoState() == GO_STATE_READY)
        {
            aPlayer          = player;
            opened           = 1;
            tQuestCredit     = 2500;
            go->SetGoState(GO_STATE_ACTIVE);
            DoorTimer = DOOR_TIMER;
            spawnKind = urand(1, 3); // 1, 2=citizen, 3=citizen&worgen (66%, 33%)
            angle = go->GetOrientation();
            x = go->GetPositionX()-cos(angle)*2;
            y = go->GetPositionY()-sin(angle)*2;
            z = go->GetPositionZ();
            wx = x-cos(angle)*2;
            wy = y-sin(angle)*2;

            if (spawnKind < 3)
            {
                if (Creature* spawnedCreature = go->SummonCreature(NPC_FRIGHTENED_CITIZEN_1, x, y, z, angle, TEMPSUMMON_TIMED_DESPAWN, SUMMON1_TTL))
                {
                    spawnedCreature->SetPhaseMask(6, 1);
                    spawnedCreature->Respawn(1);
                }
            }
            else
            {
                if (Creature* spawnedCreature = go->SummonCreature(NPC_FRIGHTENED_CITIZEN_2, x, y, z, angle, TEMPSUMMON_TIMED_DESPAWN, SUMMON1_TTL))
                {
                    spawnedCreature->SetPhaseMask(6, 1);
                    spawnedCreature->Respawn(1);
                }
            }
            return true;
        }
        return false;
    }

    void OnUpdate(GameObject* go, uint32 diff)
    {
        if (opened == 1)
        {
            if (tQuestCredit <= ((float)diff/8))
            {
                opened = 0;

                if(aPlayer)
                    aPlayer->KilledMonsterCredit(35830, 0);

                if (spawnKind == 3)
                {
                    if (Creature* spawnedCreature = go->SummonCreature(NPC_RAMPAGING_WORGEN_2, wx, wy, z, angle, TEMPSUMMON_TIMED_DESPAWN, SUMMON1_TTL))
                    {
                        spawnedCreature->SetPhaseMask(6, 1);
                        spawnedCreature->Respawn(1);
                        spawnedCreature->getThreatManager().resetAllAggro();
                        if(aPlayer)
                            aPlayer->AddThreat(spawnedCreature, 1.0f);
                        spawnedCreature->AddThreat(aPlayer, 1.0f);
                    }
                }
            }
            else tQuestCredit -= ((float)diff/8);
        }
        if (DoorTimer <= diff)
            {
                if (go->GetGoState() == GO_STATE_ACTIVE)
                    go->SetGoState(GO_STATE_READY);

                DoorTimer = DOOR_TIMER;
            }
        else
            DoorTimer -= diff;
    }
};

/*######
## npc_frightened_citizen
######*/

enum eFrightened_citizen
{
    SAY_CITIZEN_1       = -1638003,
    SAY_CITIZEN_2       = -1638004,
    SAY_CITIZEN_3       = -1638005,
    SAY_CITIZEN_4       = -1638006,
    SAY_CITIZEN_5       = -1638007,
    SAY_CITIZEN_6       = -1638008,
    SAY_CITIZEN_7       = -1638009,
    SAY_CITIZEN_8       = -1638010,
    SAY_CITIZEN_1b      = -1638011,
    SAY_CITIZEN_2b      = -1638012,
    SAY_CITIZEN_3b      = -1638013,
    SAY_CITIZEN_4b      = -1638014,
    SAY_CITIZEN_5b      = -1638015,
    PATHS_COUNT         = 2
};

struct Point
{
    float x, y;
};

struct WayPointID
{
    int pathID, pointID;
};

struct Paths
{
    Paths(): pointsCount(), paths() {};
    uint8 pointsCount[8];//pathID, pointsCount
    Point paths[8][10];//pathID, pointID, Point
};

class npc_frightened_citizen : public CreatureScript
{
public:
    npc_frightened_citizen() : CreatureScript("npc_frightened_citizen") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_frightened_citizenAI (creature);
    }

    struct npc_frightened_citizenAI : public ScriptedAI
    {
        npc_frightened_citizenAI(Creature* c) : ScriptedAI(c) {}

        uint32 tRun, tRun2, tSay;
        bool onceRun, onceRun2, onceGet, onceSay;
        float x, y, z;
        WayPointID nearestPointID;
        Paths paths;

        Paths LoadPaths()
        {
            Paths paths;
            QueryResult result[PATHS_COUNT];
            result[0] = WorldDatabase.Query("SELECT `id`, `point`, `position_x`, `position_y` FROM waypoint_data WHERE id = 349810 ORDER BY `point`");
            result[1] = WorldDatabase.Query("SELECT `id`, `point`, `position_x`, `position_y` FROM waypoint_data WHERE id = 349811 ORDER BY `point`");
            if (result[0])
                paths.pointsCount[0] = uint8(result[0]->GetRowCount());
            else
            {
                sLog->outError(LOG_FILTER_TSCR, "waypoint_data for frightened citizen missing");
                return paths;  ///- this needs correctly fixed! -truncation from double to float (warnings, that can be fixed)
            }
            if (result[1])
                paths.pointsCount[1] = uint8(result[1]->GetRowCount());
            else
            {
                sLog->outError(LOG_FILTER_TSCR, "waypoint_data for frightened citizen missing");
                return paths;
            }
            uint8 j;
            for (uint8 i = 0; i < PATHS_COUNT; i ++)
            {
                j = 0;
                do
                {
                    Field* pFields = result[i]->Fetch();
                    paths.paths[i][j].x = pFields[2].GetFloat();
                    paths.paths[i][j].y = pFields[3].GetFloat();
                    j++;
                }
                while (result[i]->NextRow());
            }

            return paths;
        }

        void MultiDistanceMeter(Point *p, uint8 pointsCount, float *dist)
        {
            for (uint8 i = 0; i <= (pointsCount-1); i++)
            {
                dist[i] = me->GetDistance2d(p[i].x, p[i].y);
            }
        }

        WayPointID GetNearestPoint(Paths paths)
        {
            WayPointID nearestPointID;
            float dist[PATHS_COUNT][10], lowestDists[PATHS_COUNT];
            uint8 nearestPointsID[PATHS_COUNT], lowestDist;
            for (uint8 i = 0; i <= PATHS_COUNT-1; i++)
            {
                MultiDistanceMeter(paths.paths[i], paths.pointsCount[i], dist[i]);
                for (uint8 j = 0; j <= paths.pointsCount[i]-1; j++)
                {
                    if (j == 0)
                    {
                        lowestDists[i] = dist[i][j];
                        nearestPointsID[i] = j;
                    }
                    else if (lowestDists[i] > dist[i][j])
                    {
                        lowestDists[i] = dist[i][j];
                        nearestPointsID[i] = j;
                    }
                }
            }
            for (uint8 i = 0; i < PATHS_COUNT; i++)
            {
                if (i == 0)
                    {
                        lowestDist = uint8(lowestDists[i]);
                        nearestPointID.pointID = nearestPointsID[i];
                        nearestPointID.pathID = i;
                    }
                    else if (lowestDist > lowestDists[i])
                    {
                        lowestDist = uint8(lowestDists[i]);
                        nearestPointID.pointID = nearestPointsID[i];
                        nearestPointID.pathID = i;
                    }
            }
            return nearestPointID;
        }

        void JustRespawned()
        {
            paths = LoadPaths();
            tRun = 500;
            tRun2 = 2500;
            tSay = 1000;
            onceRun = onceRun2 = onceSay = onceGet = true;
            x = me->m_positionX+cos(me->m_orientation)*5;
            y = me->m_positionY+sin(me->m_orientation)*5;
            z = me->m_positionZ;
        }

        void UpdateAI(uint32 diff)
        {
            if (tRun <= diff && onceRun)
            {
                me->GetMotionMaster()->MoveCharge(x, y, z, 8);
                onceRun = false;
            }
            else tRun -= diff;

            if (tSay <= diff && onceSay)
            {
                if (me->GetEntry() == NPC_FRIGHTENED_CITIZEN_1)
//                    DoScriptText(RAND(SAY_CITIZEN_1, SAY_CITIZEN_2, SAY_CITIZEN_3, SAY_CITIZEN_4, SAY_CITIZEN_5, SAY_CITIZEN_6, SAY_CITIZEN_7, SAY_CITIZEN_8), me);
//                else
//                    DoScriptText(RAND(SAY_CITIZEN_1b, SAY_CITIZEN_2b, SAY_CITIZEN_3b, SAY_CITIZEN_4b, SAY_CITIZEN_5b), me);
                onceSay = false;
            }
            else tSay -= diff;

            if (tRun2 <= diff)
            {
                if (onceGet)
                {
                    nearestPointID = GetNearestPoint(paths);
                    onceGet = false;
                }
                else
                {
                    if (me->GetDistance2d(paths.paths[nearestPointID.pathID][nearestPointID.pointID].x, paths.paths[nearestPointID.pathID][nearestPointID.pointID].y) > 1)
                        me->GetMotionMaster()->MoveCharge(paths.paths[nearestPointID.pathID][nearestPointID.pointID].x, paths.paths[nearestPointID.pathID][nearestPointID.pointID].y, z, 8);
                    else
                        nearestPointID.pointID ++;
                    if (nearestPointID.pointID >= paths.pointsCount[nearestPointID.pathID]) me->DespawnOrUnsummon();
                }
            }
            else tRun2 -= diff;
        }
    };
};

static const Position spawnPos[3][3]=
{
    {
        {-1718.195f, 1526.525879f, 55.918981f, 4.698965f}, // Spawn Left
        {-1718.152f, 1486.315918f, 57.232832f, 5.437238f}, // MoveTo Left
        {-1699.458f, 1468.477783f, 52.297140f, 5.523634f} // JumpTo Left
    },
    {
        {-1625.497f, 1492.348755f, 73.716627f, 4.070646f}, // Spawn Mid
        {-1632.688f, 1485.533447f, 74.958799f, 3.874443f}, // MoveTo Mid
        {-1676.319f, 1445.140747f, 52.297140f, 0.748411f} // JumpTo Mid - CENTER
    },
    {
        {-1562.104f, 1409.827148f, 71.676458f, 3.218636f}, // Spawn Right
        {-1594.044f, 1408.207397f, 72.850088f, 3.120459f}, // MoveTo Right
        {-1655.406f, 1425.001953f, 52.297109f, 2.291864f} //JumpTo Right
    }
};

class npc_lord_darius_crowley : public CreatureScript
{
    enum
    {
        SPELL_DEMORALIZING_SHOUT            = 61044,
        SPELL_BY_THE_SKIN                   = 66914,
        SPELL_LEFT_HOOK                     = 67825,
        SPELL_SNAP_KICK                     = 67827,
        SPELL_PHASING_AURA                  = 59073,

        QUEST_BY_THE_SKIN                   = 14154,
        ACTION_START_EVENT                  = 1,

        NPC_WORGEN_RUNT                     = 35456,
        NPC_WORGEN_RUNT_2                   = 35188,
        NPC_WORGEN_ALPHA                    = 35167,
        NPC_WORGEN_ALPHA_2                  = 35170,

        EVENT_DEMORALIZING_SHOUT            = 1,
        EVENT_LEFT_HOOK                     = 2,
        EVENT_SNAP_KICK                     = 3,
        EVENT_NEXT_WAVE                     = 4,
    };

    struct npc_lord_darius_crowleyAI : ScriptedAI
    {
        npc_lord_darius_crowleyAI(Creature* c) : ScriptedAI(c), Summons(me)
        {
           SetCombatMovement(false);
        }

        Player* m_player;

        void Reset()
        {
            EventInProgress = false;
            stage = 1;
            summonPos = 0;
            cnt = 0;
            toSummon = 0;
            phaseTimer = 15000;
            m_player = NULL;

            events.Reset();
            SetCombatMovement(false);
            Summons.DespawnAll();
        }

        void EnterEvadeMode()
        {
            if (!EventInProgress)
                ScriptedAI::EnterEvadeMode();
        }

        void JustSummoned(Creature* summoned)
        {
            Summons.Summon(summoned);
            summoned->AI()->SetData(0, summonPos);
        }

        void DoAction(int32 /*action*/)
        {
            if (!EventInProgress)
            {
                EventInProgress = true;
                stage = 1;
                events.ScheduleEvent(EVENT_NEXT_WAVE, 5000);
                events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, 20000);
                events.ScheduleEvent(EVENT_LEFT_HOOK, 25000);
                events.ScheduleEvent(EVENT_SNAP_KICK, 28000);
            }
        }

        void SetGUID(uint64 guid, int32)
        {
            if (!EventInProgress)
                playerGUID = guid;
        }

        void SummonedCreatureDespawn(Creature* summoned)
        {
            Summons.Despawn(summoned);
        }

        void JustDied(Unit* /*killer*/)
        {
            if (Player * player = me->GetPlayer(*me, playerGUID))
            {
                player->RemoveAurasDueToSpell(SPELL_PHASING_AURA);
                player->FailQuest(QUEST_BY_THE_SKIN);
            }
        }

        void CastVictim(uint32 spellId)
        {
            if (me->getVictim())
                DoCastVictim(spellId);
        }

        void UpdateAI(uint32 diff)
        {
            if (me->isInCombat())
                if (Unit* victim = me->SelectVictim())
                    AttackStart(victim);

            if (!EventInProgress)
                return;

            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_DEMORALIZING_SHOUT:
                    DoCast(SPELL_DEMORALIZING_SHOUT);
                    events.ScheduleEvent(EVENT_DEMORALIZING_SHOUT, 15000);
                    break;
                case EVENT_LEFT_HOOK:
                    CastVictim(SPELL_LEFT_HOOK);
                    events.ScheduleEvent(EVENT_LEFT_HOOK, 5000);
                    break;
                case EVENT_SNAP_KICK:
                    CastVictim(SPELL_SNAP_KICK);
                    events.ScheduleEvent(EVENT_SNAP_KICK, urand(3000, 8000));
                    break;
                case EVENT_NEXT_WAVE:
                    {
                        cnt = 0;
                        toSummon = 0;

                        switch(stage)
                        {
                        case 1:
                            cnt = 8;
                            toSummon = NPC_WORGEN_ALPHA;
                            break;
                        case 2:
                        case 7:
                            cnt = 0;
                            toSummon = NPC_WORGEN_ALPHA_2;
                            break;
                        case 3:
                            cnt = 10;
                            toSummon = NPC_WORGEN_RUNT_2;
                            break;
                        case 4:
                            cnt = 0;
                            toSummon = NPC_WORGEN_RUNT_2;
                            break;
                        case 5:
                            cnt = 7;
                            toSummon = NPC_WORGEN_ALPHA;
                            break;
                        case 6:
                            cnt = 7;
                            toSummon = NPC_WORGEN_RUNT_2;
                            break;
                        default:
                            return;
                        }
                        for(int i = 0; i < cnt; ++i)
                            me->SummonCreature(NPC_WORGEN_RUNT, spawnPos[summonPos][0], TEMPSUMMON_CORPSE_DESPAWN, 10000);
                        me->SummonCreature(toSummon, spawnPos[summonPos][0], TEMPSUMMON_CORPSE_DESPAWN, 10000);

                        ++stage;

                        if (summonPos > 1)
                            summonPos = 0;
                        else
                            ++summonPos;

                        if (stage > 7)
                        {
                            stage = 1;
                            EventInProgress = false;
                            events.Reset();
                        }
                        else
                            events.ScheduleEvent(EVENT_NEXT_WAVE, 15000);
                    }
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }

    private:
        bool EventInProgress;
        uint8 stage;
        uint8 summonPos;
        int cnt;
        uint32 toSummon;
        uint32 phaseTimer;
        uint64 playerGUID;

        EventMap events;
        SummonList Summons;
    };

public:
    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_BY_THE_SKIN)
        {
            creature->AI()->DoAction(ACTION_START_EVENT);
            creature->AI()->SetGUID(player->GetGUID());
            creature->CastSpell(player, SPELL_BY_THE_SKIN, true);
        }
        return true;
    }

    npc_lord_darius_crowley() : CreatureScript("npc_lord_darius_crowley") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lord_darius_crowleyAI (creature);
    }
};

class npc_soht_worgen : public CreatureScript
{
    enum
    {
        POINT_EDGE          = 1,
        POINT_JUMP_DEST     = 0,
    };

    struct npc_soht_worgenAI : public ScriptedAI
    {
        npc_soht_worgenAI(Creature* c) : ScriptedAI(c)
        {
            canStart = false;
            id = 0;
            summonerGUID = 0;
        }

        void Reset()
        {
            moveDelay = 0;
        }

        void IsSummonedBy(Unit * summoner)
        {
            summonerGUID = summoner->GetGUID();
        }

        void SetData(uint32 /*type*/, uint32 data)
        {
            if (!canStart)
            {
                id = uint8(data);
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MovePoint(POINT_EDGE, spawnPos[id][1]);
            }
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE)
                return;

            if (id == POINT_EDGE)
            {
                moveDelay = urand(0, 3000);
                canStart = true;
            }
            else if (id == POINT_JUMP_DEST) // moveJump uses id 0
            {
                if (Unit * summoner = me->GetUnit(*me, summonerGUID))
                    AttackStart(summoner);
                else
                    me->GetMotionMaster()->MovePoint(2, spawnPos[1][2]);
            }
        }

        void UpdateAI(uint32 diff)
        {
            if (canStart)
            {
                if (moveDelay <= diff)
                {
                    Position pos = spawnPos[id][2];
                    me->MovePosition(pos, 10.0f * (float)rand_norm(), (float)rand_norm() * static_cast<float>(2 * M_PI));
                    me->GetMotionMaster()->Clear();
                    me->GetMotionMaster()->MoveJump(pos, 20.0f, 15.0f);
                    canStart = false;
                }else moveDelay -= diff;
            }

            if (me->getVictim())
                DoMeleeAttackIfReady();
        }
    private:
        bool canStart;
        uint8 id;
        uint32 moveDelay;
        uint64 summonerGUID;
    };

public:
    npc_soht_worgen() : CreatureScript("npc_soht_worgen") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_soht_worgenAI (creature);
    }
};

/*######
## npc_josiah_avery_trigger
######*/

class npc_josiah_avery_trigger : public CreatureScript
{
public:
    npc_josiah_avery_trigger() : CreatureScript("npc_josiah_avery_trigger") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_josiah_avery_triggerAI (creature);
    }

    struct npc_josiah_avery_triggerAI : public ScriptedAI
    {
        npc_josiah_avery_triggerAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 Phase, tEvent;
        uint64 PlayerGUID;

        void Reset()
        {
            Phase       = 0;
            PlayerGUID  = 0;
            tEvent      = 0;
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (Creature* Lorna = me->FindNearestCreature(NPC_LORNA_CROWLEY_P4, 60.0f, true))
            if (Creature* BadAvery = me->FindNearestCreature(NPC_JOSIAH_AVERY_P4, 80.0f, true))
            if (Player* player = me->SelectNearestPlayer(50.0f))
            {
                if (!player->HasAura(SPELL_WORGEN_BITE))
                    return;
                else
                    PlayerGUID = player->GetGUID();
                    if (tEvent <= diff)
                    {
                        switch (Phase)
                        {
                            case (0):
                            {
                                me->AI()->Talk(SAY_JOSAIH_AVERY_TRIGGER, PlayerGUID); // Tell Player they have been bitten
                                tEvent = 200;
                                Phase++;
                                break;
                            }

                            case (1):
                            {
                                BadAvery->SetOrientation(BadAvery->GetAngle(player)); // Face Player
                                BadAvery->CastSpell(player, 69873, true); // Do Cosmetic Attack
                                //player->GetMotionMaster()->MoveKnockTo(-1791.94f, 1427.29f, 12.4584f, 22.0f, 8.0f, PlayerGUID);
                                BadAvery->getThreatManager().resetAllAggro();
                                tEvent = 1200;
                                Phase++;
                                break;
                            }

                            case (2):
                            {
                                BadAvery->GetMotionMaster()->MoveJump(-1791.94f, 1427.29f, 12.4584f, 18.0f, 7.0f);
                                tEvent = 600;
                                Phase++;
                                break;
                            }

                            case (3):
                            {
                                Lorna->CastSpell(BadAvery, SPELL_SHOOT, true);
                                tEvent = 200;
                                Phase++;
                                break;
                            }

                            case (4):
                            {
                                BadAvery->CastSpell(BadAvery, SPELL_GET_SHOT, true);
                                BadAvery->setDeathState(JUST_DIED);
                                player->SaveToDB();
                                BadAvery->DespawnOrUnsummon(1000);
                                me->DespawnOrUnsummon(1000);
                                tEvent = 5000;
                                Phase++;
                                break;
                            }
                        }
                    }
                    else tEvent -= diff;
            }
        }
    };
};

/*######
## npc_lorna_crowley_p4
######*/

class npc_lorna_crowley_p4 : public CreatureScript
{
public:
    npc_lorna_crowley_p4() : CreatureScript("npc_lorna_crowley_p4") {}

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == QUEST_FROM_THE_SHADOWS)
        {
            player->CastSpell(player, SPELL_SUMMON_GILNEAN_MASTIFF);
            creature->AI()->Talk(SAY_LORNA_CROWLEY_P4);
        }
        return true;
    }
};

/*######
# npc_gilnean_mastiff
######*/

class npc_gilnean_mastiff : public CreatureScript
{
public:
    npc_gilnean_mastiff() : CreatureScript("npc_gilnean_mastiff") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilnean_mastiffAI(creature);
    }

    struct npc_gilnean_mastiffAI : public ScriptedAI
    {
        npc_gilnean_mastiffAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            me->GetCharmInfo()->InitEmptyActionBar(false);
            me->GetCharmInfo()->SetActionBar(0, SPELL_ATTACK_LURKER, ACT_PASSIVE);
            me->SetReactState(REACT_DEFENSIVE);
            me->GetCharmInfo()->SetIsFollowing(true);
        }

        virtual void UpdateAI(uint32 diff) /*diff*/
        {
            Player* player = me->GetOwner()->ToPlayer();

            if (player->GetQuestStatus(QUEST_FROM_THE_SHADOWS) == QUEST_STATUS_REWARDED)
            {
                me->DespawnOrUnsummon(1);
            }

            if (!UpdateVictim())
            {
                me->GetCharmInfo()->SetIsFollowing(true);
                me->SetReactState(REACT_DEFENSIVE);
                return;
            }

            DoMeleeAttackIfReady();
        }

        void SpellHitTarget(Unit* Mastiff, SpellInfo const* cSpell)
        {
            if (cSpell->Id == SPELL_ATTACK_LURKER)
            {
                Mastiff->RemoveAura(SPELL_SHADOWSTALKER_STEALTH);
                Mastiff->AddThreat(me, 1.0f);
                me->AddThreat(Mastiff, 1.0f);
                me->AI()->AttackStart(Mastiff);
            }
        }

        void JustDied(Unit* /*killer*/) // Otherwise, player is stuck with pet corpse they cannot remove from world
        {
            me->DespawnOrUnsummon(1);
        }

        void KilledUnit(Unit* /*victim*/)
        {
            Reset();
        }
    };
};

/*######
## npc_bloodfang_lurker
######*/

class npc_bloodfang_lurker : public CreatureScript
{
public:
    npc_bloodfang_lurker() : CreatureScript("npc_bloodfang_lurker") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_bloodfang_lurkerAI (creature);
    }

    struct npc_bloodfang_lurkerAI : public ScriptedAI
    {
        npc_bloodfang_lurkerAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tEnrage, tSeek;
        bool willCastEnrage;

        void Reset()
        {
            tEnrage           = 0;
            willCastEnrage    = urand(0, 1);
            tSeek             = urand(5000, 10000);
            DoCast(me, SPELL_SHADOWSTALKER_STEALTH);
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (tSeek <= diff)
            {
                if ((me->isAlive()) && (!me->isInCombat() && (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 2.0f)))
                    if (Player* player = me->SelectNearestPlayer(2.0f))
                    {
                        if (!player->isInCombat())
                        {
                            me->AI()->AttackStart(player);
                            tSeek = urand(5000, 10000);
                        }
                    }
            }
            else tSeek -= diff;

            if (!UpdateVictim())
                return;

            if (tEnrage <= diff && willCastEnrage && me->GetHealthPct() <= 30)
            {
                me->MonsterTextEmote(-106, 0);
                DoCast(me, SPELL_ENRAGE);
                tEnrage = CD_ENRAGE;
            }
            else
                tEnrage -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

/* QUEST - 14204 - FROM THE SHADOWS - END */

/*######
## npc_josiah_avery_p2
######*/

class npc_josiah_avery_p2 : public CreatureScript
{
public:
    npc_josiah_avery_p2() : CreatureScript("npc_josiah_avery_p2") {}

    bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt)
    {
        if (quest->GetQuestId() == QUEST_THE_REBEL_LORDS_ARSENAL)
        {
            creature->AddAura(SPELL_WORGEN_BITE, player);
            player->RemoveAura(SPELL_PHASE_QUEST_2);
            creature->SetPhaseMask(4, 1);
            creature->CastSpell(creature, SPELL_SUMMON_JOSIAH_AVERY);
            creature->SetPhaseMask(2, 1);
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_josiah_avery_p2AI (creature);
    }

    struct npc_josiah_avery_p2AI : public ScriptedAI
    {
        npc_josiah_avery_p2AI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tSay; // Time left for say
        uint32 cSay; // Current Say

		        // Evade or Respawn
        void Reset()
        {
            tSay = DELAY_SAY_JOSIAH_AVERY; // Reset timer
            cSay = 1;                              // Start from 1
        }

        //Timed events
        void UpdateAI(uint32 diff)
        {
            //Out of combat
            if (!me->getVictim())
            {
                //Timed say
                if (tSay <= diff)
                {
                    switch (cSay)
                    {
                        default:
                        case 1:
                             Talk(SAY_JOSIAH_AVERY_1);
                            cSay++;
                            break;
                        case 2:
                             Talk(SAY_JOSIAH_AVERY_2);
                            cSay++;
                            break;
                        case 3:
                             Talk(SAY_JOSIAH_AVERY_3);
                            cSay++;
                            break;
                        case 4:
                             Talk(SAY_JOSIAH_AVERY_4);
                            cSay++;
                            break;
                        case 5:
                             Talk(SAY_JOSIAH_AVERY_5);
                            cSay = 1; // Reset to 1
                            break;							
                    }

                    tSay = DELAY_SAY_JOSIAH_AVERY; // Reset the timer
                }
                else
                {
                    tSay -= diff;
                }
                return;
            }
        }
    };
};

/*######
## npc_king_genn_greymane
######*/

class npc_king_genn_greymane : public CreatureScript
{
public:
    npc_king_genn_greymane() : CreatureScript("npc_king_genn_greymane") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_king_genn_greymaneAI (creature);
    }

    struct npc_king_genn_greymaneAI : public ScriptedAI
    {
        npc_king_genn_greymaneAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tSummon, tSay;
        bool EventActive, RunOnce;

        void Reset()
        {
            tSay            = urand(10000, 20000);
            tSummon         = urand(3000, 5000); // How often we spawn
        }

        void SummonNextWave()
        {
            switch (urand (1,4))
            {
                case (1):
                    for (int i = 0; i < 5; i++)
                        me->SummonCreature(NPC_BLOODFANG_RIPPER_P4, -1781.173f + irand(-15, 15), 1372.90f + irand(-15, 15), 19.7803f, urand(0, 6), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15000);
                    break;
                case (2):
                    for (int i = 0; i < 5; i++)
                        me->SummonCreature(NPC_BLOODFANG_RIPPER_P4, -1756.30f + irand(-15, 15), 1380.61f + irand(-15, 15), 19.7652f, urand(0, 6), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15000);
                    break;
                case (3):
                    for (int i = 0; i < 5; i++)
                        me->SummonCreature(NPC_BLOODFANG_RIPPER_P4, -1739.84f + irand(-15, 15), 1384.87f + irand(-15, 15), 19.841f, urand(0, 6), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15000);
                    break;
                case (4):
                    for (int i = 0; i < 5; i++)
                        me->SummonCreature(NPC_BLOODFANG_RIPPER_P4, -1781.173f + irand(-15, 15), 1372.90f + irand(-15, 15), 19.7803f, urand(0, 6), TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 15000);
                    break;
            }
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (tSay <= diff) // Time for next spawn wave
            {
                Talk(SAY_KING_GENN_GREYMANE);
                tSay = urand(10000, 20000);
            }
            else tSay -= diff;

            if (tSummon <= diff) // Time for next spawn wave
            {
                SummonNextWave(); // Activate next spawn wave
                tSummon = urand(3000, 5000); // Reset our spawn timer
            }
            else tSummon -= diff;
        }

        void JustSummoned(Creature* summoned)
        {
            summoned->GetDefaultMovementType();
            summoned->SetReactState(REACT_AGGRESSIVE);
        }
    };
};

// Phase 4
/*######
## npc_bloodfang_worgen
######*/

class npc_bloodfang_worgen : public CreatureScript
{
public:
    npc_bloodfang_worgen() : CreatureScript("npc_bloodfang_worgen") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_bloodfang_worgenAI (creature);
    }

    struct npc_bloodfang_worgenAI : public ScriptedAI
    {
        npc_bloodfang_worgenAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tEnrage, tSeek;
        bool willCastEnrage;

        void Reset()
        {
            tEnrage           = 0;
            willCastEnrage    = urand(0, 1);
            tSeek             = 100; // On initial loading, we should find our target rather quickly
        }

        void DamageTaken(Unit* who, uint32& damage)
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                me->getThreatManager().resetAllAggro();
                who->AddThreat(me, 1.0f);
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
            }
            else if (who->isPet())
            {
                me->getThreatManager().resetAllAggro();
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
            }
            else if (me->HealthBelowPct(30) && who->GetEntry() == NPC_GILNEAN_ROYAL_GUARD || who->GetEntry() == NPC_SERGEANT_CLEESE || who->GetEntry() == NPC_MYRIAM_SPELLWALKER)
                damage = 0;
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (tSeek <= diff)
            {
                if ((me->isAlive()) && (!me->isInCombat() && (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 1.0f)))
                    if (Creature* enemy = me->FindNearestCreature(NPC_SERGEANT_CLEESE || NPC_GILNEAN_ROYAL_GUARD, 10.0f, true))
                        me->AI()->AttackStart(enemy);
                tSeek = urand(1000, 2000); //optimize cpu load, seeking only sometime between 1 and 2 seconds
            }
            else tSeek -= diff;

            if (!UpdateVictim())
                return;

            if (tEnrage <= diff && willCastEnrage && me->GetHealthPct() <= 30)
            {
                me->MonsterTextEmote(-106, 0);
                DoCast(me, SPELL_ENRAGE);
                tEnrage = CD_ENRAGE;
            }
            else
                tEnrage -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_king_genn_greymane_c2
######*/

class npc_king_genn_greymane_c2 : public CreatureScript
{
public:
    npc_king_genn_greymane_c2() : CreatureScript("npc_king_genn_greymane_c2") {}

    bool OnQuestComplete(Player* player, Creature* /*creature*/, Quest const* /*quest*/)
    {
        player->RemoveAurasDueToSpell(68630);
        player->RemoveAurasDueToSpell(76642);
        player->CastSpell(player, 68481, true);
        return true;
    }
};


/*######
## npc_gilneas_city_guard_p8
######*/

class npc_gilneas_city_guard_p8 : public CreatureScript
{
public:
    npc_gilneas_city_guard_p8() : CreatureScript("npc_gilneas_city_guard_p8") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilneas_city_guard_p8AI (creature);
    }

    struct npc_gilneas_city_guard_p8AI : public ScriptedAI
    {
        npc_gilneas_city_guard_p8AI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tYell, SayChance, WillSay;

        void Reset()
        {
            WillSay     = urand(0,100);
            SayChance   = 10;
            tYell       = urand(10000, 20000);
        }

        void DamageTaken(Unit* who, uint32& damage)
        {
            if (who->GetEntry() == NPC_AFFLICTED_GILNEAN_P8 && me->GetHealthPct() <= 30)
            {
                damage = 0;
            }
        }

        virtual void UpdateAI(uint32 diff)
        {
            if(tYell <= diff)
            {
                if (WillSay <= SayChance)
                {
                    Talk(SAY_GILNEAS_CITY_GUARD_P8);
                    tYell = urand(10000, 20000);
                }
            }
            else tYell -= diff;

            if (!UpdateVictim())
                return;
            else
                DoMeleeAttackIfReady();
        }
    };
};

/*######
## npc_afflicted_gilnean_p8
######*/

class npc_afflicted_gilnean_p8 : public CreatureScript
{
public:
    npc_afflicted_gilnean_p8() : CreatureScript("npc_afflicted_gilnean_p8") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_afflicted_gilnean_p8AI (creature);
    }

    struct npc_afflicted_gilnean_p8AI : public ScriptedAI
    {
        npc_afflicted_gilnean_p8AI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tEnrage, tSeek;
        bool willCastEnrage;

        void Reset()
        {
            tEnrage           = 0;
            willCastEnrage    = urand(0, 1);
            tSeek             = 100; // On initial loading, we should find our target rather quickly
        }

        void DamageTaken(Unit* who, uint32& damage)
        {
            if (who->GetTypeId() == TYPEID_PLAYER)
            {
                me->getThreatManager().resetAllAggro();
                who->AddThreat(me, 1.0f);
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
            }
            else if (who->isPet())
            {
                me->getThreatManager().resetAllAggro();
                me->AddThreat(who, 1.0f);
                me->AI()->AttackStart(who);
            }
            else if (who->GetEntry() == NPC_GILNEAS_CITY_GUARD_P8)
            {
                if (damage >= me->GetHealth())
                {
                    damage = 0;
                    me->SetHealth(me->GetMaxHealth() * .85);
                }
            }
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (tSeek <= diff)
            {
                if ((me->isAlive()) && (!me->isInCombat() && (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 1.0f)))
                    if (Creature* enemy = me->FindNearestCreature(NPC_GILNEAS_CITY_GUARD_P8, 5.0f, true))
                        me->AI()->AttackStart(enemy);
                tSeek = urand(1000, 2000);
            }
            else tSeek -= diff;

            if (!UpdateVictim())
                return;

            if (tEnrage <= diff && willCastEnrage && me->GetHealthPct() <= 30)
            {
                me->MonsterTextEmote(-106, 0);
                DoCast(me, SPELL_ENRAGE);
                tEnrage = CD_ENRAGE;
            }
            else
                tEnrage -= diff;

            DoMeleeAttackIfReady();
        }
    };
};


/*######
## npc_krennan_aranas_c2
######*/

class npc_krennan_aranas_c2 : public CreatureScript
{
public:
    npc_krennan_aranas_c2() : CreatureScript("npc_krennan_aranas_c2") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_krennan_aranas_c2AI(creature);
    }

    struct npc_krennan_aranas_c2AI : public ScriptedAI
    {
        npc_krennan_aranas_c2AI(Creature* creature) : ScriptedAI(creature) {}

        bool Say, Move, Cast, KrennanDead;
        uint32 SayTimer;

        void AttackStart(Unit* /*who*/) {}
        void EnterCombat(Unit* /*who*/) {}
        void EnterEvadeMode() {}

        void Reset()
        {
            Say             = false;
            Move            = true;
            Cast            = true;
            KrennanDead     = false;
            SayTimer        = 500;
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (Creature* krennan = me->FindNearestCreature(NPC_KRENNAN_ARANAS_TREE, 50.0f))
            {
                if (!KrennanDead)
                {
                    krennan->ForcedDespawn(0);
                    KrennanDead = true;
                }
            }

            if (Creature* horse = me->FindNearestCreature(NPC_GREYMANE_HORSE_P4, 20.0f))//Jump onto horse in seat 2
            {
                if (Cast)
                {
                    DoCast(horse, 84275, true);
                }

                if (me->HasAura(84275))
                {
                    Cast = false;
                }
            }

            if (!me->HasAura(84275) && Move)
            {
                me->NearTeleportTo(KRENNAN_END_X, KRENNAN_END_Y, KRENNAN_END_Z, KRENNAN_END_O);
                Say = true;
                Move = false;
                SayTimer = 500;
            }

            if (Say && SayTimer <= diff)
            {
                Talk(SAY_KRENNAN_C2);
                me->ForcedDespawn(6000);
                Say = false;
            }
            else
                SayTimer -= diff;
        }
    };
};

class npc_lord_darius_crowley_c2 : public CreatureScript
{
public:
    npc_lord_darius_crowley_c2() : CreatureScript("npc_lord_darius_crowley_c2") { }

    bool OnQuestAccept(Player* player, Creature* /*creature*/, Quest const* /*quest*/)
    {
        for (int i = 0; i < 30; i++)
            player->KilledMonsterCredit(35582);

        player->TeleportTo(638, -1550.76f, 1565.98f, 29.57f, 0.70f);
        return true;
    }
};

class npc_lord_darius_crowley_c3 : public CreatureScript
{
    //TODO: Rewrite in 4.1 (spells were changed)
    enum
    {
        MOVIE_TRANSFORMATION        = 21,
        SPELL_PLAY_MOVIE            = 93477,
        SPELL_WORGEN_BITE           = 72870,
        SPELL_HIDEOUS_BITE_WOUND    = 76642,
    };

public:
    npc_lord_darius_crowley_c3() : CreatureScript("npc_lord_darius_crowley_c3") { }

    bool OnQuestReward(Player* player, Creature* /*creature*/, Quest const* quest, uint32 /*opt*/)
    {
        if (quest->GetQuestId() == 14222)
        {
            player->TeleportTo(654, -1818.4f, 2294.25f, 42.21335f, 3.14f);
            player->SendMovieStart(MOVIE_TRANSFORMATION); //This is the correct one cant find the other one it must be somewher in world db please remove it..once it is removed you can remove this comment!
            //player->CastSpell(player, SPELL_PLAY_MOVIE, true);
            //player->CastSpell(player, 72788, true);
            player->RemoveAurasDueToSpell(SPELL_WORGEN_BITE);
            player->CastSpell(player, SPELL_HIDEOUS_BITE_WOUND, true);
            player->setInWorgenForm();
            //player->CastSpell(player, 69123, true);
            //player->CastSpell(player, 68632, true);
            //player->CastSpell(player, 68634, true);

            WorldLocation loc = WorldLocation(654, -1818.4f, 2294.25f, 42.21335f, 3.14f);

            player->SetHomebind(loc, 4786);
        }
        return true;
    }
};

/*
Last Stand - worgen transformation event
*/
class npc_krennan_aranas_last_stand : public CreatureScript
{
    enum
    {
        SPELL_INVIS_AURA                    = 92288,
        SPELL_INVIS_DETECT_AURA             = 60922,

        SAY_1                               = 1,
        SAY_2                               = 2,

        NPC_GODFREY                         = 36330,
        NPC_GREYMANE                        = 36332,

        EVENT_KRENNAN_MOVE                  = 1,
        EVENT_KRENNAN_SAY_1                 = 2,
        EVENT_SUMMON_GODFREY                = 3,
        EVENT_GODFREY_SAY_1                 = 4, // moving
        EVENT_SUMMON_GREYMANE               = 5,
        EVENT_GREYMANE_SAY_1                = 6, // moving
        EVENT_GREYMANE_SAY_2                = 7, // facing changes
        EVENT_GREYMANE_UPDATE_FLAGS         = 8, // questgiver flag
        EVENT_DESPAWN                       = 9
    };

    struct npc_krennan_aranas_last_standAI : public ScriptedAI
    {
        npc_krennan_aranas_last_standAI(Creature* creature) : ScriptedAI(creature), summons(me)
        {
            // first effect has different target coords
            me->NearTeleportTo(-1815.903f, 2283.854f, 42.48993f, 2.478368f);
        }

        void Reset()
        {
            summons.DespawnAll();
            events.Reset();
            greymane = NULL;
            godfrey = NULL;
            events.ScheduleEvent(EVENT_KRENNAN_MOVE, 10000);
            events.ScheduleEvent(EVENT_DESPAWN, 90000);
            me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
        }

        void IsSummonedBy(Unit * summoner)
        {
            std::list<Creature *> cList;
            me->GetCreatureListWithEntryInGrid(cList, me->GetEntry(), 20.0f);
            if (cList.size() > 1)
            {
                me->DespawnOrUnsummon();
                return;
            }
            summoner->CastSpell(summoner, SPELL_INVIS_DETECT_AURA, true);
        }

        void JustSummoned(Creature * summon)
        {
            summons.Summon(summon);
            summon->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
            summon->CastSpell(summon, SPELL_INVIS_AURA, true);
        }

        /*void SummonedCreatureDespawn(Creature * summon)
        {
            if (summon == greymane)
            {
                godfrey->DespawnOrUnsummon(500);
                me->DespawnOrUnsummon(500);
            }
        }*/

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_KRENNAN_MOVE:
                    me->GetMotionMaster()->MovePoint(0, -1819.53f, 2291.25f, 42.32689f);
                    events.ScheduleEvent(EVENT_KRENNAN_SAY_1, 4000);
                    break;
                case EVENT_KRENNAN_SAY_1:
                    Talk(SAY_1);
                    events.ScheduleEvent(EVENT_SUMMON_GODFREY, 500);
                    break;
                case EVENT_SUMMON_GODFREY:
                    greymane = me->SummonCreature(NPC_GREYMANE, -1845.753f, 2288.212f, 42.376f, 0.1759785f);
                    if (greymane)
                    {
                        greymane->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        greymane->GetMotionMaster()->MovePoint(0, -1821.09f, 2292.597f, 42.23363f);
                    }

                    godfrey = me->SummonCreature(NPC_GODFREY, -1843.257f, 2290.283f, 42.45566f, 0.6922982f);
                    if (godfrey)
                        godfrey->GetMotionMaster()->MovePoint(0, -1821.922f, 2295.05f, 42.17052f);

                    events.ScheduleEvent(EVENT_GODFREY_SAY_1, 12000);
                    break;
                case EVENT_GODFREY_SAY_1:
                    if (godfrey)
                        godfrey->AI()->Talk(SAY_1);
                    events.ScheduleEvent(EVENT_GREYMANE_SAY_1, 8000);
                    break;
                    break;
                case EVENT_GREYMANE_SAY_1:
                    if (greymane)
                        greymane->AI()->Talk(SAY_1);
                    events.ScheduleEvent(EVENT_GREYMANE_SAY_2, 6000);
                    break;
                case EVENT_GREYMANE_SAY_2:
                    if (greymane)
                    {
                        greymane->SetOrientation(5.497787f);
                        greymane->SendMovementFlagUpdate();
                        greymane->AI()->Talk(SAY_2);
                    }
                    events.ScheduleEvent(EVENT_GREYMANE_UPDATE_FLAGS, 8000);
                    break;
                case EVENT_GREYMANE_UPDATE_FLAGS:
                    if (greymane)
                        greymane->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                    break;
                case EVENT_DESPAWN:
                    me->DespawnOrUnsummon(1000);
                    summons.DespawnAll();
                    break;
                default:
                    break;
                }
            }
        }

    private:
        Creature * godfrey;
        Creature * greymane;
        EventMap events;
        SummonList summons;
    };

public:
    npc_krennan_aranas_last_stand() : CreatureScript("npc_krennan_aranas_last_stand") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_krennan_aranas_last_standAI(creature);
    }
};

class npc_king_genn_greymane_last_stand : public CreatureScript
{
    enum
    {
        SPELL_CURSE_OF_THE_WORGEN           = 68631,
        SPELL_CURSE_OF_THE_WORGEN_2         = 68630,
        SPELL_HIDEOUS_BITE_WOUND            = 76642,
        SPELL_WORGEN_INTRO_COMPLETE         = 68643,
        SPELL_INVIS_DETECT                  = 56773,
    };

public:
    npc_king_genn_greymane_last_stand() : CreatureScript("npc_king_genn_greymane_last_stand") { }

    bool OnQuestReward(Player* player, Creature* /*creature*/, Quest const* /*quest*/, uint32 /*opt*/)
    {
        player->RemoveAurasDueToSpell(SPELL_CURSE_OF_THE_WORGEN);
        player->RemoveAurasDueToSpell(SPELL_CURSE_OF_THE_WORGEN_2);
        player->RemoveAurasDueToSpell(SPELL_HIDEOUS_BITE_WOUND);
        player->CastSpell(player, SPELL_WORGEN_INTRO_COMPLETE, true);
        player->RemoveAurasDueToSpell(SPELL_INVIS_DETECT);
        //player->CastSpell(player, 68481, true);
        //creature->DespawnOrUnsummon(2000);
        return true;
    }
};

/*class spell_keg_placed : public SpellScriptLoader
{
    public:
        spell_keg_placed() : SpellScriptLoader("spell_keg_placed") { }

        class spell_keg_placed_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_keg_placed_AuraScript);

            uint32 tick, tickcount;*/

            // void HandleEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            /*{
                tick = urand(1, 4);
                tickcount = 0;
            }

            void HandlePeriodic(AuraEffect const* aurEff)
            {
                PreventDefaultAction();
                if (Unit* caster = GetCaster())
                {
                    if (tickcount > tick)
                    {
                        if (caster->GetTypeId() != TYPEID_PLAYER)
                            return;

                        caster->ToPlayer()->KilledMonsterCredit(36233);
                        if (Unit* target = GetTarget())
                            target->Kill(target);
                    }
                    tickcount++;
                }
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_keg_placed_AuraScript::HandleEffectApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_keg_placed_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_keg_placed_AuraScript();
        }
};*/

class npc_chance_the_cat : public CreatureScript
{
    enum
    {
        NPC_LUCIUS              = 36461,
        QUEST_GRANDMAS_CAT      = 25331,
        SPELL_INTERACT_DUMMY    = 68743
    };

    struct npc_chance_the_catAI : public ScriptedAI
    {
        npc_chance_the_catAI(Creature* creature) : ScriptedAI(creature) {}

        void Reset()
        {
            EventInProgress = false;
            stealthTimer = 5000;
            visible = true;
        }

        void SpellHit(Unit * Hitter, const SpellInfo* spell)
        {
            if (!EventInProgress && spell->Id == SPELL_INTERACT_DUMMY)
            {
                EventInProgress = true;
                if (Creature * Lucius = me->SummonCreature(NPC_LUCIUS, -2106.372f, 2331.106f, 7.23836f, 0.1513071f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000))
                    Lucius->AI()->SetGUID(Hitter->GetGUID());
            }
        }

        void SummonedCreatureDespawn(Creature * /*summon*/)
        {
            EventInProgress = false;
            me->SetVisible(true);
        }

        void UpdateAI(uint32 diff)
        {
            if (!EventInProgress)
                return;

            if (visible)
            {
                if (stealthTimer <= diff)
                {
                    visible = false;
                    me->SetVisible(false);
                }else stealthTimer -= diff;
            }
        }

    private:
        bool EventInProgress;
        bool visible;
        uint32 stealthTimer;
    };

public:
    npc_chance_the_cat() : CreatureScript("npc_chance_the_cat") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_chance_the_catAI(creature);
    }
};

class npc_lucius_the_cruel : public CreatureScript
{
    enum
    {
        NPC_GRANDMA         = 36458,
        SPELL_SHOOT         = 41440,
    };

    struct npc_lucius_the_cruelAI : ScriptedAI
    {
        npc_lucius_the_cruelAI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            talkTimer = 2000;
            summonTimer = 7000;
        }

        void Reset()
        {
            playerGUID = 0;
            grandmaGUID = 0;
        }

        void JustReachedHome()
        {
            me->DespawnOrUnsummon(500);
        }

        void SetGUID(uint64 guid, int32 )
        {
            playerGUID = guid;
        }

        void JustDied(Unit * /*killer*/)
        {
            if (Creature * grandma = me->GetCreature(*me, grandmaGUID))
                grandma->DespawnOrUnsummon(5000);
        }

        void UpdateAI(uint32 diff)
        {
            if (talkTimer)
            {
                if (talkTimer <= diff)
                {
//                    Talk(1);
                    talkTimer = 0;
                }else talkTimer -= diff;
            }

            if (summonTimer)
            {
                if (summonTimer <= diff)
                {
                    if (Creature * grandma = me->SummonCreature(NPC_GRANDMA, -2119.142f, 2346.748f, 4.968621f, 0.0f))
                    {
                        grandma->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                        me->SetReactState(REACT_AGGRESSIVE);

                        if (Player * player = me->GetPlayer(*me, playerGUID))
                            me->AddThreat(player, 100.0f);

                        grandmaGUID = grandma->GetGUID();
                        grandma->AI()->Talk(1);
                        me->AddThreat(grandma, 1.0f);
                        grandma->AddThreat(me, 1.0f);
                        grandma->Attack(me, true);
                        grandma->GetMotionMaster()->MoveChase(me);
                    }
                    summonTimer = 0;
                }else summonTimer -= diff;
                return;
            }

            if (!UpdateVictim())
                return;

            if (shootTimer <= diff)
            {
                DoCastVictim(SPELL_SHOOT, true);
                shootTimer = urand(1500, 2000);
            }else shootTimer -= diff;

            DoMeleeAttackIfReady();
        }

    private:
        uint64 grandmaGUID;
        uint64 playerGUID;
        uint32 talkTimer;
        uint32 summonTimer;
        uint32 shootTimer;
    };

public:
    npc_lucius_the_cruel() : CreatureScript("npc_lucius_the_cruel") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lucius_the_cruelAI(creature);
    }
};

/*
Two by the Sea - Forsaken Catapult
*/

class spell_gilneas_launch : public SpellScriptLoader
{
    enum
    {
        SPELL_LAUNCH_AURA           = 66227,
    };

    // Spell on vehicle bar
    class spell_gilneas_launch_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_gilneas_launch_SpellScript);

        void HandleScript(SpellEffIndex /*effIndex*/)
        {
            Unit * caster = GetCaster();
            if (!caster)
                return;

            if (Vehicle * veh = caster->GetVehicleKit())
            {
                if (Unit * passenger = veh->GetPassenger(0))
                {
                    caster->CastSpell(caster, SPELL_LAUNCH_AURA, true);
//                    veh->SendSeatChange(passenger, 1);
                    caster->RemoveCharmedBy(passenger);
                }
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_gilneas_launch_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };
public:
    spell_gilneas_launch() : SpellScriptLoader("spell_gilneas_launch") {}

    SpellScript* GetSpellScript() const
    {
        return new spell_gilneas_launch_SpellScript();
    }
};

class spell_gilneas_launch_aura : public SpellScriptLoader
{
    class spell_gilneas_launch_aura_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_gilneas_launch_aura_AuraScript);

        void HandleTriggerSpell(AuraEffect const*  /*aurEff*/)
        {
            Unit * caster = GetCaster();
            if (!caster || caster->GetTypeId() != TYPEID_UNIT)
                return;

            if (Vehicle * veh = caster->GetVehicleKit())
            {
                if (Unit * passenger = veh->GetPassenger(0))
                {
                    caster->CastSpell(passenger, 66251, true);

                    passenger->ExitVehicle();

                    const Position pos = veh->GetLastShootPos();
                    passenger->GetMotionMaster()->MoveJump(pos, 15.0f, 20.0f);
                }
            }

        }

        void Register()
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_gilneas_launch_aura_AuraScript::HandleTriggerSpell, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
        }
    };

public:
    spell_gilneas_launch_aura() : SpellScriptLoader("spell_gilneas_launch_aura") {}

    AuraScript * GetAuraScript() const
    {
        return new spell_gilneas_launch_aura_AuraScript();
    }
};

/*
Losing Your Tail - WIP
Areatrigger doesnt work without terrain swap feature implemented
*/
/*class npc_gilneas_dark_scout : public CreatureScript
{
    enum
    {
        SPELL_TALISMAN      = 70797,
        SAY_SPAWN           = 1,
        SAY_FREED           = 2,
    };

    struct npc_gilneas_dark_scoutAI : public ScriptedAI
    {
        npc_gilneas_dark_scoutAI(Creature* creature) : ScriptedAI(creature) {}

        void IsSummonedBy(Unit * summoner)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);
            me->SetFacingToObject(summoner);
            Talk(SAY_SPAWN);
        }

        void SpellHit(Unit * caster, const SpellInfo * spell)
        {
            if (spell->Id == SPELL_TALISMAN)
            {
                Talk(SAY_FREED);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);
                DoStartMovement(caster);
            }
        }
    };

public:
    npc_gilneas_dark_scout() : CreatureScript("npc_gilneas_dark_scout") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilneas_dark_scoutAI(creature);
    }
};

class AreaTrigger_at_gilneas_losing_your_tail : public AreaTriggerScript
{
    enum
    {
        QUEST_LOSING_YOUR_TAIL      = 24616,
        NPC_GENERIC_TRIGGER         = 35374,
        SPELL_FREEZING_TRAP_EFF     = 70794,
    };

    bool OnTrigger(Player* player, AreaTriggerEntry const* trigger)
    {
        if (player->GetQuestStatus(QUEST_LOSING_YOUR_TAIL) == QUEST_STATUS_INCOMPLETE)
        {
            if (Creature * trigger = player->FindNearestCreature(NPC_GENERIC_TRIGGER, 30.0f))
                trigger->CastSpell(player, SPELL_FREEZING_TRAP_EFF, true);
        }
        return true;
    }

public:
    AreaTrigger_at_gilneas_losing_your_tail() : AreaTriggerScript("at_gilneas_losing_your_tail") {}
};*/

/*
Take Back what's Ours
*/

class spell_horn_of_taldoren : public SpellScriptLoader
{
    enum
    {
        NPC_VETERAN_DARK_RANGER         = 38022
    };

    class spell_horn_of_taldoren_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_horn_of_taldoren_SpellScript);

        SpellCastResult CanCast()
        {
            if (!GetCaster()->FindNearestCreature(NPC_VETERAN_DARK_RANGER, 30.0f))
                return SPELL_FAILED_BAD_TARGETS;
            return SPELL_CAST_OK;
        }

        void Register()
        {
            OnCheckCast += SpellCheckCastFn(spell_horn_of_taldoren_SpellScript::CanCast);
        }
    };

public:
    spell_horn_of_taldoren() : SpellScriptLoader("spell_horn_of_taldoren") {}

    SpellScript* GetSpellScript() const
    {
        return new spell_horn_of_taldoren_SpellScript();
    }
};

/*######
## npc_gilnean_crow
######*/

class npc_gilnean_crow : public CreatureScript
{
public:
    npc_gilnean_crow() : CreatureScript("npc_gilnean_crow") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_gilnean_crowAI (creature);
    }

    struct npc_gilnean_crowAI : public ScriptedAI
    {
        npc_gilnean_crowAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 tSpawn;
        bool Move;

        void Reset()
        {
            Move            = false;
            tSpawn          = 0;
            me->SetPosition(me->GetCreatureData()->posX,me->GetCreatureData()->posY, me->GetCreatureData()->posZ, me->GetCreatureData()->orientation);
        }

        void SpellHit(Unit* /*caster*/, const SpellInfo* spell)
        {
            if (spell->Id == SPELL_PING_GILNEAN_CROW)
            {
                if (!Move)
                {
                    me->SetUInt32Value(UNIT_NPC_EMOTESTATE , EMOTE_ONESHOT_NONE); // Change our emote state to allow flight
					//me->SetFlying(true);
                    Move = true;
                }
            }
        }

        virtual void UpdateAI(uint32 diff)
        {
            if (!Move)
                return;

            if (tSpawn <= diff)
            {
                me->GetMotionMaster()->MovePoint(0, (me->GetPositionX() + irand(-15, 15)), (me->GetPositionY() + irand(-15, 15)), (me->GetPositionZ() + irand(5, 15)), true);
                tSpawn = urand (500, 1000);
            }
            else tSpawn -= diff;

            if ((me->GetPositionZ() - me->GetCreatureData()->posZ) >= 20.0f)
            {
                me->DisappearAndDie();
                me->RemoveCorpse(true);
                Move = false;
            }
        }
    };
};


void AddSC_gilneas()
{
    new npc_gilneas_city_guard_phase1(); // not set
    new npc_gilneas_city_guard_phase2();
    new npc_prince_liam_greymane_phase1();
    new npc_prince_liam_greymane_phase2();
    new npc_rampaging_worgen();
    new npc_rampaging_worgen2();
    new go_merchant_square_door();
    new npc_frightened_citizen();
    new npc_panicked_citizen();
    new npc_panicked_citizen_2();
    new npc_lieutenant_walden();
    new npc_lord_darius_crowley();
    new npc_soht_worgen();
    new npc_josiah_avery_p2();
    new npc_josiah_avery_trigger();
    new npc_lord_darius_crowley_c2(); // not set
    new npc_chance_the_cat();
    new npc_lucius_the_cruel();
    new spell_gilneas_launch();
    new spell_gilneas_launch_aura();
    new spell_horn_of_taldoren();
    new npc_gilnean_crow();
    new npc_lorna_crowley_p4();
    new npc_bloodfang_lurker();
    new npc_king_genn_greymane();
    new npc_gilneas_city_guard_p8();
    new npc_afflicted_gilnean_p8();
    new npc_bloodfang_worgen();
    //new npc_gilneas_dark_scout();
    //new AreaTrigger_at_gilneas_losing_your_tail();
}
