#include "ScriptMgr.h"

enum Spells
{
   SPELL_FURY_OF_THE_SANDS         = 94946,
   SPELL_SANDS_OF_TIME             = 93578,
   SPELL_SHOCKWAVE                 = 94968,
   SPELL_STONE_MANTLE              = 93561
};

enum Events
{
   EVENT_FURY                      = 1,
   EVENT_SHOCK,
   EVENT_STONE,
};

enum Misc
{
   DATA_BELOW_50                   = 1,
};

class boss_akmahat : public CreatureScript
{
public:
    boss_akmahat() : CreatureScript("boss_akmahat") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_akmahatAI (creature);
    }

    struct boss_akmahatAI : public ScriptedAI
    {
        boss_akmahatAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset()
        {
            below50 = false;
            me->RemoveAllAuras();
        }

        void EnterCombat(Unit * /*who*/)
        {
            events.ScheduleEvent(EVENT_FURY, 5000);
            events.ScheduleEvent(EVENT_SHOCK, 12000);
            events.ScheduleEvent(EVENT_STONE, 21000);
        }

        void DamageTaken(Unit * /*done_by*/, uint32 &damage)
        {
            if(!below50 && me->HealthBelowPctDamaged(50, damage))
            {
                below50 = true;
                DoCast(SPELL_SANDS_OF_TIME);
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
                case EVENT_FURY:
                    DoCast(SPELL_FURY_OF_THE_SANDS);
                    events.ScheduleEvent(EVENT_FURY, 20000);
                    break;
                case EVENT_SHOCK:
                    DoCast(SPELL_SHOCKWAVE);
                    events.ScheduleEvent(EVENT_SHOCK, 35000);
                    break;
                case EVENT_STONE:
                    DoCast(SPELL_STONE_MANTLE);
                    events.ScheduleEvent(EVENT_STONE, 90000);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    private:
        bool below50;
        EventMap events;
    };
};

void AddSC_boss_akmahat()
{
    new boss_akmahat();
};