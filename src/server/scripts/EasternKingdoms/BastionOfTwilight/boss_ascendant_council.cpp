/*
* Copyright (C) 2010-2011 Project Trinity <http://www.projecttrinity.org/>
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

/*
UPDATE `creature_template` SET `ScriptName`='boss_ignacious' WHERE (`entry`='43686');
UPDATE `creature_template` SET `ScriptName`='boss_feludius' WHERE (`entry`='43687');
UPDATE `creature_template` SET `ScriptName`='boss_arion' WHERE (`entry`='43688');
UPDATE `creature_template` SET `ScriptName`='boss_terrastra' WHERE (`entry`='43689');
*/

#include "ScriptPCH.h"
#include "Group.h"
#include "bastion_of_twilight.h"

enum Spells
{
    SPELL_VISUAL_SUMMON            = 36400,
    SPELL_HYDROLANCE               = 82752,
    SPELL_HEART_OF_ICE             = 82655,
    SPELL_GLACIATE                 = 92508,
    SPELL_WATERBOMB                = 82699,
    SPELL_BURNING_BLOOD            = 82660,
    SPELL_FLAME_TORRENT            = 82777,
    SPELL_AEGIS_OF_FLAMES          = 92512,
    SPELL_RISING_FLAMES            = 82636,
    SPELL_ELEMENTAL_STASIS         = 82285,
    SPELL_CALL_WINDS               = 83491,
    SPELL_DISPERSE                 = 83087,
    SPELL_THUNDERSHOCK             = 83067,
    SPELL_GRAVITY_WELL             = 83572,
    SPELL_ERUPTION                 = 83675,
    SPELL_QUAKE                    = 83565,
    SPELL_CRYOGENIC                = 84918,
    SPELL_LAVA_SEED                = 84913,
    SPELL_FRENZIED_ASSAULT_10N     = 83693,
    SPELL_FRENZIED_ASSAULT_25N     = 86160,
    SPELL_FRENZIED_ASSAULT_10H     = 86161,
    SPELL_FRENZIED_ASSAULT_25H     = 86162,
};

enum Texts
{
    SAY_CHOGALS                    = 0,
    SAY_FELUDIUS_AGGRO             = 1,
    SAY_IGNACIOUS_AGGRO            = 2,
    SAY_GLACIATE                   = 3,
    SAY_KILL_FELUDIUS              = 4,
    SAY_RISING_FLAMES              = 5,
    SAY_KILL_IGNACIOUS             = 6,
    SAY_INCOMING_ARION             = 7,
    SAY_CALL_WINDS                 = 8,
    SAY_KILL_ARION                 = 9,
    SAY_INCOMING_TERA              = 10,
    SAY_SPELL_QUAKE                = 11,
    SAY_KILL_TERRASTRA             = 12,
    SAY_ARION_AGGRO                = 13,
    SAY_TERRASTRA_AGGRO            = 14,
    SAY_QUAKE                      = 15,
    SAY_GRAVITY                    = 16,
    SAY_KILL_M_1                   = 17,
    SAY_KILL_M_2                   = 18,
    SAY_DEATH_M                    = 19,
    SAY_PHASE_3_F                  = 20,
    SAY_PHASE_3_I                  = 21,
    SAY_PHASE_3_A                  = 22,
    SAY_PHASE_3_T                  = 23,
    SAY_AGGRO_MON                  = 24,
};

enum Events
{
    EVENT_HYDROLANCE               = 1,
    EVENT_GLACIO                   = 2,
    EVENT_HEART_OF_ICE             = 3,
    EVENT_WATER_BOMB               = 4,
    EVENT_BURNING_BLOOD            = 5,
    EVENT_FLAME_TORRENT            = 6,
    EVENT_AEGISO_FLAME             = 7,
    EVENT_RISING_FLAME             = 8,
    EVENT_CALL_WINDS               = 9,
    EVENT_DISPERSE                 = 10,
    EVENT_THUNDERSHOCK             = 12,
    EVENT_GRAVITY_WELL             = 13,
    EVENT_ERUPTION                 = 14,
    EVENT_QUAKE                    = 15,
    EVENT_LAVA_SEED                = 16,
    EVENT_GRUVITY_CRUSH            = 17,
    EVENT_PRE_FINAL                = 18,
    EVENT_PRE_FINAL_2              = 19,
    EVENT_PRE_FINAL_3              = 20,
};

enum Actions
{
    ACTION_STOP_EVENT              = 1,
    ACTION_PRE_FINAL               = 2,
    ACTION_WIPE                    = 3,
    ACTION_PHASE_END               = 4,
};

typedef std::list<Player*> PlayerListType;

PlayerListType GetPlayersInTheMaps(Map *pMap)
{
    PlayerListType players;
    const Map::PlayerList &PlayerList = pMap->GetPlayers();
    if (!PlayerList.isEmpty())
        for (Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i)
            if (Player* player = i->getSource())
                players.push_back(player);
                return players;
}

Player* SelectRandomPlayerFromLists(PlayerListType &players)
{
    if (players.empty())
    return NULL;
    PlayerListType::iterator it = players.begin();
    std::advance(it, urand(0, players.size()-1));
    return *it;
}

