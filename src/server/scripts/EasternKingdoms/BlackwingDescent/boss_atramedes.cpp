#include "blackwing_descent.h"
#include "Unit.h"
#include "SpellScript.h"
#include "Spell.h"
#include "SpellAuraEffects.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"
#include "SpellAuras.h"
#include "ObjectMgr.h"
#include "SpellAuras.h"

enum Spells
{
    SPELL_MODULATION                = 77612,
    SPELL_SOUND_BAR_PLAYER          = 88824,
    SPELL_SEARING_FLAME             = 77840,
    SPELL_SEARING_FLAME_DMG         = 77974,
    SPELL_SONIC_BREATH              = 78098,
    SPELL_TRACKING                  = 78092,
    SPELL_SOUND_BAR                 = 89683,
    SPELL_CLEAR_POWER               = 88773,
    SPELL_DEVASTATION               = 78898,
    SPELL_SONAR_BOMB                = 92557,
    SPELL_ROARING_FLAME_BREATH      = 78221,
    //SPELL_ROARING_FLAME_BREATH_SUM  = 78503, // Cast on the player that touches the shield
    SPELL_LIFT_OFF                  = 92569,
    SPELL_RESONATING_CLASH          = 77611,
    SPELL_RESONATING_CLASH_PLR      = 78168,
    SPELL_RESONATING_CLASH_AUR      = 77709,
    SPELL_VERTIGO                   = 77717,
    SPELL_SONIC_SHIELD              = 78864,
    SPELL_NOISY                     = 78897,
    SPELL_FLAME_BREATH              = 92815,
    SPELL_SUMMON_IMP                = 92708,
    SPELL_BERSERK                   = 26662
};

enum Events
{
    EVENT_MODULATION                = 1,
    EVENT_SONIC_BREATH,
    EVENT_SONAR_PULSE,
    EVENT_SEARING_FLAME,
    EVENT_AIR_PHASE,
    EVENT_SONAR_BOMB,
    EVENT_ROARING_FLAME_BREATH,
    EVENT_GROUND_PHASE,
    EVENT_SET_FLYING,
    EVENT_DESTROY_SHIELD,
    EVENT_BREATH_END,
    EVENT_SUMMON_IMP,
    EVENT_NEFARIAN_DESTROY
};

enum Entities
{
    NPC_SONAR_PULSE                 = 49623,
    NPC_TRACKING_FLAMES             = 41879,
    NPC_REVERBERATING_FLAME         = 41962,
    NPC_ROARING_FLAME               = 41807,
    NPC_ANCIENT_DWARVEN_SHIELD      = 42949,
};

enum Misc
{
    PATH_INTRO                      = 4144200,
    ACTION_GONG                     = 1,
    ACTION_DEATH,
    ACTION_OBNOXIOUS
};

enum Quotes
{
    SAY_AGGRO,
    SAY_SEARING_FLAME,
    SAY_AIR_PHASE,
    SAY_SLAY,
    SAY_DEATH
};

static const Position centerPos = {128.681808f, -225.258270f, 75.454468f, M_PI};

static const Position homePos = {196.520615f, -225.095123f, 75.453438f, M_PI};

typedef std::list<Unit*> UnitList;

class boss_atramedes : public CreatureScript
{
    class TargetChaseEvent : public BasicEvent
    {
    public:
        TargetChaseEvent(Creature& owner, uint64 targetGUID) : BasicEvent(), m_owner(owner), m_targetGUID(targetGUID) { }

        bool Execute(uint64 /*eventTime*/, uint32 /*diff*/)
        {
             if(Player * target = m_owner.GetPlayer(m_owner, m_targetGUID))
            {
                m_owner.ClearUnitState(UNIT_STATE_CASTING);
                m_owner.GetMotionMaster()->Clear();
                m_owner.GetMotionMaster()->MoveFollow(target, 0.0f, 0.0f);
            }
            return true;
        }

    private:
        Creature& m_owner;
        uint64 m_targetGUID;
    };

    class SoundOrderPred
    {
    public:
        SoundOrderPred() {}

        bool operator() (const Unit* a, const Unit* b) const
        {
            return a->GetPower(POWER_ALTERNATE_POWER) != 100 && a->GetPower(POWER_ALTERNATE_POWER) > b->GetPower(POWER_ALTERNATE_POWER);
        }
    };

