require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	-- notorious monsters shouldn't explode, nor dynamis
    if(mob:isMobType(MOBTYPE_NOTORIOUS)) then
    	return 1;
    end
	return math.random(0,1);
end;

function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	if(mob:getHP()~=0) then
		BOMB_TOSS_HPP = mob:getHP()/mob:getMaxHP();
	end

	local power = math.random(16,20);

	-- did I drop it in my face?
	if(math.random() < 0.1) then
		power = 3;
	end

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*power*BOMB_TOSS_HPP,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end;
