-----------------------------------	
-- Area: La Theine Plateau	
-- MOB:  Huge Wasp	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,5,2);
	checkRegime(killer,mob,71,1);
end;	