    struct boss_atramedesAI : public BossAI
    {
        boss_atramedesAI(Creature * creature) : BossAI(creature, DATA_ATRAMEDES)
        {
            introDone = false;
            introTimer = 0;
            nefarianGUID = 0;
            me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->GetMotionMaster()->MovePath(PATH_INTRO, false);
            me->SetCanFly(true);
        }

        void Reset()
        {
            me->setActive(true);
            airPhase = false;
            enrageTimer = 600000;
            flameGUID = 0;
            instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SOUND_BAR_PLAYER);
            if(introDone)
            {
                me->SetReactState(REACT_AGGRESSIVE);
                me->SetCanFly(false);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            }
            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
            {
                nefarian->DisappearAndDie();
                nefarian->DespawnOrUnsummon(3000);
            }
            _Reset();
            ResetShields();
        }

        void ResetShields()
        {
            std::list<Creature*> gongList;
            me->GetCreatureListWithEntryInGrid(gongList, NPC_ANCIENT_DWARVEN_SHIELD, 300.0f);

            if(gongList.empty())
                return;

            for(std::list<Creature*>::const_iterator itr = gongList.begin(); itr != gongList.end(); ++itr)
            {
                (*itr)->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_HIDE_NAMEPLATE | UNIT_FLAG2_UNK2);
                (*itr)->RemoveAllAuras();
                (*itr)->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                (*itr)->SetCorpseDelay(3600);
                if((*itr)->isDead())
                    (*itr)->Respawn(true);
            }
        }

        void JustSummoned(Creature * summon)
        {
            if(summon->GetEntry() == NPC_NEFARIUS_ATRAMEDES)
                nefarianGUID = summon->GetGUID();
            else
                BossAI::JustSummoned(summon);
        }

        void SpellHit(Unit * caster, const SpellInfo * spell)
        {
            if(spell->Id == SPELL_RESONATING_CLASH)
            {
                if(!airPhase)
                {
                    me->RemoveAurasDueToSpell(SPELL_SEARING_FLAME);
                    me->RemoveAurasDueToSpell(SPELL_SEARING_FLAME_DMG);
                    DoCast(me, SPELL_VERTIGO, true);
                    if(IsHeroic())
                        events.ScheduleEvent(EVENT_NEFARIAN_DESTROY, 3000);
                }else
                {
                    if(Creature * flame = me->GetCreature(*me, flameGUID))
                        flame->AI()->SetGUID(caster->GetGUID());
                }
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
            Talk(SAY_AGGRO);
            events.ScheduleEvent(EVENT_MODULATION, urand(10000, 12000));
            events.ScheduleEvent(EVENT_SONIC_BREATH, urand(20000, 25000));
            events.ScheduleEvent(EVENT_SONAR_PULSE, urand(10000, 14000));
            events.ScheduleEvent(EVENT_SEARING_FLAME, 45000);
            events.ScheduleEvent(EVENT_AIR_PHASE, 80000);
            if(IsHeroic())
                events.ScheduleEvent(EVENT_SUMMON_IMP, 10000);
            DoCast(SPELL_SOUND_BAR);
            instance->DoCastSpellOnPlayers(SPELL_CLEAR_POWER);
            DoCast(SPELL_DEVASTATION);
            me->SummonCreature(NPC_NEFARIUS_ATRAMEDES, 98.551704f, -225.954895f, 98.597633f, 0.0f);
            _EnterCombat();
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if(type == POINT_MOTION_TYPE)
            {
                me->GetMotionMaster()->MoveIdle();
                //me->SendMonsterMove(centerPos.GetPositionX(), centerPos.GetPositionY(), centerPos.GetPositionZ() + 20.0f, 100);
                DoCast(SPELL_LIFT_OFF);
                events.ScheduleEvent(EVENT_SET_FLYING, 4500);
                events.ScheduleEvent(EVENT_GROUND_PHASE, 40000);
                events.ScheduleEvent(EVENT_SONAR_BOMB, 8000);
                events.ScheduleEvent(EVENT_ROARING_FLAME_BREATH, 5000);
            }
            else if(type == WAYPOINT_MOTION_TYPE && id == 3)
            {
                DoCast(SPELL_FLAME_BREATH);
                if(GameObject * go = me->FindNearestGameObject(GO_ANCIENT_BELL, 100.0f))
                    go->SetGoState(GO_STATE_ACTIVE);
                introTimer = 5000;
            }
        }

        void KilledUnit(Unit * victim)
        {
            if(victim->GetTypeId() == TYPEID_PLAYER)
                Talk(SAY_SLAY);
        }

        void JustDied(Unit * /*killer*/)
        {
            instance->DoRemoveAurasDueToSpellOnPlayers(SPELL_SOUND_BAR_PLAYER);

            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                nefarian->AI()->DoAction(ACTION_DEATH);
            Talk(SAY_DEATH);
            _JustDied();
        }

        void UpdateAI(const uint32 diff)
        {
            if(!introDone && introTimer)
            {
                if(introTimer <= diff)
                {
                    introDone = true;
                    me->SetSpeed(MOVE_FLIGHT, 1.5f, true);
                    me->SetReactState(REACT_AGGRESSIVE);
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    me->SetHomePosition(homePos);
                    EnterEvadeMode();
                }else introTimer -= diff;
            }

            if(IsHeroic())
            {
                if(enrageTimer <= diff)
                {
                    DoCast(SPELL_BERSERK);
                    enrageTimer = 600000;
                }else enrageTimer -= diff;
            }

            if(!UpdateVictim())
                return;

            events.Update(diff);

            if(me->HasUnitState(UNIT_STATE_CASTING) || me->HasAura(SPELL_VERTIGO))
                if(!airPhase)
                    return;

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_MODULATION:
                    DoCast(SPELL_MODULATION);
                    events.ScheduleEvent(EVENT_MODULATION, urand(20000, 25000));
                    break;
                case EVENT_SONIC_BREATH:
                    if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true))
                    {
                        if(Creature * creature = target->SummonCreature(NPC_TRACKING_FLAMES, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 10000))
                        {
                            me->AddThreat(creature, 500000000.0f);
                            me->SetUInt64Value(UNIT_FIELD_TARGET, creature->GetGUID());
                            me->GetMotionMaster()->MoveChase(creature);
                            //me->SetInFront(creature);
                            me->SetReactState(REACT_PASSIVE);
                            creature->m_Events.AddEvent(new TargetChaseEvent(*creature, target->GetGUID()), me->m_Events.CalculateTime(2250));
                            creature->CastSpell(target, SPELL_TRACKING, true);
                            DoCast(SPELL_SONIC_BREATH);
                            events.ScheduleEvent(EVENT_BREATH_END, 8000);
                            events.ScheduleEvent(EVENT_SONIC_BREATH, urand(25000, 27000));
                        }
                    }
                    break;
                case EVENT_BREATH_END:
                    me->SetReactState(REACT_AGGRESSIVE);
                    if(Unit * victim = me->getVictim())
                    {
                        me->SetUInt64Value(UNIT_FIELD_TARGET, victim->GetGUID());
                        DoStartMovement(victim);
                    }
                    break;
                case EVENT_SONAR_PULSE:
                    {
                        UnitList targetList;
                        SelectTargetList(targetList, 4, SELECT_TARGET_RANDOM, 0.0f, true);
                        Position myPos, pos;
                        me->GetPosition(&myPos);
                        for(UnitList::const_iterator itr = targetList.begin(); itr != targetList.end(); ++itr)
                        {
                            if(!(*itr))
                                return;

                            if(Creature * pulse = me->SummonCreature(NPC_SONAR_PULSE, myPos, TEMPSUMMON_TIMED_DESPAWN, 20000))
                            {
                                me->GetNearPosition(pos, 80.0f, me->GetRelativeAngle((*itr)));
                                pulse->GetMotionMaster()->Clear();
                                pulse->GetMotionMaster()->MovePoint(0, pos);
                            }
                        }
                        events.ScheduleEvent(EVENT_SONAR_PULSE, urand(8000, 10000));
                        break;
                    }
                case EVENT_SEARING_FLAME:
                    Talk(SAY_SEARING_FLAME);
                    DoCast(me, SPELL_SEARING_FLAME, true);
                    DoCast(me, SPELL_SEARING_FLAME_DMG, true);
                    events.ScheduleEvent(EVENT_SEARING_FLAME, 45000);
                    break;
                case EVENT_AIR_PHASE:
                    airPhase = true;
                    events.Reset();
                    me->SetReactState(REACT_PASSIVE);
                    me->SetUInt64Value(UNIT_FIELD_TARGET, 0);
                    me->GetMotionMaster()->MoveIdle();
                    me->GetMotionMaster()->MovePoint(0, centerPos);
                    break;
                case EVENT_SET_FLYING:
                    me->SetCanFly(true);
                    me->NearTeleportTo(centerPos.GetPositionX(), centerPos.GetPositionY(), centerPos.GetPositionZ() + 20.0f, M_PI);
                    me->SendMovementFlagUpdate();
                    break;
                case EVENT_SONAR_BOMB:
                    for(int i=0; i<RAID_MODE(4, 7, 4, 7); ++i)
                        DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true), SPELL_SONAR_BOMB, true);
                    events.ScheduleEvent(EVENT_SONAR_BOMB, 2000);
                    break;
                case EVENT_ROARING_FLAME_BREATH:
                    {
                        Talk(SAY_AIR_PHASE);

                        UnitList targetList;

                        ThreatContainer::StorageType const &threatList = me->getThreatManager().getThreatList();
                        for (ThreatContainer::StorageType::const_iterator itr = threatList.begin(); itr != threatList.end(); ++itr)
                            if ((*itr)->getTarget()->GetTypeId() == TYPEID_PLAYER)
                                targetList.push_back((*itr)->getTarget());

                        targetList.sort(SoundOrderPred());

                        if(Unit * target = targetList.front())
                        {
                            if(Creature * flame = me->SummonCreature(NPC_REVERBERATING_FLAME, me->GetPositionX(), me->GetPositionY(), 75.46f, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 40000))
                            {
                                flame->AI()->SetGUID(target->GetGUID());
                                flame->SetInCombatWithZone();
                                flameGUID = flame->GetGUID();
                                DoCast(flame, SPELL_ROARING_FLAME_BREATH, false);
                                flame->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                                flame->SetDisplayId(11686);
                            }
                        }
                    }
                    break;
                case EVENT_GROUND_PHASE:
                    airPhase = false;
                    if(Creature * flame = me->GetCreature(*me, flameGUID))
                        flame->DespawnOrUnsummon();
                    flameGUID = 0;
                    me->SetCanFly(false);
                    me->SetReactState(REACT_AGGRESSIVE);
                    if(Unit * victim = me->getVictim())
                    {
                        me->SetUInt64Value(UNIT_FIELD_TARGET, victim->GetGUID());
                        DoStartMovement(victim);
                    }
                    me->MonsterMoveWithSpeed(centerPos.GetPositionX(), centerPos.GetPositionY(), centerPos.GetPositionZ(), 100);
                    events.Reset();
                    events.ScheduleEvent(EVENT_MODULATION, urand(10000, 12000));
                    events.ScheduleEvent(EVENT_SONIC_BREATH, urand(15000, 20000));
                    events.ScheduleEvent(EVENT_SONAR_PULSE, urand(10000, 14000));
                    events.ScheduleEvent(EVENT_SEARING_FLAME, 45000);
                    events.ScheduleEvent(EVENT_AIR_PHASE, 80000);
                    if(IsHeroic())
                        events.ScheduleEvent(EVENT_SUMMON_IMP, 5000);
                    break;
                case EVENT_SUMMON_IMP:
                    DoCast(SelectTarget(SELECT_TARGET_RANDOM, 1, 100, true), SPELL_SUMMON_IMP, true);
                    if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                        nefarian->AI()->DoAction(ACTION_OBNOXIOUS);
                    events.ScheduleEvent(EVENT_SUMMON_IMP, 20000);
                    break;
                case EVENT_NEFARIAN_DESTROY:
                    if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                        nefarian->AI()->DoAction(ACTION_GONG);
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
        private:
            bool airPhase;
            bool introDone;
            uint32 introTimer;
            uint32 enrageTimer;
            uint64 flameGUID;
            uint64 nefarianGUID;
    };
