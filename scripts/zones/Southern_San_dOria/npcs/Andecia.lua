-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Andecia
-- Starts and Finishes Quest: Grave Concerns
-- @zone 230
-- @pos 167 0 45
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(SANDORIA,GRAVE_CONCERNS) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(TGWaterskin, 1) and trade:getItemCount() == 1 and player:getVar("OfferingWaterOK") == 1) then
			player:startEvent(0x0270);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	Tomb = player:getQuestStatus(SANDORIA,GRAVE_CONCERNS);
	WellWater = player:hasItem(SOWellWater);
	Waterskin = player:hasItem(TGWaterskin);
	
	if(Tomb == QUEST_AVAILABLE) then
		player:startEvent(0x021d);
	elseif(Tomb == QUEST_ACCEPTED and WellWater == false and player:getVar("OfferingWaterOK") == 0) then
		player:startEvent(0x026e);
	elseif(Tomb == QUEST_ACCEPTED and Waterskin == true and player:getVar("OfferingWaterOK") == 0) then
		player:startEvent(0x026f);
	elseif(Tomb == QUEST_COMPLETED) then
		player:startEvent(0x022e);
	else
		player:startEvent(0x021c);
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

	if(csid == 0x021d and option == 0) then
		if (player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,SOWellWater);
		else
			player:addQuest(SANDORIA,GRAVE_CONCERNS);
			player:setVar("graveConcernsVar",0);
			player:addItem(SOWellWater);
			player:messageSpecial(ITEM_OBTAINED,SOWellWater);
		end
	elseif(csid == 0x0270) then
		player:tradeComplete();
		player:setVar("OfferingWaterOK",0);
		player:setTitle(ROYAL_GRAVE_KEEPER);
		player:addGil(GIL_RATE*560);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*560)
		player:addFame(SANDORIA,SAN_FAME*30);
		player:completeQuest(SANDORIA,GRAVE_CONCERNS);
	end

end;