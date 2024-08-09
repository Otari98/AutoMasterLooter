-- Events
AutoMasterLooter = CreateFrame("Frame","AutoMasterLooter",UIParent)
AutoMasterLooter:RegisterEvent("PLAYER_ENTERING_WORLD")
AutoMasterLooter:RegisterEvent("LOOT_OPENED")
AutoMasterLooter:SetScript("OnEvent", function() OpenLoot_OnEvent(event, arg1) end)

-- Rares and epics that are subject to autoloot. ["exact ingame name of the item"] = "nickname (does nothing)"
LootedItemsTable = {}
--Beasts Deck
LootedItemsTable["Ace of Beasts"] = "Ace of Beasts"
LootedItemsTable["Two of Beasts"] = "Two of Beasts"
LootedItemsTable["Three of Beasts"] = "Three of Beasts"
LootedItemsTable["Four of Beasts"] = "Four of Beasts"
LootedItemsTable["Five of Beasts"] = "Five of Beasts"
LootedItemsTable["Six of Beasts"] = "Six of Beasts"
LootedItemsTable["Seven of Beasts"] = "Seven of Beasts"
LootedItemsTable["Eight of Beasts"] = "Eight of Beasts"
--Warlords Deck
LootedItemsTable["Ace of Warlords"] = "Ace of Warlords"
LootedItemsTable["Two of Warlords"] = "Two of Warlords"
LootedItemsTable["Three of Warlords"] = "Three of Warlords"
LootedItemsTable["Four of Warlords"] = "Four of Warlords"
LootedItemsTable["Five of Warlords"] = "Five of Warlords"
LootedItemsTable["Six of Warlords"] = "Six of Warlords"
LootedItemsTable["Seven of Warlords"] = "Seven of Warlords"
LootedItemsTable["Eight of Warlords"] = "Eight of Warlords"
--Portals Deck
LootedItemsTable["Ace of Portals"] = "Ace of Portals"
LootedItemsTable["Two of Portals"] = "Two of Portals"
LootedItemsTable["Three of Portals"] = "Three of Portals"
LootedItemsTable["Four of Portals"] = "Four of Portals"
LootedItemsTable["Five of Portals"] = "Five of Portals"
LootedItemsTable["Six of Portals"] = "Six of Portals"
LootedItemsTable["Seven of Portals"] = "Seven of Portals"
LootedItemsTable["Eight of Portals"] = "Eight of Portals"
--Elementals Deck
LootedItemsTable["Ace of Elementals"] = "Ace of Elementals"
LootedItemsTable["Two of Elementals"] = "Two of Elementals"
LootedItemsTable["Three of Elementals"] = "Three of Elementals"
LootedItemsTable["Four of Elementals"] = "Four of Elementals"
LootedItemsTable["Five of Elementals"] = "Five of Elementals"
LootedItemsTable["Six of Elementals"] = "Six of Elementals"
LootedItemsTable["Seven of Elementals"] = "Seven of Elementals"
LootedItemsTable["Eight of Elementals"] = "Eight of Elementals"
--Misc
LootedItemsTable["Pristine Black Diamond"] = "Pristine Black Diamond"
LootedItemsTable["Scale of Onyxia"] = "Scale of Onyxia"
LootedItemsTable["Brilliant Chromatic Scale"] = "Brilliant Chromatic Scale"
--NAXX
LootedItemsTable["Wartorn Plate Scrap"] = "Plate scrap"
LootedItemsTable["Wartorn Chain Scrap"] = "Mail Scrap"
LootedItemsTable["Wartorn Leather Scrap"] = "leather Scrap"
LootedItemsTable["Wartorn Cloth Scrap"] = "Cloth Scrap"
LootedItemsTable["Frozen Rune"] = "Frozen Rune"
--AQ40
LootedItemsTable["Idol of Death"] = "Idol of Death"
LootedItemsTable["Idol of Life"] = "Idol of Life"
LootedItemsTable["Idol of Night"] = "Idol of Night"
LootedItemsTable["Idol of Rebirth"] = "Idol of Rebirth"
LootedItemsTable["Idol of Strife"] = "Idol of Strife"
LootedItemsTable["Idol of War"] = "Idol of War "
LootedItemsTable["Idol of the Sage"] = "Idol of the Sage "
LootedItemsTable["Idol of the Sun"] = "Idol of the Sun"
--BWL
LootedItemsTable["Elementium Ore"] = "Elementium Ore"
--ZG
LootedItemsTable["Gold Hakkari Bijou"] = "Gold Hakkari Bijou"
LootedItemsTable["Purple Hakkari Bijou"] = "Purple Hakkari Bijou"
LootedItemsTable["Red Hakkari Bijou"] = "Red Hakkari Bijou"
LootedItemsTable["Green Hakkari Bijou"] = "Green Hakkari Bijou"
LootedItemsTable["Bronze Hakkari Bijou"] = "Bronze Hakkari Bijou"
LootedItemsTable["Silver Hakkari Bijou"] = "Silver Hakkari Bijou"
LootedItemsTable["Yellow Hakkari Bijou"] = "Yellow Hakkari Bijou"
LootedItemsTable["Orange Hakkari Bijou"] = "Orange Hakkari Bijou"
LootedItemsTable["Blue Hakkari Bijou"] = "Blue Hakkari Bijou"
--AQ20
LootedItemsTable["Clay Scarab"] = "Clay Scarab"
LootedItemsTable["Stone Scarab"] = "Stone Scarab"
LootedItemsTable["Gold Scarab"] = "Gold Scarab"
LootedItemsTable["Silver Scarab"] = "Silver Scarab"
LootedItemsTable["Bronze Scarab"] = "Bronze Scarab"
LootedItemsTable["Bone Scarab"] = "Bone Scarab"
LootedItemsTable["Crystal Scarab"] = "Crystal Scarab"
LootedItemsTable["Ivory Scarab"] = "Ivory Scarab"
LootedItemsTable["Alabaster Idol"] = "Alabaster Idol"
LootedItemsTable["Amber Idol"] = "Amber Idol"
LootedItemsTable["Azure Idol"] = "Azure Idol"
LootedItemsTable["Jasper Idol"] = "Jasper Idol"
LootedItemsTable["Lambent Idol"] = "Lambent Idol"
LootedItemsTable["Obsidian Idol"] = "Obsidian Idol"
LootedItemsTable["Onyx Idol"] = "Onyx Idol"
LootedItemsTable["Vermillion Idol"] = "Vermillion Idol"
--ES
LootedItemsTable["Fading Dream Fragment"] = "Fading Dream Fragment"
--MC
LootedItemsTable["Fiery Core"] = "Fiery Core"
LootedItemsTable["Lava Core"] = "Lava Core"
LootedItemsTable["Sulfuron Ingot"] = "Sulfuron Ingot"
LootedItemsTable["Vambraces of Prophecy"] = "Vambraces of Prophecy"
LootedItemsTable["Girdle of Prophecy"] = "Girdle of Prophecy"
LootedItemsTable["Earthfury Bracers"] = "Earthfury Bracers"
LootedItemsTable["Earthfury Belt"] = "Earthfury Belt"
LootedItemsTable["Lawbringer Bracers"] = "Lawbringer Bracers"
LootedItemsTable["Lawbringer Belt"] = "Lawbringer Belt"
LootedItemsTable["Nightslayer Bracelets"] = "Nightslayer Bracelets"
LootedItemsTable["Nightslayer Belt"] = "Nightslayer Belt"
LootedItemsTable["Giantstalker's Bracers"] = "Giantstalker's Bracers"
LootedItemsTable["Giantstalker's Belt"] = "Giantstalker's Belt"
LootedItemsTable["Felheart Bracers"] = "Felheart Bracers"
LootedItemsTable["Felheart Belt"] = "Felheart Belt"
LootedItemsTable["Cenarion Bracers"] = "Cenarion Bracers"
LootedItemsTable["Cenarion Belt"] = "Cenarion Belt"
LootedItemsTable["Bracers of Might"] = "Bracers of Might"
LootedItemsTable["Belt of Might"] = "Belt of Might"
LootedItemsTable["Arcanist Bindings"] = "Arcanist Bindings"
LootedItemsTable["Arcanist Belt"] = "Arcanist Belt"

