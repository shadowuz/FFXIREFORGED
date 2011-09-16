-----------------------------------------
-- ID: 5190
-- Item: dish_of_spaghetti_carbonara
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 175
-- Magic 10
-- Strength 4
-- Vitality 2
-- Intelligence -3
-- Attack % 17
-- Attack Cap 65
-- Store TP 4
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
	target:addStatusEffect(EFFECT_FOOD,0,0,1800,0,5190);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_FOOD_HPP, 14);
	target:addMod(MOD_FOOD_HP_CAP, 175);
	target:addMod(MOD_MP, 10);
	target:addMod(MOD_STR, 4);
	target:addMod(MOD_VIT, 2);
	target:addMod(MOD_INT, -3);
	target:addMod(MOD_FOOD_ATTP, 17);
	target:addMod(MOD_FOOD_ATT_CAP, 65);
	target:addMod(MOD_STORETP, 4);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_FOOD_HPP, 14);
	target:delMod(MOD_FOOD_HP_CAP, 175);
	target:delMod(MOD_MP, 10);
	target:delMod(MOD_STR, 4);
	target:delMod(MOD_VIT, 2);
	target:delMod(MOD_INT, -3);
	target:delMod(MOD_FOOD_ATTP, 17);
	target:delMod(MOD_FOOD_ATT_CAP, 65);
	target:delMod(MOD_STORETP, 4);
end;