public:
    boss_atramedes() : CreatureScript("boss_atramedes") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_atramedesAI(creature);
    }
};

class spell_sound_bar : public SpellScriptLoader
{
    class spell_sound_bar_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_sound_bar_SpellScript);

        void FilterTargets(UnitList targetList)
        {
            for(UnitList::iterator itr = targetList.begin(); itr != targetList.end();)
            {
                if((*itr)->HasAura(GetSpellInfo()->Id))
                    itr = targetList.erase(itr);
                else
                {
                    (*itr)->SetPower(POWER_ALTERNATE_POWER, 0);
                    ++itr;
                }
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sound_bar_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sound_bar_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

    class spell_sound_bar_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_sound_bar_AuraScript)

        void HandleEffectRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if(Unit * target = GetTarget())
                target->SetVehicleId(0);
        }

        void HandleEffectApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if(Unit * target = GetTarget())
                target->SetVehicleId(497);
        }

        void HandleEffectPeriodic(AuraEffect const* /*aurEff*/)
        {
            Unit* target = GetTarget();
            if(target->GetPower(POWER_ALTERNATE_POWER) >= 100 && !target->HasAura(SPELL_NOISY))
                target->CastSpell(target, SPELL_NOISY, true);
        }

        void Register()
        {
            OnEffectRemove += AuraEffectRemoveFn(spell_sound_bar_AuraScript::HandleEffectRemove, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectApply += AuraEffectApplyFn(spell_sound_bar_AuraScript::HandleEffectApply, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_sound_bar_AuraScript::HandleEffectPeriodic, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
        }
    };
public:
    spell_sound_bar() : SpellScriptLoader("spell_sound_bar") { }

    SpellScript * GetSpellScript() const
    {
        return new spell_sound_bar_SpellScript();
    }

    AuraScript* GetAuraScript() const
    {
        return new spell_sound_bar_AuraScript();
    }
};

