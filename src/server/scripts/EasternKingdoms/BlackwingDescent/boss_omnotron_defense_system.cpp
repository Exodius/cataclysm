#include "blackwing_descent.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "ScriptedCreature.h"
#include "ScriptMgr.h"
#include "SpellScript.h"
#include "Vehicle.h"

/*
TODO:
- Add Encounter Frames
- Cleanup
*/

enum Spells
{
    SPELL_POWERED_DOWN          = 82265, // transform
    SPELL_SHUTTING_DOWN         = 78746, // triggers inactive
    SPELL_INACTIVE              = 78726,
    SPELL_ACTIVATED             = 78740,
    SPELL_ENERGY_DRAIN          = 78725, // -100% regen
    SPELL_RECHARGE_ARCANOTRON   = 78699, // Beams
    SPELL_RECHARGE_ELECTRON     = 78697,
    SPELL_RECHARGE_MAGMATRON    = 78698,
    SPELL_RECHARGE_TOXITRON     = 78700,
    SPELL_POWER_CONVERSION      = 79729, // Arcanotron Shield
    SPELL_UNSTABLE_SHIELD       = 79900, // Electron Shield
    SPELL_BARRIER               = 79582, // Magmatron Shield
    SPELL_POISON_SHELL          = 79835, // Toxitron Shield
};

enum Quotes
{
    EMOTE_SHIELD                = 0,
    SAY_ARCANOTRON_ACTIVATE     = 0,
    SAY_ELECTRON_ACTIVATE,
    SAY_MAGMATRON_ACTIVATE,
    SAY_TOXITRON_ACTIVATE,
    SAY_ARCANOTRON_SHIELD,
    SAY_ELECTRON_SHIELD,
    SAY_MAGMATRON_SHIELD,
    SAY_TOXITRON_SHIELD,
    SAY_MAGMATRON_FLAMETHROWER,
    SAY_AGGRO,
    SAY_DEATH,
    SAY_NEF_ARCANOTRON          = 0,
    SAY_NEF_ELECTRON,
    SAY_NEF_MAGMATRON,
    SAY_NEF_TOXITRON,
    SAY_NEF_AGGRO,
    SAY_NEF_DEATH
};

enum Actions
{
    ACTION_COMBAT,
    ACTION_FIRST,
    ACTION_DISABLED,
    ACTION_DELAY,
    ACTION_INIT,
    ACTION_DEATH,
    ACTION_EMPOWER,
    ACTION_GRIP
};

enum Misc
{
    TYPE_OMNOTRON_GUID          = 0,
    TYPE_NEFARIAN_GUID          = 1,
};

// 67236 on bots, invis detection

struct Tron
{
    uint32 npcEntry;
    uint32 beamId;
    uint32 ShieldId;
    uint8 activation;
    uint8 shield;
};

static const Tron bots[4] =
{
    {NPC_ARCANOTRON, SPELL_RECHARGE_ARCANOTRON, SPELL_POWER_CONVERSION, SAY_ARCANOTRON_ACTIVATE, SAY_ARCANOTRON_SHIELD},
    {NPC_ELECTRON, SPELL_RECHARGE_ELECTRON, SPELL_UNSTABLE_SHIELD, SAY_ELECTRON_ACTIVATE, SAY_ELECTRON_SHIELD},
    {NPC_MAGMATRON, SPELL_RECHARGE_MAGMATRON, SPELL_BARRIER, SAY_MAGMATRON_ACTIVATE, SAY_MAGMATRON_SHIELD},
    {NPC_TOXITRON, SPELL_RECHARGE_TOXITRON, SPELL_POISON_SHELL, SAY_TOXITRON_ACTIVATE, SAY_TOXITRON_SHIELD},
};

static const Position homePos[4] =
{
    {-335.633057f, -407.140930f, 214.019852f, 1.204964f},
    {-342.247772f, -403.688599f, 213.974152f, 1.015378f},
    {-307.048340f, -407.050171f, 214.007553f, 2.126453f},
    {-313.014130f, -409.362091f, 213.898727f, 1.812075f}
};

// Generic AI for bots

struct npc_omnotron_botAI : public ScriptedAI
{
    npc_omnotron_botAI(Creature * creature) : ScriptedAI(creature), summons(me)
    {
        first = false;
        for(int i=0;i<3;++i)
            guids[i] = 0;
        omnotronGUID = 0;
        nefarianGUID = 0;
        me->SetHealth(me->GetMaxHealth());
    }

