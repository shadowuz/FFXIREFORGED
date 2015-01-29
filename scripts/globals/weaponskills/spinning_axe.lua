-----------------------------------
-- Spinning Axe
-- Axe weapon skill
-- Skill level: 150
-- Single-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget, Soil Gorget & Thunder Gorget.
-- Aligned with the Flame Belt, Soil Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 2.00      2.50      3.00
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/weaponskills");
-----------------------------------

function onUseWeaponSkill(player, target, wsID)

	local params = {};
	params.numHits = 1;
	params.ftp100 = 2; params.ftp200 = 2.5; params.ftp300 = 3;
	params.str_wsc = 0.6; params.dex_wsc = 0.0; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.0; params.acc200= 0.0; params.acc300= 0.0;
	params.atkmulti = 1;
	local damage, criticalHit, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);

	return tpHits, extraHits, criticalHit, damage;

end
