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
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

/* ScriptData
SDName: Instance_Shadowfang_Keep
SD%Complete: 0%
SDComment:
SDCategory: Shadowfang Keep
EndScriptData */

#include "ScriptPCH.h"
#include "shadowfang_keep.h"

#define ENCOUNTERS 5

class instance_shadowfang_keep : public InstanceMapScript
{
public:
    instance_shadowfang_keep() : InstanceMapScript("instance_shadowfang_keep", 33) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const
    {
        return new instance_shadowfang_keep_InstanceMapScript(map);
    }

    struct instance_shadowfang_keep_InstanceMapScript: public InstanceScript
    {
        instance_shadowfang_keep_InstanceMapScript(InstanceMap* map): InstanceScript(map) { }

        uint32 uiEncounter[ENCOUNTERS];

        uint64 uiBaronAshbury;
        uint64 uiBaronSilverlaine;
        uint64 uiCommanderSpringvale;
        uint64 uiLordGodfrey;
        uint64 uiLordWalden;

        uint64 doorBaronAshbury;
        uint64 doorGodfrey;

        void Initialize()
        {
            uiBaronAshbury = 0;
            uiBaronSilverlaine = 0;
            uiCommanderSpringvale = 0;
            uiLordGodfrey = 0;
            uiLordWalden = 0;

            doorBaronAshbury = 0;
            doorGodfrey = 0;

            for (uint8 i=0; i < ENCOUNTERS; ++i)
                uiEncounter[i] = NOT_STARTED;
        }

        bool IsEncounterInProgress() const
        {
            for (uint8 i=0; i < ENCOUNTERS; ++i)
            {
                if (uiEncounter[i] == IN_PROGRESS)
                    return true;
            }
            return false;
        }

        void OnCreatureCreate(Creature* creature)
        {
            switch (creature->GetEntry())
            {
                case BOSS_BARON_ASHBURY:
                    uiBaronAshbury = creature->GetGUID();
                    break;
                case BOSS_BARON_SILVERLAINE:
                    uiBaronSilverlaine = creature->GetGUID();
                    break;
                case BOSS_COMMANDER_SPRINGVALE:
                    uiCommanderSpringvale = creature->GetGUID();
                    break;
                case BOSS_LORD_GODFREY:
                    uiLordGodfrey = creature->GetGUID();
                    break;
                case BOSS_LORD_WALDEN:
                    uiLordWalden = creature->GetGUID();
                    break;
                }
            }

        void OnGameObjectCreate(GameObject * go)
        {
            switch(go->GetEntry())
            {
                case GO_BARON_ASHBURY_DOOR: doorBaronAshbury = go->GetGUID(); break;
                case GO_LORD_GODFREY_DOOR: doorGodfrey = go->GetGUID(); break;
            }
        }

        void OnCreatureDeath(Creature * creature)
        {
            switch(creature->GetEntry())
            {
                case BOSS_BARON_ASHBURY:
                    if(GetData(DATA_BARON_ASHBURY_EVENT) == DONE)
                       HandleGameObject(GetData64(GO_BARON_ASHBURY_DOOR), true);
                    break;
                case NPC_DREAD_SCRYER:
                    if (!creature->isAlive())
                        HandleGameObject(GetData64(GO_LORD_GODFREY_DOOR), true);
                    break;
            }
        }

        uint64 GetData64(uint32 identifier) const
        {
            switch (identifier)
            {
                case DATA_BARON_ASHBURY:
                    return uiBaronAshbury;
                case DATA_BARON_SILVERLAINE:
                    return uiBaronSilverlaine;
                case DATA_COMMANDER_SPRINGVALE:
                    return uiCommanderSpringvale;
                case DATA_LORD_GODFREY:
                    return uiLordGodfrey;
                case DATA_LORD_WALDEN:
                    return uiLordWalden;
                case GO_BARON_ASHBURY_DOOR:
                    return doorBaronAshbury;
                case GO_LORD_GODFREY_DOOR:
                    return doorGodfrey;
            }
            return 0;
        }

        void SetData(uint32 type, uint32 data)
        {
            switch (type)
            {
                case DATA_BARON_ASHBURY_EVENT:
                    uiEncounter[0] = data;
                    break;
                case DATA_BARON_SILVERLAINE_EVENT:
                    uiEncounter[1] = data;
                    break;
                case DATA_COMMANDER_SPRINGVALE_EVENT:
                    uiEncounter[2] = data;
                    break;
                case DATA_LORD_GODFREY_EVENT:
                    uiEncounter[3] = data;
                    break;
                case DATA_LORD_WALDEN_EVENT:
                    uiEncounter[4] = data;
                    break;
            }

           if (data == DONE)
               SaveToDB();
        }

        uint32 GetData(uint32 type) const
        {
            switch (type)
            {
                case DATA_BARON_ASHBURY_EVENT:
                    return uiEncounter[0];
                case DATA_BARON_SILVERLAINE_EVENT:
                    return uiEncounter[1];
                case DATA_COMMANDER_SPRINGVALE_EVENT:
                    return uiEncounter[2];
                case DATA_LORD_GODFREY_EVENT:
                    return uiEncounter[3];
                case DATA_LORD_WALDEN_EVENT:
                    return uiEncounter[4];
            }
            return 0;
        }

        std::string GetSaveData()
        {
            OUT_SAVE_INST_DATA;

            std::string str_data;
            std::ostringstream saveStream;
            saveStream << "S K" << uiEncounter[0] << " " << uiEncounter[1]  << " " << uiEncounter[2]  << " " << uiEncounter[3] << " " << uiEncounter[4];
            str_data = saveStream.str();

            OUT_SAVE_INST_DATA_COMPLETE;
            return str_data;
        }

        void Load(char const* in)
        {
            if (!in)
            {
                OUT_LOAD_INST_DATA_FAIL;
                return;
            }

            OUT_LOAD_INST_DATA(in);

            char dataHead1, dataHead2;
            uint16 data0, data1, data2, data3, data4;

            std::istringstream loadStream(in);
            loadStream >> dataHead1 >> dataHead2 >> data0 >> data1 >> data2 >> data3 >> data4;

            if (dataHead1 == 'S' && dataHead2 == 'K')
            {
                uiEncounter[0] = data0;
                uiEncounter[1] = data1;
                uiEncounter[2] = data2;
                uiEncounter[3] = data3;
                uiEncounter[4] = data4;

                for (uint8 i=0; i<ENCOUNTERS; ++i)
                    if (uiEncounter[i] == IN_PROGRESS)
                        uiEncounter[i] = NOT_STARTED;
            }
            else OUT_LOAD_INST_DATA_FAIL;

            OUT_LOAD_INST_DATA_COMPLETE;
        }
    };
};

void AddSC_instance_shadowfang_keep()
{
    new instance_shadowfang_keep();
}