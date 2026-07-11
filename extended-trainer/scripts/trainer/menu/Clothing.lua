WeaponList = {
    {
        name = "Military",
        desc = "",
		search = true,
        weapons = {
            {"P-9mm", "Items.9223372047058962365"},
            {"PX4 (WD1)", "Items.9223372048779332882"},
            {"1911", "Items.9223372047058962367"},
            {"Spec Ops 1911 (WD1)", "Items.12515250973962405321"},
            {"R-33 (WD1)", "Items.9223372048779332883"},
            {"D50 (WD1)", "Items.9223372048779332873"},
            {"MP412 (WD1)", "Items.9223372048779332871"},
            {"M8-M (WD1)", "Items.9223372048779332876"},
            {"MP-9mm (WD1)", "Items.9223372048779332901"},
            {"SMG-11", "Items.9223372047058962401"},
            {"Spec Ops SMG-11 (WD1)", "Items.11868950790208760770"},
            {"R-2000", "Items.9223372047058962400"},
            {"MP5 (WD1)", "Items.9223372048779332899"},
            {"M1 SMG (WD1)", "Items.9223372048779332896"},
            {"Vector 45 (WD1)", "Items.9223372048779332906"},
            {"SO Vector 45 (WD1)", "Items.9223372048779332907"},
            {"OCP-11", "Items.9223372047058962350"},
            {"AK-47", "Items.9223372047058962347"},
            {"416 (WD1)", "Items.9223372048779332850"},
            {"Wildfire (WD1)", "Items.9223372048779332851"},
            {"417 (WD1)", "Items.9223372048779332852"},
            {"Goblin", "Items.9223372047058962345"},
            {"Spec Ops Goblin (WD1)", "Items.11588178184283772220"},
            {"Gentleman's Piece (WD2E)", "Items.13237220995124715358"},
            {"ACR (WD1)", "Items.9223372048779332854"},
            {"Biometric Rifle (WD1)", "Items.9223372048779332856"},
            {"AC-AR (WD2E)", "Items.12109079359845502474"},
            {"U100", "Items.9223372047058962351"},
            {"D12 (WD1)", "Items.9223372048779332887"},
            {"SG590", "Items.9223372047058962389"},
            {"Piledriver (WD1)", "Items.9223372048779332894"},
            {"M1014 (WD1)", "Items.9223372048779332889"},
            {"SGR-12", "Items.9223372047058962388"},
            {"ATSG-12", "Items.9223372047058962386"},
            {"SVD", "Items.9223372047058962413"},
            {"SR25 (WD1)", "Items.9223372048779332916"},
            {"Spec Ops SR25 (WD1)", "Items.9223372048779332919"},
            {"ACE", "Items.9223372047058962411"},
            {"M107 (WD1)", "Items.9223372048779332911"},
            {"Destroyer (WD1)", "Items.9223372048779332913"},
            {"G106 (WD1)", "Items.9223372048779332865"},
            {"GL-94 (WD1)", "Items.9223372048779332867"},
            {"PML-6", "Items.9223372066571805241"},
        }
    },
    {
        name = "3D Printed",
        desc = "",
		search = true,
        weapons = {
            {"4N00bs Pistol", "Items.9223372047058962370"},
            {"Protocol Pistol", "Items.9223372056267743677"},
            {"4SS4SS1N Pistol (WD2E)", "Items.13780072824569081751"},
			{"Core Dump Pistol", "Items.9223372047058962709"},
            {"2Pr3cise Pistol (CUT)", "Items.9223372047058962449"},
			{"Help Desk Denial Pistol", "Items.9223372047058962710"},
			{"DOT_EXE Rifle", "Items.9223372047058962424"},
			{"DOT_FILE Rifle", "Items.9223372047058962425"},
			{"HHOS Rifle", "Items.9223372047058962428"},
			{"Zero Day Rifle", "Items.9223372047058962429"},
			{"DDoS Shotgun", "Items.9223372047058962458"},
			{"Goodbye, World Shotgun", "Items.9223372047058962459"},
			{"Bullet Hell Shotgun", "Items.9223372047058962457"},
			{"Spear Phish Sniper", "Items.9223372047058962466"},
            {"PR1M3_SH0T Sniper (WD2E)", "Items.9223372047058962467"},
			{"YourBoySerge Sniper", "Items.9223372047058962469"},
			{"/END Sniper", "Items.9223372047058962468"},
			{"WTB Stun Launcher", "Items.9223372047058962431"},
			{"CTRL-ALT-DEL Launcher", "Items.9223372047058962430"},
			{"Air Shotgun", "Items.9223372072984393620"},
            {"Air Shotgun Super (WD2E)", "Items.11632424190261489351"},
			{"Paintball Rifle", "Items.9223372072984393619"},
			{"Sniper Taser", "Items.9223372072984393621"},
            {"LTL U100 (WD2E)", "Items.13499608217070670853"},
        }
    },
}

function OpenGraphicKitModelMenu(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)

	local activeGraphicKitTable = tbl
	for k,v in pairsByKeys(tbl) do
		menu:AddButton(k, k, function(menu, text, hint, index) 
			ScriptHook.SetLocalPlayerGraphicKitModel(activeGraphicKitTable[text])
			ScriptHook.ShowNotification("Applied model  " .. text)
		end)
	end

	return menu
end

