local QBCore = exports['qb-core']:GetCoreObject()

local PlayerJob = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

--// Process Regular Sushi \\--
RegisterNetEvent('qb-Noodles:Client:ProcessNormalNoodles', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessNormalSushi', function(HasItems)
		if HasItems then
			ProcessNormalSushi()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

--// Process Fish Sushi \\--
RegisterNetEvent('qb-Noodles:Client:ProcessFishSushi', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessFishSushi', function(HasItems)
		if HasItems then
			ProcessFishSushi()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

--// Process Inside Out Sushi \\--
RegisterNetEvent('qb-Noodles:Client:ProcessInsideOutSushi', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessInsideOutSushi', function(HasItems)
		if HasItems then
			ProcessInsideOutSushi()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

--// Process Sandwich Sushi \\--
RegisterNetEvent('qb-Noodles:Client:ProcessSandwichSushi', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessSandwichSushi', function(HasItems)
		if HasItems then
			ProcessSandwichSushi()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

--// Process Regular Noodles \\--
RegisterNetEvent('qb-Noodles:Client:ProcessRegularNoodles', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessRegularNoodles', function(HasItems)
		if HasItems then
			ProcessRegularNoodles()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

--// Process Egg Roll \\--
RegisterNetEvent('qb-Noodles:Client:ProcessEggRoll', function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemProcessEggRoll', function(HasItems)
		if HasItems then
			ProcessEggRoll()
		else
			QBCore.Functions.Notify('You Dont Have Enough Ingredients', 'error')
		end
	end)
end)

local TakingPanSeconds = 300

local TakingPanSecondsRemaining = 0

--// Grab Pan \\--
RegisterNetEvent('qb-Noodle:GrabPan', function()
	if not onDuty then
		if TakingPanSecondsRemaining <= 0 then
			HandleCooldown()
		 	TriggerServerEvent("QBCore:Server:AddItem", Config.PanItem, 1)
		 	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.PanItem], "add")
		else
			local minutes = math.floor(TakingPanSecondsRemaining / 60)
			local seconds = TakingPanSecondsRemaining - minutes * 60
			QBCore.Functions.Notify("You Have To Wait " .. minutes .. " Minutes And ".. seconds .. " Seconds Before Taking Another Pan", "error")
		end
	else
		QBCore.Functions.Notify("You Are Not On Duty !", "error")
	end
end)

--// Function For Cool Down \\--
function HandleCooldown()
    TakingPanSecondsRemaining = TakingPanSeconds
    Citizen.CreateThread(function()
        while TakingPanSecondsRemaining > 0 do
            Citizen.Wait(1000)
            TakingPanSecondsRemaining = TakingPanSecondsRemaining - 1
        end
    end)
end

--// Normal Sushi \\--
RegisterNetEvent("qb-Noodles:Client:NormalSushi")
AddEventHandler("qb-Noodles:Client:NormalSushi", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatNormalSushi', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eatnormalsushi", "Eating Sushi...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.NormalSushiItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.NormalSushiItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

--// Fish Sushi \\--
RegisterNetEvent("qb-Noodles:Client:FishSushi")
AddEventHandler("qb-Noodles:Client:FishSushi", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatFishSushi', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eatfishasushi", "Eating Fish Sushi...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.FishSushiItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.FishSushiItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

--// Inside Out Sushi \\--
RegisterNetEvent("qb-Noodles:Client:InsideOutSushi")
AddEventHandler("qb-Noodles:Client:InsideOutSushi", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatInsideOutSushi', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eatinsideoutasushi", "Eating Inside Out Sushi...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.InsideOutSushiItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.InsideOutSushiItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

--// Sandwich Sushi \\--
RegisterNetEvent("qb-Noodles:Client:SandwichSushi")
AddEventHandler("qb-Noodles:Client:SandwichSushi", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatSandwichSushi', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eatsandwichsushi", "Eating Sandwich Sushi...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.SandwichSushiItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.SandwichSushiItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

--// Regular Noodles \\--
RegisterNetEvent("qb-Noodles:Client:RegularNoodles")
AddEventHandler("qb-Noodles:Client:RegularNoodles", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatRegularNoodles', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eatregularnoodles", "Eating Noodles...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.NoodlesItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.NoodlesItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

--// Egg Roll \\--
RegisterNetEvent("qb-Noodles:Client:EggRoll")
AddEventHandler("qb-Noodles:Client:EggRoll", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemEatEggRoll', function(HasItems)
		if HasItems then
			QBCore.Functions.Progressbar("eateggroll", "Eating Egg Roll...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.EggRollItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.EggRollItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end)
end)

RegisterNetEvent("qb-Noodles:PrepareRamen")
AddEventHandler("qb-Noodles:PrepareRamen", function()
	QBCore.Functions.Progressbar("prepareramen", "Preparing Ramen...", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
	}, {
	}, {}, {}, function() -- Done
	end, function() -- Cancel
		QBCore.Functions.Notify("Canceled...", "error")
	end)
end)

--// Ramen \\--
RegisterNetEvent("qb-Noodles:Client:Ramen")
AddEventHandler("qb-Noodles:Client:Ramen", function()
	TriggerEvent("qb-Noodles:PrepareRamen")
	Wait(5500)
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
		if result then
			QBCore.Functions.Progressbar("eatramen", "Eating Ramen...", 5000, false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mp_player_inteat@burger",
				anim = "mp_player_int_eat_burger",
				flags = 49,
				TriggerEvent("qb-Noodles:SpawnNormalSushi")
			}, {}, {}, function() -- Done
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.RamenItem, 1)
				TriggerServerEvent("QBCore:Server:RemoveItem", Config.ChopSticksItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.ChopSticksItem], "remove")
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RamenItem], "remove")
				SushiEffect()
			end, function() -- Cancel
				StopAnimTask(GetPlayerPed(-1), "mp_player_inteat@burger", "mp_player_int_eat_burger", 1.0)
				QBCore.Functions.Notify("Canceled...", "error")
			end)
		else
			QBCore.Functions.Notify('You Dont Have Chopsticks !', 'error')
		end
	end, Config.RamenItem)
end)

function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Wait(10)
	end
end

RegisterNetEvent("qb-Noodles:SpawnNormalSushi")
AddEventHandler("qb-Noodles:SpawnNormalSushi", function()
	LoadModel('prop_ff_noodle_01')
	local sushi = CreateObject(GetHashKey('prop_ff_noodle_01'), GetEntityCoords(PlayerPedId()), true)
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectNormalSushi = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("prop_ff_noodle_01"), false)
	local itemid = objectNormalSushi
    if Config.UseSounds then
	  TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'sushi', 8.0)
    end
	AttachEntityToEntity(objectNormalSushi,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 18905),0.13,0.07,0.02,10.0,140.0,60.0,1,1,0,1,0,1)
	Wait(5500)
	DetachEntity(objectNormalSushi, true, true)
	DeleteObject(objectNormalSushi)