    EventMap events;
    bool first;
    uint64 guids[3];
    uint64 nefarianGUID;

    void SetGUID(uint64 guid, int32 type)
    {
        if(type == TYPE_OMNOTRON_GUID)
            omnotronGUID = guid;
        else if(type == TYPE_NEFARIAN_GUID)
            nefarianGUID = guid;
    }

    void OmnotronTalk(uint8 ID)
    {
        if(Creature * omnotron = me->GetCreature(*me, omnotronGUID))
            omnotron->AI()->Talk(ID);
    }

    void Reset()
    {
        _Reset();
    }

    void _Reset()
    {
        events.Reset();
        summons.DespawnAll();
    }

    void JustDied(Unit* /*killer*/)
    {
        summons.DespawnAll();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_31);
        me->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_LOOTABLE);
    }

    void EnterEvadeMode()
    {
        if (!_EnterEvadeMode())
            return;
        Reset();
        if (me->IsVehicle())
            me->GetVehicleKit()->Reset();
        JustReachedHome();
    }

    bool CanEmpower() const
    {
        if(IsHeroic())
        {
            if(Creature * omnotron = me->GetCreature(*me, omnotronGUID))
            {
                if(omnotron->AI()->GetData(0))
                {
                    omnotron->AI()->DoAction(ACTION_EMPOWER);
                    return true;
                }
            }
        }
        return false;
    }

    void DamageTaken(Unit* done_by, uint32 &damage)
    {
        if(done_by == me)
            return;

        bool kill = damage >= me->GetHealth();

        for(int i=0; i<=2; ++i)
        {
            if(Creature * tron = me->GetCreature(*me, guids[i]))
            {
                if(kill)
                    done_by->Kill(tron);
                else
                {
                    tron->DealDamage(tron, damage, NULL, NODAMAGE);
                    tron->LowerPlayerDamageReq(damage);
                }
            }
        }

        if(kill)
            if(Creature * omnotron = me->GetCreature(*me, omnotronGUID))
                omnotron->AI()->DoAction(ACTION_DEATH);
    }

    void JustSummoned(Creature * creature)
    {
        _JustSummoned(creature);
    }

    void _JustSummoned(Creature * creature)
    {
        if(creature->GetEntry() == NPC_POWER_GENERATOR)
            creature->DespawnOrUnsummon(30000);

        summons.Summon(creature);
    }

    void JustReachedHome()
    {
        if(!first)
        {
            me->CastSpell(me, SPELL_INACTIVE, true);
            me->CastSpell(me, SPELL_POWERED_DOWN, true);
            me->CastSpell(me, SPELL_ENERGY_DRAIN, true);
        }
    }

    void DoAction(int32 action)
    {
        switch(action)
        {
        case ACTION_FIRST:
            first = true;
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MovePath(NPC_OMNOTRON*100, true);
            break;
        case ACTION_DISABLED:
            first = false;
            //JustReachedHome();
            break;
        case ACTION_DELAY:
            events.DelayEvents(180000);
            break;
        default:
            break;
        }
    }

    void _EnterCombat(Unit * who)
    {
        if(first)
        {
            if(Creature * controller = me->FindNearestCreature(NPC_OMNOTRON, 200.0f))
                controller->AI()->DoAction(ACTION_COMBAT);
            me->CastSpell(me, SPELL_ACTIVATED, true);
            me->CastSpell(me, SPELL_ENERGY_DRAIN, true);
        }
        ScriptedAI::EnterCombat(who);
    }
private:
    SummonList summons;
    uint64 omnotronGUID;
};

// Controller
class boss_omnotron : public CreatureScript
{
    enum Events
    {
        EVENT_BEAM_NEXT         = 1,
        EVENT_ACTIVATE_NEXT,
        EVENT_PLAYER_CHECK,
        EVENT_EMPOWER_RESET
    };

    class BotInitEvent : public BasicEvent
    {
    public:
        BotInitEvent(Creature& owner) : BasicEvent(), m_owner(owner) { }

        bool Execute(uint64 /*eventTime*/, uint32 /*diff*/)
        {
            m_owner.AI()->DoAction(ACTION_INIT);
            return true;
        }

    private:
        Creature& m_owner;
    };

    struct boss_omnotronAI : public BossAI
    {
        boss_omnotronAI(Creature * creature) : BossAI(creature, DATA_OMNOTRON_DEFENSE_SYSTEM)
        {
            me->m_Events.AddEvent(new BotInitEvent(*me), me->m_Events.CalculateTime(100));
            done = false;
        }