Player* SelectRandomPlayerInTheMaps(Map* pMap)
{
    PlayerListType players = GetPlayersInTheMaps(pMap);
    return SelectRandomPlayerFromLists(players);
}

class boss_feludius : public CreatureScript
{
    public:
    boss_feludius() : CreatureScript("boss_feludius") { }
    
    struct boss_feludiusAI : BossAI
    {
        boss_feludiusAI(Creature * creature) : BossAI(creature,DATA_FELUDIUS)
        {
            pInstance = (InstanceScript*)creature->GetInstanceScript();
        }
        
        void Reset()
        {
            instance->SetData(DATA_COUNCIL_EVENT, NOT_STARTED);
            IntroStart = false;
            phaseEnd  = false;
            finalTeleport = false;
            attack = true;
            events.CancelEvent(EVENT_HYDROLANCE);
            events.CancelEvent(EVENT_GLACIO);
            events.CancelEvent(EVENT_HEART_OF_ICE);
            events.CancelEvent(EVENT_WATER_BOMB);
            me->SetVisible(true);
            me->setFaction(16);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
        
        void EnterCombat(Unit* who)
        {
            if(phaseEnd || !who->isAlive())
            return;
            
            if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
            pIgnacious->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
            instance->SetData(DATA_COUNCIL_EVENT, IN_PROGRESS);
            pInstance->SetData(DATA_FELUDIUS, IN_PROGRESS);
            pInstance->SendEncounterUnit(ENCOUNTER_FRAME_ADD, me);
            DoScriptText(SAY_FELUDIUS_AGGRO, me);
            DoZoneInCombat(me);
            events.RescheduleEvent(EVENT_HYDROLANCE, 11000);
            events.RescheduleEvent(EVENT_GLACIO, 32000);
            events.RescheduleEvent(EVENT_HEART_OF_ICE, 39000);
            events.RescheduleEvent(EVENT_WATER_BOMB, 8000);
        }
        
        void JustReachedHome()
        {
            me->SetReactState(REACT_AGGRESSIVE);
            instance->SetData(DATA_COUNCIL_EVENT, FAIL);
            me->SetReactState(REACT_AGGRESSIVE);
            me->setFaction(16);
            me->SetVisible(true);
            events.CancelEvent(EVENT_HYDROLANCE);
            events.CancelEvent(EVENT_GLACIO);
            events.CancelEvent(EVENT_HEART_OF_ICE);
            events.CancelEvent(EVENT_WATER_BOMB);
            
            me->Respawn();
            me->SetHealth(me->GetMaxHealth());
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetOrientation(me->GetHomePosition().getOrientation());
            me->AI()->DoAction(ACTION_WIPE);
        }
        
        void KilledUnit(Unit* victim)
        {
            DoScriptText(SAY_KILL_FELUDIUS, me);
        }
        
        void MoveInLineOfSight(Unit* who)
        {
            if(!IntroStart)
            {
                if(Creature *Chogal = me->SummonCreature(NPC_CHOGAL, me->getX(), me->getY(), me->getZ(), 1, TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    DoScriptText(SAY_CHOGALS, Chogal);
                    Chogal->DespawnOrUnsummon();
                }
                IntroStart = true;
            }
        }
        
        void DoAction(int32 const action)
        {
            switch(action)
            {
                case ACTION_STOP_EVENT:
                events.CancelEvent(EVENT_HYDROLANCE);
                events.CancelEvent(EVENT_GLACIO);
                events.CancelEvent(EVENT_HEART_OF_ICE);
                events.CancelEvent(EVENT_WATER_BOMB);
                me->AttackStop();
                me->CombatStop();
                pInstance->SetData(DATA_FELUDIUS, DONE);
                me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetVisible(false);
                break;
                case ACTION_PRE_FINAL:
                events.RescheduleEvent(EVENT_PRE_FINAL, 500);
                break;
                case ACTION_WIPE:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->setFaction(16);
                IntroStart = false;
                phaseEnd  = false;
                finalTeleport = false;
                me->SetHealth(me->GetMaxHealth());
                me->CombatStop();
                events.CancelEvent(EVENT_GRAVITY_WELL);
                events.CancelEvent(EVENT_ERUPTION);
                events.CancelEvent(EVENT_QUAKE);
                me->AI_SendMoveToPacket(me->GetHomePosition().getX(),me->GetHomePosition().getY(),me->GetHomePosition().getZ(), 0, SPLINEFLAG_WALKING, 0);
                me->SetOrientation(me->GetHomePosition().getOrientation());
                me->SetVisible(true);
                break;
                case ACTION_PHASE_END:
                phaseEnd  = true;
                break;
            }
        }
        
        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE)
            {
                switch (id)
                {
                    case POINT_FINAL:
                    if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
                    pIgnacious->GetMotionMaster()->MovePoint(POINT_FINAL, -1008.483337f, -582.623352f, 831.90f);
                    break;
                }
            }
        }
        
        
        void UpdateAI(const uint32 diff)
        {
            if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
            
            if(me->getVictim() && me->isAlive())
            {
                if(!phaseEnd && attack)
                {
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    attack = false;
                }
            }
            
            if (me->GetHealthPct() <= 25.0f && !phaseEnd)
            {
                me->AI()->DoAction(ACTION_STOP_EVENT);
                if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
                {
                    pIgnacious->AI()->DoAction(ACTION_STOP_EVENT);
                    pIgnacious->AI()->DoAction(ACTION_PHASE_END);
                }
                if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
                {
                    pTerrastra->NearTeleportTo(-1009.1f, -535.1f, 831.88f, 1.0f);
                    pTerrastra->CastSpell(pTerrastra, SPELL_VISUAL_SUMMON, true);
                    pTerrastra->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
                }
                
                if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
                {
                    pArion->NearTeleportTo(-1009.1f, -634.3f, 831.88f, 1.0f);
                    pArion->CastSpell(pArion, SPELL_VISUAL_SUMMON, true);
                    pArion->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
                }
                
                phaseEnd = true;
            }
            
            if(finalTeleport)
            {
                me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                me->SetVisible(false);
                me->SetSpeed(MOVE_WALK, 90.0f, true);
                me->SetSpeed(MOVE_RUN, 90.0f, true);
                me->NearTeleportTo(-987.960613f, -603.783691f, 831.900940f, 1.0f);
                me->AI_SendMoveToPacket(-987.960613f, -603.783691f, 831.900940f, 0, SPLINEFLAG_WALKING, 0);
                events.RescheduleEvent(EVENT_PRE_FINAL_2,1500);
                finalTeleport = false;
            }
            
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_HYDROLANCE:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        if(Player* Victim = SelectRandomPlayerInTheMaps(me->GetMap()))
                        DoCast(Victim,SPELL_HYDROLANCE);
                        events.RescheduleEvent(EVENT_HYDROLANCE, 11000);
                        break;
                    }
                    case EVENT_HEART_OF_ICE:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        if(Player* Victim = SelectRandomPlayerInTheMaps(me->GetMap()))
                        DoCast(Victim,SPELL_HEART_OF_ICE);
                        events.RescheduleEvent(EVENT_HEART_OF_ICE, 39000);
                        break;
                    }
                    case EVENT_GLACIO:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCast(SPELL_GLACIATE);
                        DoScriptText(SAY_GLACIATE, me);
                        events.RescheduleEvent(EVENT_GLACIO, 32000);
                        break;
                    }
                    case EVENT_WATER_BOMB:
                    {
                        if (Creature* stalker = GetRandomWBStalker())
                            DoCast(stalker, SPELL_WATERBOMB);

                        events.RescheduleEvent(EVENT_WATER_BOMB, 8000);
                        break;
                    }
                    case EVENT_PRE_FINAL:
                    {
                        me->AI()->DoAction(ACTION_STOP_EVENT);
                        me->AttackStop();
                        me->CombatStop();
                        me->SetReactState(REACT_PASSIVE);
                        me->setFaction(35);
                        
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                        finalTeleport = true;
                        break;
                    }
                    case EVENT_PRE_FINAL_2:
                    {
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->SetSpeed(MOVE_RUN, 3.0f, true);
                        me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                        DoScriptText(SAY_PHASE_3_F, me);
                        break;
                    }
                }
            }
            if(!phaseEnd)
            DoMeleeAttackIfReady();
        }

        Creature* GetRandomWBStalker() {
            std::list<Creature*> stalker;
            GetCreatureListWithEntryInGrid(stalker, me, NPC_COUNCIL_PLUME_STALKER, 1000.0f);

            if (stalker.empty())
                return NULL;

            uint32 r = urand(0, stalker.size()-1);
            uint32 c = 0;
            for (std::list<Creature*>::iterator iter = stalker.begin(); iter != stalker.end(); ++iter, c++)
                if (c == r) return (*iter);

            return me->FindNearestCreature(NPC_COUNCIL_PLUME_STALKER, 1000.0f, true);
        }
        
        private:
        bool finalTeleport;
        bool IntroStart;
        bool phaseEnd;
        bool attack;
        InstanceScript* pInstance;
        EventMap events;
    };
    
    CreatureAI * GetAI(Creature* creature) const
    {
        return new boss_feludiusAI(creature);
    }
};