end)

function SushiEffect()
	TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 25)
end

--// Function For Process Normal Sushi \\--
function ProcessNormalSushi()
	TriggerServerEvent('qb-Noodles:RemoveNormalSushi')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Sushi...", 7000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = 'mp_arresting',
		anim = 'a_uncuff',
		flags = 16,
	}, {}, {}, function()
		ClearPedTasks(GetPlayerPed(-1))
		TriggerServerEvent('qb-Noodles:AddNormalSushi')
	end, function()
		ClearPedTasks(GetPlayerPed(-1))
	end)  
end

--// Function For Process Inside Out Sushi \\--
function ProcessInsideOutSushi()
	TriggerServerEvent('qb-Noodles:RemoveInsideOutSushi')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Inside Out Sushi...", 7000, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
	  	disableCombat = true,
   	}, {
	  	animDict = 'mp_arresting',
	  	anim = 'a_uncuff',
	  	flags = 16,
   	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-Noodles:AddInsideOutSushi')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)   
end

--// Function For Process Sandwich Sushi \\--
function ProcessSandwichSushi()
	TriggerServerEvent('qb-Noodles:RemoveSandwichSushi')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Sandwich Sushi...", 7000, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
	  	disableCombat = true,
   	}, {
	  	animDict = 'mp_arresting',
	  	anim = 'a_uncuff',
	  	flags = 16,
   	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-Noodles:AddSandwichSushi')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)     
end

--// Function For Process Fish Sushi \\--
function ProcessFishSushi()
	TriggerServerEvent('qb-Noodles:RemoveFishSushi')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Fish Sushi...", 7000, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
	  	disableCombat = true,
   	}, {
	  	animDict = 'mp_arresting',
	  	anim = 'a_uncuff',
	  	flags = 16,
   	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-Noodles:AddFishSushi')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)     
end

--// Function For Process Regular Noodles \\--
function ProcessRegularNoodles()
	TriggerServerEvent('qb-Noodles:RemoveRegularNoodles')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Noodles...", 6500, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
	  	disableCombat = true,
   	}, {
	 	animDict = 'amb@prop_human_bbq@male@base',
	  	anim = 'base',
	  	flags = 16,
	  	TriggerEvent("qb-Noodles:SpawnPanForNoodles")
   	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-Noodles:AddRegularNoodles')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)   
end

--// Function For Process Egg Roll \\--
function ProcessEggRoll()
	TriggerServerEvent('qb-Noodles:RemoveEggRoll')                                                       				
	QBCore.Functions.Progressbar("search_register", "Making Egg Roll...", 6000, false, true, {
	  	disableMovement = true,
	  	disableCarMovement = true,
	  	disableMouse = false,
	  	disableCombat = true,
   	}, {
	  	animDict = 'amb@prop_human_bbq@male@base',
	  	anim = 'base',
	  	flags = 16,
	  	TriggerEvent("qb-Noodles:SpawnPanForNoodles")
  	}, {}, {}, function()
	  	ClearPedTasks(GetPlayerPed(-1))
	  	TriggerServerEvent('qb-Noodles:AddEggRoll')
   	end, function()
	  	ClearPedTasks(GetPlayerPed(-1))
   	end)   
end

RegisterNetEvent("qb-Noodles:SpawnPanForNoodles")
AddEventHandler("qb-Noodles:SpawnPanForNoodles", function()
	Wait(400)
	LoadModel('v_ret_fh_fry02')
	local pan = CreateObject(GetHashKey('v_ret_fh_fry02'), GetEntityCoords(PlayerPedId()), true)
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectPan = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("v_ret_fh_fry02"), false)
	local itemid = objectPan
	if Config.UseSounds then
		TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'cooking', 8.0)
	end
	AttachEntityToEntity(objectPan,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 6286),0.20,0.00,0.05,5.0,20.0,180.0,1,1,0,1,0,1)
	Wait(5500)
	DetachEntity(objectPan, true, true)
	DeleteObject(objectPan)
