#include"ScriptMgr.h"
#include "Vehicle.h"
#include "Player.h"

// Escape Velocity
class npc_captured_goblin : public CreatureScript
{
    enum
    {
        SPELL_ON_INTERACT               = 73947,
        SPELL_ROCKETS                   = 73948,
        SAY_ROCKET                      = 1,
    };

    struct npc_captured_goblinAI : public ScriptedAI
    {
        npc_captured_goblinAI(Creature * c) : ScriptedAI(c) {}

        void Reset()
        {
            cooldown = 60000;
        }

        void SpellHit(Unit * caster, const SpellInfo * spell)
        {
            if(spell->Id == SPELL_ON_INTERACT && !me->HasAura(SPELL_ROCKETS))
            {
                hasaura = true;
                cooldown = 60000;
                DoCast(SPELL_ROCKETS);
                Talk(SAY_ROCKET, caster->GetGUID());
                if(Player* player = caster->ToPlayer())
                    player->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
            }
        }

        void UpdateAI(uint32 diff)
        {
            if(hasaura)
            {
                if(cooldown <= diff)
                {
                    me->RemoveAurasDueToSpell(SPELL_ROCKETS);
                    hasaura = false;
                }else cooldown -= diff;
            }
        }

    private:
        bool hasaura;
        uint32 cooldown;
    };

public:
    npc_captured_goblin() : CreatureScript("npc_captured_goblin") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_captured_goblinAI(creature);
    }
};

// Goblin Escape Pods
class go_goblin_escape_pod : public GameObjectScript
{
    enum
    {
        SPELL_PRINCE_CONTROLLER_AURA        = 67433,
        SPELL_SUMMON_PRINCE                 = 67845,
        SPELL_SUMMON_SURVIVOR               = 66137,
    };

    bool OnGossipHello(Player* player, GameObject* pGO)
    {
        if(player->HasAura(SPELL_PRINCE_CONTROLLER_AURA))
            player->CastSpell(pGO->GetPositionX(), pGO->GetPositionY(), pGO->GetPositionZ(), SPELL_SUMMON_PRINCE, true);
        else
            player->CastSpell(pGO->GetPositionX(), pGO->GetPositionY(), pGO->GetPositionZ(), SPELL_SUMMON_SURVIVOR, true);

        pGO->SetRespawnTime(30);
        pGO->SetLootState(GO_JUST_DEACTIVATED);

        return false;
    }

public:
    go_goblin_escape_pod() : GameObjectScript("go_goblin_escape_pod") { }
};

// Irresistible Pool Pony
class npc_naga_hatchling : public CreatureScript
{
    enum
    {
        NPC_HATCHLING_1         = 44588,
        NPC_CREDIT              = 38413,
        SPELL_ROOT_AURA         = 71917,
        SPELL_PONY_AURA         = 71914,
    };

    struct npc_naga_hatchlingAI : public ScriptedAI
    {
        npc_naga_hatchlingAI(Creature * c) : ScriptedAI(c) {}

        void Reset()
        {
            done = false;
        }

        void SpellClick(Player* who)
        {
            if(done || !who->HasAura(SPELL_PONY_AURA))
                return;

            done = true;
            uint32 creatureIDs[5] = {44580, 44579, 44578, 38412, 38457};
            std::list<Creature*> cList;

            for(int i=0; i<=4; ++i)
            {
                std::list<Creature*> subList;
                me->GetCreatureListWithEntryInGrid(cList, creatureIDs[i], 20.0f);
                if(!cList.empty())
                    cList.merge(subList);
            }

            if(cList.empty())
                return;
            for(std::list<Creature*>::const_iterator itr = cList.begin(); itr != cList.end(); ++itr)
            {
                if(Creature * summon = who->SummonCreature(NPC_HATCHLING_1 + urand(0,3), who->GetPositionX(), who->GetPositionY(), who->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 120000))
                {
                    summon->GetMotionMaster()->MoveFollow(who, PET_FOLLOW_DIST, (float)rand_norm()*static_cast<float>(M_PI));
                    summon->CastSpell(summon, SPELL_ROOT_AURA, true);
                }
                who->KilledMonsterCredit(NPC_CREDIT);
                (*itr)->DespawnOrUnsummon(500);
            }
        }

