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
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston MA 02111-1307 USA
 */

/*
 * ToDo:
 * Fix both Spells: 
 * SPELL_CONJURE_MYSTERY_TOXIN,
 * Red: The Player must be stand/not-moving, or they die.
 * Find the correct Sound-Yells
 * Sniff for the correct Timers
 */

#include "ScriptPCH.h"
#include "SpellAuraEffects.h"
#include "shadowfang_keep.h"

enum Spells
{
   SPELL_CONJURE_FROST_MIXTURE            = 93505,
   SPELL_CONJURE_POISONOUS_MIXTURE        = 93697,
   SPELL_CONJURE_MYSTERY_TOXIN            = 93563,
   SPELL_TOXIC_COAGULANT_GREEN            = 93572,
   SPELL_TOXIC_COAGULANT_RED              = 93573,
   SPELL_ICE_SHARDS                       = 93527,
   SPELL_TOXIC_COAGULANT_TRIGGERED        = 93617,
};

enum Events
{
   EVENT_CONJURE_POISONOUS_MIXTURE        = 1,
   EVENT_CONJURE_FROST_MIXTURE,
   EVENT_CONJURE_MYSTERY_TOXIN,
   EVENT_ICE_SHARDS,
};

enum Texts
{
   SAY_AGGRO                              = 0,
   SAY_DEATH                              = 1,
   SAY_KILLER_1                           = 2,
   SAY_KILLER_2                           = 3,
};

class boss_lord_walden : public CreatureScript
{
    struct boss_lord_waldenAI : public BossAI
    {
        boss_lord_waldenAI(Creature * creature) : BossAI(creature, BOSS_LORD_WALDEN) {}

        void Reset()
        {
            _Reset();
        }

        void EnterCombat(Unit * /*who*/)
        {
            Talk(SAY_AGGRO);
            events.ScheduleEvent(EVENT_CONJURE_POISONOUS_MIXTURE, 5000);
            events.ScheduleEvent(EVENT_CONJURE_MYSTERY_TOXIN, 25000);
            events.ScheduleEvent(EVENT_ICE_SHARDS, 15000);

            _EnterCombat();
        }

        void JustDied(Unit * /*killer*/)
        {
            Talk(SAY_DEATH);
            _JustDied();
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
                switch(urand(0,1))
                {
               case 0:
                    DoCast(SPELL_CONJURE_FROST_MIXTURE);
                    events.ScheduleEvent(EVENT_CONJURE_FROST_MIXTURE, urand(10000, 20000));
                    break;
               case 1:
                    DoCast(SPELL_CONJURE_POISONOUS_MIXTURE);
                    events.ScheduleEvent(EVENT_CONJURE_POISONOUS_MIXTURE, urand(20000, 40000));
                    break;
                }
                switch(eventId)
                {
               case EVENT_ICE_SHARDS:
                    DoCast(SPELL_ICE_SHARDS);
                    events.ScheduleEvent(EVENT_ICE_SHARDS, 15000);
                    break;
               case EVENT_CONJURE_MYSTERY_TOXIN:
                    DoCast(SPELL_CONJURE_MYSTERY_TOXIN);
                    events.ScheduleEvent(EVENT_CONJURE_MYSTERY_TOXIN, 30000);
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
public:
    boss_lord_walden() : CreatureScript("boss_lord_walden") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_lord_waldenAI(creature);
    }
};

class npc_toxin_trigger : public CreatureScript
{
public:
    npc_toxin_trigger() : CreatureScript("npc_toxin_trigger") { }

    struct npc_toxin_triggerAI : public ScriptedAI
    {
        npc_toxin_triggerAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            pInstance = pCreature->GetInstanceScript();
            me->SetUnitMovementFlags(MOVEMENTFLAG_HOVER | MOVEMENTFLAG_CAN_FLY);
        }

        InstanceScript *pInstance;

        void Reset()
        {
            float x, y, z;
            me->GetPosition(x, y, z);
            DoTeleportTo(x, y, z+5.0f);

                switch(urand(0,1))
                {
               case 0:
                    me->AddAura(SPELL_TOXIC_COAGULANT_GREEN, me);
                    break;
               case 1: 
                    me->AddAura(SPELL_TOXIC_COAGULANT_RED, me); 
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature *pCreature) const
    {
        return new npc_toxin_triggerAI (pCreature);
    }
};

void AddSC_boss_lord_walden()
{
    new boss_lord_walden();
    new npc_toxin_trigger();
}