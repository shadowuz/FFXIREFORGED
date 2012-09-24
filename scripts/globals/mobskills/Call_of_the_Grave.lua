---------------------------------------------
--  Call of the Grave
--
--  Description: Lowers INT of targets in an area of effect.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_INT_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,1);
		if(resist > 0.5) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,50,0,180);--power=50;tic=0;duration=180;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