        void UpdateAI(uint32 /*diff*/)
        {
        }

    private:
        bool done;
    };

public:
    npc_naga_hatchling() : CreatureScript("npc_naga_hatchling") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_naga_hatchlingAI(creature);
    }
};

// Cluster Cluck

class npc_wild_clucker : public CreatureScript
{
    enum
    {
        SPELL_FIREWORKS                     = 71170,
        SPELL_FIREWORKS_VISUAL              = 74177,
        NPC_WILD_CLUCKER_CREDIT             = 38117
    };

    struct npc_wild_cluckerAI : public ScriptedAI
    {
        npc_wild_cluckerAI(Creature * c) : ScriptedAI(c) {}

        void Reset()
        {
            done = false;
            liftoffTimer = 2000;
            z = me->GetPositionZ();
            itr = 0;
        }

        void SpellHit(Unit * caster, const SpellInfo * spell)
        {
            if(spell->Id == SPELL_FIREWORKS)
            {
                DoCast(me, SPELL_FIREWORKS_VISUAL, true);
                StartEvent(caster->ToPlayer());
            }
        }

        void StartEvent(Player * caster)
        {
            if(!done)
            {
                done = true;
                me->GetMotionMaster()->Clear();
                me->GetMotionMaster()->MoveIdle();
                z = me->GetPositionZ();
                caster->KilledMonsterCredit(NPC_WILD_CLUCKER_CREDIT);
            }
        }

        void SpellClick(Player* who)
        {
            StartEvent(who);
        }

        void UpdateAI(uint32 diff)
        {
            if(done)
            {
                if(liftoffTimer <= diff)
                {
                    if(itr <= 10) // Go woopwoop for 5 seconds
                    {
                        ++itr;
                        float tar_z = z + urand(5, 20);
                        Position pos;
                        me->GetRandomNearPosition(pos, 15.0f);
                        me->GetMotionMaster()->UpdateMotion(10000); // hack
                        me->GetMotionMaster()->MoveJump(pos.GetPositionX(), pos.GetPositionY(), tar_z, 20.0f, 5.0f);
                        liftoffTimer = 250;
                    }
                    else
                    {
                        me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ() + 200.0f, 15.0f, 5.0f);
                        me->DespawnOrUnsummon(20000);
                        done = false;
                    }
                }liftoffTimer -= diff;
            }
        }

    private:
        bool done;
        uint32 liftoffTimer;
        int itr;
        float z;
    };

public:
    npc_wild_clucker() : CreatureScript("npc_wild_clucker") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_wild_cluckerAI(creature);
    }
};

// Final  Confrontation
class npc_final_confrontation_gallywix : public CreatureScript
{
    enum
    {
        SAY_DOWNSIZING          = 0,
        SAY_REVENUE_STREAM      = 1,
        SAY_TOXIC_ASSETS        = 2,
        SAY_FIRED               = 3,
        SAY_VICTORY_1           = 4,
        SAY_VICTORY_2           = 5,
        SAY_VICTORY_3           = 6,
        SAY_VICTORY_4           = 7,
        SAY_AGGRO               = 8,

        SPELL_DOWNSIZING        = 74003,
        SPELL_REVENUE_STREAM    = 74005,
        SPELL_TOXIC_ASSETS      = 74000,
        SPELL_FIRED             = 74004,
        SPELL_CALL_A_MEETING    = 81000,

        EVENT_DOWNSIZING        = 1,
        EVENT_REVENUE_STREAM    = 2,
        EVENT_TOXIC_ASSETS      = 3,
        EVENT_FIRED             = 4,
        EVENT_CALL_A_MEETING    = 5,
        EVENT_OUTRO             = 6,

        NPC_THRALL              = 39594,
        NPC_FOOTBOMB_UNIFORM    = 39598,
    };

