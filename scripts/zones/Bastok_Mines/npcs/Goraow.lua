-----------------------------------
-- Area: Bastok Mines
-- NPC: Garaow
-- Starts Quests: Vengeful Wraith
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
QuadavHelm = trade:hasItemQty(501,1);

	if (QuadavHelm == true and count == 1) then
		Vengeful = player:getQuestStatus(BASTOK,VENGEFUL_WRATH);
		if (Vengeful >= 1) then
			player:tradeComplete();
			player:startEvent(0x006d);
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Vengeful = player:getQuestStatus(BASTOK,VENGEFUL_WRAITH);

	if (Vengeful == 0) then
		player:startEvent(0x006a);
	else
		plyaer:startEvent(0x0069);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
	
	if (csid == 0x006a) then
		player:addQuest(BASTOK,VENGEFUL_WRATH);
	elseif (csid == 0x006d) then
		Vengeful = player:getQuestStatus(BASTOK,VENGEFUL_WRATH);
		if (Vengeful == 1) then
			player:completeQuest(BASTOK,VENGEFUL_WRATH);
			player:addFame(BASTOK,BAS_FAME*120);
			player:setTitle(95);
		else
			player:addFame(BASTOK,BAS_FAME*8);
		end
		player:addGil(GIL_RATE*900);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
	end
		
end;