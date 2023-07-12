-- Events
AutoMasterLooter = CreateFrame("Frame","AutoMasterLooter",UIParent)
AutoMasterLooter:RegisterEvent("PLAYER_ENTERING_WORLD");
AutoMasterLooter:RegisterEvent("LOOT_OPENED");
AutoMasterLooter:SetScript("OnEvent", function() OpenLoot_OnEvent(event, arg1) end)

-- Rares and epics that are subject to autoloot. ["exact ingame name of the item"] = "nickname (does nothing)"
LootedItemsTable = {}
LootedItemsTable["Wartorn Plate Scrap"] = "Plate scrap"
LootedItemsTable["Wartorn Chain Scrap"] = "Mail Scrap"
LootedItemsTable["Wartorn Leather Scrap"] = "leather Scrap"
LootedItemsTable["Wartorn Cloth Scrap"] = "Cloth Scrap"
LootedItemsTable["Idol of Death"] = "Idol of Death"
LootedItemsTable["Idol of Life"] = "Idol of Life"
LootedItemsTable["Idol of Night"] = "Idol of Night"
LootedItemsTable["Idol of Rebirth"] = "Idol of Rebirth"
LootedItemsTable["Idol of Strife"] = "Idol of Strife"
LootedItemsTable["Idol of War"] = "Idol of War "
LootedItemsTable["Idol of the Sage"] = "Idol of the Sage "
LootedItemsTable["Idol of the Sun"] = "Idol of the Sun"
LootedItemsTable["Elementium Ore"] = "Elementium Ore"

local AutoMasterLooter = 0

function AutoMasterLooterSwitch(cmd)
	if AutoMasterLooter == 0 then
		DEFAULT_CHAT_FRAME:AddMessage("AutoMasterLooter |cffFF0000ON")
		AutoMasterLooter = 1
	else
		DEFAULT_CHAT_FRAME:AddMessage("AutoMasterLooter |cffFF0000OFF")
		AutoMasterLooter = 0
	end
end

SLASH_AUTOMASTERLOOTER1 = '/AutoMasterLooter'
SLASH_AUTOMASTERLOOTER2 = '/automasterlooter'
SLASH_AUTOMASTERLOOTER3 = '/automl'
SLASH_AUTOMASTERLOOTER4 = '/autoML'
SLASH_AUTOMASTERLOOTER5 = '/AutoML'
SLASH_AUTOMASTERLOOTER5 = '/Automl'
SLASH_AUTOMASTERLOOTER6 = '/AutoMasterlooter'
SlashCmdList.AUTOMASTERLOOTER = AutoMasterLooterSwitch

function OpenLoot_OnEvent()
	lootmethod, masterlooterID = GetLootMethod() -- Only run if the player is the masterlooter.
	if masterlooterID == 0 and AutoMasterLooter == 1 then
		local announcestring = "Epic inside! " -- Generate announce message
		for looterindex = 1, 40 do
			if (GetMasterLootCandidate(looterindex) == UnitName("player")) then
				for lootedindex = 1, GetNumLootItems() do
					lootIcon, lootName, lootQuantity, rarity = GetLootSlotInfo(lootedindex)
					for LootTableName,LootTableAnnounce in pairs(LootedItemsTable) do
						if LootTableName == lootName or rarity <3 then -- loot item if it's gray/white/green/listed blue
							GiveMasterLoot(lootedindex, looterindex)
						end
					end
					if rarity == 4 and lootName ~= "Elementium Ore" then announcestring = announcestring..lootName.." ! " end -- Add any found epics to the announce message. Except Elementium Ore, because it's automatically looted to the player.
				end
			end
		end
		if announcestring ~= "Epic inside! " then -- Announce the message if any epics were added into it.
			DEFAULT_CHAT_FRAME:AddMessage(announcestring)
			PlaySound("AuctionWindowClose"); -- Play a warning sound. I choose auction house close, you can choose any sound you want from https://wowwiki-archive.fandom.com/wiki/API_PlaySound?oldid=313344 
		end
	end
end