end)

--// Blips \\--
Citizen.CreateThread(function()
	for _, info in pairs(Config.BlipLocation) do
		if Config.UseBlips then
			info.blip = AddBlipForCoord(info.x, info.y, info.z)
			SetBlipSprite(info.blip, info.id)
			SetBlipDisplay(info.blip, 4)
			SetBlipScale(info.blip, 0.6)	
			SetBlipColour(info.blip, info.colour)
			SetBlipAsShortRange(info.blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(info.title)
			EndTextCommandSetBlipName(info.blip)
		end
	end	
end)

--// Shop \\--
RegisterNetEvent('qb-Noodle:Shop:Open', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Noodle Shop", Config.Items)
end)

--// Stash \\--
RegisterNetEvent('qb-Noodle:Stash:Open', function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "Noodle Storage") 
	TriggerEvent("inventory:client:SetCurrentStash", "Noodle Storage")
end)

--// Trey \\--
RegisterNetEvent("qb-Noodle:Tray:Open", function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "Noodle Tray", {maxweight = 30000, slots = 10})
	TriggerEvent("inventory:client:SetCurrentStash", "Noodle Tray") 
end)

--// Wash \\--
RegisterNetEvent("qb-Noodle:Wash:Pan", function()
	QBCore.Functions.TriggerCallback('qb-Noodles:HasItemWashDirtyPan', function(HasItems)
		if HasItems then
			TriggerServerEvent("QBCore:Server:RemoveItem", Config.DirtyPanItem, 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.DirtyPanItem], "remove")                                                 				
			QBCore.Functions.Progressbar("search_register", "Washing Dirty Pan...", 7000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = 'timetable@floyd@clean_kitchen@base',
				anim = 'base',
				flags = 16,
				TriggerEvent("qb-Noodle:SpawnSponage")
			}, {}, {}, function()
				ClearPedTasks(GetPlayerPed(-1))
				TriggerServerEvent("QBCore:Server:AddItem", Config.PanItem, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.PanItem], "add")      
			end, function()
				ClearPedTasks(GetPlayerPed(-1))
			end)   
		else
			QBCore.Functions.Notify('You Dont Have Dirty Pan !', 'error')
		end
	end)  
