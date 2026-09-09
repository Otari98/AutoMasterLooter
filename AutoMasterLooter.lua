-- Rares and epics that are subject to autoloot. [itemID] = "nickname (does nothing)"
local LootedItems = {
	-- Beasts Deck
	[19227] = "Ace of Beasts",
	[19230] = "Two of Beasts",
	[19231] = "Three of Beasts",
	[19232] = "Four of Beasts",
	[19233] = "Five of Beasts",
	[19234] = "Six of Beasts",
	[19235] = "Seven of Beasts",
	[19236] = "Eight of Beasts",
	-- Warlords Deck
	[19258] = "Ace of Warlords",
	[19259] = "Two of Warlords",
	[19260] = "Three of Warlords",
	[19261] = "Four of Warlords",
	[19262] = "Five of Warlords",
	[19263] = "Six of Warlords",
	[19264] = "Seven of Warlords",
	[19265] = "Eight of Warlords",
	-- Portals Deck
	[19276] = "Ace of Portals",
	[19278] = "Two of Portals",
	[19279] = "Three of Portals",
	[19280] = "Four of Portals",
	[19281] = "Five of Portals",
	[19282] = "Six of Portals",
	[19283] = "Seven of Portals",
	[19284] = "Eight of Portals",
	-- Elementals Deck
	[19268] = "Ace of Elementals",
	[19269] = "Two of Elementals",
	[19270] = "Three of Elementals",
	[19271] = "Four of Elementals",
	[19272] = "Five of Elementals",
	[19273] = "Six of Elementals",
	[19274] = "Seven of Elementals",
	[19275] = "Eight of Elementals",
	-- Misc
	[18335] = "Pristine Black Diamond",
	[15410] = "Scale of Onyxia",
	[12607] = "Brilliant Chromatic Scale",
	[83572] = "Grimoire of Demon Gate",
	-- NAXX
	[22376] = "Wartorn Cloth Scrap",
	[22373] = "Wartorn Leather Scrap",
	[22374] = "Wartorn Chain Scrap",
	[22375] = "Wartorn Plate Scrap",
	[22682] = "Frozen Rune",
	-- AQ40
	[20877] = "Idol of the Sage",
	[20879] = "Idol of Life",
	[20878] = "Idol of Rebirth",
	[20874] = "Idol of the Sun",
	[20876] = "Idol of Death",
	[20882] = "Idol of War",
	[20881] = "Idol of Strife",
	[20875] = "Idol of Night",
	-- BWL
	[18562] = "Elementium Ore",
	-- ZG
	[19708] = "Blue Hakkari Bijou",
	[19710] = "Orange Hakkari Bijou",
	[19712] = "Purple Hakkari Bijou",
	[19714] = "Silver Hakkari Bijou",
	[19707] = "Red Hakkari Bijou",
	[19709] = "Yellow Hakkari Bijou",
	[19711] = "Green Hakkari Bijou",
	[19713] = "Bronze Hakkari Bijou",
	[19715] = "Gold Hakkari Bijou",
	-- AQ20
	[20859] = "Gold Scarab",
	[20861] = "Bronze Scarab",
	[20863] = "Clay Scarab",
	[20865] = "Ivory Scarab",
	[20858] = "Stone Scarab",
	[20860] = "Silver Scarab",
	[20862] = "Crystal Scarab",
	[20864] = "Bone Scarab",
	[20867] = "Onyx Idol",
	[20869] = "Amber Idol",
	[20871] = "Obsidian Idol",
	[20873] = "Alabaster Idol",
	[20870] = "Jasper Idol",
	[20868] = "Lambent Idol",
	[20872] = "Vermillion Idol",
	[20866] = "Azure Idol",
	-- ES
	[61197] = "Fading Dream Fragment",
	-- MC
	[17203] = "Sulfuron Ingot",
	[17011] = "Lava Core",
	[17010] = "Fiery Core",
	-- [16817] = "Girdle of Prophecy",
	-- [16819] = "Vambraces of Prophecy",
	-- [16825] = "Nightslayer Bracelets",
	-- [16827] = "Nightslayer Belt",
	-- [16851] = "Giantstalker's Belt",
	-- [16850] = "Giantstalker's Bracers",
	-- [16857] = "Lawbringer Bracers",
	-- [16858] = "Lawbringer Belt",
	-- [16861] = "Bracers of Might",
	-- [16864] = "Belt of Might",
	-- [16799] = "Arcanist Bindings",
	-- [16802] = "Arcanist Belt",
	-- [16804] = "Felheart Bracers",
	-- [16806] = "Felheart Belt",
	-- [16828] = "Cenarion Belt",
	-- [16830] = "Cenarion Bracers",
	-- [16840] = "Earthfury Bracers",
	-- [16838] = "Earthfury Belt",
}
-- Whites and greens that are excluded from autoloot.
local ExcludedItems = {
	[81283] = "Mr. Bigglesworth",
	[51217] = "Fashion Coin",
	[17966] = "Onyxia Hide Backpack",
	[16665] = "Tome of Tranquilizing Shot",
	[19939] = "Gri'lek's Blood",
	[19940] = "Renataki's Tooth",
	[51739] = "Little Ball of Spider Web",
	[19942] = "Hazza'rah's Dream Thread",
	[19941] = "Wushoolay's Mane",
	[54001] = "Dream Frog",
	[37006] = "Skitterweb Hatchling",
	[37009] = "Cavernweb Hatchling",
	[37010] = "Razzashi Hatchling",
	[37011] = "Araxxna's Hatchling",
	[37012] = "Maexxna's Hatchling",
}