        void Reset()
        {
            cnt2 = 0;
            curBot = 0;
            canEmpower = IsHeroic();
            nefarianGUID = 0;
            events.Reset();

            // Init bot Sequence
            for(uint8 i=0; i<4; ++i)
                botOrder[i] = i;
            srand((unsigned int)time(NULL));
            std::random_shuffle(botOrder, botOrder + 4);

            if(done)
                InitBots();
            _Reset();
        }

        uint32 GetData(uint32 /*id = 0*/) const
        {
            return canEmpower;
        }

        void EnterEvadeMode()
        {
            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                nefarian->DespawnOrUnsummon();
            BossAI::EnterEvadeMode();
        }

        void InitBots()
        {
            // Disable all bots except the first one
            for(int i=0; i<4; ++i)
            {
                if(Creature * tron = me->GetCreature(*me, botGUID[botOrder[i]]))
                {

                    tron->RemoveAllAuras();
                    tron->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_31);
                    tron->SetHealth(tron->GetMaxHealth()); // health regen is disabled
                    tron->DestroyForNearbyPlayers();
                    tron->SetPosition(homePos[botOrder[i]]);
                    tron->GetMotionMaster()->MoveIdle();

                    if(i)
                    {
                        // Disable
                        tron->SendMovementFlagUpdate();
                        tron->CastSpell(tron, SPELL_INACTIVE, true);
                        tron->CastSpell(tron, SPELL_POWERED_DOWN, true);
                        tron->CastSpell(tron, SPELL_ENERGY_DRAIN, true);
                        tron->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_31); // from sniffs
                        tron->SetReactState(REACT_PASSIVE);
                        tron->AI()->DoAction(ACTION_DISABLED);
                        tron->GetMotionMaster()->ResetMovement(true);
                    }
                    else
                    {
                        // Enable and make us follow waypoints
                        tron->RemoveAllAuras();
                        tron->SetReactState(REACT_AGGRESSIVE);
                        tron->AI()->DoAction(ACTION_FIRST);
                        tron->SetPower(POWER_ENERGY, 100);
                    }
                    tron->ClearUnitState(UNIT_STATE_EVADE);
                }
            }
        }

        void AttackStart(Unit * who)
        {
            DoStartNoMovement(who);
        }

        void DoAction(int32 action)
        {
            if(action == ACTION_COMBAT)
            {
                DoZoneInCombat();
                // Beam on next
                if(Creature * nextBot = me->GetCreature(*me, botGUID[botOrder[1]]))
                    DoCast(nextBot, bots[botOrder[1]].beamId, true);
            }
            else if(action == ACTION_INIT)
            {
                // Set GUIDs
                for(int i=0; i<=3; ++i)
                {
                    if(Creature * tron = me->FindNearestCreature(bots[i].npcEntry, 300.0f, true))
                        botGUID[i] = tron->GetGUID();
                    else
                    {// shouldn't happen
                        botGUID[i] = 0;
                        sLog->outFatal(LOG_FILTER_TSCR, "Omnotron D.S. : Tron %u is not spawned.", bots[i].npcEntry);
                    }
                }
                // Set GUIDs for hp share
                for(int i=0; i<=3; ++i)
                {
                    uint64 const * botguid = botGUID;
                    if(Creature * tron = me->FindNearestCreature(bots[i].npcEntry, 300.0f, true))
                    {
                        for(int j=0; j<=2; ++j, ++botguid)
                        {
                            if(*botguid == tron->GetGUID())
                                ++botguid;
                            CAST_AI(npc_omnotron_botAI, tron->AI())->guids[j] = *botguid;
                            tron->AI()->SetGUID(me->GetGUID(), TYPE_OMNOTRON_GUID);
                        }
                    }
                }

                InitBots();
                done = true;
            }
            else if(action == ACTION_DEATH)
            {
                Talk(SAY_DEATH);
                //EnterEvadeMode();
                events.Reset();
                _JustDied();
                me->DespawnOrUnsummon(5000);
                if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                    nefarian->AI()->DoAction(ACTION_DEATH);
            }
            else if(action == ACTION_EMPOWER)
            {
                canEmpower = false;
                events.ScheduleEvent(EVENT_EMPOWER_RESET, 35000);
            }
        }

        void EnterCombat(Unit* /*who*/)
        {
            events.ScheduleEvent(EVENT_BEAM_NEXT, 45000);
            events.ScheduleEvent(EVENT_ACTIVATE_NEXT, 90000);
            events.ScheduleEvent(EVENT_PLAYER_CHECK, 5000);
            Talk(SAY_AGGRO);
            _EnterCombat();
            if(Creature * nefarian = me->SummonCreature(NPC_NEFARIUS_OMNOTRON, -302.155975f, -349.211700f, 220.481094f, 4.7f))
            {
                nefarianGUID = nefarian->GetGUID();
                for(int i=0; i<4; ++i)
                {
                    if(Creature * creature = me->GetCreature(*me, botGUID[i]))
                        creature->AI()->SetGUID(nefarianGUID, TYPE_NEFARIAN_GUID);
                }
            }
        }

        void UpdateAI(uint32 diff)
        {
            if(!UpdateVictim())
                return;

            events.Update(diff);

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_BEAM_NEXT: // activates next npc
                    {
                        // TODO: rewrite this
                        uint8 tar = cnt2+1;
                        uint8 next = cnt2+2;

                        if(cnt2 == 3)
                        {
                            tar = 0;
                            next = 1;
                        }
                        else if(cnt2 == 2)
                            next = 0;

                        Unit * target = NULL;

                        // Shield old Bot
                        if(Creature * bot = me->GetCreature(*me, botGUID[botOrder[cnt2]]))
                        {
                            bot->CastSpell(bot, bots[botOrder[cnt2]].ShieldId, false);
                            Talk(bots[botOrder[cnt2]].shield);
                            bot->AI()->Talk(EMOTE_SHIELD);
                            target = bot->getVictim();
                        }

                        //Activate new
                        if(Creature * nextBot = me->GetCreature(*me, botGUID[botOrder[tar]]))
                        {
                            nextBot->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_31);
                            nextBot->SetReactState(REACT_AGGRESSIVE);
                            nextBot->RemoveAurasDueToSpell(SPELL_INACTIVE);
                            nextBot->RemoveAurasDueToSpell(SPELL_POWERED_DOWN);
                            nextBot->CastSpell(nextBot, SPELL_ENERGY_DRAIN, true);
                            nextBot->CastSpell(nextBot, SPELL_ACTIVATED, true);

                            if(target)
                                nextBot->AddThreat(target, 1.0f);

                            nextBot->AI()->DoZoneInCombat();
                        }

                        // Beam on next
                        if(Creature * nextBot = me->GetCreature(*me, botGUID[botOrder[next]]))
                            DoCast(nextBot, bots[botOrder[next]].beamId, true);

                        ++cnt2;
                        if(cnt2 >= 4)
                            cnt2 = 0;
                        events.ScheduleEvent(EVENT_BEAM_NEXT, 45000);
                        break;
                    }
                case EVENT_ACTIVATE_NEXT: // Disables old
                    if(Creature * bot = me->GetCreature(*me, botGUID[botOrder[curBot]]))
                    {
                        bot->SetReactState(REACT_PASSIVE);
                        bot->RemoveAurasDueToSpell(SPELL_ACTIVATED);
                        bot->CastSpell(bot, SPELL_SHUTTING_DOWN, false);
                        bot->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_UNK_31);
                        bot->AttackStop();
                        bot->AI()->DoAction(ACTION_DELAY);
                    }
                    ++curBot;
                    if(curBot >= 4)
                        curBot = 0;
                    events.ScheduleEvent(EVENT_ACTIVATE_NEXT, 45000);
                    break;
                case EVENT_PLAYER_CHECK:
                    if(!SelectTarget(SELECT_TARGET_RANDOM, 0, 100.0f, true))
                    {
                        for (int i=0; i<4; ++i)
                            if(Creature * bot = me->GetCreature(*me, botGUID[i]))
                                bot->AI()->EnterEvadeMode();
                        EnterEvadeMode();
                    }
                    events.ScheduleEvent(EVENT_PLAYER_CHECK, 5000);
                    break;
                case EVENT_EMPOWER_RESET:
                    canEmpower = true;
                    break;
                default:
                    break;
                }
            }
        }

    private:
        uint8 botOrder[4];
        uint64 botGUID[4];
        uint8 curBot;
        uint8 cnt2;
        bool done;
        bool canEmpower;
        uint64 nefarianGUID;
    };