local GK_Categories = {
	"Generic",
    "Animals",
    "AFI",
    "Auntieshu",
    "Bodyguards",
    "Bratva",
    "CorruptCops",
    "Dedsec",
    "FBI",
    "GhostRidaz",
    "OPD",
    "SFPD",
    "Prime8",
    "Ragnarok",
    "T13",
    "Umeni",
    "Oakland",
    "SanFrancisco",
    "Ava",
    "Fla",
    "IOP",
    "Mis",
    "NPC",
    "POI",
    "NeiAlcatraz",
    "NeiBlume",
    "NeiCastro",
    "NeiChinatown",
    "NeiDocks",
    "NeiDowntown",
    "NeiDowntownWealthy",
    "NeiGalilei",
    "NeiGhetto",
    "NeiHaightashbury",
    "NeiIndustrial",
    "NeiInvite",
    "NeiMarina",
    "NeiMarin",
    "NeiMission",
    "NeiNatureBeach",
    "NeiNatureRecreational",
    "NeiNudle",
    "NeiSiliconValley",
    "NeiStanford",
    "NeiSwelterSkelter",
    "NeiTidis",
    "NeiWaterFront",
    "NeiWealthyOakland",
    "OCCDriver",
    "Marketing",
    "Debug"
}

function ChangeGraphicsKitMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Change your model")

	for _,name in pairsByKeys(GK_Categories) do
		menu:AddButton(name, Script():CacheMenu(function()
			return OpenGraphicKitModelMenu(name, GraphicKitModels[name])
		end))
	end

	return menu
end

function OpenGameClothingMenu()
    OpenMenuPage("UIMenuPageDB.9223372046350598820")
end

