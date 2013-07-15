/*
 * Copyright (C) 2011-2012 DarkCore <http://www.darkpeninsula.eu/>
 * Copyright (C) 2011-2012 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
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


#include "InstanceScript.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "SpellAuraEffects.h"
#include "Cell.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "the_vortex_pinnacle.h"
#include "G3D/Vector3.h"
#include "G3D/Triangle.h"
#include "G3D/Plane.h"
#include "G3D/CollisionDetection.h" 

using G3D::Vector3; 

enum AsaadTexts
{
    SAY_AGGRO                   = 0,
    SAY_LIGHTNING               = 1,
    SAY_DEATH                   = 2,
};

enum AsaadSpells
{
    SPELL_SUPREMACY_OF_THE_STORM            = 86930,
    SPELL_UNSTABLE_GROUNDING_FIELD          = 86911,
    SPELL_CHAIN_LIGHTNING                   = 87622,
    SPELL_SUMMON_SKYFALL                    = 96260,
    SPELL_SUMMON_UNSTABLE_GROUND_FIELD      = 86658,
    SPELL_SUMMON_GROUNDING_FIELD            = 87521,
    SPELL_CHANNEL_GROUNDING_FIELD           = 86911,
    SPELL_SUPREMACY_TELEPORT                = 87328,
    SPELL_GROUNDING_FIELD                   = 87514,
    SPELL_GROUNDING_FIELD_BUFF              = 87474,
    SPELL_ARCANE_BARRAGE                    = 87854,

    // Heroic Mode
    SPELL_STATIC_CLING                      = 87618,
};

enum AsaadEvents
{
    EVENT_CHAIN_LIGHTNING               = 1,
    EVENT_SUMMON_SKYFALL                = 2,
    EVENT_STATIC_CLING                  = 3,
    EVENT_SUMMON_UNSTABLE_GROUND_FIELD  = 4,
    EVENT_SUPREMACY_OF_THE_STORM        = 5,
    EVENT_CLEAN_UP                      = 6,
    EVENT_ARCANE_BARRAGE                = 7,
};

enum AsaadMisc
{
    DATA_TRIGGER_GUID           = 1,
    DATA_SUMMON_TRIGGER_GUID    = 2,
    ACTION_CLEAN_UP             = 1,
    ACTION_TELEPORT             = 2,
};

enum AsaadMovementPositionPoints
{
    DATA_FIRST_POSITION         = 1,
    DATA_SECOND_POSITION        = 2,
    DATA_THIRD_POSITION         = 3,
};

float const floorZ = 646.680725f;

class boss_asaad : public CreatureScript
{
    public:
        boss_asaad() : CreatureScript("boss_asaad")
        {
        }

        struct script_impl : public BossAI
        {
            script_impl(Creature* creature) : BossAI(creature, BOSS_ASAAD)
            {
            }

            std::list<uint64> failedAchievementGUIDs;

            void Reset()
            {
                _Reset();
                events.ScheduleEvent(EVENT_CHAIN_LIGHTNING, 5000);
                events.ScheduleEvent(EVENT_SUMMON_SKYFALL, urand(15000, 25000));
                events.ScheduleEvent(EVENT_STATIC_CLING, urand(10000, 15000));
                events.ScheduleEvent(EVENT_SUMMON_UNSTABLE_GROUND_FIELD, 20000);
                failedAchievementGUIDs.clear();
            }

            void EnterCombat(Unit* /*who*/)
            {
                _EnterCombat();
            }

            void JustDied(Unit* /*who*/)
            {
                _JustDied();
            }

            uint64 GetRandomStormTarget() const
            {
                std::list<Creature*> triggerList;
                me->GetCreatureListWithEntryInGrid(triggerList, NPC_STORM_TARGET, 100.0f);
                if (!triggerList.empty())
                    return Trinity::Containers::SelectRandomContainerElement(triggerList)->GetGUID();

                return NULL;
            }

            void SpellHitTarget(Unit* target, SpellInfo const* spell)
            {
                if (spell->Id == SPELL_STATIC_CLING && IsHeroic())
                    failedAchievementGUIDs.push_back(target->GetGUID());
            }

            void DoAction(int32 action)
            {
                if (action == ACTION_TELEPORT)
                    events.ScheduleEvent(EVENT_SUPREMACY_OF_THE_STORM, 1000);
            }

            void UpdateAI(uint32 diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_CHAIN_LIGHTNING:
                            if (me->HasUnitState(UNIT_STATE_CASTING))
                                break;
                            if (Unit* const target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                                me->CastSpell(target, SPELL_CHAIN_LIGHTNING, false);
                            events.ScheduleEvent(EVENT_CHAIN_LIGHTNING, urand(75000, 100000));
                            break;
                        case EVENT_SUMMON_SKYFALL:
                            me->CastSpell(me, SPELL_SUMMON_SKYFALL, true);
                            events.ScheduleEvent(EVENT_SUMMON_SKYFALL, 20000);
                            break;
                        case EVENT_STATIC_CLING:
                            if (me->HasUnitState(UNIT_STATE_CASTING))
                                break;
                            me->CastSpell(me, SPELL_STATIC_CLING, false);
                            events.ScheduleEvent(EVENT_STATIC_CLING, urand(12000, 15000));
                            break;
                        case EVENT_SUMMON_UNSTABLE_GROUND_FIELD:
                            if (Creature* const trigger = ObjectAccessor::GetCreature(*me, GetRandomStormTarget()))
                                trigger->CastSpell(trigger, SPELL_SUMMON_UNSTABLE_GROUND_FIELD, true);
                            if (Creature* const groundingField = me->FindNearestCreature(NPC_UNSTABLE_GROUNDING_FIELD, 100.0f, true))
                                me->CastSpell(groundingField, SPELL_CHANNEL_GROUNDING_FIELD, true);
                            break;
                        case EVENT_SUPREMACY_OF_THE_STORM:
                            me->InterruptNonMeleeSpells(false);
                            me->CastStop();
                            me->SetCanFly(true);
                            me->CastSpell(me, SPELL_SUPREMACY_TELEPORT, true);
                            me->CastSpell(me, SPELL_SUPREMACY_OF_THE_STORM, true);
                            events.ScheduleEvent(EVENT_CLEAN_UP, 6000);
                            break;
                        case EVENT_CLEAN_UP:
                            if (Creature* const groundingField = me->FindNearestCreature(NPC_UNSTABLE_GROUNDING_FIELD, 100.0f, true))
                                groundingField->GetAI()->DoAction(ACTION_CLEAN_UP);
                            events.ScheduleEvent(EVENT_SUMMON_UNSTABLE_GROUND_FIELD, urand(20000, 25000));
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return GetVortexPinnacleAI<script_impl>(creature);
        }
};