class npc_tracking_flames : public CreatureScript
{
    enum
    {
        SPELL_BUILDING_SPEED            = 78217,
        SPELL_BUILDING_SPEED_EFF        = 78218,
        SPELL_BUILDING_SPEED_BOOST      = 78969,
        SPELL_FLAME_BREATH_PER_EFF      = 78431,
        SPELL_SUMMON_TRACKER            = 78354,
    };

    struct npc_tracking_flamesAI : public ScriptedAI
    {
        npc_tracking_flamesAI(Creature * creature) : ScriptedAI(creature) {}

        void Reset()
        {
            targetGUID = 0;
            moveTimer = 0;
            change = false;
            me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
        }

        void DamageTaken(Unit * /*who*/, uint32 &damage)
        {
            damage = 0;
        }

        void SetGUID(uint64 guid, int32)
        {
            // change target
            me->RemoveAurasDueToSpell(SPELL_BUILDING_SPEED);
            me->RemoveAurasDueToSpell(SPELL_BUILDING_SPEED_EFF);
            me->GetMotionMaster()->MoveIdle();
            DoCast(SPELL_BUILDING_SPEED_BOOST);

            if(Unit * unit = me->GetUnit(*me, guid))
            {
                if(Unit * old = me->GetUnit(*me, targetGUID))
                    me->getThreatManager().modifyThreatPercent(old, -100);

                DoCast(unit, SPELL_TRACKING, true);
                me->AddThreat(unit, 500000.0f);
                me->ClearUnitState(UNIT_STATE_CASTING);
                DoStartMovement(unit);
                //me->GetMotionMaster()->MoveFollow(unit, 0.0f, 0.0f);
                me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
                float speed = me->GetSpeed(MOVE_RUN);
                moveTimer = uint32(me->GetExactDist(unit) / speed * 1000);
                if(AuraEffect * aur = me->GetAuraEffect(SPELL_SUMMON_TRACKER, EFFECT_0))
                    aur->CalculatePeriodic(me);
                change = true;
            }
            targetGUID = guid;
        }

