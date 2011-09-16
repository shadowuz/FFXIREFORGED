-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Guillerme
-- Used for Quest: Rosel the Armorer
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- "Rosel the Armorer" quest status var
	RoselTheArmorer = player:getQuestStatus(SANDORIA,ROSEL_THE_ARMORER);
	
	-- "Rosel the Armorer" - turn in reciept to prince
	if (RoselTheArmorer == QUEST_ACCEPTED and player:hasKeyItem(119)) then
		player:startEvent(0x01fb);  -- 
	end;
		
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

	-- "Rosel the Armorer", give receipt to NPC:Guilerme
	if (csid == 0x01fb) then
		player:delKeyItem(119);
	end;
		
end;