class npc_asaad_grounding_field_trigger : public CreatureScript
{
    public:
        npc_asaad_grounding_field_trigger() : CreatureScript("npc_asaad_grounding_field_trigger")
        {
        }

        struct script_impl : public ScriptedAI
        {
            script_impl(Creature* creature) : ScriptedAI(creature)
            {
                triggerList.clear();
                memset(triggerGUIDs, 0, sizeof(triggerGUIDs));
            }

            std::list<uint64> triggerList;
            uint64 triggerGUIDs[3];

            void Reset()
            {
                me->CastSpell(me, SPELL_SUMMON_GROUNDING_FIELD, true);
                TriggerMove();
            }

            void SetGUID(uint64 guid, int32 data)
            {
                if (data == DATA_TRIGGER_GUID)
                {
                    triggerList.push_back(guid);
                    if (Creature* const trigger = ObjectAccessor::GetCreature(*me, triggerList.back()))
                    {
                        trigger->SetCanFly(true);
                        trigger->GetMotionMaster()->MovePoint(0, trigger->GetPositionX(), trigger->GetPositionY(), trigger->GetPositionZ() + 3.0f);
                    }
                }
            }

            void DoAction(int32 action)
            {
                if (action == ACTION_CLEAN_UP)
                    CleanUp();
            }