class boss_ignacious : public CreatureScript
{
    public:
    boss_ignacious() : CreatureScript("boss_ignacious") { }
    
    struct boss_ignaciousAI : public BossAI
    {
        boss_ignaciousAI(Creature * creature) : BossAI(creature,DATA_IGNACIOUS)
        {
            pInstance = (InstanceScript*)creature->GetInstanceScript();
        }
        
        void Reset()
        {
            me->SetReactState(REACT_AGGRESSIVE);
            instance->SetData(DATA_COUNCIL_EVENT, NOT_STARTED);
            phaseEnd = false;
            finalTeleport = false;
            attack = true;
            events.CancelEvent(EVENT_BURNING_BLOOD);
            events.CancelEvent(EVENT_FLAME_TORRENT);
            events.CancelEvent(EVENT_AEGISO_FLAME);
            events.CancelEvent(EVENT_RISING_FLAME);
            me->SetVisible(true);
            me->setFaction(16);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }
        
        void EnterCombat(Unit* who)
        {
            if(phaseEnd || !who->isAlive())
            return;
            
            if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
            pFeliduis->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
            pInstance->SetData(DATA_IGNACIOUS, IN_PROGRESS);
            pInstance->SendEncounterUnit(ENCOUNTER_FRAME_ADD, me);
            DoScriptText(SAY_IGNACIOUS_AGGRO, me);
            DoZoneInCombat(me);
            events.RescheduleEvent(EVENT_BURNING_BLOOD, 31000);
            events.RescheduleEvent(EVENT_FLAME_TORRENT, 10000);
            events.RescheduleEvent(EVENT_AEGISO_FLAME, 54000);
            events.RescheduleEvent(EVENT_RISING_FLAME, 20000);
        }
        
        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE)
            {
                switch (id)
                {
                    case POINT_FINAL:
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                    me->SetReactState(REACT_PASSIVE);
                    me->SetVisible(false);
                    if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
                    {
                        pFeliduis->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        pFeliduis->SetReactState(REACT_PASSIVE);
                        pFeliduis->SetVisible(false);
                    }
                    
                    if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
                    {
                        pTerrastra->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        pTerrastra->SetReactState(REACT_PASSIVE);
                        pTerrastra->SetVisible(false);
                    }
                    
                    if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
                    {
                        pArion->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        pArion->SetReactState(REACT_PASSIVE);
                        pArion->SetVisible(false);
                    }
                    
                    if(Creature* boss = me->SummonCreature(BOSS_MONSTROSITY, -1008.483337f, -582.623352f, 831.90f))
                    {
                        boss->SetHealth(me->GetHealth()+
                        ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION))->GetHealth()+
                        ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS))->GetHealth()+
                        ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA))->GetHealth());
                        boss->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
                    }
                    break;
                }
            }
        }
        
        void JustReachedHome()
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            instance->SetData(DATA_COUNCIL_EVENT, FAIL);
            me->SetReactState(REACT_AGGRESSIVE);
            me->setFaction(16);
            me->SetVisible(true);
            events.CancelEvent(EVENT_BURNING_BLOOD);
            events.CancelEvent(EVENT_FLAME_TORRENT);
            events.CancelEvent(EVENT_AEGISO_FLAME);
            events.CancelEvent(EVENT_RISING_FLAME);
            
            me->Respawn();
            me->SetHealth(me->GetMaxHealth());
            me->SetOrientation(me->GetHomePosition().getOrientation());
            me->AI()->DoAction(ACTION_WIPE);
        }
        
        void DoAction(int32 const action)
        {
            switch(action)
            {
                case ACTION_STOP_EVENT:
                events.CancelEvent(EVENT_BURNING_BLOOD);
                events.CancelEvent(EVENT_FLAME_TORRENT);
                events.CancelEvent(EVENT_AEGISO_FLAME);
                events.CancelEvent(EVENT_RISING_FLAME);
                me->AttackStop();
                me->CombatStop();
                pInstance->SetData(DATA_IGNACIOUS, DONE);
                me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetVisible(false);
                break;
                case ACTION_PRE_FINAL:
                events.RescheduleEvent(EVENT_PRE_FINAL, 500);
                break;
                case ACTION_WIPE:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->setFaction(16);
                phaseEnd = false;
                finalTeleport = false;
                me->SetHealth(me->GetMaxHealth());
                me->CombatStop();
                events.CancelEvent(EVENT_GRAVITY_WELL);
                events.CancelEvent(EVENT_ERUPTION);
                events.CancelEvent(EVENT_QUAKE);
                me->AI_SendMoveToPacket(me->GetHomePosition().getX(),me->GetHomePosition().getY(),me->GetHomePosition().getZ(), 0, SPLINEFLAG_WALKING, 0);
                me->SetOrientation(me->GetHomePosition().getOrientation());
                me->SetVisible(true);
                break;
                case ACTION_PHASE_END:
                phaseEnd  = true;
                break;
            }
        }
        
        void KilledUnit(Unit* victim)
        {
            DoScriptText(SAY_KILL_IGNACIOUS, me);
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
            
            if(me->getVictim() && me->isAlive())
            {
                if(!phaseEnd && attack)
                {
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    attack = false;
                }
            }
            
            if(finalTeleport)
            {
                me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                me->SetVisible(false);
                me->SetSpeed(MOVE_WALK, 90.0f, true);
                me->SetSpeed(MOVE_RUN, 90.0f, true);
                me->NearTeleportTo(-1017.23f, -550.35f, 831.90f, 1.0f);
                me->AI_SendMoveToPacket(-1017.23f, -550.35f, 831.90f, 0, SPLINEFLAG_WALKING, 0);
                events.RescheduleEvent(EVENT_PRE_FINAL_2,1500);
                finalTeleport = false;
            }
            
            if (me->GetHealthPct() <= 25.0f && !phaseEnd)
            {
                me->AI()->DoAction(ACTION_STOP_EVENT);
                
                if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
                {
                    pFeliduis->AI()->DoAction(ACTION_STOP_EVENT);
                    pFeliduis->AI()->DoAction(ACTION_PHASE_END);
                }
                if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
                {
                    pTerrastra->NearTeleportTo(-1009.1f, -535.1f, 831.88f, 1.0f);
                    pTerrastra->CastSpell(pTerrastra, SPELL_VISUAL_SUMMON, true);
                    pTerrastra->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
                }
                if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
                {
                    pArion->NearTeleportTo(-1009.1f, -634.3f, 831.88f, 1.0f);
                    pArion->CastSpell(pArion, SPELL_VISUAL_SUMMON, true);
                    pArion->AI()->AttackStart(SelectRandomPlayerInTheMaps(me->GetMap()));
                }
                phaseEnd = true;
            }
            
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_BURNING_BLOOD:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCastVictim(SPELL_BURNING_BLOOD,false);
                        events.RescheduleEvent(EVENT_BURNING_BLOOD, 31000);
                        break;
                    }
                    case EVENT_FLAME_TORRENT:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCast(SPELL_FLAME_TORRENT);
                        events.RescheduleEvent(EVENT_FLAME_TORRENT, 10000);
                        break;
                    }
                    case EVENT_AEGISO_FLAME:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCast(me,SPELL_AEGIS_OF_FLAMES);
                        events.RescheduleEvent(EVENT_AEGISO_FLAME, 54000);
                        break;
                    }
                    case EVENT_RISING_FLAME:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCast(me,SPELL_RISING_FLAMES);
                        DoScriptText(SAY_RISING_FLAMES,me);
                        events.RescheduleEvent(EVENT_RISING_FLAME, 20000);
                        break;
                    }
                    case EVENT_PRE_FINAL:
                    {
                        me->AI()->DoAction(ACTION_STOP_EVENT);
                        me->AttackStop();
                        me->CombatStop();
                        me->SetReactState(REACT_PASSIVE);
                        me->setFaction(35);
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                        finalTeleport = true;
                        break;
                    }
                    case EVENT_PRE_FINAL_2:
                    {
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->SetSpeed(MOVE_RUN, 3.0f, true);
                        me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                        DoScriptText(SAY_PHASE_3_I, me);
                        break;
                    }
                }
            }
            if(!phaseEnd)
            DoMeleeAttackIfReady();
        }
        
        private:
        bool finalTeleport;
        bool phaseEnd;
        bool attack;
        EventMap events;
        InstanceScript * pInstance;
    };
    
    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_ignaciousAI(creature);
    }
};

