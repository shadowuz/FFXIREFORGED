﻿/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/sql.h"

#include <algorithm>

#include "data_loader.h"
#include "search.h"

CDataLoader::CDataLoader()
{
    SqlHandle = Sql_Malloc();

	ShowStatus("sqlhandle is allocating\n");
    if( Sql_Connect(SqlHandle,search_config.mysql_login,
                              search_config.mysql_password,
                              search_config.mysql_host,
                              search_config.mysql_port,
                              search_config.mysql_database) == SQL_ERROR )
	{
		ShowError("cant connect\n");
	}
}

CDataLoader::~CDataLoader()
{
    Sql_Free(SqlHandle);
}

std::vector<ahHistory*> CDataLoader::GetAHItemHystory(uint16 ItemID, bool stack)
{
    std::vector<ahHistory*> HistoryList;

    const int8* fmtQuery = "SELECT sale, sell_date, seller_name, buyer_name \
                            FROM auction_house \
                            WHERE itemid = %u AND stack = %u AND buyer_name IS NOT NULL \
                            ORDER BY sell_date DESC \
                            LIMIT 10";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, ItemID, stack);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
            ahHistory* PAHHistory = new ahHistory;

            PAHHistory->Price = Sql_GetUIntData(SqlHandle,0);
            PAHHistory->Data  = Sql_GetUIntData(SqlHandle,1);

            snprintf((int8*)PAHHistory->Name1, 15, "%s", Sql_GetData(SqlHandle,2));
            snprintf((int8*)PAHHistory->Name2, 15, "%s", Sql_GetData(SqlHandle,3));

            HistoryList.push_back(PAHHistory);
        }
        std::reverse(HistoryList.begin(),HistoryList.end());
    }
    return HistoryList;
}

/************************************************************************
*                                                                       *
*  Список продаваемых предметов в указанной категории                   *
*                                                                       *
************************************************************************/

std::vector<ahItem*> CDataLoader::GetAHItemsToCategry(uint8 AHCategoryID)
{
    ShowDebug("try find category %u\n", AHCategoryID);

    std::vector<ahItem*> ItemList;

    const int8* fmtQuery = "SELECT item_basic.itemid, item_basic.stackSize, COUNT(*)-SUM(stack), SUM(stack) \
                            FROM item_basic \
	                        LEFT JOIN auction_house ON item_basic.itemId = auction_house.itemid AND auction_house.buyer_name IS NULL \
                            LEFT JOIN item_armor ON item_basic.itemid = item_armor.itemid \
                            LEFT JOIN item_weapon ON item_basic.itemid = item_weapon.itemid \
                            WHERE aH = %u \
                            GROUP BY item_basic.itemid \
                            ORDER BY item_armor.level DESC, item_weapon.dmg DESC, item_basic.sortname ASC";

	int32 ret = Sql_Query(SqlHandle, fmtQuery, AHCategoryID);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
			ahItem* PAHItem   = new ahItem;

            PAHItem->ItemID	= Sql_GetIntData(SqlHandle,0);

            PAHItem->SinglAmount = Sql_GetIntData(SqlHandle,2);
            PAHItem->StackAmount = Sql_GetIntData(SqlHandle,3);

            if (Sql_GetIntData(SqlHandle,1) == 1)
            {
                PAHItem->StackAmount = -1;
            }

            ItemList.push_back(PAHItem);
        }
    }
	return ItemList;
}

/************************************************************************
*                                                                       *
*  Количество активных игроков в мире                                   *
*                                                                       *
************************************************************************/

uint32 CDataLoader::GetPlayersCount()
{
	if( Sql_Query(SqlHandle, "SELECT COUNT(*) FROM accounts_sessions") != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		if (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            return Sql_GetUIntData(SqlHandle, 0);
        }
    }
    return 0;
}

/************************************************************************
*                                                                       *
*  Список найденных персонажей в игровом мире                           *
*                                                                       *
************************************************************************/

std::list<SearchEntity*> CDataLoader::GetPlayersList()
{
    std::list<SearchEntity*> PlayersList;

    const int8* fmtQuery = "SELECT charid, partyid, charname, pos_zone, nation, rankSandoria, rankBastok, rankWindurst, race, nameflags, mjob, sjob, \
                            war, mnk, whm, blm, rdm, thf, pld, drk, bst, brd, rng, sam, nin, drg, smn, blu, cor, pup, dnc, sch \
                            FROM accounts_sessions \
                            LEFT JOIN chars USING (charid) \
                            LEFT JOIN char_look USING (charid) \
                            LEFT JOIN char_stats USING (charid) \
                            LEFT JOIN char_jobs USING(charid) \
                            ORDER BY charname ASC \
                            LIMIT 20";

    int32 ret = Sql_Query(SqlHandle, fmtQuery);

	if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	{
		while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		{
            SearchEntity* PPlayer = new SearchEntity;
            memset(PPlayer, 0, sizeof(SearchEntity));

            memcpy(PPlayer->name, Sql_GetData(SqlHandle, 2), 15);

            PPlayer->id     = (uint32)Sql_GetUIntData(SqlHandle, 0);
            PPlayer->zone   = (uint8) Sql_GetIntData(SqlHandle,  3);
            PPlayer->nation = (uint8) Sql_GetIntData(SqlHandle,  4);
            PPlayer->mjob   = (uint8) Sql_GetIntData(SqlHandle, 10);
            PPlayer->sjob   = (uint8) Sql_GetIntData(SqlHandle, 11);
            PPlayer->mlvl   = (uint8) Sql_GetIntData(SqlHandle, 11 + PPlayer->mjob);
            PPlayer->slvl   = (uint8) Sql_GetIntData(SqlHandle, 11 + PPlayer->sjob);
            PPlayer->race   = (uint8) Sql_GetIntData(SqlHandle,  8);
            PPlayer->rank   = (uint8) Sql_GetIntData(SqlHandle,  5 + PPlayer->nation);

            PPlayer->slvl = (PPlayer->slvl > (PPlayer->mlvl >> 1) ? (PPlayer->mlvl == 1 ? 1 : (PPlayer->mlvl >> 1)) : PPlayer->slvl);

            uint32 partyid  = (uint32)Sql_GetUIntData(SqlHandle, 1);
            uint32 nameflag = (uint32)Sql_GetUIntData(SqlHandle, 9);

            if (partyid == PPlayer->id) PPlayer->flags1 |= 0x0008;
            if (nameflag & FLAG_AWAY)   PPlayer->flags1 |= 0x0100;
            if (nameflag & FLAG_DC)     PPlayer->flags1 |= 0x0800;
            if (partyid != 0)           PPlayer->flags1 |= 0x2000;
            if (nameflag & FLAG_ANON)   PPlayer->flags1 |= 0x4000;
            if (nameflag & FLAG_INVITE) PPlayer->flags1 |= 0x8000;

            PPlayer->flags2 = PPlayer->flags1;

            PlayersList.push_back(PPlayer);
        }
    }
    return PlayersList;
}