            void CleanUp()
            {
                for (uint8 n = 0; n < 3; ++n)
                    if (Creature* const trigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[n]))
                        trigger->DespawnOrUnsummon();
                if (InstanceScript* const instance = me->GetInstanceScript())
                    instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_GROUNDING_FIELD_BUFF);
                me->DespawnOrUnsummon();
            }

            void FillGUIDs()
            {
                uint8 n = 0;
                for (std::list<uint64>::const_iterator itr = triggerList.begin(); itr != triggerList.end(); ++itr, ++n)
                    triggerGUIDs[n] = *itr;
            }

            void TriggerMove()
            {
                FillGUIDs();
                float angle = -(M_PI / 4.0f);
                float const dist = 15.0f;
                bool followedTrigger = false;

                for (uint8 n = 1; n < 3; ++n)
                {
                    Creature* const trigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[n]);
                    if (!trigger)
                        return;

                    angle += M_PI / 4.0f;
                    Position position;
                    trigger->GetNearPosition(position, dist, angle);
                    trigger->GetMotionMaster()->MovePoint(0, position);
                    if (!followedTrigger)
                    {
                        me->GetMotionMaster()->MovePoint(DATA_FIRST_POSITION, position);
                        // Visual
                        if (Creature* const firstTrigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[0]))
                            firstTrigger->CastSpell(trigger, SPELL_CHANNEL_GROUNDING_FIELD, true);
                        followedTrigger = true;
                    }
                }
            }

            void MovementInform(uint32 type, uint32 id)
            {
                if (type != POINT_MOTION_TYPE)
                    return;

                switch (id)
                {
                    case DATA_FIRST_POSITION:
                    {
                        Creature* const secondTrigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[1]);
                        Creature* const thirdTrigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[2]);
                        if (!secondTrigger || !thirdTrigger)
                            return;

                        me->GetMotionMaster()->Clear(false);
                        me->GetMotionMaster()->Initialize();
                        me->GetMotionMaster()->MovePoint(DATA_SECOND_POSITION, thirdTrigger->GetPositionX(), thirdTrigger->GetPositionY(), thirdTrigger->GetPositionZ());
                        secondTrigger->StopMoving();
                        secondTrigger->GetMotionMaster()->Clear(false);
                        secondTrigger->CastSpell(thirdTrigger, SPELL_CHANNEL_GROUNDING_FIELD, true);
                        break;
                    }
                    case DATA_SECOND_POSITION:
                        if (Creature* const firstTrigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[0]))
                        {
                            if (Creature* const thirdTrigger = ObjectAccessor::GetCreature(*me, triggerGUIDs[2]))
                            {
                                thirdTrigger->StopMoving();
                                thirdTrigger->GetMotionMaster()->Clear(false);
                                thirdTrigger->CastSpell(firstTrigger, SPELL_CHANNEL_GROUNDING_FIELD, true);
                            }
                            me->SetFacingToObject(firstTrigger);
                            Position position;
                            me->GetNearPosition(position, 7.0f, M_PI / 6.0f);
                            me->SetCanFly(true);
                            me->NearTeleportTo(position.GetPositionX(), position.GetPositionY(), position.GetPositionZ() + 7.0f, 0.0f);
                            me->StopMoving();
                            me->GetMotionMaster()->Clear(false);
                            me->GetMotionMaster()->Initialize();
                            me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 5.0f, 5.0f, DATA_THIRD_POSITION);
                        }
                        break;
                    case DATA_THIRD_POSITION:
                        me->CastSpell(me, SPELL_GROUNDING_FIELD, true);
                        me->StopMoving();
                        me->GetMotionMaster()->Clear(false);
                        if (Creature const* const Asaad = ObjectAccessor::GetCreature(*me, me->GetInstanceScript()->GetData64(BOSS_ASAAD)))
                            Asaad->AI()->DoAction(ACTION_TELEPORT);
                        break;
                    default:
                        break;
                }
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return GetVortexPinnacleAI<script_impl>(creature);
        }
};

class TriangleCheck
{
    WorldObject* const _target;
    Position const _position1;
    Position const _position2;
    Position const _position3;

    public:
        TriangleCheck(WorldObject* target, Position position1, Position position2, Position position3)
            : _target(target)
            , _position1(position1)
            , _position2(position2)
            , _position3(position3)
        {
        }

        bool Check() const
        {
            if (IsInTriangle())
                return true;

            return false;
        }

