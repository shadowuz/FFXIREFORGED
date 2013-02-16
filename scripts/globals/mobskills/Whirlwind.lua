---------------------------------------------
--  Whirlwind
--
--  Description: Deals wind damage to enemies within range. Additional effect: VIT Down.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_VIT_DOWN;

    if(target:hasStatusEffect(typeEffect) == false) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getStat(statmod)-target:getStat(statmod),0,ELE_WIND);
        if(resist > 0.1) then
            target:addStatusEffect(typeEffect,10,0,120*resist);--power=50;tic=0;duration=120
        end
    end

    local dmgmod = 1;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.3,ELE_WIND,dmgmod,TP_NO_EFFECT);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_IGNORE_SHADOWS);
    target:delHP(dmg);
    return dmg;
end;
