-----------------------------------
--	Area: Buburimu Peninsula
--	NPC:  Song Runes
--  Finishes Quest: The Old Monument
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
require("scripts/zones/Buburimu_Peninsula/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
			
	if (player:getVar("TheOldMonument_Event") == 3) then
		count = trade:getItemCount();
		gil = trade:getGil();

		if (trade:hasItemQty(PARCHMENT,1) == true and count == 1 and gil == 0) then
			player:tradeComplete();
			player:completeQuest(JEUNO,THE_OLD_MONUMENT);
			player:addItem(POETIC_PARCHMENT,1);
			player:messageSpecial(ITEM_OBTAINED, POETIC_PARCHMENT);
			player:setTitle(RESEARCHER_OF_CLASSICS);
			player:addFame(BASTOK,BAS_FAME*10);
			player:addFame(SANDORIA,SAN_FAME*10);
			player:addFame(WINDURST,WIN_FAME*10);
			player:setVar("TheOldMonument_Event",0);
		end
	end		
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getVar("TheOldMonument_Event") == 2) then
		player:startEvent(0x0000);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x0000) then
		player:setVar("TheOldMonument_Event",3);
	end
end;