    struct npc_final_confrontation_gallywixAI : public ScriptedAI
    {
        npc_final_confrontation_gallywixAI(Creature * c) : ScriptedAI(c)
        {
            me->SetCorpseDelay(5);
        }

        void Reset()
        {
            events.Reset();
            outroStep = 0;
            fakeDamageTimer = 2000;
            playerInCombat = false;
            me->SetReactState(REACT_AGGRESSIVE);
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        }

        void AwardPlayers()
        {
            std::list<Creature*> cList;
            me->GetCreatureListWithEntryInGrid(cList, NPC_FOOTBOMB_UNIFORM, 30.0f);
            for(std::list<Creature*>::const_iterator itr = cList.begin(); itr != cList.end(); ++itr)
                if(Vehicle* veh = (*itr)->GetVehicleKit())
                    if(Unit* passenger = veh->GetPassenger(0))
                        if(Player * player = passenger->ToPlayer())
                            player->KilledMonsterCredit(me->GetEntry());
        }

        void DamageTaken(Unit * done_by, uint32 &damage)
        {
            if(!playerInCombat && done_by->IsVehicle())
            {
                playerInCombat = true;

                Talk(SAY_AGGRO);
                events.ScheduleEvent(EVENT_DOWNSIZING, 5000);
                events.ScheduleEvent(EVENT_REVENUE_STREAM, 10000);
                events.ScheduleEvent(EVENT_TOXIC_ASSETS, 15000);
                events.ScheduleEvent(EVENT_FIRED, 20000);
                events.ScheduleEvent(EVENT_FIRED, urand(20000, 25000));
            }
            else
            {
                if(outroStep)
                    damage = 0;
                else if(damage >= me->GetHealth())
                {
                    AwardPlayers();
                    outroStep = 1;
                    damage = 0;
                    events.Reset();
                    me->SetReactState(REACT_PASSIVE);
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                    me->RemoveAllAuras();
                    me->DeleteThreatList();
                    me->CombatStop(true);
                    Talk(SAY_VICTORY_1);
                    events.ScheduleEvent(EVENT_OUTRO, 6000);
                }
            }
        }

        void UpdateAI(uint32 diff)
        {
            if(!UpdateVictim() && !outroStep)
                return;

            events.Update(diff);

            if(uint32 eventId = events.ExecuteEvent())
            {
                switch(eventId)
                {
                case EVENT_DOWNSIZING:
                    Talk(SAY_DOWNSIZING);
                    DoCastVictim(SPELL_DOWNSIZING);
                    events.ScheduleEvent(EVENT_DOWNSIZING, urand(20000, 30000));
                    break;
                case EVENT_REVENUE_STREAM:
                    Talk(SAY_REVENUE_STREAM);
                    DoCastVictim(SPELL_REVENUE_STREAM);
                    events.ScheduleEvent(EVENT_REVENUE_STREAM, urand(20000, 35000));
                    break;
                case EVENT_TOXIC_ASSETS:
                    Talk(SAY_TOXIC_ASSETS);
                    DoCastVictim(SPELL_TOXIC_ASSETS);
                    events.ScheduleEvent(EVENT_TOXIC_ASSETS, urand(20000, 35000));
                    break;
                case EVENT_FIRED:
                    Talk(SAY_FIRED);
                    DoCast(SPELL_FIRED);
                    events.ScheduleEvent(EVENT_FIRED, urand(20000, 35000));
                    break;
                case EVENT_CALL_A_MEETING:
                    DoCast(SPELL_CALL_A_MEETING);
                    events.ScheduleEvent(EVENT_FIRED, urand(20000, 25000));
                    break;
                case EVENT_OUTRO:
                    {
                        uint32 delay = 0;
                        switch(outroStep)
                        {
                        case 1:
                            Talk(SAY_VICTORY_2);
                            delay = 11;
                            break;
                        case 2:
                            Talk(SAY_VICTORY_3);
                            delay = 3;
                            break;
                        case 3:
                            if(Creature * thrall = me->FindNearestCreature(NPC_THRALL, 15.0f))
                                thrall->AI()->Talk(0);
                            delay = 3;
                            break;
                        case 4:
                            if(Creature * thrall = me->FindNearestCreature(NPC_THRALL, 15.0f))
                                thrall->AI()->Talk(1);
                            delay = 6;
                            break;
                        case 5:
                            if(Creature * thrall = me->FindNearestCreature(NPC_THRALL, 15.0f))
                                thrall->AI()->Talk(2);
                            delay = 11;
                            break;
                        case 6:
                            if(Creature * thrall = me->FindNearestCreature(NPC_THRALL, 15.0f))
                                thrall->AI()->Talk(3);
                            delay = 6;
                            break;
                        case 7:
                            Talk(SAY_VICTORY_4);
                            delay = 10;
                            break;
                        case 8:
                            if(Creature * thrall = me->FindNearestCreature(NPC_THRALL, 15.0f))
                                thrall->DisappearAndDie();
                            me->DisappearAndDie();
                            return;
                        }
                        delay *= IN_MILLISECONDS;
                        outroStep++;
                        events.ScheduleEvent(EVENT_OUTRO, delay);
                    }
                    break;
                }
            }

            // Fake Damage
            if(Unit * victim = me->getVictim())
            {
                if(victim->GetEntry() == NPC_THRALL && victim->HealthBelowPct(95))
                {
                    if(fakeDamageTimer <= diff)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                        victim->HandleEmoteCommand(urand(0,1) ? EMOTE_ONESHOT_DODGE : EMOTE_ONESHOT_WOUND);

                        fakeDamageTimer = 2000;
                    }else fakeDamageTimer -= diff;
                }
                else
                    DoMeleeAttackIfReady();
            }
        }