        void UpdateAI(const uint32 diff)
        {
            if(!UpdateVictim() || !change)
                return;

            if(moveTimer <= diff)
            {
                change = false;
                me->RemoveAurasDueToSpell(SPELL_BUILDING_SPEED_BOOST);
                if(AuraEffect * aur = me->GetAuraEffect(SPELL_SUMMON_TRACKER, EFFECT_0))
                    aur->CalculatePeriodic(me);

                if(Unit * target = me->GetUnit(*me, targetGUID))
                {
                    if(Aura * aur = me->AddAura(SPELL_BUILDING_SPEED_EFF, me))
                        aur->SetStackAmount(uint8(std::ceil(float(target->GetPower(POWER_ALTERNATE_POWER))/10.0f)));
                    DoCast(me, SPELL_BUILDING_SPEED, true);
                }
            }else moveTimer -= diff;
        }

    private:
        bool change;
        uint32 moveTimer;
        uint64 targetGUID;
    };

public:
    npc_tracking_flames() : CreatureScript("npc_tracking_flames") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_tracking_flamesAI(creature);
    }
};

class spell_roaring_flame_periodic : public SpellScriptLoader
{
    class spell_roaring_flame_periodic_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_roaring_flame_periodic_SpellScript);

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            if(!unitList.empty())
                return;

            if(Unit* caster = GetCaster())
            {
                if(TempSummon* temp = caster->ToTempSummon())
                {
                    if(Unit* owner = temp->GetSummoner())
                    {
                        if(Creature* creature = owner->SummonCreature(NPC_ROARING_FLAME, caster->GetPositionX(), caster->GetPositionY(), caster->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 80000))
                        {
                            creature->SetFloatValue(UNIT_FIELD_BOUNDINGRADIUS, 0.0f);
                            creature->SetFloatValue(UNIT_FIELD_COMBATREACH, 0.0f);
                        }
                    }
                }
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_roaring_flame_periodic_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

public:
    spell_roaring_flame_periodic() : SpellScriptLoader("spell_roaring_flame_periodic") { }

    SpellScript * GetSpellScript() const
    {
        return new spell_roaring_flame_periodic_SpellScript();
    }
};