local function UnlockAllSongs()
	local playerID = GetLocalPlayerEntityId()
	ScriptHook.ShowNotification("Unlocked all songs")
     --Song.Bay_City_Pop.Culture_Club
	ExecuteReward_V2(playerID, "Items.14706078520596652381", 0)
     --Song.Bay_City_Pop.Duran_Duran
	ExecuteReward_V2(playerID, "Items.5451135471302519813", 0)
     --Song.Bay_City_Pop.Prayers
	ExecuteReward_V2(playerID, "Items.1691228284104873136", 0)
     --Song.Bay_City_Pop.Scott_McKenzie
	ExecuteReward_V2(playerID, "Items.7189798623253130554", 0)
     --Song.Bay_City_Pop.Skylar Spence
	ExecuteReward_V2(playerID, "Items.14933783499242910044", 0)
     --Song.Bay_City_Pop.Small Black
	ExecuteReward_V2(playerID, "Items.18174822333942559164", 0)
     --Song.DedSec_Pirate_Radio.DKMD
	ExecuteReward_V2(playerID, "Items.4943777722902536324", 0)
     --Song.DedSec_Pirate_Radio.LONE
	ExecuteReward_V2(playerID, "Items.18194417859532447776", 0)
     --Song.KCE_Centuries.Beethoven2
	ExecuteReward_V2(playerID, "Items.60066764437832008", 0)
     --Song.KCE_Centuries.Chopin
	ExecuteReward_V2(playerID, "Items.12825747998489422677", 0)
     --Song.KCE_Centuries.Chopin2
	ExecuteReward_V2(playerID, "Items.1630538516592861533", 0)
     --Song.KCE_Centuries.Faure
	ExecuteReward_V2(playerID, "Items.9819630199491645451", 0)
     --Song.KCE_Centuries.Haydn
	ExecuteReward_V2(playerID, "Items.5384202261446215844", 0)
     --Song.KCE_Centuries.Mozart2
	ExecuteReward_V2(playerID, "Items.15038575947068914789", 0)
     --Song.KCE_Centuries.Tchaikovsky
	ExecuteReward_V2(playerID, "Items.11503569806958028096", 0)
     --Song.KCE_Centuries.Vivaldi
	ExecuteReward_V2(playerID, "Items.2751796353841031873", 0)
     --Song.Las_Ondas_De_La_Ria.Anthony B
	ExecuteReward_V2(playerID, "Items.5789938167537226270", 0)
     --Song.Las_Ondas_De_La_Ria.Chivirico
	ExecuteReward_V2(playerID, "Items.1090123629060697279", 0)
     --Song.Las_Ondas_De_La_Ria.C-KAN_Calle
	ExecuteReward_V2(playerID, "Items.2963144388746305433", 0)
     --Song.Las_Ondas_De_La_Ria.C-KAN_UnPar
	ExecuteReward_V2(playerID, "Items.1353559727322301286", 0)
     --Song.Las_Ondas_De_La_Ria.Jungle Fire
	ExecuteReward_V2(playerID, "Items.13153930105499871306", 0)
     --Song.Las_Ondas_De_La_Ria.KC_And_The_Sunshine_Band
	ExecuteReward_V2(playerID, "Items.17508524586847820043", 0)
     --Song.Las_Ondas_De_La_Ria.Los_Rakas_Kalle
	ExecuteReward_V2(playerID, "Items.8947585291365500366", 0)
     --Song.Las_Ondas_De_La_Ria.Los_Rakas_Soy_Rakas
	ExecuteReward_V2(playerID, "Items.8452048275142146371", 0)
     --Song.Las_Ondas_De_La_Ria.Tony Rebel
	ExecuteReward_V2(playerID, "Items.6421999106116746433", 0)
     --Song.Radio_Bay_Nation.Cannonhead
	ExecuteReward_V2(playerID, "Items.17855934610085850437", 0)
     --Song.Radio_Bay_Nation.Casey Vedgies
	ExecuteReward_V2(playerID, "Items.15328403372166972380", 0)
     --Song.Radio_Bay_Nation.Dizzee Rascal
	ExecuteReward_V2(playerID, "Items.11760653592434957415", 0)
     --Song.Radio_Bay_Nation.Erik B and Rakim
	ExecuteReward_V2(playerID, "Items.5699670315527163748", 0)
     --Song.Radio_Bay_Nation.Naughty_By_Nature
	ExecuteReward_V2(playerID, "Items.14512635288487017842", 0)
     --Song.Radio_Bay_Nation.Outkast
	ExecuteReward_V2(playerID, "Items.3150851464592790085", 0)
     --Song.Radio_Bay_Nation.Pep Love
	ExecuteReward_V2(playerID, "Items.15672861721729551221", 0)
     --Song.Radio_Bay_Nation.Polish Ambassador
	ExecuteReward_V2(playerID, "Items.2673731017666953366", 0)
     --Song.Radio_Bay_Nation.PSA
	ExecuteReward_V2(playerID, "Items.9329807977767400076", 0)
     --Song.Radio_Bay_Nation.Shirt
	ExecuteReward_V2(playerID, "Items.18378115853252718060", 0)
     --Song.Radio_Bay_Nation.Tate Kobang
	ExecuteReward_V2(playerID, "Items.12423221095545121240", 0)
     --Song.Rock_The_Bridge.American Steel
	ExecuteReward_V2(playerID, "Items.5644807551050013402", 0)
     --Song.Rock_The_Bridge.Anti-Flag
	ExecuteReward_V2(playerID, "Items.16139123752262902636", 0)
     --Song.Rock_The_Bridge.Direct Hit!
	ExecuteReward_V2(playerID, "Items.3938955528589106978", 0)
     --Song.Rock_The_Bridge.Down And Outlaws
	ExecuteReward_V2(playerID, "Items.1530728283084127425", 0)
     --Song.Rock_The_Bridge.Good_Riddance
	ExecuteReward_V2(playerID, "Items.12710260315230020091", 0)
     --Song.Rock_The_Bridge.Judas_Priest
	ExecuteReward_V2(playerID, "Items.11563846155466230812", 0)
     --Song.Rock_The_Bridge.Lagwagon
	ExecuteReward_V2(playerID, "Items.9764192609987043373", 0)
     --Song.Rock_The_Bridge.Leatherface
	ExecuteReward_V2(playerID, "Items.13738826253926660499", 0)
     --Song.Rock_The_Bridge.Masked_Intruder
	ExecuteReward_V2(playerID, "Items.13706592610228075156", 0)
     --Song.Rock_The_Bridge.New Bomb Turks
	ExecuteReward_V2(playerID, "Items.1787338397326084940", 0)
     --Song.Rock_The_Bridge.No Use For A Name
	ExecuteReward_V2(playerID, "Items.16604585518481244662", 0)
     --Song.Rock_The_Bridge.Pears
	ExecuteReward_V2(playerID, "Items.17467526539841434040", 0)
     --Song.Rock_The_Bridge.PUP
	ExecuteReward_V2(playerID, "Items.17977364563301665880", 0)
     --Song.Rock_The_Bridge.Rancid
	ExecuteReward_V2(playerID, "Items.16809248649104847984", 0)
     --Song.Rock_The_Bridge.Shannon and the Clams
	ExecuteReward_V2(playerID, "Items.11714826120819795122", 0)
     --Song.Rock_The_Bridge.Sorority Noise
	ExecuteReward_V2(playerID, "Items.16791479114050361442", 0)
     --Song.Rock_The_Bridge.Swingin Utters
	ExecuteReward_V2(playerID, "Items.7543666980494774243", 0)
     --Song.Rock_The_Bridge.TheProdigy
	ExecuteReward_V2(playerID, "Items.16258011096701728710", 0)
     --Song.Rock_The_Bridge.Turbonegro
	ExecuteReward_V2(playerID, "Items.841575063302057750", 0)
     --Song.Square_Wave.Crystal Castles
	ExecuteReward_V2(playerID, "Items.2996129138329192268", 0)
     --Song.Square_Wave.Cybotron
	ExecuteReward_V2(playerID, "Items.8703473050060994443", 0)
     --Song.Square_Wave.Deadmau5
	ExecuteReward_V2(playerID, "Items.7352024425263939845", 0)
     --Song.Square_Wave.Georgio Moroder
	ExecuteReward_V2(playerID, "Items.7385339303749929177", 0)
end

local function UnlockHackVehicles()
	local playerID = GetLocalPlayerEntityId()
	ScriptHook.ShowNotification("Unlocked all civilian hacking vehicles")
	ExecuteReward_V2(playerID, "Items.7566047385906989731", 0) --Cowboy Workvan
	ExecuteReward_V2(playerID, "Items.8718968890513836707", 0) --Space Workvan
	ExecuteReward_V2(playerID, "Items.9901163792802454188", 0) --Expedite Boxvan
	ExecuteReward_V2(playerID, "Items.10984410701160926101", 0) --Expedite Delivery Truck
	ExecuteReward_V2(playerID, "Items.9763813899518680492", 0) --Oakland Bus
	ExecuteReward_V2(playerID, "Items.9462080447106456236", 0) --Oakland Dump Truck
	ExecuteReward_V2(playerID, "Items.7566047385906989756", 0) --Bayhill Service Truck
	ExecuteReward_V2(playerID, "Items.11027345174517926588", 0) --SF Service Truck
	ExecuteReward_V2(playerID, "Items.7599824383112268476", 0) --Ladder Service Truck
	ExecuteReward_V2(playerID, "Items.9804673950779853474", 0) --Tidy Bananas Workvan
	ExecuteReward_V2(playerID, "Items.6216430947688139682", 0) --Work Workvan
	ExecuteReward_V2(playerID, "Items.506092168770509481", 0) --Gabay Flatbed
	ExecuteReward_V2(playerID, "Items.11024811899727530684", 0) --Starter Oil Utility Truck
	ExecuteReward_V2(playerID, "Items.6153682918586863074", 0) --Graffiti Black
	ExecuteReward_V2(playerID, "Items.6153119487563550178", 0) --Graffiti Blue
	ExecuteReward_V2(playerID, "Items.3857128102535122402", 0) --Graffiti Green
	ExecuteReward_V2(playerID, "Items.6139327694774619618", 0) --Graffiti Red
	ExecuteReward_V2(playerID, "Items.6153118869121813986", 0) --Graffiti Yellow
	ExecuteReward_V2(playerID, "Items.6161563736864869858", 0) --Graffiti Beige
	ExecuteReward_V2(playerID, "Items.9612727945261108706", 0) --Graffiti White