    private:
        bool IsInTriangle() const
        {
            G3D::Triangle const triangle(PositionToVector3(_position1), PositionToVector3(_position2), PositionToVector3(_position3));
            G3D::Vector3 const vector(_target->GetPositionX(), _target->GetPositionY(), _target->GetPositionZ());
            float b[3];

            return G3D::CollisionDetection::isPointInsideTriangle(triangle.vertex(0), triangle.vertex(1), triangle.vertex(2), triangle.normal(), vector, b, triangle.primaryAxis());
        }

        G3D::Vector3 PositionToVector3(Position const& position) const
        {
            return G3D::Vector3(position.GetPositionX(), position.GetPositionY(), position.GetPositionZ());
        }
};

class achievement_not_static_at_all : public AchievementCriteriaScript
{
    bool OnCheck(Player* player, Unit* target)
    {
        if (!target || !target->ToCreature())
            return false;

        std::list<uint64> failedAchievementGUIDs = CAST_AI(boss_asaad::script_impl, target->ToCreature()->AI())->failedAchievementGUIDs;
        if (!failedAchievementGUIDs.empty())
            for (std::list<uint64>::iterator itr = failedAchievementGUIDs.begin(); itr != failedAchievementGUIDs.end(); ++itr)
                if (player->GetGUID() == *itr)
                    return false;

        return true;
    }

public:
    achievement_not_static_at_all() : AchievementCriteriaScript("achievement_not_static_at_all")
    {
    }
};

class spell_asaad_static_cling : public SpellScriptLoader
{
    class StaticClingCheck
    {
        Unit const* const _target;

        public:
            StaticClingCheck(Unit* target) : _target(target)
            {
            }

            bool operator() (WorldObject* target)
            {
                // Remove if target is jumping
                if (_target->GetPositionZ() > floorZ)
                    return true;

                return false;
            }
    };

