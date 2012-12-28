-----------------------------------
--	[Command name]: give item to player
--	[Author      ]: link
--	[Description ]: will give item to player
--
--	(@giveitem Link 17440) will give link 1 kraken club
--	(@giveitem Link 1179 99) will give link 99x shihei
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,target,itemID,quantity)

	pc = GetPlayerByName(target);

	if (pc:getFreeSlotsCount() == 0) then 
		pc:messageSpecial(ITEM_CANNOT_BE_OBTAINED,itemID);
	else 
		pc:addItem(itemID,quantity);
		pc:messageSpecial(ITEM_OBTAINED,itemID);
	end

end;