public:
    boss_omnotron() : CreatureScript("boss_omnotron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new boss_omnotronAI(creature);
    }
};

// Individual AI for each bot

static const uint32 ARCANE_ANNIHILATOR_HELPER[4] = {79710, 91540, 91541, 91542};

class npc_arcanotron : public CreatureScript
{
    enum Spells
    {
        SPELL_POWER_GENERATOR           = 79626,
        SPELL_ARCANE_ANNIHILATOR        = 79710,
        SPELL_OVERCHARGED_GENERATOR     = 91857
    };

    enum Events
    {
        EVENT_GENERATOR                 = 1,
        EVENT_ANNIHILATOR,
    };

    struct npc_arcanotronAI : public npc_omnotron_botAI
    {
        npc_arcanotronAI(Creature * creature) : npc_omnotron_botAI(creature)
        {
            difficulty = GetDifficulty();
        }

        void EnterCombat(Unit * who)
        {
            events.ScheduleEvent(EVENT_GENERATOR, urand(5000, 8000));
            events.ScheduleEvent(EVENT_ANNIHILATOR, urand(8000, 10000));
            _EnterCombat(who);
        }

        void SpellHit(Unit * /*caster*/, const SpellInfo *spell)
        {
            Spell * curSpell = me->GetCurrentSpell(CURRENT_GENERIC_SPELL);
            if(curSpell && (curSpell->m_spellInfo->Id == ARCANE_ANNIHILATOR_HELPER[difficulty]))
                for (uint8 i = 0; i < 3; ++i)
                    if(spell->Effects[i].Effect == SPELL_EFFECT_INTERRUPT_CAST)
                        me->InterruptSpell(CURRENT_GENERIC_SPELL, false);
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
                case EVENT_GENERATOR:
                    {
                        Unit * target = NULL;
                        for(int i=0; i<=2; ++i)
                        {
                            if(Creature * creature = me->GetCreature(*me, guids[i]))
                            {
                                if(creature->HasAura(SPELL_INACTIVE))
                                    continue;
                                target = creature;
                                break;
                            }
                        }
                        if(!target)
                            target = me;
                        if(CanEmpower())
                            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                                nefarian->AI()->Talk(SAY_NEF_ARCANOTRON);
                        target->CastSpell(target, SPELL_POWER_GENERATOR, true);
                        events.ScheduleEvent(EVENT_GENERATOR, urand(30000, 35000));
                        break;
                    }
                case EVENT_ANNIHILATOR:
                    DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0), SPELL_ARCANE_ANNIHILATOR); 
                    events.ScheduleEvent(EVENT_ANNIHILATOR, urand(5000, 7000));
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    private:
        Difficulty difficulty;
    };
