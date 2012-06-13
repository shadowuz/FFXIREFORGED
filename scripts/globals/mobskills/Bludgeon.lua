---------------------------------------------
--  Bludgeon
--
--  Description: Delivers a threefold attack. Accuracy varies with TP.
--  Type: Physical (Blunt)
--  
--  
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)
    numhits = 3;
    accmod = 1;
    dmgmod = .4;
    info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded);
    target:delHP(dmg);
    return dmg;
end;