local function GiveAllLoot(name)
	if not name then return false end
	for i = 1, 40 do
		if strlower(GetMasterLootCandidate(i) or "") == strlower(name) then
			for slot = 1, GetNumLootItems() do
				local lootIcon, lootName, lootQuantity, quality = GetLootSlotInfo(slot)
				local link = GetLootSlotLink(slot)
				local _, _, itemID = strfind(link or "", "item:(%d+)")
				itemID = tonumber(itemID)
				if itemID then
					if quality < 3 then
						if not ExcludedItems[itemID] then
							GiveMasterLoot(slot, i)
						end
					else
						if LootedItems[itemID] then
							GiveMasterLoot(slot, i)
						end
					end
				end
			end
			return true
		end
	end
	return false
end

local function OnEvent()
	if event == "PLAYER_LOGIN" then
		AUTOML_ENABLED = AUTOML_ENABLED == nil and true or AUTOML_ENABLED
		AUTOML_RECIEVER = AUTOML_RECIEVER == nil and UnitName("player") or AUTOML_RECIEVER
		DEFAULT_CHAT_FRAME:AddMessage(format("AutoMasterLooter is %s, type %s to toggle.", AUTOML_ENABLED and GREEN_FONT_COLOR_CODE.."ON|r" or GRAY_FONT_COLOR_CODE.."OFF|r", SLASH_AUTOMASTERLOOTER1))
		DEFAULT_CHAT_FRAME:AddMessage(format("AutoMasterLooter loot will be sent to %s, type %s <player_name> to change it.", GREEN_FONT_COLOR_CODE..AUTOML_RECIEVER.."|r", SLASH_AUTOMASTERLOOTER1))
	elseif event == "LOOT_OPENED" then
		local lootmethod, masterlooterID = GetLootMethod()
		-- Only run if the player is the masterlooter.
		if not (masterlooterID == 0 and AUTOML_ENABLED) then
			return
		end
		if not GiveAllLoot(AUTOML_RECIEVER) then
			GiveAllLoot(UnitName("player"))
		end
	end
end

local frame = CreateFrame("Frame", "AutoMasterLooterFrame" , UIParent)
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("LOOT_OPENED")
frame:SetScript("OnEvent", OnEvent)

SLASH_AUTOMASTERLOOTER1 = "/automl"

SlashCmdList.AUTOMASTERLOOTER = function(msg)
	if msg and msg ~= "" then
		AUTOML_RECIEVER = msg
		DEFAULT_CHAT_FRAME:AddMessage("AutoMasterLooter loot will be sent to "..msg..".")
	else
		AUTOML_ENABLED = not AUTOML_ENABLED
		DEFAULT_CHAT_FRAME:AddMessage("AutoMasterLooter "..(AUTOML_ENABLED and GREEN_FONT_COLOR_CODE.."ON|r" or GRAY_FONT_COLOR_CODE.."OFF|r"))
	end
end
