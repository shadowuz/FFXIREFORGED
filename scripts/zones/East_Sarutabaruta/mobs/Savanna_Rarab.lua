-----------------------------------	
-- Area: East Sarutabaruta	
-- MOB:  Savanna Rarab	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,91,1);
end;	
