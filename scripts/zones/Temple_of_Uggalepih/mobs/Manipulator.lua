----------------------------------	
-- Area:  Temple of Uggalipeh
-- NM:    Manipulator
-- Notes: Paths around the 2 staircases 
-----------------------------------	

local path = 
{
-17.930, -8.500, -93.215, 
-18.553, -7.713, -91.224, 
-20.226, -6.250, -89.091, 
-21.651, -5.005, -87.401, 
-23.137, -3.917, -85.818, 
-24.750, -2.650, -84.440, 
-26.487, -1.300, -83.362, 
-28.366, -0.068, -82.488, 
-30.361, 0.500, -81.880, 
-32.450, 0.500, -81.498, 
-34.553, 0.500, -81.367, 
-36.575, 0.500, -81.401, 
-38.601, 0.500, -81.632, 
-40.699, 0.500, -82.133, 
-43.542, -1.300, -83.312, 
-45.403, -2.650, -84.455, 
-47.108, -3.804, -85.804, 
-48.567, -4.900, -87.243, 
-49.894, -6.250, -88.891, 
-50.957, -7.518, -90.686, 
-51.714, -8.500, -92.696, 
-52.136, -8.500, -94.655, 
-52.358, -8.500, -96.757, 
-52.482, -8.500, -99.253, 
-52.530, -8.500, -102.142, 
-52.409, -8.500, -104.364, 
-51.995, -8.500, -106.498, 
-51.329, -7.998, -108.403, 
-50.419, -6.700, -110.216, 
-49.221, -5.514, -111.939, 
-47.741, -4.367, -113.588, 
-46.122, -3.100, -115.009, 
-44.418, -1.750, -116.181, 
-42.611, -0.797, -117.185, 
-40.653, 0.500, -117.857, 
-38.622, 0.500, -118.275, 
-36.614, 0.500, -118.518, 
-34.459, 0.500, -118.650, 
-32.303, 0.500, -118.591, 
-30.276, 0.500, -118.249, 
-28.199, -0.318, -117.605, 
-26.325, -1.300, -116.748, 
-24.522, -2.650, -115.637, 
-22.911, -3.550, -114.378, 
-21.430, -4.900, -112.942, 
-20.121, -6.250, -111.382, 
-18.967, -7.150, -109.509, 
-18.191, -8.500, -107.518, 
-17.743, -8.500, -105.495, 
-17.541, -8.500, -103.466, 
-17.497, -8.500, -101.427, 
-17.408, -8.500, -97.263, 
-17.573, -8.500, -95.179
};

function onMobSpawn(mob)
	onMobRoam(mob);
end;

function onPath(mob)
	pathfind.patrol(mob, path);
end;

function onMobRoam(mob)
	-- move to start position if not moving
	if (mob:isFollowingPath() == false) then
		mob:pathThrough(pathfind.first(path));
	end
end;

function onMobDeath(mob,killer)	

    -- Set Manipulator's spawnpoint and respawn time
    mob:setRespawnTime(7200); -- 2 hours

end;