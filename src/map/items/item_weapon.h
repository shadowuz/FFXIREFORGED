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

#ifndef _CITEMWEAPON_H
#define _CITEMWEAPON_H

#include "../../common/cbasetypes.h"

#include "item_armor.h"


class CItemWeapon : public CItemArmor
{
public:

	CItemWeapon(uint16);
	virtual ~CItemWeapon();

	uint8	getSkillType();
	uint16	getDelay();
	uint16	getDamage();
	uint16	getDmgType();

    bool    isTwoHanded();

	void	setSkillType(uint8 skillType);
	void	setDelay(uint16 delay);
	void	setDamage(uint16 damage);
	void	setDmgType(uint16 dmgType);
	
private:

	uint8	m_skillType;
	uint16	m_damage;
	uint16	m_delay;
	uint16	m_dmgType;
    bool    m_twoHanded;
};

#endif