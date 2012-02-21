-----------------------------------------
-- Spell: Tonko: Ichi
-- Lessens chance of being detected by sound
-- Duration is 3 minutes (non-random duration)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	if (target:hasStatusEffect(EFFECT_INVISIBLE) == false) then
		spell:setMsg(0);
		target:addStatusEffect(EFFECT_INVISIBLE,0,10,180,FLAG_DISPELABLE);
	else
		spell:setMsg(75); -- no effect.
	end
end;
