-----------------------------------------
-- Spell: LightSpirit
-- Summons LightSpirit to fight by your side
-----------------------------------------

require("scripts/globals/pets");
require("scripts/globals/summon");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
    if(caster:hasPet()) then
        return 1;
    end
	return 0;
end;

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_LIGHT_SPIRIT);

	return 0;
end;