public:
    npc_arcanotron() : CreatureScript("npc_arcanotron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_arcanotronAI(creature);
    }
};

class npc_electron : public CreatureScript
{
    enum Spells
    {
        SPELL_LIGHTNING_CONDUCTOR           = 79888,
        SPELL_ELECTRICAL_DISCHARGE          = 79879,
        SPELL_SHADOW_INFUSION               = 92048
    };

    enum Events
    {
        EVENT_CONDUCTOR                     = 1,
        EVENT_DISCHARGE,
    };

    enum Misc
    {
        EMOTE_CONDUCTOR                     = 1
    };

    struct npc_electronAI : public npc_omnotron_botAI
    {
        npc_electronAI(Creature * creature) : npc_omnotron_botAI(creature) {}

        void EnterCombat(Unit * who)
        {
            events.ScheduleEvent(EVENT_CONDUCTOR, urand(5000, 8000));
            events.ScheduleEvent(EVENT_DISCHARGE, urand(8000, 10000));
            _EnterCombat(who);
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
                case EVENT_CONDUCTOR:
                    if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
                    {
                        DoCast(target, SPELL_LIGHTNING_CONDUCTOR);
                        if(CanEmpower())
                        {
                            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                            {
                                nefarian->AI()->Talk(SAY_NEF_ELECTRON);
                                nefarian->CastSpell(nefarian, SPELL_SHADOW_INFUSION, false);
                            }
                        }
                        Talk(EMOTE_CONDUCTOR, target->GetGUID());
                    }
                    events.ScheduleEvent(EVENT_CONDUCTOR, urand(12000, 15000));
                    break;
                case EVENT_DISCHARGE:
                    DoCast(SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true, -INTERACTION_DISTANCE), SPELL_ELECTRICAL_DISCHARGE); 
                    events.ScheduleEvent(EVENT_DISCHARGE, urand(5000, 7000));
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
public:
    npc_electron() : CreatureScript("npc_electron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_electronAI(creature);
    }
};

class npc_magmatron : public CreatureScript
{
    enum Spells
    {
        SPELL_INCINERATION                  = 79023,
        SPELL_ACQUIRING_TARGET              = 79501,
        SPELL_ENCASING_SHADOWS              = 92023,
    };

