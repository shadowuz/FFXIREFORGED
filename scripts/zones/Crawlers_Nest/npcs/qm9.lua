-----------------------------------
-- Area: Crawlers Nest
-- NPC:  ???
-- Used In Quest: A Boy's Dream
-- @zone 197
-- @pos -18 -8 124
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	DreadbugTimer = player:getVar("DreadbugNM_Timer");
	DreadbugDay = player:getVar("DreadbugNM_Day");
	MyDay = VanadielDayOfTheYear();
	aBoysDream = player:getQuestStatus(SANDORIA, A_BOY_S_DREAM);
	
	if(MyDay ~= DreadbugDay and aBoysDream == QUEST_ACTIVE) then
		canSpawn = (os.time() - DreadbugTimer) > 30;
		
		if(canSpawn) then
			SpawnMob(17584425,168):updateEnmity(player); -- Despawn after 3 minutes (-12 seconds for despawn delay).
			player:setVar("DreadbugNM_Timer",os.time()+180);
			player:setVar("DreadbugNM_Day",VanadielDayOfTheYear());
			player:messageSpecial(SENSE_OF_FOREBODING);
		else
			player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN);
		end
	else
		player:messageSpecial(NOTHING_WILL_HAPPEN_YET);
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

