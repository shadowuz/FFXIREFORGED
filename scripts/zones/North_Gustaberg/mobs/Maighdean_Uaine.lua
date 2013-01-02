----------------------------------	
-- Area: North Gustaberg
--   NM: Maighdean Uaine
-----------------------------------	

require("/scripts/globals/fieldsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

	checkRegime(killer,mob,18,2);
  
  -- Set Maighdean_Uaine's Window Open Time
  wait = math.random((900),(10800))
  SetServerVariable("[POP]Maighdean_Uaine", os.time(t) + wait); -- 15-180 minutes
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Maighdean_Uaine");
  SetServerVariable("[PH]Maighdean_Uaine", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;