    enum Events
    {
        EVENT_INCINERATION      = 1,
        EVENT_ACQUIRING_TARGET,
        EVENT_TAUNT_UNAPPLY
    };

    enum Misc
    {
        EMOTE_FLAMETHROWER                  = 1
    };

    struct npc_magmatronAI : public npc_omnotron_botAI
    {
        npc_magmatronAI(Creature * creature) : npc_omnotron_botAI(creature) {}

        void Reset()
        {
            targetGUID = 0;
            me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, false);
            me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, false);
            _Reset();
        }

        void EnterCombat(Unit * who)
        {
            events.ScheduleEvent(EVENT_INCINERATION, urand(5000, 8000));
            events.ScheduleEvent(EVENT_ACQUIRING_TARGET, urand(8000, 10000));
            _EnterCombat(who);
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
                case EVENT_INCINERATION:
                    DoCast(SPELL_INCINERATION);
                    events.ScheduleEvent(EVENT_INCINERATION, urand(18000, 20000));
                    break;
                case EVENT_ACQUIRING_TARGET:
                    if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
                    {
                        targetGUID = target->GetGUID();
                        me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, true);
                        me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, true);
                        me->AddThreat(target, 50000000.0f);
                        DoCast(target, SPELL_ACQUIRING_TARGET);
                        if(CanEmpower())
                        {
                            if(Creature * nefarian = me->GetCreature(*me, nefarianGUID))
                            {
                                nefarian->AI()->Talk(SAY_NEF_MAGMATRON);
                                target->AddAura(SPELL_ENCASING_SHADOWS, target);
                                //nefarian->CastSpell(nefarian, SPELL_ENCASING_SHADOWS, false);
                            }
                        }
                        Talk(EMOTE_FLAMETHROWER, targetGUID);
                        OmnotronTalk(SAY_MAGMATRON_FLAMETHROWER);
                    }
                    events.ScheduleEvent(EVENT_ACQUIRING_TARGET, urand(15000, 18000));
                    events.ScheduleEvent(EVENT_TAUNT_UNAPPLY, 8000);
                    break;
                case EVENT_TAUNT_UNAPPLY:
                    if(Player * target = me->GetPlayer(*me, targetGUID))
                        me->AddThreat(target, -50000000.0f);
                    me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_TAUNT, false);
                    me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_ATTACK_ME, false);
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    private:
        uint64 targetGUID;
    };
public:
    npc_magmatron() : CreatureScript("npc_magmatron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_magmatronAI(creature);
    }
};

class npc_toxitron : public CreatureScript
{
    enum Spells
    {
        SPELL_CHEMICAL_BOMB         = 80157,
        SPELL_POISON_PROTOCOL       = 80053,
        SPELL_FIXATE                = 80094,
    };

    enum Events
    {
        EVENT_CHEMICAL_BOMB         = 1,
        EVENT_POISON_PROTOCOL,
    };

    struct npc_toxitronAI : public npc_omnotron_botAI
    {
        npc_toxitronAI(Creature * creature) : npc_omnotron_botAI(creature) {}

        void EnterCombat(Unit * who)
        {
            events.ScheduleEvent(EVENT_CHEMICAL_BOMB, urand(5000, 8000));
            events.ScheduleEvent(EVENT_POISON_PROTOCOL, urand(10000, 15000));
            _EnterCombat(who);
        }

