#include "blackwing_descent.h"
#include "Object.h"
#include "InstanceScript.h"
#include "ScriptMgr.h"

#define ENCOUNTERS     4

static const Position NefarianPos = {143.501663f, -241.307678f, 74.920464f, 2.260429f};
static const Position AtramedesPos = {386.093842f, -314.483643f, 137.624100f, 0.0f};

class instance_blackwing_descent : public InstanceMapScript
{
    public:
        instance_blackwing_descent() : InstanceMapScript("instance_blackwing_descent", 669) { }

        struct instance_blackwing_descent_InstanceMapScript : public InstanceScript
        {
            instance_blackwing_descent_InstanceMapScript(InstanceMap* map) : InstanceScript(map)
            {
                SetBossNumber(ENCOUNTERS);
                drakonidCnt = 0;
                dwarvesCnt = 0;
                magmawGUID = 0;
                bellGUID = 0;
                atramedesGUID = 0;
            }

            void OnGameObjectCreate(GameObject * go)
            {
                if(go->GetEntry() == GO_ANCIENT_BELL)
                {
                    bellGUID = go->GetGUID();
                    if(dwarvesCnt < 7)
                        go->SetFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
                }
            }

            void OnCreatureCreate(Creature* creature)
            {
                switch(creature->GetEntry())
                {
                case NPC_DRAKONID_DRUDGE:
                    if(Creature * magmaw = this->instance->GetCreature(magmawGUID))
                    {
                        if(drakonidCnt < 2)
                        {
                            magmaw->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                            magmaw->SetReactState(REACT_PASSIVE);
                            if(creature->isDead())
                                SetData(DATA_DRAKONID, 1);
                        }
                    }
                    break;
                case NPC_MAGMAW:
                    magmawGUID = creature->GetGUID();
                    break;
                case NPC_ATRAMEDES:
                    atramedesGUID = creature->GetGUID();
                    break;
                default:
                    break;
                }
            }

            void OnCreatureDeath(Creature * creature)
            {
                if(creature->GetEntry() == NPC_SPIRIT_OF_THAURISSIAN)
                {
                    ++dwarvesCnt;
                    if(dwarvesCnt == 7)
                    {
                        instance->SummonCreature(NPC_INTRO_NEFARIAN, NefarianPos);
                        SaveToDB();
                    }
                }
            }

            void SetData(uint32 type, uint32 /*data*/)
            {
                switch(type)
                {
                case DATA_DRAKONID:
                    ++drakonidCnt;
                    if(drakonidCnt >= 2)
                    {
                        if(Creature * magmaw = this->instance->GetCreature(magmawGUID))
                        {
                            magmaw->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
                            magmaw->SetReactState(REACT_AGGRESSIVE);
                        }
                    }
                    break;
                case DATA_ATRAMEDES_INTRO:
                    if(GameObject * go = instance->GetGameObject(bellGUID))
                        go->RemoveFlag(GAMEOBJECT_FLAGS, GO_FLAG_IN_USE);
                    break;
                case DATA_ATRAMEDES_SUMMON:
                    if(!atramedesGUID && GetBossState(DATA_ATRAMEDES) != DONE)
                        instance->SummonCreature(NPC_ATRAMEDES, AtramedesPos);
                    break;
                default:
                    break;
                }
            }

            bool SetBossState(uint32 type, EncounterState state)
            {
                if (!InstanceScript::SetBossState(type, state))
                    return false;

                 return true;
            }

            std::string GetSaveData()
            {
                OUT_SAVE_INST_DATA;

                std::ostringstream saveStream;
                saveStream << "B D " << GetBossSaveData() << drakonidCnt << " " << dwarvesCnt;

                OUT_SAVE_INST_DATA_COMPLETE;
                return saveStream.str();
            }

            void Load(char const* str)
            {
                if (!str)
                {
                    OUT_LOAD_INST_DATA_FAIL;
                    return;
                }

                OUT_LOAD_INST_DATA(str);

                char dataHead1, dataHead2;

                std::istringstream loadStream(str);
                loadStream >> dataHead1 >> dataHead2;

                if (dataHead1 == 'B' && dataHead2 == 'D')
                {
                    for (uint8 i = 0; i < ENCOUNTERS; ++i)
                    {
                        uint32 tmpState;
                        loadStream >> tmpState;
                        if (tmpState == IN_PROGRESS || tmpState > SPECIAL)
                            tmpState = NOT_STARTED;
                        SetBossState(i, EncounterState(tmpState));
                    }
                    loadStream >> drakonidCnt >> dwarvesCnt;
                } else OUT_LOAD_INST_DATA_FAIL;

                OUT_LOAD_INST_DATA_COMPLETE;
            }
        private:
            uint32 drakonidCnt;
            uint32 dwarvesCnt;
            uint64 magmawGUID;
            uint64 bellGUID;
            uint64 atramedesGUID;
        };

        InstanceScript* GetInstanceScript(InstanceMap* map) const
        {
            return new instance_blackwing_descent_InstanceMapScript(map);
        }
};

void AddSC_instance_blackwing_descent()
{
    new instance_blackwing_descent();
}
