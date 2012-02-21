-----------------------------------------
-- Spell: ThunderSpirit
-- Summons ThunderSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_THUNDERSPIRIT);
	return 0;
end;