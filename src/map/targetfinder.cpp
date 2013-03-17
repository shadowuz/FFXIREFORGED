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

#include "battleentity.h"
#include "charentity.h"
#include "packets/action.h"
#include "alliance.h"
#include <math.h>
#include "../common/mmo.h"

#include "packets/action.h"

#include "targetfinder.h"

CTargetFinder::CTargetFinder(CBattleEntity* PBattleEntity)
{
  m_PBattleEntity = PBattleEntity;
  m_radius = 0.0f;
  m_zone = 0;
  m_conal = false;
  m_PRadiusAround = NULL;
  m_PTarget = NULL;
  m_PMasterTarget = NULL;
  m_PAction = NULL;
}

void CTargetFinder::reset(apAction_t* PAction)
{
  m_PAction = PAction;
  m_PBattleEntity->m_ActionList.clear();
  m_conal = false;
  m_radius = 0.0f;
  m_zone = 0;
  m_APoint = NULL;
  m_PRadiusAround = NULL;
  m_PTarget = NULL;
  m_PMasterTarget = NULL;
}

void CTargetFinder::findSingleTarget(CBattleEntity* PTarget)
{
  m_radius = 999.0f;
  m_zone = m_PBattleEntity->getZone();
  m_PTarget = NULL;

  addEntity(PTarget, false);
}

void CTargetFinder::findWithinArea(CBattleEntity* PTarget, AOERADIUS radiusType, float radius)
{
  m_radius = radius;
  m_zone = m_PBattleEntity->getZone();

  if(radiusType == AOERADIUS_ATTACKER){
    m_PRadiusAround = &m_PBattleEntity->loc.p;
  } else {
    // radius around target
    m_PRadiusAround = &PTarget->loc.p;
  }

  // get master to properly handle loops
  m_PMasterTarget = findMaster(PTarget);

  // no not include pets if this AoE is a buff spell
  // this is a buff because i'm targetting my self
  bool withPet = PETS_CAN_AOE_BUFF || (m_PMasterTarget->objtype != m_PBattleEntity->objtype);

  // always add original target first
  addEntity(PTarget, false); // pet will be added later

  m_PTarget = PTarget;

  if(isPlayer()){
    // handle this as a player

    if(m_PMasterTarget->objtype == TYPE_MOB)
    {
      // special case to add all mobs in range
      addAllInMobList(m_PMasterTarget, withPet);

    } else {

      // players will never need to add whole alliance

      if(m_PMasterTarget->PParty != NULL)
      {
        // add party members
        addAllInParty(m_PMasterTarget, withPet);
      } else {
        // just add myself
        addEntity(m_PMasterTarget, withPet);
      }
    }

  } else {

    // handle this as a mob
    if(m_PMasterTarget->PParty != NULL)
    {
      if(m_PMasterTarget->PParty->m_PAlliance != NULL)
      {
        addAllInAlliance(m_PMasterTarget, withPet);
      } else {
        // all party instead
        addAllInParty(m_PMasterTarget, withPet);
      }
    } else {
      addEntity(m_PMasterTarget, withPet);
    }

  }

}

void CTargetFinder::findWithinCone(CBattleEntity* PTarget, float distance, float angle)
{
  m_conal = true;

  // TODO: a point should be based on targets position
  m_APoint = &m_PBattleEntity->loc.p;

  float halfAngle = angle / 2.0f;

  float rightAngle = (1 - ((float)m_APoint->rotation + halfAngle) / 255) * 6.28318f;
  float leftAngle = (1 - ((float)m_APoint->rotation - halfAngle) / 255) * 6.28318f;

  // calculate end points for triangle
  m_BPoint.x = cosf(rightAngle) * distance + m_APoint->x;
  m_BPoint.z = sinf(rightAngle) * distance + m_APoint->z;

  m_CPoint.x = cosf(leftAngle) * distance + m_APoint->x;
  m_CPoint.z = sinf(leftAngle) * distance + m_APoint->z;

  // ShowDebug("angle %f, rotation %f, distance %f, A (%f, %f) B (%f, %f) C (%f, %f)\n", angle, rightAngle, distance, m_APoint->x, m_APoint->z, m_BPoint.x, m_BPoint.z, m_CPoint.x, m_CPoint.z);
  // ShowDebug("Target: (%f, %f)\n", PTarget->loc.p.x, PTarget->loc.p.z);

  // precompute for next stage
  m_BPoint.x = m_BPoint.x - m_APoint->x;
  m_BPoint.z = m_BPoint.z - m_APoint->z;

  m_CPoint.x = m_CPoint.x - m_APoint->x;
  m_CPoint.z = m_CPoint.z - m_APoint->z;

  // calculate scalar
  m_scalar = (m_BPoint.x * m_CPoint.z) - (m_BPoint.z * m_CPoint.x);

  findWithinArea(PTarget, AOERADIUS_ATTACKER, distance);
}

void CTargetFinder::addAllInMobList(CBattleEntity* PTarget, bool withPet)
{
  CCharEntity* PChar = (CCharEntity*)m_PBattleEntity;
  CBattleEntity* PBattleTarget = NULL;

  for (SpawnIDList_t::const_iterator it = PChar->SpawnMOBList.begin();  it != PChar->SpawnMOBList.end(); ++it)
  {
    PBattleTarget = (CBattleEntity*)it->second;

    if(isMobOwner(PBattleTarget)){
      addEntity(PBattleTarget, withPet);
    }

  }
}