        void JustSummoned(Creature * summon)
        {
            if(summon->GetEntry() == NPC_POISON_BOMB)
            {
                if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 1, 0.0f, true, -SPELL_FIXATE))
                {
                    summon->CastSpell(target, SPELL_FIXATE, true);
                    summon->ClearUnitState(UNIT_STATE_CASTING);
                    summon->AddThreat(target, 5000000.0f);
                    summon->AI()->AttackStart(target);
                }
            }
            _JustSummoned(summon);
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
                case EVENT_CHEMICAL_BOMB:
                    if(Unit * target = SelectTarget(SELECT_TARGET_RANDOM, 0, -INTERACTION_DISTANCE, true))
                    {
                        DoCast(target, SPELL_CHEMICAL_BOMB, true);
                        if(CanEmpower())
                        {
                            if(Creature * nefarian = me->FindNearestCreature(NPC_NEFARIUS_OMNOTRON, 500.0f))
                            {
                                nefarian->AI()->Talk(SAY_NEF_TOXITRON);
                                nefarian->NearTeleportTo(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f);
                                nefarian->AI()->DoAction(ACTION_GRIP);
                            }
                        }
                    }
                    events.ScheduleEvent(EVENT_CHEMICAL_BOMB, urand(20000, 23000));
                    break;
                case EVENT_POISON_PROTOCOL:
                    DoCast(SPELL_POISON_PROTOCOL);
                    events.ScheduleEvent(EVENT_POISON_PROTOCOL, urand(18000, 20000));
                    break;
                default:
                    break;
                }
            }

            DoMeleeAttackIfReady();
        }
    };
public:
    npc_toxitron() : CreatureScript("npc_toxitron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_toxitronAI(creature);
    }
};

class spell_magmatron_barrier : public SpellScriptLoader
{
    enum
    {
        SPELL_BACKDRAFT         = 79617
    };

    class spell_magmatron_barrier_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_magmatron_barrier_AuraScript);

        void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit * caster = GetCaster();
            if(!caster)
                return;

            if(GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_ENEMY_SPELL)
                caster->CastSpell(caster, SPELL_BACKDRAFT, true);
        }

        void Register()
        {
            OnEffectRemove += AuraEffectRemoveFn(spell_magmatron_barrier_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB, AURA_EFFECT_HANDLE_REAL);
        }
    };
public:
    spell_magmatron_barrier() : SpellScriptLoader("spell_magmatron_barrier") { }

    AuraScript* GetAuraScript() const
    {
        return new spell_magmatron_barrier_AuraScript();
    }
};

class npc_victor_nefarius_omnotron : public CreatureScript
{
    enum
    {
        EVENT_DEATH         = 1,
        EVENT_INTRO,
        EVENT_RESET,
        EVENT_GRIP,
        SPELL_GRIP_OF_DEATH         = 91849
    };

    struct npc_victor_nefarius_omnotronAI : public ScriptedAI
    {
        npc_victor_nefarius_omnotronAI(Creature * creature) : ScriptedAI(creature)
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetReactState(REACT_PASSIVE);
        }

        void Reset()
        {
            events.Reset();
            events.ScheduleEvent(EVENT_INTRO, 2000);
        }

        void DoAction(int32 action)
        {
            if(action == ACTION_DEATH)
                events.ScheduleEvent(EVENT_DEATH, 5000);
            else if (action == ACTION_GRIP)
                events.ScheduleEvent(EVENT_GRIP, 1500);
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_INTRO:
                    Talk(SAY_NEF_AGGRO);
                    break;
                case EVENT_DEATH:
                    Talk(SAY_NEF_DEATH);
                    me->DespawnOrUnsummon(5000);
                    break;
                case EVENT_RESET:
                    me->NearTeleportTo(me->GetHomePosition());
                    break;
                case EVENT_GRIP:
                    if(Player * player = me->FindNearestPlayer(100.0f))
                        DoCast(player, SPELL_GRIP_OF_DEATH);
                    events.ScheduleEvent(EVENT_RESET, 6000);
                    break;
                }
            }
        }

    private:
        EventMap events;
    };

public:
    npc_victor_nefarius_omnotron() : CreatureScript("npc_victor_nefarius_omnotron") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_victor_nefarius_omnotronAI(creature);
    }
};

class npc_power_generator : public CreatureScript
{
    enum
    {
        SPELL_GROW_STACKER          = 91861,
        SPELL_ARCANE_BLOWBACK       = 91879,
        SPELL_OVERCHARGED_GENERATOR = 91857
    };

    struct npc_power_generatorAI : public ScriptedAI
    {
        npc_power_generatorAI(Creature * creature) : ScriptedAI(creature)
        {
            if(IsHeroic())
            {
                me->RemoveAllAuras();
                DoCast(me, SPELL_OVERCHARGED_GENERATOR, true);
            }
        }

        void Reset()
        {
            growing = false;
            actionTimer = 20000;
        }

        void DoAction(int32 /*action*/)
        {
        }