end

function UnlockAllClothes()
	local Clothings = {
		ItemClothingBundles,
		ItemClothingKiosk,
		ItemClothingReward,
		ItemClothingShopsBiker,
		ItemClothingShopsHighEndSuits,
		ItemClothingShopsHipHop,
		ItemClothingShopsHipster,
		ItemClothingShopsNormcore,
		ItemClothingShopsUrbanSkate,
		ItemClothingDefaultSkin,
		ItemClothingULC,
		ItemClothingVendingMachines,
		ItemClothingCollectibles
	}

	for k,v in pairsByKeys(Clothings) do
		for k2,v2 in pairsByKeys(v) do
			ScriptHook.AddInventoryItem(v2, 1)
		end
	end
	
	ScriptHook.ShowNotification("Unlocked all non-modded clothing")
end

function OpenWeaponCategory(title, tbl)
	local menu = UI.SimpleMenu()
	local hasSearch = tbl.search or false
	menu:SetTitle(title)
	if hasSearch == true then
	menu:AddSearch("Search", "Start typing to filter")
	end
	for _, v in pairs(tbl.weapons) do
		local name, weapon = unpack(v)
		menu:AddButton(name, function(menu, text, hint, index)
			--AddItem(weapon, 1)
			EquipItem(weapon)
			ScriptHook.ShowNotification("Weapon equipped: " .. text)
		end)
	end	

	return menu
end

function GiveWeaponsMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Weapon Menu")

	for _, v in ipairs(WeaponList) do
	menu:AddButton(v.name, v.desc, Script():CacheMenu(function() return OpenWeaponCategory(v.name, v) end))
	end

	return menu
end

function ChangeModMelee(menu, name)
	--SimpleTrainerMenu:Toggle()

	local item = ThunderballSkins[name]
	Globals.FREEROAM.MonkeyFistSkin = item
	SetItem("Items.13799116143782152342", item)

	ScriptHook.ShowNotification("Thunderball equipped: " .. name)
end

function ChangeModMeleeMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Thunderball Skins")

	for k,v in pairsByKeys(ThunderballSkins) do
		menu:AddButton(k, ChangeModMelee)
	end

	return menu
end

function ChangeModLaptop(menu, name)
	--SimpleTrainerMenu:Toggle()

	local item = LaptopSkins[name]
	Globals.FREEROAM.LaptopSkin = item
	SetItem("Items.13711663141740776639", item)

	ScriptHook.ShowNotification("Laptop equipped: " .. name)
end

function ChangeModLaptopMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Laptop Skins")

	for k,v in pairsByKeys(LaptopSkins) do
		menu:AddButton(k, ChangeModLaptop)
	end

	return menu
end

function OpenGamePawnshopMenu()
    OpenMenuPage("UIMenuPageDB.9223372046350593915")
end

function OpenGamePrinterMenu()
	--AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), -1)
    local PosX, PosY, PosZ = GetEntityPosition(GetLocalPlayerEntityId(), 0), GetEntityPosition(GetLocalPlayerEntityId(), 1), GetEntityPosition(GetLocalPlayerEntityId(), 2)
    local PrinterArchetype = SpawnEntityFromArchetype("{42D297D6-080E-11F1-8DE9-0242AC120002}", PosX, PosY, PosZ, 0, 0, GetEntityAngle(GetLocalPlayerEntityId(), 2) + 180)
	Globals.FREEROAM.LocalPrinterX, Globals.FREEROAM.LocalPrinterY, Globals.FREEROAM.LocalPrinterZ = PosX, PosY, PosZ
	UseSelectedIngredient(GetLocalPlayerEntityId(), PrinterArchetype)
end

function ChangeModBody(menu, name)
	local item = BodySwaps[name]
	SetItem("Items.13118201435502326015", item)
	OverrideMarcusModel(item)

	ScriptHook.ShowNotification("Body changed: " .. name)
end

function ChangeModBodyMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Change Body")

	for k,v in pairsByKeys(BodySwaps) do
		menu:AddButton(k, ChangeModBody)
	end

	return menu
end

function ChangeDialogActor(menu, name)
	local item = DialogActors[name]
	ChangePlayerGkModelFromHumanConfigAndVoiceActor("", item)

	ScriptHook.ShowNotification("Voice changed: " .. name)
end

function ChangeDialogActorMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Change Voice")

	for k,v in pairsByKeys(DialogActors) do
		menu:AddButton(k, ChangeDialogActor)
	end

	return menu