-- Whites and greens that are excluded from autoloot.
ExcludedItemsTable = {}
ExcludedItemsTable["Tome of Tranquilizing Shot"] = "Tranq Shot book"
ExcludedItemsTable["Hazza'rah's Dream Thread"] = "Hazzarah"
ExcludedItemsTable["Gri'lek's Blood"] = "Grilek"
ExcludedItemsTable["Wushoolay's Mane"] = "Wushoolay"
ExcludedItemsTable["Renataki's Tooth"] = "Renataki"
ExcludedItemsTable["Mr. Bigglesworth"] = "KT cat"
ExcludedItemsTable["Onyxia Hide Backpack"] = "Ony bag"
ExcludedItemsTable["Dream Frog"] = "ES pet"
ExcludedItemsTable["Little Ball of Spider Web"] = "Overseer pet"
ExcludedItemsTable["Fashion Coin"] = "Fashion Coin"

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

SLASH_AUTOMASTERLOOTER1 = '/automasterlooter'
SLASH_AUTOMASTERLOOTER2 = '/automl'
SLASH_AUTOMASTERLOOTER3 = '/automasterloot'
SlashCmdList.AUTOMASTERLOOTER = AutoMasterLooterSwitch

function OpenLoot_OnEvent()
	lootmethod, masterlooterID = GetLootMethod()
	if masterlooterID == 0 and AutoMasterLooter == 1 then -- Only run if the player is the masterlooter.
		local announcestring = "Epic inside! " -- Generate announce message
		for looterindex = 1, 40 do
			if (GetMasterLootCandidate(looterindex) == UnitName("player")) then
				for lootedindex = 1, GetNumLootItems() do
					lootIcon, lootName, lootQuantity, rarity = GetLootSlotInfo(lootedindex)
					if rarity == 4 and lootName ~= "Elementium Ore" then
						announcestring = announcestring..lootName.." ! " -- Add any found epics to the announce message. Except Elementium Ore, because it's automatically looted to the player.
					end 
					if rarity < 3 then
						local IsExcludedItem = 0
						for ExcludedTableName,ExcludedTableAnnounce in pairs(ExcludedItemsTable) do			
							if ExcludedTableName == lootName then
								IsExcludedItem = 1 -- Found a white/green item that shouldn't be masterlooted
							elseif next(ExcludedItemsTable,ExcludedTableName) == nil and IsExcludedItem == 0 then
								GiveMasterLoot(lootedindex, looterindex) -- If we went through all the items that should be excluded and none of them matched, loot the item.
							end
						end
					else
						for LootTableName,LootTableAnnounce in pairs(LootedItemsTable) do
							if LootTableName == lootName or rarity <3 then
								GiveMasterLoot(lootedindex, looterindex) -- loot item if it's gray/white/green/listed blue
							end
						end
					end
				end
			end
		end
		if announcestring ~= "Epic inside! " then
			DEFAULT_CHAT_FRAME:AddMessage(announcestring) -- Announce the message if any epics were added into it.
			PlaySound("AuctionWindowClose") -- Play a warning sound. I chose auction house close, you can choose any sound you want from https://wowwiki-archive.fandom.com/wiki/API_PlaySound?oldid=313344 
		end
	end
end