    class script_impl : public SpellScript
    {
        PrepareSpellScript(script_impl);

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            // Remove if target is jumping
            if (Unit* const target = GetHitUnit())
                unitList.remove_if(StaticClingCheck(target));
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(script_impl::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(script_impl::FilterTargets, EFFECT_1, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

public:
    spell_asaad_static_cling() : SpellScriptLoader("spell_asaad_static_cling")
    {
    }

    SpellScript* GetSpellScript() const
    {
        return new script_impl();
    }
};

class spell_asaad_grounding_field : public SpellScriptLoader
{
    class script_impl : public SpellScript
    {
        PrepareSpellScript(script_impl);

        Position position[3];
        std::list<uint64> triggerList;

        bool Load()
        {
            Creature* const trigger = GetCaster()->FindNearestCreature(NPC_UNSTABLE_GROUNDING_FIELD, 100.0f, true);
            triggerList = CAST_AI(npc_asaad_grounding_field_trigger::script_impl, trigger->AI())->triggerList;
            if (!trigger || triggerList.empty())
                return false;

            uint8 n = 0;
            for (std::list<uint64>::const_iterator itr = triggerList.begin(); itr != triggerList.end(); ++itr, ++n)
            {
                if (Creature* const triangleTrigger = ObjectAccessor::GetCreature(*trigger, *itr))
                {
                    Position pos;
                    triangleTrigger->GetPosition(&pos);
                    position[n] = pos;
                }
            }

            return true;
        }

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            for (std::list<WorldObject*>::iterator itr = unitList.begin(); itr != unitList.end();)
            {
                TriangleCheck const* const triangle = new TriangleCheck(*itr, position[0], position[1], position[2]);
                if (!triangle->Check())
                    unitList.remove(*itr++);
                else
                    ++itr;
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(script_impl::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

public:
    spell_asaad_grounding_field() : SpellScriptLoader("spell_asaad_grounding_field")
    {
    }

    SpellScript* GetSpellScript() const
    {
        return new script_impl();
    }
};

class spell_asaad_supremacy_dummy : public SpellScriptLoader
{
    class script_impl : public SpellScript
    {
        PrepareSpellScript(script_impl);

        Targets _targets;
        Position position[3];
        std::list<uint64> triggerList;

        bool Load()
        {
            Creature* const trigger = GetCaster()->FindNearestCreature(NPC_UNSTABLE_GROUNDING_FIELD, 100.0f, true);
            triggerList = CAST_AI(npc_asaad_grounding_field_trigger::script_impl, trigger->AI())->triggerList;
            if (!trigger || triggerList.empty())
                return false;

            uint8 n = 0;
            for (std::list<uint64>::const_iterator itr = triggerList.begin(); itr != triggerList.end(); ++itr, ++n)
            {
                if (Creature* const triangleTrigger = ObjectAccessor::GetCreature(*trigger, *itr))
                {
                    Position pos;
                    triangleTrigger->GetPosition(&pos);
                    position[n] = pos;
                }
            }

            return true;
        }

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            for (std::list<WorldObject*>::iterator itr = unitList.begin(); itr != unitList.end();)
            {
                TriangleCheck const* const triangle = new TriangleCheck(*itr, position[0], position[1], position[2]);
                if (triangle->Check())
                    unitList.remove(*itr++);
                else
                    ++itr;
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(script_impl::FilterTargets, EFFECT_0, _targets);
        }

    public:
        script_impl(Targets targets)
            : _targets(targets)
        {
        }
    };

    Targets _targets;

public:
    spell_asaad_supremacy_dummy(char const* name, Targets targets)
        : SpellScriptLoader(name)
        , _targets(targets)
    {
    }

    SpellScript* GetSpellScript() const
    {
        return new script_impl(_targets);
    }
};

class spell_asaad_supremacy_of_the_storm_summon : public SpellScriptLoader
{
    class script_impl : public SpellScript
    {
        PrepareSpellScript(script_impl);

        void HandleSummon(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            Unit* const caster = GetCaster();
            if (!caster || !caster->GetAI())
                return;

            if (Creature const* const trigger = caster->SummonCreature(NPC_GROUNDING_FIELD, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ(), caster->GetOrientation()))
                caster->GetAI()->SetGUID(trigger->GetGUID(), DATA_TRIGGER_GUID);
        }

        void Register()
        {
            OnEffect += SpellEffectFn(script_impl::HandleSummon, EFFECT_0, SPELL_EFFECT_SUMMON);
        }
    };

public:
    spell_asaad_supremacy_of_the_storm_summon() : SpellScriptLoader("spell_asaad_supremacy_of_the_storm_summon")
    {
    }

    SpellScript* GetSpellScript() const
    {
        return new script_impl();
    }
};

class npc_skyfall_star : public CreatureScript
{
    public:
        npc_skyfall_star() : CreatureScript("npc_skyfall_star") { }

        struct npc_skyfall_starAI : public ScriptedAI
        {
            npc_skyfall_starAI(Creature* creature) : ScriptedAI(creature) { }

        void EnterCombat(Unit* /*who*/)
        {
             _events.ScheduleEvent(EVENT_ARCANE_BARRAGE, urand(3000, 10000));
        }

        void UpdateAI(uint32 diff)
        {
            if (!UpdateVictim())
                return;

            _events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_ARCANE_BARRAGE:
                        if(Player* player = me->FindNearestPlayer(55.0f))
                        {
                            me->AddThreat(player, 55.0f);
                            me->AI()->AttackStart(player);
                            DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true), SPELL_ARCANE_BARRAGE, true);
                        }
                        _events.ScheduleEvent(EVENT_ARCANE_BARRAGE, urand(3000, 5000));
                        break;
                    default:
                        break;
                }
            }
        }
        private:
            EventMap _events;
};

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_skyfall_starAI (creature);
        }
};

void AddSC_boss_asaad()
{
    new boss_asaad();
    new npc_asaad_grounding_field_trigger();
    new npc_skyfall_star();
    new achievement_not_static_at_all();
    new spell_asaad_static_cling();
    new spell_asaad_grounding_field();
    new spell_asaad_supremacy_dummy("spell_asaad_grounding_damage", TARGET_UNIT_SRC_AREA_ENTRY);
    new spell_asaad_supremacy_dummy("spell_asaad_grounding_dummy", TARGET_UNIT_SRC_AREA_ENTRY);
    new spell_asaad_supremacy_of_the_storm_summon();
}
