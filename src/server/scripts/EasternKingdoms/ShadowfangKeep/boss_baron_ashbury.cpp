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

/*
* ToDo: 
* Find the correct Sound Texts from DBC's
* Find a better Way for his Archangel Cast
*/

#include "ScriptMgr.h"
#include "shadowfang_keep.h"

enum Spells
{
   // Normal Mode
   SPELL_ASPHYXOATE                       = 93423,
   SPELL_PAIN_AND_SUFFERING               = 93581,
   SPELL_STAY_OF_EXECUTION                = 93468,

   // Heroic Mode
   SPELL_ASPHYXOATE_H                     = 93710,
   SPELL_PAIN_AND_SUFFERING_H             = 93712,
   SPELL_STAY_OF_EXECUTION_H              = 93705,
   SPELL_DARK_ARCHANGEL_FORM              = 93757,
   SPELL_DARK_ARCHANGEL_VISUAL            = 93766,
   SPELL_CALAMITY                         = 93812,
   SPELL_WRACKING_PAIN                    = 93720,
};

enum Events
{
    EVENT_ASPHYXOATE                      = 1,
    EVENT_PAIN_AND_SUFFERING,
    EVENT_STAY_OF_EXECUTION,
    EVENT_WRACKING_PAIN,
};

enum Texts
{
   SAY_AGGRO                              = 0, // Pull
   SAY_DEATH                              = 1, // Boss Death
   SAY_KILLER_1                           = 2, // Playerkill
   SAY_KILLER_2                           = 3, // Playerkill 2
   SAY_ARCHANGEL                          = 4, // Archangel
   SAY_STAYEXE                            = 5, // Stay of execution
   SAY_ASPHY                              = 6, // On Asphyxoate
};

class boss_baron_ashbury : public CreatureScript
{
    struct boss_baron_ashburyAI : public BossAI
    {
        boss_baron_ashburyAI(Creature * creature) : BossAI(creature, BOSS_BARON_ASHBURY) 
        {
            instance = creature->GetInstanceScript();
            defaultsize = creature->GetFloatValue(OBJECT_FIELD_SCALE_X);
        }

       InstanceScript* instance;
       float defaultsize;

        void Reset()
        {
            enraged = false;
            me->RemoveAllAuras();
            me->SetFloatValue(OBJECT_FIELD_SCALE_X, defaultsize);
            _Reset();

            if (instance)
            {
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_WRACKING_PAIN);
                instance->SetData(DATA_BARON_ASHBURY_EVENT, NOT_STARTED);
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
            Talk(SAY_AGGRO);

            if (instance)
            {
                instance->HandleGameObject(instance->GetData64(GO_BARON_ASHBURY_DOOR), false);
                instance->SetData(DATA_BARON_ASHBURY_EVENT, IN_PROGRESS);
            }

            events.ScheduleEvent(EVENT_ASPHYXOATE, 40000);
            events.ScheduleEvent(EVENT_PAIN_AND_SUFFERING, 15000);
            events.ScheduleEvent(EVENT_STAY_OF_EXECUTION, 55000);
            events.ScheduleEvent(EVENT_WRACKING_PAIN, 60000);
            _EnterCombat();
        }

        void JustDied(Unit * /*killer*/)
        {
            me->SetFloatValue(OBJECT_FIELD_SCALE_X, defaultsize);
            Talk(SAY_DEATH);
            _JustDied();

            if (instance)
            {
                instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_WRACKING_PAIN);
                instance->SetData(DATA_BARON_ASHBURY_EVENT, DONE);
                instance->HandleGameObject(instance->GetData64(GO_BARON_ASHBURY_DOOR), true);
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
                case EVENT_ASPHYXOATE:
                    Talk(SAY_ASPHY);
                    DoCast(DUNGEON_MODE(SPELL_ASPHYXOATE,SPELL_ASPHYXOATE_H));
                    events.ScheduleEvent(EVENT_ASPHYXOATE, urand(40000, 45000));
                    break;
                case EVENT_PAIN_AND_SUFFERING:
                    DoCast(DUNGEON_MODE(SPELL_PAIN_AND_SUFFERING,SPELL_PAIN_AND_SUFFERING_H));
                    events.ScheduleEvent(EVENT_PAIN_AND_SUFFERING, 50000);
                    break;
                case EVENT_STAY_OF_EXECUTION:
                    Talk(SAY_STAYEXE);
                    DoCast(DUNGEON_MODE(SPELL_STAY_OF_EXECUTION,SPELL_STAY_OF_EXECUTION_H));
                    events.ScheduleEvent(EVENT_STAY_OF_EXECUTION, 55000);
                    break;
                case EVENT_WRACKING_PAIN:
                    DoCast(SPELL_WRACKING_PAIN);
                    events.ScheduleEvent(EVENT_WRACKING_PAIN, 60000);
                    break;
                }
            }

            if(!enraged && me->HealthBelowPct(20))
            {
                enraged = true;
                Talk(SAY_ARCHANGEL);
                //DoCast(me, SPELL_DARK_ARCHANGEL_FORM);
                me->AddAura(SPELL_DARK_ARCHANGEL_VISUAL, me);
                me->SetFloatValue(OBJECT_FIELD_SCALE_X, defaultsize*1.0f);
                DoCast(SPELL_CALAMITY);
            }

            DoMeleeAttackIfReady();
        }
    private:
        bool enraged;
    };
public:
    boss_baron_ashbury() : CreatureScript("boss_baron_ashbury") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_baron_ashburyAI(creature);
    }
};


void AddSC_boss_baron_ashbury()
{
    new boss_baron_ashbury();
}