/*
 * Copyright (C) 2005-2011 MaNGOS <http://www.getmangos.com/>
 *
 * Copyright (C) 2008-2011 Trinity <http://www.trinitycore.org/>
 *
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 *
 * Copyright (C) 2010-2011 Project Trinity <http://www.projecttrinity.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

 /* ToDo
 * Find the correct Sound Yells
 * Find the correct Pistol Barrage Visual
 * Just one Ghoul Summon or 6? PTR was 6
 * Timer correction
 * Find a better solution for the team say between A & H
 */

#include "ScriptMgr.h"
#include "shadowfang_keep.h"

enum Spells
{
   // Normal Mode
   SPELL_CURSED_BULLETS                   = 93629,
   SPELL_MORTAL_WOUND                     = 93675,
   SPELL_PISTOL_BARRAGE                   = 93520,
   SPELL_SUMMON_GHOUL                     = 93714,

   // Heroic Mode
   SPELL_CURSED_BULLETS_H                 = 93761,
   SPELL_MORTAL_WOUND_H                   = 93771,
};

enum Events
{
   EVENT_CURSED_BULLETS                   = 1,
   EVENT_MORTAL_WOUND,
   EVENT_PISTOL_BARRAGE,
   EVENT_SUMMON_BLOODTHIRSTY_GHOULS,
};

enum eTexts
{
    SAY_AGGRO_A                          = 0,
    SAY_AGGRO_H                          = 1,
    SAY_DEATH                            = 2,
    SAY_KILLER_1                         = 3,
    SAY_KILLER_2                         = 4,
};

class boss_lord_godfrey : public CreatureScript
{
    struct boss_lord_godfreyAI : public BossAI
    {
        boss_lord_godfreyAI(Creature * creature) : BossAI(creature, BOSS_LORD_GODFREY)
        {
            instance = creature->GetInstanceScript();
        }

       InstanceScript* instance;

        void Reset()
        {
            _Reset();

            if (instance)
            {
                instance->SetData(DATA_LORD_GODFREY_EVENT, NOT_STARTED);
                instance->HandleGameObject(instance->GetData64(GO_LORD_GODFREY_DOOR), true);
            }
        }

        void EnterCombat(Unit * who)
        {
//            Talk(SAY_AGGRO_H);

            if (instance)
            {
                instance->SetData(DATA_LORD_GODFREY_EVENT, IN_PROGRESS);
                instance->HandleGameObject(instance->GetData64(GO_LORD_GODFREY_DOOR), false);
            }

            events.ScheduleEvent(EVENT_SUMMON_BLOODTHIRSTY_GHOULS, 10000);
            events.ScheduleEvent(EVENT_MORTAL_WOUND, 25000);
            events.ScheduleEvent(EVENT_PISTOL_BARRAGE, 55000);
            events.ScheduleEvent(EVENT_CURSED_BULLETS, 15000);
            _EnterCombat();
        }

        void JustDied(Unit * /*killer*/)
        {
            Talk(SAY_DEATH);
            _JustDied();

            if (instance)
            {
                instance->SetData(DATA_LORD_GODFREY_EVENT, DONE);
                instance->HandleGameObject(instance->GetData64(GO_LORD_GODFREY_DOOR), true);
            }
        }

        void KilledUnit(Unit * victim)
        {
             switch(urand(0,1))
             {
               case 0:
                   Talk(SAY_KILLER_1);
                   break;
               case 1:
                   Talk(SAY_KILLER_2);
                   break;
             }
        }

        void UpdateAI(uint32 diff)
        {
            if(!UpdateVictim())
                return;

            events.Update(diff);

            if(me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
               case EVENT_SUMMON_BLOODTHIRSTY_GHOULS:
                    DoCast(SPELL_SUMMON_GHOUL);
                    events.ScheduleEvent(EVENT_SUMMON_BLOODTHIRSTY_GHOULS, 40000);
                    break;
               case EVENT_MORTAL_WOUND:
                    DoCast(DUNGEON_MODE(SPELL_MORTAL_WOUND,SPELL_MORTAL_WOUND_H));
                    events.ScheduleEvent(EVENT_MORTAL_WOUND, 25000);
                    break;
               case EVENT_PISTOL_BARRAGE:
                    DoCastVictim(SPELL_PISTOL_BARRAGE);
                    events.ScheduleEvent(EVENT_PISTOL_BARRAGE, 55000);
                    break;
               case EVENT_CURSED_BULLETS:
                    DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0), DUNGEON_MODE(SPELL_CURSED_BULLETS,SPELL_CURSED_BULLETS_H), true);
                    events.ScheduleEvent(EVENT_CURSED_BULLETS, 20000);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
public:
    boss_lord_godfrey() : CreatureScript("boss_lord_godfrey") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_lord_godfreyAI(creature);
    }
};

void AddSC_boss_lord_godfrey()
{
    new boss_lord_godfrey();
}