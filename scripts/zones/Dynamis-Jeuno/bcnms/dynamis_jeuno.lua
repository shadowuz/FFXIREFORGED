-----------------------------------
-- Area: Dynamis Jeuno
-- Name: Dynamis Jeuno
-----------------------------------

require("scripts/globals/battlefield");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,battlefield)
	
	SetServerVariable("[DynaJeuno]UniqueID",player:getDynamisUniqueID(1283));
	SetServerVariable("[DynaJeuno]Boss_Trigger",0);
	SetServerVariable("[DynaJeuno]Already_Received",0);
	
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,battlefield)
	
	player:setVar("DynamisID",GetServerVariable("[DynaJeuno]UniqueID"));
	local realDay = os.time();
    local dynaWaitxDay = player:getVar("dynaWaitxDay");

    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay) then
		player:setVar("dynaWaitxDay",realDay);
	end
	
end;

function onBattlefieldTick(battlefield)
    OnBattlefieldTick(battlefield);
end;

-- Leaving the Dynamis by every mean possible, given by the LeaveCode
-- 3=Disconnected or warped out (if dyna is empty: launch 4 after 3)
-- 4=Finish he dynamis

function onBcnmLeave(player,battlefield,leavecode)
--print("leave code "..leavecode);
	
	if (leavecode == 4) then
		GetNPCByID(17547510):setStatus(2);
		SetServerVariable("[DynaJeuno]UniqueID",0);
	end
	
end;