end

function OpenBarkCategory(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)
	menu:AddSearch("Search", "Start typing to filter")
	for _, v in ipairs(tbl.voicelines) do
		menu:AddButton(v, "", function(menu, text, hint, index)
			RequestPlayTrigger(GetLocalPlayerEntityId(), v, "ForcePlay")
		end)
	end	

	return menu
end

function PlayBarkMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Play Dialog")

	for _, v in ipairs(Barks) do
	menu:AddButton(v.name, v.desc, Script():CacheMenu(function() return OpenBarkCategory(v.name, v) end))
	end

	return menu
end

-- Inventory items
function OpenItemCategoryMenu(title, tbl)
	local menu = UI.SimpleMenu()
	menu:SetTitle(title)
	
	for k,v in pairsByKeys(tbl) do
		menu:AddButton(k, k, function(menu, text, hint, index) 
			ScriptHook.AddInventoryItem(tbl[text], 1)
			ScriptHook.ShowNotification("Added item " .. text)
		end)
	end

	return menu
end

local Item_Categories = {
	{ "Generic", Items },
	{ "Access Codes", ItemAccessCodes },
	{ "Access Codes Coop", ItemAccessCodesCoop },
	{ "Access Code Rare Car", ItemAccessCodesRareCar },
	{ "Skills", ItemSkills },
	{ "Car Hacking Rewards", ItemCarHackingRewards },
	{ "Cash", ItemCash },
	{ "Clothing Bundles",ItemClothingBundles },
	{ "Clothing Kiosk",ItemClothingKiosk },
	{ "Clothing Reward", ItemClothingReward },
	{ "Clothing Biker",ItemClothingShopsBiker },
	{ "Clothing Highend", ItemClothingShopsHighEndSuits },
	{ "Clothing HipHop", ItemClothingShopsHipHop },
	{ "Clothing Hipster", ItemClothingShopsHipster },
	{ "Clothing Normcore", ItemClothingShopsNormcore },
	{ "Clothing Urban Skate",ItemClothingShopsUrbanSkate },
	{ "Clothing Default", ItemClothingDefaultSkin },
	{ "Clothing ULC", ItemClothingULC },
	{ "Clothing Vending Machines", ItemClothingVendingMachines },
	{ "Clothing Collectibles", ItemClothingCollectibles },
	{ "Components", ItemComponents },
	{ "Emotes", ItemEmotes },
	{ "Followers", ItemFollowers },
	{ "Narrative",ItemsNarrative },
	{ "Progression", ItemsProgression },
	{ "Projectiles", ItemsProjectiles },
	{ "Races", ItemsRaces },
	{ "RCSkins",ItemsRCSkins },
	{ "Survival Guide", ItemsSurvivalGuide },
	{ "Upgrades", ItemUpgrades },
	{ "Valueables", ItemValueables },
	{ "Vehicle Decals", ItemVehicleDecals },
	{ "Weapon Decals", ItemWeaponDecals },
	{ "Yacht", ItemYacht }
}

function OpenItemCategoriesMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Select Item Category")
	
	for _,v in pairsByKeys(Item_Categories) do
		local name, tbl = unpack(v)
		menu:AddButton(name, Script():CacheMenu(function()
			return OpenItemCategoryMenu(name, tbl)
		end))
	end

	return menu
end

function ClearInventory()
	Globals.FREEROAM.DisableItemAdding = 1
	SwitchLocalPlayerInventoryToEmpty()
	ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.9223372048779332208", 0)
end

function WrenchInventory()
	Globals.FREEROAM.DisableItemAdding = 1
	SwitchLocalPlayerInventoryList("ItemInventoryLists.9223372048560598129", 1)
	ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.9223372048779332208", 0)
end

function CustomInventory()
	Globals.FREEROAM.DisableItemAdding = 1
	SwitchLocalPlayerInventoryList("ItemInventoryLists.-6301486210180672759", 1)
	ExecuteReward_V2(GetLocalPlayerEntityId(), "Items.9223372048779332208", 0)
end

function ResetInventory()
	Globals.FREEROAM.DisableItemAdding = 0
	SwitchLocalPlayerInventoryToNormal()
    --Fix for BodySwap
    if Globals.FREEROAM.BodySwap_Enabled == 1 then
    default = GetItemCount(GetLocalPlayerEntityId(), "Items.13118201435502326015") or 0
    Globals.FREEROAM.PlayerBody = default
		if default > 0 then
		OverrideMarcusModel(default)
		end
    end
end

function ChangeToSitara()
ChangePlayerGkModelFromHumanConfig("HumanConfig.-9223372023958135765")
ScriptHook.ShowNotification("Changed to Female Base \nNo longer floating in air, can be paired with Change Model option \nNOTE: If you wanna use custom voice, apply it first and then apply skeleton")
end

function ChangeToMarcus()
ChangePlayerGkModelFromHumanConfig("")
ScriptHook.ShowNotification("Changed to Male Base")
end

-- Unlimited Projectiles
function PlayerHasUnlimitedProjectiles()
	return Script().StateWatcher:GetState("unlimitedProjectiles") == true
end
function PlayerSetUnlimitedProjectiles(on)
	Script().StateWatcher:SetState("unlimitedProjectiles", on)
	Script().StateWatcher:UnlimitedProjectiles()
end

-- No Recoil
function PlayerHasNoRecoil()
	return Globals.FREEROAM.Trainer_NoRecoil
end
function PlayerSetNoRecoil(on)
	Globals.FREEROAM.Trainer_NoRecoil = on