class boss_arion : public CreatureScript
{
    public:
    boss_arion() : CreatureScript("boss_arion") { }
    
    struct boss_arionAI : public BossAI
    {
        boss_arionAI(Creature * creature) : BossAI(creature,DATA_ARION)
        {
            pInstance = (InstanceScript*)creature->GetInstanceScript();
        }
        
        void Reset()
        {
            me->SetReactState(REACT_AGGRESSIVE);
            phaseEnd = false;
            finalTeleport = false;
            attack = true;
            events.CancelEvent(EVENT_CALL_WINDS);
            events.CancelEvent(EVENT_DISPERSE);
            events.CancelEvent(EVENT_THUNDERSHOCK);
            me->SetVisible(true);
            me->setFaction(16);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetOrientation(me->GetHomePosition().getOrientation());
        }
        
        void EnterCombat(Unit* who)
        {
            if(phaseEnd || !who->isAlive())
            return;
            DoScriptText(SAY_ARION_AGGRO, me);
            instance->SetData(DATA_ARION, IN_PROGRESS);
            pInstance->SendEncounterUnit(ENCOUNTER_FRAME_ADD, me);
            DoZoneInCombat(me);
            events.RescheduleEvent(EVENT_CALL_WINDS, 35000);
            events.RescheduleEvent(EVENT_DISPERSE, 25000);
            events.RescheduleEvent(EVENT_THUNDERSHOCK, 15000);
        }
        
