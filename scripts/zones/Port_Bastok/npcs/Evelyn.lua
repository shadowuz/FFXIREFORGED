-----------------------------------
--	Area: Port Bastok
--	NPC: Evelyn
--	Only sells when Bastok controlls Gustaberg Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = getRegionOwner(GUSTABERG);

if (RegionOwner ~= BASTOK) then 
	player:showText(npc,EVELYN_CLOSED_DIALOG);
else
	player:showText(npc,EVELYN_OPEN_DIALOG);
	
	stock = {0x0454,703,		-- Sulfur
		 0x026b,43,		-- Popoto
		 0x0263,36,		-- Rye Flour
		 0x1124,40}		-- Eggplant
			  
showShop(player,BASTOK,stock);
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