void CTargetFinder::addAllInAlliance(CBattleEntity* PTarget, bool withPet)
{
  CParty* party = NULL;

  for(uint16 i = 0; i < PTarget->PParty->m_PAlliance->partyList.size(); i++)
  {
    party = PTarget->PParty->m_PAlliance->partyList.at(i);

    for(uint16 p = 0; p < party->members.size(); p++)
    {

      addEntity(party->members.at(p), withPet);

    }
  }
}

void CTargetFinder::addAllInParty(CBattleEntity* PTarget, bool withPet)
{

  CParty* party = PTarget->PParty;

  // don't cache the party size!
  for(uint16 p = 0; p < party->members.size(); p++)
  {

    addEntity(party->members.at(p), withPet);

  }

}

void CTargetFinder::addEntity(CBattleEntity* PTarget, bool withPet)
{
  if(validEntity(PTarget)){

    m_PAction->ActionTarget = PTarget;

    m_PBattleEntity->m_ActionList.push_back(*m_PAction);
  }

  // add my pet too, if its allowed
  if(withPet && PTarget->PPet != NULL && validEntity(PTarget->PPet))
  {
    m_PAction->ActionTarget = PTarget->PPet;
    m_PBattleEntity->m_ActionList.push_back(*m_PAction);
  }

}

CBattleEntity* CTargetFinder::findMaster(CBattleEntity* PTarget)
{
  if(PTarget->objtype == TYPE_PET || PTarget->objtype == TYPE_MOB)
  {
    if(PTarget->PMaster != NULL){
      return PTarget->PMaster;
    }
  }
  return PTarget;
}

bool CTargetFinder::isMobOwner(CBattleEntity* PTarget)
{
if (PTarget->m_OwnerID.id == 0 || PTarget->m_OwnerID.id == m_PBattleEntity->id)
  {
    return true;
  }

  CCharEntity* PChar = (CCharEntity*)m_PBattleEntity;

  if (PChar->PParty != NULL)
  {
    if (PChar->PParty->m_PAlliance != NULL)
    {
      for (uint8 a = 0; a < PChar->PParty->m_PAlliance->partyList.size(); ++a)
      {
        for (uint8 i = 0; i < PChar->PParty->m_PAlliance->partyList.at(a)->members.size(); ++i)
        {
          if (PChar->PParty->m_PAlliance->partyList.at(a)->members[i]->id == PTarget->m_OwnerID.id)
          {
            return true;
          }
        }
      }
    }
        else //no alliance
        {
      for (uint8 i = 0; i < PChar->PParty->members.size(); ++i)
      {
        if (PChar->PParty->members[i]->id == PTarget->m_OwnerID.id)
        {
          return true;
        }
      }
    }
  }
  return false;
}

bool CTargetFinder::validEntity(CBattleEntity* PTarget)
{

  // make sure i'm not over limit
  if(m_PBattleEntity->m_ActionList.size() >= MAX_AOE_TARGETS) return false;

  if (PTarget->isDead() || PTarget->getZone() != m_zone)
  {
    return false;
  }

  // this is first target, always add him
  if(m_PTarget == NULL)
  {
    return true;
  }

  // check placement
  // force first target to be added
  // this will be removed when conal targetting is polished
  if(m_conal && isWithinCone(PTarget))
  {
    return true;
  }
  else if(isWithinArea(PTarget))
  {
    return true;
  }

  return false;
}

bool CTargetFinder::isPlayer()
{
  if(m_PBattleEntity->objtype == TYPE_PC) return true;

  // check if i'm owned by a pc
  return m_PBattleEntity->PMaster != NULL && m_PBattleEntity->PMaster->objtype;
}

bool CTargetFinder::isWithinArea(CBattleEntity* PTarget)
{
   return distance(*m_PRadiusAround, PTarget->loc.p) <= m_radius;
}

bool CTargetFinder::isWithinCone(CBattleEntity* PTarget)
{

  position_t PPoint;

  // holds final weight
  position_t WPoint;

  // move origin to one vertex
  PPoint.x = PTarget->loc.p.x - m_APoint->x;
  PPoint.z = PTarget->loc.p.z - m_APoint->z;

  WPoint.x = (PPoint.x * (m_BPoint.z - m_CPoint.z) + PPoint.z * (m_CPoint.x - m_BPoint.x) + m_BPoint.x * m_CPoint.z - m_CPoint.x * m_BPoint.z) / m_scalar;

  WPoint.y = (PPoint.x * m_CPoint.z - PPoint.z * m_CPoint.x) / m_scalar;
  WPoint.z = (PPoint.z * m_BPoint.x - PPoint.x * m_BPoint.z) / m_scalar;

  // ShowDebug("A %f, B %f, C %f\n", WPoint.x, WPoint.y, WPoint.z);

  if(WPoint.x < 0 || WPoint.x > 1)
  {
    return false;
  }

  if(WPoint.y < 0 || WPoint.y > 1)
  {
    return false;
  }

  if(WPoint.z < 0 || WPoint.z > 1)
  {
    return false;
  }

  return true;
}

bool CTargetFinder::isWithinRange(CBattleEntity* PTarget, float range)
{
   return distance(m_PBattleEntity->loc.p, PTarget->loc.p) <= range;
}