class spell_modulation : public SpellScriptLoader
{
    class spell_modulation_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_modulation_SpellScript);

        void HandleEffect(SpellEffIndex /*effIndex*/)
        {
            if(Unit * target = GetHitUnit())
            {
                int32 damage = GetHitDamage();
                int32 sound = target->GetPower(POWER_ALTERNATE_POWER);
                SetHitDamage(damage + (damage * sound * 2) / 100);
            }
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_modulation_SpellScript::HandleEffect, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };
public:
    spell_modulation() : SpellScriptLoader("spell_modulation") { }

    SpellScript* GetSpellScript() const
    {
        return new spell_modulation_SpellScript();
    }
};

class npc_ancient_dwarven_shield : public CreatureScript
{
    struct npc_ancient_dwarven_shieldAI : public ScriptedAI
    {
        npc_ancient_dwarven_shieldAI(Creature * creature) : ScriptedAI(creature) {}

        void SpellClick(Player * /*player*/)
        {
            DoCast(me, SPELL_RESONATING_CLASH_AUR, true);
            DoCast(SPELL_SONIC_SHIELD);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
        }

        void UpdateAI(const uint32 /*diff*/) {}
    };

public:
    npc_ancient_dwarven_shield() : CreatureScript("npc_ancient_dwarven_shield") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_ancient_dwarven_shieldAI(creature);
    }
};

class spell_sonic_flames : public SpellScriptLoader
{
    class spell_sonic_flames_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_sonic_flames_SpellScript);

         void FilterTargets(std::list<Creature*> &cList)
        {
            if(cList.empty())
                return;

            for(std::list<Creature*>::iterator itr = cList.begin(); itr != cList.end();)
            {
                if(!(*itr)->HasAura(SPELL_RESONATING_CLASH_AUR) || !(*itr)->isAlive())
                    itr = cList.erase(itr);
                else
                    ++itr;
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sonic_flames_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

public:
    spell_sonic_flames() : SpellScriptLoader("spell_sonic_flames") { }

    SpellScript * GetSpellScript() const
    {
        return new spell_sonic_flames_SpellScript();
    }
};

class go_ancient_bell : public GameObjectScript
{
    bool OnGossipHello(Player* player, GameObject* pGO)
    {
        if(InstanceScript * instance = player->GetInstanceScript())
        {
            instance->SetData(DATA_ATRAMEDES_SUMMON, 1);
            pGO->SendCustomAnim(0);
            pGO->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
        }
        return true;
    }
public:
    go_ancient_bell() : GameObjectScript("go_ancient_bell") { }
};

class spell_sonic_breath_periodic : public SpellScriptLoader
{
    class spell_sonic_breath_periodic_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_sonic_breath_periodic_SpellScript);

         void FilterTargets(std::list<WorldObject*>& unitList)
        {
            if(unitList.empty())
                return;

            Unit * target = GetOriginalCaster();
            Unit * caster = GetCaster();
            if(!target || !caster)
                return;
            for(std::list<WorldObject*>::iterator itr = unitList.begin(); itr != unitList.end();)
            {
                if(!caster->HasInArc(caster->GetAngle(target), (*itr), 12.0f)
                    && (*itr)->GetExactDist2d(caster->GetPositionX(), caster->GetPositionY()) > 7.0f)
                    itr = unitList.erase(itr);
                else
                    ++itr;
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sonic_breath_periodic_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENEMY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_sonic_breath_periodic_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
        }
    };

public:
    spell_sonic_breath_periodic() : SpellScriptLoader("spell_sonic_breath_periodic") { }

    SpellScript * GetSpellScript() const
    {
        return new spell_sonic_breath_periodic_SpellScript();
    }
};