end)

RegisterNetEvent("qb-Noodle:SpawnSponage")
AddEventHandler("qb-Noodle:SpawnSponage", function()
	LoadModel('prop_sponge_01')
	local sushi = CreateObject(GetHashKey('prop_sponge_01'), GetEntityCoords(PlayerPedId()), true)
	local pedCoords = GetEntityCoords(PlayerPedId())
	local objectSponge = GetClosestObjectOfType(pedCoords, 10.0, GetHashKey("prop_sponge_01"), false)
	local itemid = objectSponge
	if Config.UseSounds then
	 TriggerEvent('LIFE_CL:Sound:PlayOnOne', 'wash', 8.0)
	end
	AttachEntityToEntity(objectSponge,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),0.0,0.0,-0.01,90.0,0.0,0.0,1,1,0,1,0,1)
	Wait(7300)
	DetachEntity(objectSponge, true, true)
	DeleteObject(objectSponge)
end)

--// Duty \\--
RegisterNetEvent('qb-NoodleDuty:duty', function()
	onDuty = not onDuty
	TriggerServerEvent("QBCore:ToggleDuty")
end)

--// Noodles Menu \\--
RegisterNetEvent('qb-Noodles:Restaurant:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Noodles Restaurant Menu",
			txt = "View Recipes",
			params = {
				event = "qb-Noodles:Restaurant:Make:Menu"
            }
        },
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },   
    })
end)

--// Noodles 2 Menu \\--
RegisterNetEvent('qb-Noodle:Menu:Noodles', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Noodles Restaurant Menu",
			txt = "View Noodles Recipes",
			params = {
				event = "qb-Noodles:Restaurant2:Make:Menu"
            }
        },
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },  
    })
end)

--// Noodles Making Menu \\--
RegisterNetEvent('qb-Noodles:Restaurant:Make:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Noodles Restaurant Menu",
			isMenuHeader = true,
        },
        {
            header = "Make Normal Sushi",
            txt = "1X Avocado 1X Sushi Extract 1X Rice 1X Sushi Seaweed",
			params = {
				event = "qb-Noodles:Client:ProcessNormalNoodles",
            }
        },     
		{
            header = "Make Fish Sushi",
            txt = "1X Avocado 1X Sushi Extract 1X Rice 1X Salmon Fish 1X Teriyaki Sauce 1X Sushi Seaweed",
			params = {
				event = "qb-Noodles:Client:ProcessFishSushi",
            }
        },     
		{
            header = "Make Inside Out Sushi",
            txt = "1X Avocado 1X Sushi Extract 1X Rice 1X Spicymayo Sauce 1X Sushi Seaweed",
			params = {
				event = "qb-Noodles:Client:ProcessInsideOutSushi",
            }
        },
		{
            header = "Make Sandwich Sushi",
            txt = "1X Avocado 1X Sushi Extract 1X Rice 1X Sushi Seaweed",
			params = {
				event = "qb-Noodles:Client:ProcessSandwichSushi",
            }
        },    
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },  
    })
end)

--// Noodles Making 2 Menu \\--
RegisterNetEvent('qb-Noodles:Restaurant2:Make:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Noodles Restaurant Menu",
			isMenuHeader = true,
        },
        {
            header = "Make Normal Noodles",
            txt = "1X Raw Noodles 1X Noodles Bowl 1X Pan",
			params = {
				event = "qb-Noodles:Client:ProcessRegularNoodles",
            }
        },     
		{
            header = "Make Egg Roll",
            txt = "1X Egg Roll Meat 1X Pan 1X Spicy Mayo",
			params = {
				event = "qb-Noodles:Client:ProcessEggRoll",
            }
        },     
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },    
    })
