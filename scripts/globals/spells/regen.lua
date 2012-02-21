-----------------------------------------
-- Spell: Regen
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	hp = 5; 
	
	body = caster:getEquipID(5);
	if (body == 15089 or body == 14502) then
		hp = hp+1;
	end
	
	duration = 75;

	if (target:getMainLvl() < 21) then
		duration = duration * target:getMainLvl() / 21;
	end
	
	target:delStatusEffect(EFFECT_REGEN);
	target:addStatusEffect(EFFECT_REGEN,hp,3,duration,FLAG_DISPELABLE);
	return 0;
end;