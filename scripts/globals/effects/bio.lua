-----------------------------------
--
-- 	EFFECT_NONE
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	res = 3 * effect:getPower() * (26/512);	-- target:getDef() au lieu du 3
	target:addMod(MOD_ATT,-res);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	skin = target:getMod(MOD_STONESKIN);
    if(skin>0) then
        if(skin >= effect:getPower()) then --absorb all damage
            target:delMod(MOD_STONESKIN,effect:getPower());
            if(target:getMod(MOD_STONESKIN)==0) then
                target:delStatusEffect(EFFECT_STONESKIN);
            end
        else --absorbs some damage then wear
            target:delMod(MOD_STONESKIN,skin);
            target:delStatusEffect(EFFECT_STONESKIN);
			target:wakeUp();
			target:delHP(effect:getPower() - skin);
        end
	else
		target:delHP(effect:getPower());
		target:wakeUp();
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	res = 3 * effect:getPower() * (26/512);	-- target:getDef() au lieu du 3
	target:delMod(MOD_ATT,-res);
end;