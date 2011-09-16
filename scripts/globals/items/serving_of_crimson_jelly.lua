-----------------------------------------
-- ID: 5144
-- Item: serving_of_crimson_jelly
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic % 12
-- Magic Cap 85
-- Intelligence 6
-- Magic Regen While Healing 1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:hasStatusEffect(EFFECT_FOOD) == true) then
		result = 246;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_FOOD,0,0,10800,0,5144);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_MPP, 12);
	target:addMod(MOD_FOOD_MP_CAP, 85);
	target:addMod(MOD_INT, 6);
	target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_MPP, 12);
	target:delMod(MOD_FOOD_MP_CAP, 85);
	target:delMod(MOD_INT, 6);
	target:delMod(MOD_MPHEAL, 1);
end;
