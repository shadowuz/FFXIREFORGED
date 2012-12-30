-----------------------------------	
-- Arching Arrow	
-- Archery weapon skill	
-- Skill level: 225	
-- Delivers a single-hit attack. Chance of params.critical varies with TP.	
-- Aligned with the Flame Gorget & Light Gorget.	
-- Aligned with the Flame Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:16% ; AGI:25%	
-- 100%TP    200%TP    300%TP	
-- 3.50      3.50      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");
require("scripts/globals/weaponskills");	
	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 1;
	params.ftp100 = 3.5; params.ftp200 = 3.5; params.ftp300 = 3.5;
	params.str_wsc = 0.16; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.25; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.1; params.crit200 = 0.3; params.crit300 = 0.5;
	params.canCrit = true;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	damage, tpHits, extraHits = doRangedWeaponskill(player, target, params);
	
    return tpHits, extraHits, damage;
	
end	