end

--Open Store

function OpenSpecificStore(ID)
	local ArchID = nil
    local PosX, PosY, PosZ = GetEntityPosition(GetLocalPlayerEntityId(), 0), GetEntityPosition(GetLocalPlayerEntityId(), 1), GetEntityPosition(GetLocalPlayerEntityId(), 2)
	if ID == "HipHop" then
	ArchID = "{A4DA6CAD-D434-43E7-BCB2-6D9207C3E3B7}"
	elseif ID == "Hipster" then
	ArchID = "{CF54E208-DFFC-491C-91D7-A4E104CBAE1C}"
	elseif ID == "Normcore" then
	ArchID = "{96682E96-C726-4C17-99A3-72FA213290B8}"
	elseif ID == "UrbanSkate" then
	ArchID = "{894D41CE-6CC5-45B1-944F-262FE233F433}"
	elseif ID == "Galilei" then
	ArchID = "{62124CF8-A398-4259-99BD-8B0A1B885A95}"
	elseif ID == "Hackerspace" then
	ArchID = "{F3B95594-8B44-4C12-9D13-397B701E3FA3}"
	elseif ID == "HighEndSuits" then
	ArchID = "{19E5F74D-228F-4ED1-BD70-66EC9A56DCD1}"
	elseif ID == "Biker" then
	ArchID = "{B4B2B358-CCB8-4BC6-BC05-7860B60D4272}"
	elseif ID == "Yacht" then
	ArchID = "{23042FBC-7B2B-43D3-A4D3-424BE2ECA314}"
	elseif ID == "Stanford" then
	ArchID = "{E212FF30-1C48-45CF-B42B-40CCA23E322A}"
	elseif ID == "SF" then
	ArchID = "{B3B49460-6C15-4B9B-A99A-FB8F9B228EE0}"
	elseif ID == "Basketball" then
	ArchID = "{4E74DA76-91FF-442F-A0D3-55E8362212A1}"
	elseif ID == "Baseball" then
	ArchID = "{DC00FD70-4114-4B88-B14B-295595DB6134}"
	elseif ID == "Alcatraz" then
	ArchID = "{47C3EEDE-D3C1-4AA6-B2D3-6AA299CD55E8}"
	elseif ID == "HaightAshbury" then
	ArchID = "{E9CC1562-460E-4D45-AC61-582191ABDDE8}"
	elseif ID == "NudleSwagMachine" then
	ArchID = "{0662C1ED-A87F-4E08-A889-7BF08467ECD5}"
	elseif ID == "Dealership_HighEnd" then
	ArchID = "{9230F2FD-99FB-4C3F-BF3A-32FEC0566095}"
	elseif ID == "Dealership_Common" then
	ArchID = "{D8F3646C-9A1B-4317-B13B-917178BD23E1}"
	elseif ID == "Dealership_Yacht" then
	ArchID = "{BB77C544-A1F0-4CE4-A9A4-599138BD148E}"
	elseif ID == "WD2E_GeekShop" then
	ArchID = "{8565BCB0-825C-11EF-B864-0242AC120002}"
	elseif ID == "WD2E_CrazyHaights" then
	ArchID = "{453E4AD8-8B23-11EF-B864-0242AC120002}"
	elseif ID == "WD2E_LuckyPierre" then
	ArchID = "{C09EB26C-A8E7-11EF-B864-0242AC120002}"
	elseif ID == "WD2E_MaverickInk" then
	ArchID = "{28CF6D8E-ED68-11F0-8DE9-0242AC120002}"
	elseif ID == "WD2E_BarberShop" then
	ArchID = "{89DAAFF8-6351-11F1-AB07-0242AC120002}"
	elseif ID == "WD2E_PleasurePalace" then
	ArchID = "{823628B4-D1F7-11EF-9CD2-0242AC120002}"
	else
	ArchID = "{0662C1ED-A87F-4E08-A889-7BF08467ECD5}"
	end
	if ShopArch ~= nil then
	RemoveEntity(ShopArch)
	end
    ShopArch = SpawnEntityFromArchetype(ArchID, PosX, PosY, PosZ, 0, 0, GetEntityAngle(GetLocalPlayerEntityId(), 2) + 0)
	HideCameraClippedEntity(ShopArch)
	SetPhysicsEnabled(ShopArch, 0)
	UseSelectedIngredient(GetLocalPlayerEntityId(), ShopArch)
end

function PlayAudioLog(menu, name)
	local item = AudioLogs[name]
	ExecuteReward_V2(GetLocalPlayerEntityId(), item, 1)

	--ScriptHook.ShowNotification("Playing Audio Log: " .. name)
end

function AudioLogMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Audio Logs")

	for k,v in pairsByKeys(AudioLogs) do
		menu:AddButton(k, PlayAudioLog)
	end

	return menu
end

