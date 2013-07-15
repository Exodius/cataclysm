#include "ScriptMgr.h"

enum Spells
{
   SPELL_ANTIMAGIC_PULSE           = 93506,
   SPELL_MAGMA_SHACKLES            = 93507,
   SPELL_MASSIVE_ERUPTION          = 93508
};

enum Events
{
   EVENT_ANTIMAGIC                 = 1,
   EVENT_SHACKLES,
   EVENT_ERUPTION,
};

class boss_garr_hyjal : public CreatureScript
{
public:
    boss_garr_hyjal() : CreatureScript("boss_garr_hyjal") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_garr_hyjalAI (creature);
    }

    struct boss_garr_hyjalAI : public ScriptedAI
    {
        boss_garr_hyjalAI(Creature* creature) : ScriptedAI(creature) { }

        void EnterCombat(Unit * /*who*/)
        {
            me->SetInCombatWithZone();
            events.ScheduleEvent(EVENT_ANTIMAGIC, 9000);
            events.ScheduleEvent(EVENT_SHACKLES, 30000);
            events.ScheduleEvent(EVENT_ERUPTION, 31000);
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
                case EVENT_ANTIMAGIC:
                    DoCast(SPELL_ANTIMAGIC_PULSE);
                    events.ScheduleEvent(EVENT_ANTIMAGIC, 27000);
                    break;
                case EVENT_SHACKLES:
                    DoCast(SPELL_MAGMA_SHACKLES);
                    events.ScheduleEvent(EVENT_SHACKLES, 30000);
                    break;
                case EVENT_ERUPTION:
                    DoCast(SPELL_MASSIVE_ERUPTION);
                    events.ScheduleEvent(EVENT_ERUPTION, 31000);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };
};

void AddSC_boss_garr_hyjal()
{
    new boss_garr_hyjal();
};