        void Wipe()
        {
            if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
            pFeliduis->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
            pIgnacious->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
            pTerrastra->AI()->DoAction(ACTION_WIPE);
        }
        
        void JustReachedHome()
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            Wipe();
            instance->SetData(DATA_COUNCIL_EVENT, FAIL);
            me->SetReactState(REACT_AGGRESSIVE);
            me->setFaction(16);
            me->SetVisible(true);
            events.CancelEvent(EVENT_CALL_WINDS);
            events.CancelEvent(EVENT_DISPERSE);
            events.CancelEvent(EVENT_THUNDERSHOCK);
            
            me->Respawn();
            me->SetHealth(me->GetMaxHealth());
            me->SetOrientation(me->GetHomePosition().getOrientation());
        }
        
        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE)
            {
                switch (id)
                {
                    case POINT_FINAL:
                    if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
                    pTerrastra->GetMotionMaster()->MovePoint(POINT_FINAL, -1008.483337f, -582.623352f, 831.90f);
                    break;
                }
            }
        }
        
        void DoAction(int32 const action)
        {
            switch(action)
            {
                case ACTION_STOP_EVENT:
                events.CancelEvent(EVENT_CALL_WINDS);
                events.CancelEvent(EVENT_DISPERSE);
                events.CancelEvent(EVENT_THUNDERSHOCK);
                break;
                case ACTION_PRE_FINAL:
                events.RescheduleEvent(EVENT_PRE_FINAL, 500);
                break;
                case ACTION_WIPE:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->setFaction(16);
                phaseEnd = false;
                finalTeleport = false;
                me->SetHealth(me->GetMaxHealth());
                me->CombatStop();
                events.CancelEvent(EVENT_GRAVITY_WELL);
                events.CancelEvent(EVENT_ERUPTION);
                events.CancelEvent(EVENT_QUAKE);
                me->AI_SendMoveToPacket(me->GetHomePosition().getX(),me->GetHomePosition().getY(),me->GetHomePosition().getZ(), 0, SPLINEFLAG_WALKING, 0);
                me->SetOrientation(me->GetHomePosition().getOrientation());
                me->SetVisible(true);
                break;
                case ACTION_PHASE_END:
                phaseEnd  = true;
                break;
            }
        }
        
        void CastElementalStasis()
        {
            Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (!players.isEmpty())
            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            if (Player* player = itr->getSource())
            DoCast(player,SPELL_ELEMENTAL_STASIS);
        }
        
        void KilledUnit(Unit* victim)
        {
            DoScriptText(SAY_KILL_ARION, me);
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
            
            if(me->getVictim() && me->isAlive())
            {
                if(!phaseEnd && attack)
                {
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    attack = false;
                }
            }
            
            if(finalTeleport)
            {
                me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                me->SetVisible(false);
                me->SetSpeed(MOVE_WALK, 90.0f, true);
                me->SetSpeed(MOVE_RUN, 90.0f, true);
                me->NearTeleportTo(-987.832581f, -562.032837f, 831.900940f, 1.0f);
                me->AI_SendMoveToPacket(-987.832581f, -562.032837f, 831.900940f, 0, SPLINEFLAG_WALKING, 0);
                events.RescheduleEvent(EVENT_PRE_FINAL_2,1500);
                finalTeleport = false;
            }
            
            if (me->GetHealthPct() <= 25.0f && !phaseEnd)
            {
                me->AI()->DoAction(ACTION_PRE_FINAL);
                
                if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
                {
                    pFeliduis->AI()->DoAction(ACTION_PRE_FINAL);
                    pFeliduis->AI()->DoAction(ACTION_PHASE_END);
                }
                if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
                {
                    pIgnacious->AI()->DoAction(ACTION_PRE_FINAL);
                    pIgnacious->AI()->DoAction(ACTION_PHASE_END);
                }
                if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
                {
                    pTerrastra->AI()->DoAction(ACTION_PRE_FINAL);
                    pTerrastra->AI()->DoAction(ACTION_PHASE_END);
                }
                phaseEnd = true;
            }
            
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_CALL_WINDS:
                    {
                        DoScriptText(SAY_CALL_WINDS, me);
                        DoCast(me,SPELL_CALL_WINDS,true);
                        events.RescheduleEvent(EVENT_CALL_WINDS, 35000);
                        break;
                    }
                    case EVENT_DISPERSE:
                    {
                        DoCast(me, SPELL_DISPERSE, true);
                        events.RescheduleEvent(EVENT_DISPERSE, 25000);
                        break;
                    }
                    case EVENT_THUNDERSHOCK:
                    {
                        if (!UpdateVictim())
                        return;
                        //DoScriptText(SAY_THUNDERSHOCK,me);
                        DoCastVictim(SPELL_THUNDERSHOCK,false);
                        events.RescheduleEvent(EVENT_THUNDERSHOCK, 15000);
                        break;
                    }
                    case EVENT_PRE_FINAL:
                    {
                        events.CancelEvent(EVENT_CALL_WINDS);
                        events.CancelEvent(EVENT_DISPERSE);
                        events.CancelEvent(EVENT_THUNDERSHOCK);
                        me->AI()->DoAction(ACTION_STOP_EVENT);
                        me->AttackStop();
                        me->CombatStop();
                        me->setFaction(35);
                        me->SetReactState(REACT_PASSIVE);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                        finalTeleport = true;
                        break;
                    }
                    case EVENT_PRE_FINAL_2:
                    {
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->SetSpeed(MOVE_RUN, 3.0f, true);
                        me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                        DoScriptText(SAY_PHASE_3_A, me);
                        events.RescheduleEvent(EVENT_PRE_FINAL_3, 1500);
                        break;
                    }
                    case EVENT_PRE_FINAL_3:
                    me->GetMotionMaster()->MovePoint(POINT_FINAL, -1008.483337f, -582.623352f, 831.90f);
                    break;
                }
            }
            if(!phaseEnd)
            DoMeleeAttackIfReady();
        }
        
        private:
        bool finalTeleport;
        bool phaseEnd;
        bool attack;
        InstanceScript * pInstance;
        EventMap events;
    };
    
    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_arionAI(creature);
    }
};

