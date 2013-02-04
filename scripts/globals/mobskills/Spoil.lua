---------------------------------------------
--  Spoil
--
--  Description: Lowers the strength of target.
--  Type: Enhancing
--  Utsusemi/Blink absorb: Ignore
--  Range: Self
--  Notes: Very sharp evasion increase.
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local message = MSG_MISS;
    if(target:hasStatusEffect(EFFECT_ENMITY_DOWN) == false) then
        local typeEffect = EFFECT_STR_DOWN;
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,typeEffect,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WATER);
        if(resist > 0.2) then
            message = MSG_ENFEEB_IS;
            target:addStatusEffect(typeEffect,50,0,120*resist);--power=50;tic=0;duration=120;
        end
    else
        message = MSG_NO_EFFECT;
    end

    skill:setMsg(message);
    return typeEffect;
end;