    private:
        EventMap events;
        int outroStep;
        uint32 fakeDamageTimer;
        bool playerInCombat;
    };

public:
    npc_final_confrontation_gallywix() : CreatureScript("npc_final_confrontation_gallywix") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_final_confrontation_gallywixAI(creature);
    }
};

class npc_final_confrontation_thrall : public CreatureScript
{
    enum
    {
        NPC_GALLYWIX                = 39582
    };

    struct npc_final_confrontation_thrallAI : public ScriptedAI
    {
        npc_final_confrontation_thrallAI(Creature * c) : ScriptedAI(c)
        {
            me->SetCorpseDelay(5);
        }

        void Reset()
        {
            fakeDamageTimer = 2000;
        }

        void UpdateAI(uint32 diff)
        {
            if(!UpdateVictim())
                return;

            // Fake Damage
            if(Unit * victim = me->getVictim())
            {
                if(victim->GetEntry() == NPC_GALLYWIX && victim->HealthBelowPct(95))
                {
                    if(fakeDamageTimer <= diff)
                    {
                        me->HandleEmoteCommand(EMOTE_ONESHOT_ATTACK1H);
                        victim->HandleEmoteCommand(urand(0,1) ? EMOTE_ONESHOT_DODGE : EMOTE_ONESHOT_WOUND);

                        fakeDamageTimer = 2000;
                    }else fakeDamageTimer -= diff;
                }
                else
                    DoMeleeAttackIfReady();
            }
        }

    private:
        uint32 fakeDamageTimer;
    };

public:
    npc_final_confrontation_thrall() : CreatureScript("npc_final_confrontation_thrall") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_final_confrontation_thrallAI(creature);
    }
};

// Up, Up and Away!

class go_rocket_sling : public GameObjectScript
{
    enum
    {
        SPELL_ROCKET_FORCECAST          = 68806,
    };

    bool OnGossipSelect(Player* player, GameObject* pGO, uint32 /*sender*/, uint32 /*action*/)
    {
        pGO->CastSpell(player, SPELL_ROCKET_FORCECAST);
        return true;
    }
public:
    go_rocket_sling() : GameObjectScript("go_rocket_sling") { }
};

class npc_rocket_sling : public CreatureScript
{
    enum
    {
        PATH_ROCKET                     = 3650501,
        SPELL_CREDIT                    = 68813,
        SPELL_ROCKET_BLAST              = 66110,
    };