class npc_obnoxious_fiend : public CreatureScript
{
    enum
    {
        SPELL_PESTERED      = 92685,
        SPELL_OBNOXIOUS     = 92677,
        SPELL_PHASE_SHIFT   = 92681
    };

    struct npc_obnoxious_fiendAI : public ScriptedAI
    {
        npc_obnoxious_fiendAI(Creature * creature) : ScriptedAI(creature) {}

        void Reset()
        {
            riding = false;
        }

        void OnVehicleControl(Unit * /*base*/, int8 /*seatId*/, bool apply)
        {
            riding = apply;
            if(!apply)
                DoCast(SPELL_PHASE_SHIFT);
            else
                me->ClearUnitState(UNIT_STATE_ONVEHICLE);
        }

        void IsSummonedBy(Unit *)
        {
            me->SetInCombatWithZone();
            if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true, -SPELL_PESTERED))
                me->AddThreat(target, 5000000.0f);
            DoCast(SPELL_PHASE_SHIFT);
            if(Creature * atramedes = me->FindNearestCreature(NPC_ATRAMEDES, 500.0f))
                atramedes->AI()->JustSummoned(me);
        }

        void UpdateAI(const uint32 /*diff*/)
        {
            if(!UpdateVictim())
                return;

            DoMeleeAttackIfReady();

            if(riding && !me->HasUnitState(UNIT_STATE_CASTING))
                DoCastVictim(SPELL_OBNOXIOUS);
        }

    private:
        bool riding;
        uint32 obnoxiousTimer;
    };

public:
    npc_obnoxious_fiend() : CreatureScript("npc_obnoxious_fiend") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_obnoxious_fiendAI(creature);
    }
};

class npc_victor_nefarius_atramedes : public CreatureScript
{
    enum
    {
        SAY_GONG,
        SAY_DEATH,
        SAY_OBNOXIOUS,
        SPELL_SONIC_FLAMES      = 77782,
        SPELL_HOVER_ANIM        = 90766
    };

    struct npc_victor_nefarius_atramedesAI : public ScriptedAI
    {
        npc_victor_nefarius_atramedesAI(Creature * creature) : ScriptedAI(creature)
        {
            me->setActive(true);
        }

        void Reset()
        {
            canTalk = true;
            textCooldown = 0;
        }

        void IsSummonedBy(Unit *)
        {
        }

        void DoAction(const int32 action)
        {
            switch(action)
            {
            case ACTION_GONG:
                if(canTalk)
                {
                    canTalk = false;
                    textCooldown = 10000;
                    Talk(SAY_GONG);
                }
                if(Creature * shield = me->FindNearestCreature(NPC_ANCIENT_DWARVEN_SHIELD, 500.0f))
                {
                    shield->CastSpell(shield, SPELL_RESONATING_CLASH_AUR, true);
                    DoCast(SPELL_SONIC_FLAMES);
                }
                break;
            case ACTION_DEATH:
                Talk(SAY_DEATH);
                me->DespawnOrUnsummon(5000);
                break;
            case ACTION_OBNOXIOUS:
                Talk(SAY_OBNOXIOUS);
                break;
            }
        }

        void UpdateAI(const uint32 diff)
        {
            if(!canTalk)
            {
                if(textCooldown <= diff)
                    canTalk = true;
                else
                    textCooldown -= diff;
            }
        }

    private:
        bool canTalk;
        uint32 textCooldown;
    };

public:
    npc_victor_nefarius_atramedes() : CreatureScript("npc_victor_nefarius_atramedes") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_victor_nefarius_atramedesAI(creature);
    }
};

void AddSC_boss_atramedes()
{
    new boss_atramedes();
    new spell_sound_bar();
    new npc_tracking_flames();
    new spell_roaring_flame_periodic();
    new spell_modulation();
    new npc_ancient_dwarven_shield();
    new spell_sonic_flames();
    new go_ancient_bell();
    new spell_sonic_breath_periodic();
    new npc_obnoxious_fiend();
    new npc_victor_nefarius_atramedes();
};