        void UpdateAI(uint32 diff)
        {
            if(!IsHeroic())
                return;

            if(actionTimer <= diff)
            {
                if(!growing)
                {
                    growing = true;
                    DoCast(SPELL_GROW_STACKER);
                    actionTimer = 4500;
                }else
                {
                    DoCast(SPELL_ARCANE_BLOWBACK);
                    me->DespawnOrUnsummon(1000);
                    actionTimer = 2000;
                }
            }else actionTimer -= diff;

        }

    private:
        bool growing;
        uint32 actionTimer;
    };

public:
    npc_power_generator() : CreatureScript("npc_power_generator") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_power_generatorAI(creature);
    }
};

//class spell_power_generator_periodic : public SpellScriptLoader
//{
//public:
//   spell_power_generator_periodic() : SpellScriptLoader("spell_power_generator_periodic") { }
//
//   class spell_power_generator_periodic_AuraScript : public AuraScript
//   {
//       PrepareAuraScript(spell_power_generator_periodic_AuraScript);
//
//       void HandleTriggerSpell(AuraEffect const* aurEff)
//       {
//           PreventDefaultAction();
//
//           if (Unit* caster = GetCaster())
//           {
//               uint32 triggerSpell = GetSpellInfo()->EffectTriggerSpell[EFFECT_0];
//               int32 radius = int32((caster->GetFloatValue(OBJECT_FIELD_SCALE_X) + 0.1f) * 10000);
//               CustomSpellValues values;
//               values.AddSpellMod(SPELLVALUE_RADIUS_MOD, radius);
//               caster->CastCustomSpell(triggerSpell, values, caster, true);
//           }
//       }
//
//       void Register()
//       {
//           OnEffectPeriodic += AuraEffectPeriodicFn(spell_power_generator_periodic_AuraScript::HandleTriggerSpell, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
//       }
//   };
//
//   AuraScript* GetAuraScript() const
//   {
//       return new spell_power_generator_periodic_AuraScript();
//   }
//};

class spell_power_generator_periodic : public SpellScriptLoader
{
    enum
    {
        SPELL_GROW          = 91860
    };

    class spell_power_generator_periodic_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_power_generator_periodic_SpellScript);

        void FilterTargets(std::list<WorldObject*>& SummonList)
        {
            Unit * caster = GetCaster();
            if(!caster || SummonList.empty())
                return;

            uint32 stackAmount = 0;
            if(Aura * aur = caster->GetAura(SPELL_GROW))
                stackAmount = aur->GetStackAmount();

            for(std::list<WorldObject*>::iterator itr = SummonList.begin(); itr != SummonList.end();)
            {
                if(!(*itr)->IsWithinDist(caster, INTERACTION_DISTANCE + 3.0f * stackAmount))
                    itr = SummonList.erase(itr);
                else
                    ++itr;
            }
        }

        void Register()
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_power_generator_periodic_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENTRY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_power_generator_periodic_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENTRY);
        }
    };

public:
    spell_power_generator_periodic() : SpellScriptLoader("spell_power_generator_periodic") { }

    SpellScript * GetSpellScript() const
    {
        return new spell_power_generator_periodic_SpellScript();
    }
};

class spell_shadow_conductor : public SpellScriptLoader
{
    enum
    {
        SPELL_ID_10M        = 92051
    };

    class spell_shadow_conductor_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_shadow_conductor_SpellScript);

        void HandleEffect(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if(!caster || !target)
                return;

            float damage = GetSpellInfo()->Id == SPELL_ID_10M ? 15000.0f : 20000.0f;
            float dist = caster->GetDistance(target);
            SetHitDamage(int32(damage * std::max(dist / 2.0f, 1.0f)));
        }

        void Register()
        {
            OnEffectHitTarget += SpellEffectFn(spell_shadow_conductor_SpellScript::HandleEffect, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };
public:
    spell_shadow_conductor() : SpellScriptLoader("spell_shadow_conductor") { }

    SpellScript* GetSpellScript() const
    {
        return new spell_shadow_conductor_SpellScript();
    }
};

void AddSC_boss_omnotron_defense_system()
{
    new boss_omnotron();
    new npc_arcanotron();
    new npc_electron();
    new npc_magmatron();
    new npc_toxitron();
    new spell_magmatron_barrier();
    new npc_victor_nefarius_omnotron();
    new npc_power_generator();
    new spell_power_generator_periodic();
    new spell_shadow_conductor();
}
