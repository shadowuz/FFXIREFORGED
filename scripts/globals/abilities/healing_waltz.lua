-----------------------------------
-- Ability: Divine Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getTP() < 20) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	player:delTP(20);
	target:eraseStatusEffect();	
end;