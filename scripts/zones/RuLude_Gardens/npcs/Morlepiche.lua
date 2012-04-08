-----------------------------------
-- Area: Rulude Gardens
-- NPC:  Morlepiche
-- @pos -95 0 160 243

-- X Grant Signet
-- X Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-------------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
package.loaded["scripts/globals/conquestguards"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquestguards");
require("scripts/zones/Rulude_Gardens/TextIDs");

guardnation = JEUNO;	-- SANDORIA, BASTOK, WINDURST, JEUNO.
guardtype	= 1;		-- 1: city, 2: foreign, 3: outpost, 4: border

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	Menu1 = getArg1(guardnation,player);
	Menu3 = conquestRanking();
	Menu6 = getArg6(player);
	Menu7 = getCP(player);
	
	player:startEvent(0x7ffb,Menu1,0,Menu3,0,0,Menu6,Menu7,0); 
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdateCSID: %u",csid);
--printf("onUpdateOPTION: %u",option);
	
	if(player:getNation() == 0) then 
		inventory = SandInv;
		size = table.getn(SandInv);
	elseif(player:getNation() == 1) then 
		inventory = BastInv;
		size = table.getn(BastInv);
	else 
		inventory = WindInv;
		size = table.getn(WindInv);
	end
	
	if(option >= 32768 and option <= 32944) then
		for Item = 1,size,3 do
			if(option == inventory[Item]) then
				CPVerify = 1;
				if(getCP(player) >= inventory[Item + 1]) then
					CPVerify = 0;
				end;
				
				player:updateEvent(2,CPVerify,inventory[Item + 2]); -- can't equip = 2 ?
				break;
			end;
		end;
	end;
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinishCSID: %u",csid);
--printf("onFinishOPTION: %u",option);
	
	if(option == 1) then
		duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
		player:delStatusEffect(EFFECT_SIGNET);
		player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
	elseif(option >= 32768 and option <= 32944) then
		myCP = getCP(player);
		for Item = 1,size,3 do
			if(option == inventory[Item]) then
				if(player:getFreeSlotsCount() >= 1) then
					PlayerCP = myCP - inventory[Item + 1];
					setCP(player,PlayerCP);
					player:addItem(inventory[Item + 2],1);
					player:messageSpecial(ITEM_OBTAINED,inventory[Item + 2]);
				else
					player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
				end;
				break;
			end;
		end;
	end;
	
end;