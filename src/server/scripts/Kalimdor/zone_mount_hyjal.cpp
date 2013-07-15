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

/*
# q25776
*/

enum Spells
{
   SPELL_TWILIGHT_BOLT             = 78129,
   SPELL_TWILIGHT_BREATH           = 78143,
   SPELL_TWILIGHT_FISSURE          = 78160,
   SPELL_TRANSFORM_VISUAL          = 24085,
};

enum Events
{
   EVENT_TWIL_BOLT                 = 1,
   EVENT_TWIL_BREATH,
   EVENT_TWIL_FISSURE,
};

enum eEnum
{
   DISPLAY_DRAGON                  = 32367,
   DISPLAY_HUMAN                   = 32308

};

class mob_sethria : public CreatureScript
{
public:
    mob_sethria() : CreatureScript("mob_sethria") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new mob_sethriaAI (creature);
    }

    struct mob_sethriaAI : public ScriptedAI
    {
        mob_sethriaAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            me->SetDisplayId(DISPLAY_HUMAN);
        }

        void EnterCombat(Unit * /*who*/)
        {
            events.ScheduleEvent(EVENT_TWIL_BOLT, 2000);
            events.ScheduleEvent(EVENT_TWIL_BREATH, 30000);
            events.ScheduleEvent(EVENT_TWIL_FISSURE, 10000);
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
                case EVENT_TWIL_BOLT:
                    DoCast(SPELL_TWILIGHT_BOLT);
                    events.ScheduleEvent(EVENT_TWIL_BOLT, 6000);
                    break;
                case EVENT_TWIL_BREATH:
                    DoCast(SPELL_TWILIGHT_BREATH);
                    events.ScheduleEvent(EVENT_TWIL_BREATH, 30000);
                    break;
                case EVENT_TWIL_FISSURE:
                    DoCast(SPELL_TWILIGHT_FISSURE);
                    events.ScheduleEvent(EVENT_TWIL_FISSURE, 14000);
                    break;
                }
            }

           if (me->HealthBelowPct(75))
           {
               me->SetDisplayId(DISPLAY_DRAGON);
           }

            DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };
};

void AddSC_mount_hyjal()
{
   new mob_sethria();
};
