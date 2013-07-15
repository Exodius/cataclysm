/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
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

/* ScriptData
SDName: vashjir
SD%Complete: 0
SDComment: Quest support: 25477
SDCategory: Vashj'ir
EndScriptData */

/* ContentData
moanah_stormhoof
EndContentData */

#include "ScriptPCH.h"

/*######
## moanah_stormhoof
######*/

class moanah_stormhoof : public CreatureScript
{
public:
    moanah_stormhoof() : CreatureScript("moanah_stormhoof") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new moanah_stormhoofAI (creature);
    }

    struct moanah_stormhoofAI : public ScriptedAI
    {
        moanah_stormhoofAI(Creature* c) : ScriptedAI(c) { }

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_UNIT)
                return;

            if (who->GetEntry() == 40223 && me->IsWithinDistInMap(who, 6.0f) && who->GetCharmerOrOwner())
            {
                who->CastSpell(who, 75385, true);
                who->ToCreature()->DisappearAndDie();
            }
        }
    };
};

enum eQuest25743Data
{
   QUEST_DECISIONS             = 25743,
   NPC_SILVER_TRIGGER_CREDIT   = 41192,
};

class spell_q25743_silver_dummy : public SpellScriptLoader
{
    public:
        spell_q25743_silver_dummy() : SpellScriptLoader("spell_q25743_silver_dummy") { }
 
        class spell_q25743_silver_dummy_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_q25743_silver_dummy_SpellScript)
 
            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                if (Creature* unitTarget = GetHitCreature())
                {
                    if (Player* player = GetCaster()->ToPlayer())
                    {
                        if (player->GetQuestStatus(QUEST_DECISIONS) == QUEST_STATUS_INCOMPLETE)
                        {
                            switch (unitTarget->GetEntry())
                            {
                                 case NPC_SILVER_TRIGGER_CREDIT:
                                     player->KilledMonsterCredit(NPC_SILVER_TRIGGER_CREDIT, 0);
                                     break;
                                 default:
                                     break;
                            }
                        }
                    }
                }
            }
 
            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_q25743_silver_dummy_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };
 
        SpellScript* GetSpellScript() const
        {
            return new spell_q25743_silver_dummy_SpellScript();
        }
};


void AddSC_vashjir()
{
    new moanah_stormhoof();
    new spell_q25743_silver_dummy();
}