local function ClothingMenu()
	local menu = UI.SimpleMenu()
	menu:SetTitle("Customization / Inventory")

    menu:AddButton("Open Wardrobe", "Open the game menu to change your clothes", OpenGameClothingMenu)
    menu:AddButton("Change Model", "Change your player model to Sitara, Wrench, etc.", Script():CacheMenu(ChangeGraphicsKitMenu))
    menu:AddButton("Change Body", "Change the player body and face model", Script():CacheMenu(ChangeModBodyMenu))
    menu:AddButton("Change Voice", "Change the player voice for generic lines", Script():CacheMenu(ChangeDialogActorMenu))
	menu:AddButton("Play Dialog", "Make sure to select matching voice first", Script():CacheMenu(PlayBarkMenu))
	menu:AddButton("Open 3D Printer", "Open the game menu to change your weapons", OpenGamePrinterMenu)
	menu:AddButton("Set Thunderball Skin", "Change the skin for player's melee weapon", ChangeModMeleeMenu)
	menu:AddButton("Set Laptop Skin", "Change the skin for player's laptop", ChangeModLaptopMenu)
	menu:AddButton("Open Pawn Shop Menu", "Open the game menu to sell valuables", OpenGamePawnshopMenu)
	menu:AddButton("Unlock All Clothing Items", "Unlocks all non-modded clothing items for Marcus", UnlockAllClothes)
	menu:AddButton("Unlock All Songs", "Unlocks all 59 songs found from SongSneak", UnlockAllSongs)
	menu:AddButton("Audio Logs", "Play Audio Logs", AudioLogMenu)
	menu:AddButton("Unlock Hacking Collectible Vehicles", "WD2E: Unlocks 13 vehicles from Civilian Hacks", UnlockHackVehicles)
	menu:AddButton("Add/Give Weapon", "*Might* corrupt inventory, use 3D Printer", GiveWeaponsMenu)
	menu:AddButton("Add Item", "WARNING: Might corrupt save file", Script():CacheMenu(OpenItemCategoriesMenu))
	menu:AddButton("Clear Inventory", "Temporarily clears inventory", ClearInventory)
	menu:AddButton("Wrench's Inventory Preset", "With unlocked weapon slot limit", WrenchInventory)
	menu:AddButton("Custom Inventory Preset", "WD2E: With unlocked weapon slot limit", CustomInventory)
	menu:AddButton("Reset Inventory", "Resets cleared inventory to normal", ResetInventory)
	
    menu:AddButton("Swap to Female Skeleton", "Changes to Sitara with smaller 'hitbox'", Script():CacheMenu(ChangeToSitara))
    menu:AddButton("Swap to Male Skeleton", "Return to normal player model", Script():CacheMenu(ChangeToMarcus))
	
	menu:AddButton("Store: StreetFlex", "Spawn and access the menu for this shop", function() OpenSpecificStore("HipHop") end)
	menu:AddButton("Store: William Finn", "Spawn and access the menu for this shop", function() OpenSpecificStore("HighEndSuits") end)
	menu:AddButton("Store: Axle Boardshop", "Spawn and access the menu for this shop", function() OpenSpecificStore("UrbanSkate") end)
	menu:AddButton("Store: Stache & Vine", "Spawn and access the menu for this shop", function() OpenSpecificStore("Hipster") end)
	menu:AddButton("Store: Torque Rat Bike Shop", "Spawn and access the menu for this shop", function() OpenSpecificStore("Biker") end)
	menu:AddButton("Store: Plainstock", "Spawn and access the menu for this shop", function() OpenSpecificStore("Normcore") end)
	menu:AddButton("Store: Alcatraz Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("Alcatraz") end)
	menu:AddButton("Store: Beatniks Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("Baseball") end)
	menu:AddButton("Store: Ohlones Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("Basketball") end)
	menu:AddButton("Store: Tie Dye Dude Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("HaightAshbury") end)
	menu:AddButton("Store: Stanford Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("Stanford") end)
	menu:AddButton("Store: Tourist Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("SF") end)
	menu:AddButton("Store: Yacht Club Kiosk", "Spawn and access the menu for this shop", function() OpenSpecificStore("Yacht") end)
	menu:AddButton("Store: DedSec Vending Machine", "Spawn and access the menu for this shop", function() OpenSpecificStore("Hackerspace") end)
	menu:AddButton("Store: Galilei Vending Machine", "Spawn and access the menu for this shop", function() OpenSpecificStore("Galilei") end)
	menu:AddButton("Store: Nudle Vending Machine", "Spawn and access the menu for this shop", function() OpenSpecificStore("NudleSwagMachine") end)
	menu:AddButton("Store: Geek Store", "WD2E: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_GeekShop") end)
	menu:AddButton("Store: Pleasure Palace", "WD2E: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_PleasurePalace") end)
	menu:AddButton("Store: Crazy Haights Tattoos", "WD2E: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_CrazyHaights") end)
	menu:AddButton("Store: Maverick Ink Tattoos", "WD2E: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_MaverickInk") end)
	menu:AddButton("Store: Lucky Pierre's Tattoos", "WD2E: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_LuckyPierre") end)
	menu:AddButton("Store: Barber Shop", "WD2E WIP: Spawn and access the menu for this shop", function() OpenSpecificStore("WD2E_BarberShop") end)
	menu:AddButton("Delete spawned store", "Deletes store, also auto-deletes when too far", function() if ShopArch ~= nil then RemoveEntity(ShopArch) end end)
	--THESE DON'T WORK
	--menu:AddButton("Store: Auto Elite", "Open the game menu for this shop", function() OpenSpecificStore("Dealership_HighEnd") end)
	--menu:AddButton("Store: Total Motors", "Open the game menu for this shop", function() OpenSpecificStore("Dealership_Common") end)
	--menu:AddButton("Store: Yacht Shop", "Open the game menu for this shop", function() OpenSpecificStore("Dealership_Yacht") end)
	
	menu:AddButton("Equip Handgun", "Equips random hidden Handgun slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 0)
	end)
	
	menu:AddButton("Equip Assault Rifle", "Equips random hidden AR slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 1)
	end)
	
	menu:AddButton("Equip Shotgun", "Equips random hidden Shotgun slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 2)
	end)
	
	menu:AddButton("Equip Sniper", "Equips random hidden Sniper slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 3)
	end)
	
	menu:AddButton("Equip Launcher", "Equips random hidden Launcher slot", function()
		AgentDrawWeaponShootingType(GetLocalPlayerEntityId(), 4)
	end)
	
	local noRecoilIdx = menu:AddCheckbox("No Recoil", "Makes weapons have zero recoil when shooting", function()
		PlayerSetNoRecoil(not PlayerHasNoRecoil())
	end)
	
	local unlProjectilesIdx = menu:AddCheckbox("Unlimited Projectiles", "Throw infinitely without stopping", function()
		PlayerSetUnlimitedProjectiles(not PlayerHasUnlimitedProjectiles())
	end)
	
	menu:AddButton("Add 5 Explosive Devices", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 then
		AddItem("Items.9223372048779332549", 5)
		EquipItem("Items.9223372048779332549")
		ScriptHook.ShowNotification("Added 5 Explosive Devices")
		else
		ScriptHook.ShowNotification("You must purchase Explosive Devices upgrade to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Add 5 Shock Devices", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372046063608332", 5)
		EquipItem("Items.9223372046063608332")
		ScriptHook.ShowNotification("Added 5 Shock Devices")
		else
		ScriptHook.ShowNotification("You must purchase Shock Devices upgrade to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 Frag Grenades", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372048779332539", 5)
		EquipItem("Items.9223372048779332539") --BB4BC2C602000080
		ScriptHook.ShowNotification("Equipped 5 Frag Grenades, press [CSS_BLUE]USE PROJECTILE[CSS_END] to throw")
		else
		ScriptHook.ShowNotification("You must purchase Shock Devices and Explosive Devices upgrades to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 Proximity IEDs", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372048779332558", 5)
		EquipItem("Items.9223372048779332558") --CE4BC2C602000080
		ScriptHook.ShowNotification("Equipped 5 Proximity IEDs, press [CSS_BLUE]USE PROJECTILE[CSS_END] to throw")
		else
		ScriptHook.ShowNotification("You must own Shock Devices and Explosive Devices upgrades to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 P8-IEDs", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372048779332555", 5)
		EquipItem("Items.9223372048779332555") --CB4BC2C602000080
		ScriptHook.ShowNotification("Equipped 5 P8-IEDs, press [CSS_BLUE]USE PROJECTILE[CSS_END] to throw")
		else
		ScriptHook.ShowNotification("You must purchase Shock Devices and Explosive Devices upgrades to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 10 Shock Grenades", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372048779332538", 10)
		EquipItem("Items.9223372048779332538") --BA4BC2C602000080
		ScriptHook.ShowNotification("Equipped 10 Shock Grenades, press [CSS_BLUE]USE PROJECTILE[CSS_END] to throw")
		else
		ScriptHook.ShowNotification("You must purchase Shock Devices and Explosive Devices upgrades to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 Lures", "", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569154") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165569199") == 1 then
		AddItem("Items.9223372048779332554", 5)
		EquipItem("Items.9223372048779332554") --CA4BC2C602000080
		ScriptHook.ShowNotification("Equipped 5 Lures, press [CSS_BLUE]USE PROJECTILE[CSS_END] to throw")
		else
		ScriptHook.ShowNotification("You must purchase Shock Devices and Explosive Devices upgrades to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 ctOS Scans", "Tags all nearby enemies, has cooldown", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570330") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570324") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570329") == 1 then
		AddItem("Items.12617966217559746172", 5)
		EquipItem("Items.12617966217559746172") --7C2687096C051CAF
		ScriptHook.ShowNotification("Equipped 5 ctOS Scans, press [CSS_BLUE]USE PROJECTILE[CSS_END] to use")
		else
		ScriptHook.ShowNotification("You must purchase all Mass Hacks to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 Jam Comms", "Stops civilian/reinforcement calls, has cooldown", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570330") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570324") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570329") == 1 then
		AddItem("Items.9223372048779332784", 5)
		EquipItem("Items.9223372048779332784") --B04CC2C602000080
		ScriptHook.ShowNotification("Equipped 5 Jam Comms, press [CSS_BLUE]USE PROJECTILE[CSS_END] to use")
		else
		ScriptHook.ShowNotification("You must purchase all Mass Hacks to use this\nTo prevent save corruption")
		end
	end)
	
	menu:AddButton("Equip 5 Nitro Boosts", "Works almost the same way as the skill upgrade", function()
		if GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570330") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570324") == 1 and GetPlayerHasPerkWithDbObj("PerksSinglePlayer.9223372048165570329") == 1 then
		AddItem("Items.11655618992652520924", 5)
		EquipItem("Items.11655618992652520924") --DC8D593EB813C1A1
		ScriptHook.ShowNotification("Equipped 5 Nitro Boosts, press [CSS_BLUE]USE PROJECTILE[CSS_END] to use")
		else
		ScriptHook.ShowNotification("You must purchase all Mass Hacks to use this feature\nTo prevent save corruption")
		end
	end)
	
	-- Update
	menu:OnUpdate(function()
		menu:SetChecked(noRecoilIdx, PlayerHasNoRecoil())
		menu:SetChecked(unlProjectilesIdx, PlayerHasUnlimitedProjectiles())
	end)
    
	return menu
end

table.insert(SimpleTrainerMenuItems, { "Customization / Inventory", "Change clothes, model, weapons, etc.", Script():CacheMenu(ClothingMenu) })