end)

CreateThread(function()
	for k, v in pairs(Config.TreyLocations) do
		exports['qb-target']:AddBoxZone("TreyLocation"..k, vector3(v.coords.x, v.coords.y, v.coords.z), v.poly1, v.poly2, {
			name = "TreyLocation"..k,
			heading = v.heading,
			debugPoly = Config.PolyZone,
			minZ = v.minZ,
			maxZ = v.maxZ,
			}, {
				options = { 
				{
					type = "client",
					event = "qb-Noodle:Tray:Open",
					icon = "fa fa-random",
					label = "Open Tray",
				}
			},
			distance = 1.1,
		})
	end

	--// Making Target \\--
	exports['qb-target']:AddBoxZone("NoodleMakingSushi", vector3(-1238.534, -268.8895, 37.498126), 0.4, 2.4, {
		name = "NoodleMakingSushi",
		heading = 206.83779,
		debugPoly = Config.PolyZone,
		minZ = 36.498126,
		maxZ = 38.498126,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-Noodles:Restaurant:Menu",
				icon = "fa fa-angles-right",
				label = "To Make Sushi",	
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
		},
		distance = 1.1
	})

	--// Washing Target \\--
	exports['qb-target']:AddBoxZone("NoodleWashPan", vector3(-1237.112, -267.0296, 37.518581), 0.4, 2.4, {
		name = "NoodleWashPan",
		heading = 298.4013,
		debugPoly = Config.PolyZone,
		minZ = 36.518581,
		maxZ = 38.518581,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-Noodle:Wash:Pan",
				icon = "fa fa-hands-bubbles",
				label = "To Wash Pan",		
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
		},
		distance = 1.1
	})

	--// Register 1 Target \\--
	exports['qb-target']:AddBoxZone("NoodleRegister", vector3(-1237.1999, -271.3155, 37.771099), 0.5, 0.5, {
		name = "NoodleRegister",
		heading = 28.902858,
		debugPoly = Config.PolyZone,
		minZ = 36.771099,
		maxZ = 38.771099,
	}, {
		options = {
			{
				type = "client",
				event = "qb-Noodle:client:open:menu",
				icon = "fa fa-bars",
				label = "Open Menu",
			},
			{
				type = "client",
				event = "qb-NoodleDuty:On",
				icon = "fa fa-clock",
				label = "On / Off Duty",
				job = Config.Job,
			},
		},
		distance = 1.1
	})

	--// Register 2 Target \\--
	exports['qb-target']:AddBoxZone("NoodleRegister2", vector3(-1235.555, -270.4423, 37.792961), 0.5, 0.5, {
		name = "NoodleRegister2",
		heading = 210.56243,
		debugPoly = Config.PolyZone,
		minZ = 36.792961,
		maxZ = 38.792961,
	}, {
		options = {
			{
				type = "client",
				event = "qb-NoodleDuty:duty",
				icon = "fa fa-clock",
				label = "On / Off Duty",
				job = Config.Job,
			},
			{
				type = "client",
				event = "qb-Noodle:client:open:menu",
				icon = "fa fa-bars",
				label = "Open Menu",
			},
		},
		distance = 1.1
	})

	--// Register 2 Target \\--
	exports['qb-target']:AddBoxZone("NoodleRegister3", vector3(-1238.888, -272.1839, 37.774776), 0.5, 0.5, {
		name = "NoodleRegister3",
		heading = 204.77766,
		debugPoly = Config.PolyZone,
		minZ = 36.774776,
		maxZ = 38.774776,
	}, {
		options = {
			{
				type = "client",
				event = "qb-NoodleDuty:duty",
				icon = "fa fa-clock",
				label = "On / Off Duty",
				job = Config.Job,
			},
			{
				type = "client",
				event = "qb-Noodle:client:open:menu",
				icon = "fa fa-bars",
				label = "Open Menu",
			},
		},
		distance = 1.1
	})

	--// Making 2 Target \\--
	exports['qb-target']:AddBoxZone("NoodleMaking2", vector3(-1239.515, -266.8394, 37.735916), 0.4, 2.5, {
		name = "NoodleMaking2",
		heading = 29.642482,
		debugPoly = Config.PolyZone,
		minZ = 36.735916,
		maxZ = 38.735916,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-Noodle:Menu:Noodles",
				icon = "fa fa-angles-right",
				label = "To Make Noodles",		
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
		},
		distance = 1.1
	})

	--// Shop / Stash Target \\--
	exports['qb-target']:AddBoxZone("NoodleShopAndStash", vector3(-1241.44, -267.8354, 37.518581), 0.8, 1.6, {
		name = "NoodleShopAndStash",
		heading = 30.60987,
		debugPoly = Config.PolyZone,
		minZ = 36.518581,
		maxZ = 38.518581,
	}, {
		options = {
			{
            	type = "client",
            	event = "qb-Noodle:Shop:Open",
				icon = "fa fa-shop",
				label = "Open Shop",			
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
			{
            	type = "client",
            	event = "qb-Noodle:Stash:Open",
				icon = "fa fa-box",
				label = "Storage",			
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
			{
            	type = "client",
            	event = "qb-Noodle:GrabPan",
				icon = "fa fa-hand",
				label = "Grab Pan",			
				job = Config.Job,
				canInteract = function()
					if not onDuty then
						return false
					else
						return true
					end
				end,
			},
		},
		distance = 1.0
	})
end)

RegisterNetEvent("Noodle:garage")
AddEventHandler("Noodle:garage", function()
	SpawnBaller(Config.Vehicle)
end)

CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed)
        local letSleep = true        
		vector3(-1330.49, -427.12, -1.75)
        if PlayerJob ~= nil and PlayerJob.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, -1330.49, -427.12, -1.75, true) < 10) then
                letSleep = false
                DrawMarker(2, -1227.75, -293.8171, 37.590229, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 0, 0, 0, 222, false, false, false, true, false, false, false)
                 if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, -1330.49, -427.12, -1.75, true) < 1.5) then
                    DrawText3D(-1227.75, -293.8171, 37.590229, "~g~E~w~ - Noodles Garage") 
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("Noodle:Garage:Menu")
                    end
                end  
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