class boss_terrastra : public CreatureScript
{
    public:
    boss_terrastra() : CreatureScript("boss_terrastra") { }
    
    struct boss_terrastraAI : public BossAI
    {
        boss_terrastraAI(Creature * creature) : BossAI(creature,DATA_TERRASTRA)
        {
            pInstance = (InstanceScript*)creature->GetInstanceScript();
        }
        
        void Reset()
        {
            me->SetReactState(REACT_AGGRESSIVE);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            finalTeleport = false;
            phaseEnd = false;
            attack = true;
            me->setFaction(16);
            events.CancelEvent(EVENT_GRAVITY_WELL);
            events.CancelEvent(EVENT_ERUPTION);
            events.CancelEvent(EVENT_QUAKE);
            me->SetVisible(true);
            me->SetOrientation(me->GetHomePosition().getOrientation());
        }
        
        void EnterCombat(Unit* who)
        {
            if(phaseEnd || !who->isAlive())
            return;
            DoScriptText(SAY_TERRASTRA_AGGRO, me);
            instance->SetData(DATA_TERRASTRA, IN_PROGRESS);
            DoZoneInCombat(me);
            events.RescheduleEvent(EVENT_GRAVITY_WELL, 15000);
            events.RescheduleEvent(EVENT_ERUPTION, 10000);
            events.RescheduleEvent(EVENT_QUAKE, 20000);
        }
        
