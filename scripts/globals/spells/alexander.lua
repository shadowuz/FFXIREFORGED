-----------------------------------------
-- Spell: Alexander
-- Summons Alexander to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_ALEXANDER);
	return 0;
end;