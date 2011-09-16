-----------------------------------
-- Area: Eastern Altepa Desert
-- NPC: Telepoint
-- 
-----------------------------------

require("scripts/zones/Eastern_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

item = trade:getItem();

if (trade:getItemCount() == 1 and item > 4095 and item < 4104) then	
	if (player:getFreeSlotsCount() > 0 and not(player:hasItem(613))) then
		player:tradeComplete();
		player:addItem(613);
		player:messageSpecial(ITEM_OBTAINED,613);
	else
		player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,613);
	end
end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:hasKeyItem(357) == false) then
		player:addKeyItem(357);
		player:messageSpecial(KEYITEM_OBTAINED,357);
	else
		player:messageSpecial(ALREADY_OBTAINED_TELE);
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
end;