        void Wipe()
        {
            if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
            pFeliduis->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
            pIgnacious->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
            pArion->AI()->DoAction(ACTION_WIPE);
        }
        
        void JustReachedHome()
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            Wipe();
            instance->SetData(DATA_COUNCIL_EVENT, FAIL);
            me->SetReactState(REACT_AGGRESSIVE);
            me->setFaction(16);
            me->SetVisible(true);
            events.CancelEvent(EVENT_GRAVITY_WELL);
            events.CancelEvent(EVENT_ERUPTION);
            events.CancelEvent(EVENT_QUAKE);
            
            me->Respawn();
            me->SetHealth(me->GetMaxHealth());
            me->SetOrientation(me->GetHomePosition().getOrientation());
        }
        
        void CastElementalStasis()
        {
            Map::PlayerList const& players = me->GetMap()->GetPlayers();
            if (!players.isEmpty())
            for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
            if (Player* player = itr->getSource())
            DoCast(player,SPELL_ELEMENTAL_STASIS);
        }
        
        void MovementInform(uint32 type, uint32 id)
        {
            if (type == POINT_MOTION_TYPE)
            {
                switch (id)
                {
                    case POINT_FINAL:
                    if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
                    pFeliduis->GetMotionMaster()->MovePoint(POINT_FINAL, -1008.483337f, -582.623352f, 831.90f);
                    break;
                }
            }
        }
        
        void DoAction(int32 const action)
        {
            switch(action)
            {
                case ACTION_STOP_EVENT:
                events.CancelEvent(EVENT_GRAVITY_WELL);
                events.CancelEvent(EVENT_ERUPTION);
                events.CancelEvent(EVENT_QUAKE);
                break;
                case ACTION_PRE_FINAL:
                events.RescheduleEvent(EVENT_PRE_FINAL, 500);
                break;
                case ACTION_WIPE:
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->SetReactState(REACT_AGGRESSIVE);
                me->setFaction(16);
                finalTeleport = false;
                phaseEnd = false;
                me->SetHealth(me->GetMaxHealth());
                me->CombatStop();
                events.CancelEvent(EVENT_GRAVITY_WELL);
                events.CancelEvent(EVENT_ERUPTION);
                events.CancelEvent(EVENT_QUAKE);
                me->AI_SendMoveToPacket(me->GetHomePosition().getX(),me->GetHomePosition().getY(),me->GetHomePosition().getZ(), 0, SPLINEFLAG_WALKING, 0);
                me->SetOrientation(me->GetHomePosition().getOrientation());
                me->SetVisible(true);
                break;
                case ACTION_PHASE_END:
                phaseEnd  = true;
                break;
            }
        }
        
        void KilledUnit(Unit* victim)
        {
            DoScriptText(SAY_KILL_TERRASTRA, me);
        }
        
        void UpdateAI(const uint32 diff)
        {
            if (me->HasUnitState(UNIT_STATE_CASTING))
            return;
            
            if(me->getVictim() && me->isAlive())
            {
                if(!phaseEnd && attack)
                {
                    me->GetMotionMaster()->MoveChase(me->getVictim());
                    attack = false;
                }
            }
            
            if (me->GetHealthPct() <= 25.0f && !phaseEnd)
            {
                me->AI()->DoAction(ACTION_PRE_FINAL);
                
                if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
                {
                    pFeliduis->AI()->DoAction(ACTION_PRE_FINAL);
                    pFeliduis->AI()->DoAction(ACTION_PHASE_END);
                    
                }
                if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
                {
                    pIgnacious->AI()->DoAction(ACTION_PRE_FINAL);
                    pIgnacious->AI()->DoAction(ACTION_PHASE_END);
                }
                if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
                {
                    pArion->AI()->DoAction(ACTION_PRE_FINAL);
                    pArion->AI()->DoAction(ACTION_PHASE_END);
                }
                phaseEnd = true;
            }
            
            if(finalTeleport)
            {
                me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                me->SetVisible(false);
                me->SetSpeed(MOVE_WALK, 90.0f, true);
                me->SetSpeed(MOVE_RUN, 90.0f, true);
                me->NearTeleportTo(-1029.484985f, -603.448425f, 831.900940f, 1.0f);
                me->AI_SendMoveToPacket(-1029.484985f, -603.448425f, 831.900940f, 0, SPLINEFLAG_WALKING, 0);
                events.RescheduleEvent(EVENT_PRE_FINAL_2,1500);
                finalTeleport = false;
            }
            
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_GRAVITY_WELL:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoScriptText(SAY_INCOMING_TERA, me);
                        DoCastVictim(SPELL_GRAVITY_WELL,false);
                        events.RescheduleEvent(EVENT_GRAVITY_WELL, 15000);
                        break;
                    }
                    case EVENT_ERUPTION:
                    {
                        if (!UpdateVictim())
                        return;
                        
                        DoCastVictim(SPELL_ERUPTION,false);
                        events.RescheduleEvent(EVENT_ERUPTION, 10000);
                        break;
                    }
                    case EVENT_QUAKE:
                    {
                        if (!UpdateVictim())
                        return;
                        DoScriptText(SAY_QUAKE,me);
                        DoCastVictim(SPELL_QUAKE,false);
                        DoScriptText(SAY_SPELL_QUAKE, me);
                        events.RescheduleEvent(EVENT_QUAKE, 20000);
                        break;
                    }
                    case EVENT_PRE_FINAL:
                    {
                        CastElementalStasis();
                        events.CancelEvent(EVENT_GRAVITY_WELL);
                        events.CancelEvent(EVENT_ERUPTION);
                        events.CancelEvent(EVENT_QUAKE);
                        pInstance->SetData(DATA_TERRASTRA, DONE);
                        pInstance->SetData(DATA_ARION, DONE);
                        me->AI()->DoAction(ACTION_STOP_EVENT);
                        me->AttackStop();
                        me->CombatStop();
                        me->setFaction(35);
                        me->SetReactState(REACT_PASSIVE);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                        finalTeleport = true;
                        break;
                    }
                    case EVENT_PRE_FINAL_2:
                    {
                        me->SetVisible(true);
                        me->SetSpeed(MOVE_WALK, 3.0f, true);
                        me->SetSpeed(MOVE_RUN, 3.0f, true);
                        me->CastSpell(me, SPELL_VISUAL_SUMMON, true);
                        DoScriptText(SAY_PHASE_3_T, me);
                        break;
                    }
                }
            }
            if(!phaseEnd)
            DoMeleeAttackIfReady();
            
        }
        
        private:
        bool finalTeleport;
        bool phaseEnd;
        bool attack;
        InstanceScript * pInstance;
        EventMap events;
        uint64 uiMonsterTimer;
    };
    
    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_terrastraAI(creature);
    }
};