--// Noodle Garage \\--
function SpawnBaller(vehicle)
    local coords = { ['x'] = -1230.244, ['y'] = -291.0263, ['z'] = 37.708133, ['h'] = 209.90235 }
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "NOODLE"..tostring(math.random(1000, 9999)))
        exports['qb-fuel']:SetFuel(veh, 100.0)
        SetVehicleCustomPrimaryColour(veh, 255,255,255)
        SetEntityHeading(veh, coords.h)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)     
end

--// Noodles Garage Store Vehicle \\--
RegisterNetEvent('Noodle:storecar')
AddEventHandler('Noodle:storecar', function()
    QBCore.Functions.Notify('Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    DeleteVehicle(car)
    DeleteEntity(car)
end)

--// Noodles Garage Menu \\--
RegisterNetEvent('Noodle:Garage:Menu', function()
    TriggerEvent('qb-menu:client:openMenu', {
        {
            header = "Noodles Garage",
			isMenuHeader = true,
        },
        {
            header = "Speedo",
            txt = "Noodle Vehicle",
			params = {
				event = "Noodle:garage",
			}
        },
        {
            header = "Store Vehicle",
            txt = "Store Vehicle Inside Garage",
			params = {
				event = "Noodle:storecar",
			}
        },
		{
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },      
    })
end)

--// Function For Animations \\--
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

RegisterNUICallback('Click', function()
	PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)
  
RegisterNUICallback('CloseNui', function()
	SetNuiFocus(false, false)
end)

--// Menu \\--
RegisterNetEvent('qb-Noodle:client:open:menu')
AddEventHandler('qb-Noodle:client:open:menu', function()
  	SetNuiFocus(true, true)
  	SendNUIMessage({action = 'OpenMenu'})
end)

--[[ Cleaned: 2023/03/02 16:12 ]]--

--[[ Cleaned: 2023/03/02 16:12 ]]--

--[[ Cleaned: 2023/03/02 16:12 ]]--
