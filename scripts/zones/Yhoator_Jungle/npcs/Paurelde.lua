-----------------------------------
-- Area: Yhoator Jungle
-- NPC: Paurelde
-- Chocobo Vendor
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

price = 100;
gil = player:getGil();
hasLicense = player:hasKeyItem(CHOCOBO_LICENSE);
level = player:getMainLvl();

	if (hasLicense and level >= 15) then
		player:startEvent(0x000c,price,gil);
	else
		player:startEvent(0x000d,price,gil);
	end

end;

  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);

price = 100;
level = player:getMainLvl();

	if (csid == 0x000c and option == 0) then
		if (level >= 20) then
			player:addStatusEffect(EFFECT_CHOCOBO,1,0,1800);
		else
			player:addStatusEffect(EFFECT_CHOCOBO,1,0,900);
		end
		player:delGil(price);
	end

end;