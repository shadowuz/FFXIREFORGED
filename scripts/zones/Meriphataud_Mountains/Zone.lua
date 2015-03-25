-----------------------------------
--
-- Zone: Meriphataud_Mountains (119)
--
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
package.loaded["scripts/globals/chocobo_digging"] = nil;
-----------------------------------

require("scripts/zones/Meriphataud_Mountains/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");
require("scripts/globals/chocobo_digging");

-----------------------------------
-- Chocobo Digging vars
-----------------------------------
local itemMap = {
                    -- itemid, abundance, requirement
                    { 646, 4, DIGREQ_NONE },
                    { 845, 12, DIGREQ_NONE },
                    { 640, 112, DIGREQ_NONE },
                    { 768, 237, DIGREQ_NONE },
                    { 893, 41, DIGREQ_NONE },
                    { 748, 33, DIGREQ_NONE },
                    { 846, 145, DIGREQ_NONE },
                    { 869, 100, DIGREQ_NONE },
                    { 17296, 162, DIGREQ_NONE },
                    { 771, 21, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },
                    { 4097, 100, DIGREQ_NONE },
                    { 4098, 100, DIGREQ_NONE },
                    { 4099, 100, DIGREQ_NONE },
                    { 4100, 100, DIGREQ_NONE },
                    { 4101, 100, DIGREQ_NONE },
                    { 4102, 100, DIGREQ_NONE },
                    { 4103, 100, DIGREQ_NONE },
                    { 678, 5, DIGREQ_BURROW },
                    { 645, 9, DIGREQ_BURROW },
                    { 737, 5, DIGREQ_BURROW },
                    { 643, 69, DIGREQ_BURROW },
                    { 1650, 62, DIGREQ_BURROW },
                    { 644, 31, DIGREQ_BURROW },
                    { 736, 62, DIGREQ_BURROW },
                    { 739, 5, DIGREQ_BURROW },
                    { 678, 5, DIGREQ_BORE },
                    { 645, 9, DIGREQ_BORE },
                    { 737, 5, DIGREQ_BORE },
                    { 738, 8, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                };

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

-----------------------------------
-- onChocoboDig
-----------------------------------
function onChocoboDig(player, precheck)

    -- Let's get the weather of the zone

    local weather = player:getWeather();

    if (weather ~= nil) then
      if (weather >= 0 and weather <= 4) then
        zoneWeather = "WEATHER_NONE";
      elseif (weather > 4 and weather % 2 ~= 0) then -- If the weather is 5, 7, 9, 11, 13, 15, 17 or 19, checking for odd values
        zoneWeather = "WEATHER_DOUBLE";
      else
        zoneWeather = "WEATHER_SINGLE";
      end
    else
      zoneWeather = "WEATHER_NONE";
    end
    
    return chocoboDig(player, itemMap, precheck, messageArray, zoneWeather);
end;

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17265291,17265292,17265293};

    SetFieldManual(manuals);

    -- Waraxe Beak
    SetRespawnTime(17264828, 900, 10800);

    -- Coo Keja the Unseen
    SetRespawnTime(17264946, 900, 10800);

    SetRegionalConquestOverseers(zone:getRegionID())
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 752.632, -33.761, -40.035, 129);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x001f;
    end

    return cs;
end;


-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;
-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x001f) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x001f) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;