    struct npc_rocket_slingAI : public ScriptedAI
    {
        npc_rocket_slingAI(Creature * c) : ScriptedAI(c)
        {
        }

        void Reset()
        {
            DoCast(SPELL_ROCKET_BLAST);
            //explodeTimer = 10000; // movement delay in sniff
        }

        void MovementInform(uint32 type, uint32 /*id*/)
        {
            if(type == POINT_MOTION_TYPE)
            {
                if(Vehicle * veh = me->GetVehicleKit())
                    if(Unit * passenger = veh->GetPassenger(0))
                        passenger->CastSpell(passenger, SPELL_CREDIT, true);
                me->DespawnOrUnsummon(250);
            }
        }

         void PassengerBoarded(Unit* /*who*/, int8 /*seatId*/, bool apply)
         {
             //const WaypointPath * wp = sWaypointMgr->GetPath(PATH_ROCKET);
             if(apply)
                me->GetMotionMaster()->MoveJump(945.2621f, 2396.825f, 4.585697f, 25.0f, 25.0f);
             //me->SendMonsterMovePath(wp, 11742, SPLINEFLAG_PATH_SMOOTHING | SPLINEFLAG_FLYING);//SPLINEFLAG_FLYING | /*SPLINEFLAG_CATMULL_ROM | */SPLINEFLAG_PATH_SMOOTHING);
         }

        void UpdateAI(uint32 /*diff*/)
        {
            //if(explodeTimer <= diff)
            //{
            //    //me->Relocate(945.2621f, 2396.825f, 4.585697f);
            //    if(Vehicle * veh = me->GetVehicleKit())
            //        if(Unit * passenger = veh->GetPassenger(0))
            //            passenger->CastSpell(passenger, SPELL_CREDIT, true);
            //}else explodeTimer -= diff;
        }

    private:
        //uint32 explodeTimer;
    };

public:
    npc_rocket_sling() : CreatureScript("npc_rocket_sling") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_rocket_slingAI(creature);
    }
};

// Precious Cargo

class npc_gyrochoppa : public CreatureScript
{
    enum
    {
        SPELL_CREDIT                    = 68813,
    };

    struct npc_gyrochoppaAI : public ScriptedAI
    {
        npc_gyrochoppaAI(Creature * c) : ScriptedAI(c)
        {
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if(type == WAYPOINT_MOTION_TYPE && id == 5)
            {
                if(Vehicle * veh = me->GetVehicleKit())
                    if(Unit * passenger = veh->GetPassenger(0))
                        passenger->CastSpell(passenger, SPELL_CREDIT, true);
                me->DespawnOrUnsummon(250);
            }
        }
    };

public:
    npc_gyrochoppa() : CreatureScript("npc_gyrochoppa") {}

    CreatureAI * GetAI(Creature * creature) const
    {
        return new npc_gyrochoppaAI(creature);
    }
};

class veh_gyrochoppa : public VehicleScript
{
public:
    veh_gyrochoppa() : VehicleScript("npc_gyrochoppa") { }

    void OnAddPassenger(Vehicle* veh, Unit* passenger, int8 /*seatId*/)
    {
        if(Unit * unit = veh->GetBase())
        {
            unit->RemoveCharmedBy(passenger); // probably there is some new flag
            unit->AddUnitMovementFlag(MOVEMENTFLAG_DISABLE_GRAVITY | MOVEMENTFLAG_FLYING);
            unit->SetSpeed(MOVE_FLIGHT, 4.0f, true);
            unit->GetMotionMaster()->Clear();
            unit->GetMotionMaster()->MovePath(3614301, false);
        }
    }
};

void AddSC_lost_isles()
{
    new npc_captured_goblin();
    new go_goblin_escape_pod();
    new npc_naga_hatchling();
    new npc_wild_clucker();
    new npc_final_confrontation_gallywix();
    new npc_final_confrontation_thrall();
    new npc_gyrochoppa();
    new veh_gyrochoppa();
    new go_rocket_sling();
    new npc_rocket_sling();
}