class boss_monstrosity : public CreatureScript
{
    public:
    boss_monstrosity() : CreatureScript("boss_monstrosity") { }
    
    struct boss_monstrosityAI : public BossAI
    {
        boss_monstrosityAI(Creature * creature) : BossAI(creature,DATA_MONSTROSITY), summons(me)
        {
            pInstance = (InstanceScript*)creature->GetInstanceScript();
        }
        
        void Reset()
        {
            DoCast(me, SPELL_CRYOGENIC);
            DoScriptText(SAY_AGGRO_MON, me);
        }
        
        void EnterCombat(Unit* who)
        {
            instance->SetData(DATA_COUNCIL_EVENT, IN_PROGRESS);
            events.RescheduleEvent(EVENT_LAVA_SEED, 11000);
            events.RescheduleEvent(EVENT_GRUVITY_CRUSH, 15000);
            DoZoneInCombat(me);
        }
        
        void Wipe()
        {
            if (Creature* pFeliduis = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_FELUDIUS)))
            pFeliduis->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pIgnacious = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_IGNACIOUS)))
            pIgnacious->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pArion = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_ARION)))
            pArion->AI()->DoAction(ACTION_WIPE);
            
            if (Creature* pTerrastra = ObjectAccessor::GetCreature(*me, pInstance->GetData64(DATA_TERRASTRA)))
            pTerrastra->AI()->DoAction(ACTION_WIPE);
        }
        
        void JustReachedHome()
        {
            me->DespawnOrUnsummon();
        }
        
        void KilledUnit(Unit* /*victim*/)
        {
            uint32 random = urand(1,2);
            
            if(random == 1)
            DoScriptText(SAY_KILL_M_1, me);
            
            if(random == 2)
            DoScriptText(SAY_KILL_M_2, me);
        }
        
        void JustDied(Unit* /*Killer*/)
        {
            instance->SetData(DATA_COUNCIL_EVENT, DONE);
            DoScriptText(SAY_DEATH_M, me);
        }
        
        void UpdateAI(const uint32 diff)
        {
            events.Update(diff);
            
            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_LAVA_SEED:
                    {
                        DoCast(SPELL_LAVA_SEED);
                        events.RescheduleEvent(EVENT_LAVA_SEED, 11000);
                        break;
                    }
                    case EVENT_GRUVITY_CRUSH:
                    {
                        DoScriptText(SAY_GRAVITY, me);
                        DoCast(RAID_MODE(SPELL_FRENZIED_ASSAULT_10N, SPELL_FRENZIED_ASSAULT_25N, SPELL_FRENZIED_ASSAULT_10H, SPELL_FRENZIED_ASSAULT_25H));
                        events.RescheduleEvent(EVENT_GRUVITY_CRUSH, 15000);
                        break;
                    }
                }
            }
            
            if (!me->getVictim() || !me->getVictim()->isAlive())
            {
                me->DespawnOrUnsummon();
                Wipe();
            }
            
            DoMeleeAttackIfReady();
        }
        
        private:
        EventMap events;
        InstanceScript * pInstance;
        SummonList summons;
    };
    
    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_monstrosityAI(creature);
    }
};

void AddSC_boss_ascendant_council()
{
    new boss_feludius();
    new boss_ignacious();
    new boss_arion();
    new boss_terrastra();
    new boss_monstrosity();
}