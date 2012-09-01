/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _BATTLEUTILS_H
#define _BATTLEUTILS_H

#include "../common/cbasetypes.h"

#include <list>

#include "battleentity.h"

class CSpell;
class CAbility;
class CTrait;
class CWeaponSkill; 
class CMobSkill;

enum ENSPELL
{
	ENSPELL_NONE			= 0,
	ENSPELL_I_FIRE			= 1,
	ENSPELL_I_EARTH			= 2,
	ENSPELL_I_WATER			= 3,
	ENSPELL_I_WIND			= 4,
	ENSPELL_I_ICE			= 5,
	ENSPELL_I_THUNDER		= 6,
	ENSPELL_I_LIGHT			= 7,
	ENSPELL_I_DARK			= 8,
	ENSPELL_II_FIRE			= 9,
	ENSPELL_II_EARTH		= 10,
	ENSPELL_II_WATER		= 11,
	ENSPELL_II_WIND			= 12,
	ENSPELL_II_ICE			= 13,
	ENSPELL_II_THUNDER		= 14,
	ENSPELL_II_LIGHT		= 15,
	ENSPELL_BLOOD_WEAPON	= 16,
	ENSPELL_ROLLING_THUNDER = 17,
	ENSPELL_AUSPICE			= 18
};

namespace battleutils
{
	void	LoadSkillTable();
	void	LoadWeaponSkillsList(); 
	void	LoadMobSkillsList();
	void	LoadEnmityTable();
    void    LoadSkillChainDamageModifiers();

	uint8	GetSkillRank(SKILLTYPE SkillID, JOBTYPE JobID);
	uint16	GetMaxSkill(SKILLTYPE SkillID, JOBTYPE JobID, uint8 level);

	CWeaponSkill* GetWeaponSkill(uint16 WSkillID);
	CMobSkill*    GetMobSkill(uint16 SkillID);

	std::list<CWeaponSkill*> GetWeaponSkills(uint8 skill);
	std::vector<CMobSkill*>  GetMobSkillsByFamily(uint16 FamilyID);

	void    FreeWeaponSkillsList();
	void	FreeMobSkillsList();
    void    FreeSkillChainDamageModifiers();

    SUBEFFECT GetSkillChainEffect(CBattleEntity* PDefender, CWeaponSkill* PWeaponSkill);
    SKILLCHAIN_ELEMENT FormSkillchain(std::list<SKILLCHAIN_ELEMENT> resonance, std::list<SKILLCHAIN_ELEMENT> skill);
    uint8 GetSkillchainTier(SKILLCHAIN_ELEMENT skillchain);
    uint8 GetSkillchainSubeffect(SKILLCHAIN_ELEMENT skillchain);
    uint16 GetSkillchainMinimumResistance(SKILLCHAIN_ELEMENT element, CBattleEntity* PDefender);

	bool	IsParalised(CBattleEntity* PAttacker);
    bool    IsAbsorbByShadow(CBattleEntity* PDefender);
	bool	IsIntimidated(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	bool	IsAnticipated(CBattleEntity* PDefender, bool forceRemove, bool ignore);

	int32	GetFSTR(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 SlotID);
	uint8	GetHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint8	GetHitRateAccOffset(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint32 accuracy); 
	uint8	GetCritHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool ignoreSneakAttack);
	uint8   GetBlockRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    uint8   GetParryRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    uint8   GetGuardRate(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	float	GetDamageRatio(CBattleEntity* PAttacker, CBattleEntity* PDefender, bool isCritical); 
    uint16  TakeMagicDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	uint16	TakePhysicalDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, int16 damage, bool isBlocked, uint8 slot, uint16 tpMultiplier, CBattleEntity* taChar); 
    uint16  TakeSkillchainDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint16 lastSkillDamage);
	uint32  MagicCalculateCure(CBattleEntity* PCaster, CBattleEntity* PTarget, CSpell* PSpell, int8 targetNumber, CZone* PZone);
	bool    SingSong(CBattleEntity* PCaster,CBattleEntity* PTarget,CSpell* PSpell);
	bool    IsParried(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    bool    IsGuarded(CBattleEntity* PAttacker, CBattleEntity* PDefender);
    bool    IsBlocked(CBattleEntity* PAttacker, CBattleEntity* PDefender);

	float   GetRangedPDIF(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	void    HandleRangedAdditionalEffect(CCharEntity* PAttacker, CBattleEntity* PDefender,apAction_t* Action);
	void    HandleEnspell(CCharEntity* PAttacker, CBattleEntity* PDefender,apAction_t* Action, uint8 hitNumber);
	uint8	GetRangedHitRate(CBattleEntity* PAttacker, CBattleEntity* PDefender); 
	uint16	CalculateEnspellDamage(CBattleEntity* PAttacker, CBattleEntity* PDefender, uint8 Tier, uint8 element); 

    uint8	GetEnmityMod(uint8 level, uint8 modType);
	bool	Enfeeble(CBattleEntity* PCaster, CBattleEntity* PDefender, EFFECT Effect);
	void	MoveTo(CBattleEntity* PEntity, position_t pos, uint8 mode);
	bool	isValidSelfTargetWeaponskill(int wsid);
	bool	TryInterruptSpell(CBattleEntity* PAttacker, CBattleEntity* PDefender);
	float	CalculateBaseTP(int delay, int stp);

    CItemWeapon* GetEntityWeapon(CBattleEntity* PEntity, SLOTTYPE Slot);
    CItemArmor* GetEntityArmor(CBattleEntity* PEntity, SLOTTYPE Slot);

    void MakeEntityStandUp(CBattleEntity* PEntity);
    bool IsEngauged(CBattleEntity* PEntity);
	CBattleEntity* getAvailableTrickAttackChar(CBattleEntity* taUser, CBattleEntity* PMob);
    bool HasNinjaTool(CBattleEntity* PEntity, CSpell* PSpell, bool ConsumeTool);
};

#endif