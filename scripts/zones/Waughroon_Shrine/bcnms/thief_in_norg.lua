-----------------------------------
-- Area: Waughroon_Shrine
-- Name: A Thief in Norg?!
-- Norg Quest
-----------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/battlefield");
require("scripts/zones/Waughroon_Shrine/TextIDs");

-----------------------------------
-- EXAMPLE SCRIPT
-- 
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool, 
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,battlefield)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,battlefield)
end;

function onBattlefieldTick(battlefield)
    OnBattlefieldTick(battlefield);
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,battlefield,leavecode)
-- print("leave code "..leavecode);
	
	
	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		player:startEvent(0x7d01,1,1,1,battlefield:getTimeInside(),1,1,4);
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);
		if (csid == 0x7d01 and player:getVar("aThiefinNorgCS") == 6) then
			player:setVar("aThiefinNorgCS",7);
			player:addKeyItem(CHARRED_HELM);
			player:messageSpecial(KEYITEM_OBTAINED,CHARRED_HELM);
		end
end;
