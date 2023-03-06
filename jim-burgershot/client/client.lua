local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent("qb-burgershot:MurderMeal", function(bagid)
	if bagid then
		TriggerServerEvent("inventory:server:OpenInventory", "stash", 'murdermeal_'..bagid, {maxweight = 5000, slots = 5})
		TriggerEvent("inventory:client:SetCurrentStash", 'murdermeal_'..bagid)
	else
		QBCore.Functions.Notify("This meal is fake!")
	end
end)


PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "burgershot" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function() 
    BurgershotBlip = AddBlipForCoord(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)
    SetBlipSprite(BurgershotBlip, 106)
    SetBlipDisplay(BurgershotBlip, 3)
    SetBlipColour(BurgershotBlip, 5)
    SetBlipScale(BurgershotBlip, 0,6)
    SetBlipAsShortRange(BurgershotBlip, true)
    SetBlipScale(BurgershotBlip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(BurgershotBlip)
end)

RegisterNetEvent('BurgerShotMenu')
AddEventHandler('BurgerShotMenu', function()
  TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Dunkin Items",
            txt = ""
        },
        {
            id = 2,
            header = "| Hot Coffee |",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 3,
            header = "| Iced Coffee |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
          id = 4,
          header = "| Bagel with Butter |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
        id = 5,
        header = "| Pink Donut |",
        txt = "$100",
        params = {
            event = ""
           }
        },
        {
          id = 6,
          header = "| White Donut |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
          id = 7,
          header = "| Purple Donut |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
          id = 8,
          header = "| Blue Donut |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
        id = 9,
        header = "| itemname |",
        txt = "$100",
        params = {
            event = ""
         }
      },
      {
      id = 10,
      header = "| itemname |",
      txt = "$100",
      params = {
          event = ""
         }
      },
      {
        id = 11,
        header = "| itemname |",
        txt = "$100",
        params = {
            event = ""
         }
      },
              {
            id = 12,
            header = "| itemname |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
            id = 13,
            header = "| itemname |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
          id = 14,
          header = "| itemname |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
        id = 15,
        header = "| itemname |",
        txt = "$100",
        params = {
            event = ""
           }
        },
        {
          id = 16,
          header = "| itemname |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
          id = 17,
          header = "| itemname |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
          id = 18,
          header = "| itemname |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
        id = 19,
        header = "| itemname |",
        txt = "$100",
        params = {
            event = ""
         }
      },
      {
      id = 20,
      header = "| itemname |",
      txt = "$100",
      params = {
          event = ""
         }
      },
      {
        id = 21,
        header = "| itemname |",
        txt = "$100",
        params = {
            event = ""
         }
      },
    })
end)

Citizen.CreateThread(function()
    while true do
      local sleep = 2000
      local PlayerPed = PlayerPedId()
      local PlayerPos = GetEntityCoords(PlayerPed)
      local Player = QBCore.Functions.GetPlayerData()
  
      local BurgerShotMenu = #(PlayerPos - vector3(-1193.8, -893.55, 13.97))  
      
      InRange = false
      if BurgerShotMenu < 10 then sleep = 2 end
      if BurgerShotMenu < 1.0 then
          InRange = true
              if IsControlJustPressed(0, 38) then
                  TriggerEvent("BurgerShotMenu")
              end
            end
      Citizen.Wait(sleep)
    end
  end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
Citizen.CreateThread(function()
    --local PlayerData = QBCore.Functions.GetPlayerData()
	while true do
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		if PlayerJob.name == "burgershot" and onDuty then
			if #(pos - vector3(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)) > Config.ClockOutDist then
				onDuty = not onDuty
				TriggerServerEvent("QBCore:ToggleDuty")
			end
		end
		Wait(100)
	end
end)

CreateThread(function()
	if Config.MLO == "GN" then
		if tray1 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_02"))
			Wait(100)
			local tray1 = CreateObject(GetHashKey("prop_food_bs_tray_02"),-1193.36, -895.44, 15.1-1.0,false,false,false)
			SetEntityHeading(tray1,GetEntityHeading(tray1)-60)
			FreezeEntityPosition(tray1, true)
		end
		if tray2 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_01"))
			Wait(100)
			local tray2 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1194.42, -893.88, 15.1-1.0,false,false,false)
			SetEntityHeading(tray2,GetEntityHeading(tray2)-60)
			FreezeEntityPosition(tray2, true)
		end
		if tray3 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_01"))
			Wait(100)
			local tray3 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1192.41, -896.84, 15.1-1.0,false,false,false)
			SetEntityHeading(tray3,GetEntityHeading(tray3)-60)
			FreezeEntityPosition(tray3, true)
		end
		if clockin == nil then
			RequestModel(GetHashKey("v_ind_tor_clockincard"))
			Wait(100)
			local clockin = CreateObject(GetHashKey("v_ind_tor_clockincard"),-1186.42, -898.41, 13.97,false,false,false)
			SetEntityHeading(clockin,GetEntityHeading(clockin)-145)
			FreezeEntityPosition(clockin, true)
		end
		if atm == nil then
			RequestModel(GetHashKey("prop_atm_01"))
			Wait(100)
			local atm = CreateObject(GetHashKey("prop_atm_01"),-1199.6, -884.99, 13.66-1.25,false,false,false)
			SetEntityHeading(atm,GetEntityHeading(atm)-145)
			FreezeEntityPosition(atm, true)
		end
	elseif Config.MLO == "LP" then
		--CLEAR PROPS
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -851111464, true)
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -421145003, true)
		
		CreateModelHide(vector3(-1199.01, -890.5, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1196.95, -886.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1191.59, -882.02, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1195.24, -890.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.99, -894.32, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.81, -881.8, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1188.73, -890.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1182.04, -894.47, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.26, -896.37, 14.0), 1.5, 1864388210, true)
		
		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 759729215, true)
		CreateModelHide(vector3(-1180.19, -893.49, 14.0), 1.5, -775118285, true)
		
		CreateModelHide(vector3(-1200.74, -887.44, 14.0), 1.5, 1778631864, true)
		
		CreateModelHide(vector3(-1200.34, -886.73, 14.01), 1.5, -1842599357, true)
		
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 600967813, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1049934319, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 443058963, true)
		
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 510552540, true)
		
		CreateModelHide(vector3(-1187.63, -898.52, 14.0), 1.5, 510552540, true)
		
		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1948359883, true)
		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1388308576, true)		
				
		CreateModelHide(vector3(-1200.69, -888.19, 14.0), 1.5, 922914566, true)
		CreateModelHide(vector3(-1202.72, -888.3, 14.0), 1.5, -1732499190, true)
	
		--ADD JOB RELATED PROPS
		local tray1 = CreateObject(GetHashKey("prop_food_bs_tray_02"),-1196.3, -890.7, 14.02,false,false,false)
		SetEntityHeading(tray1,GetEntityHeading(tray1)-60)
		FreezeEntityPosition(tray1, true)
		
		local tray2 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1195.0, -892.68, 14.02,false,false,false)
		SetEntityHeading(tray2,GetEntityHeading(tray2)-60)
		FreezeEntityPosition(tray2, true)
		
		local atm = CreateObject(GetHashKey("prop_atm_01"),-1199.6, -884.99, 13.66-1.25,false,false,false)
		SetEntityHeading(atm,GetEntityHeading(atm)-145)
		FreezeEntityPosition(atm, true)
		
	end
end)

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("BurgerPay", vector3(251.75, 222.17, 106.2), 0.6, 2.0, { name="BurgerPay", heading = 340.0, debugPoly=false, minZ = 105.75, maxZ = 107.29, }, 
		{ options = { { type = "server", event = "jim-burgershot:Tickets:Sell", icon = "fas fa-receipt", label = "Cash in Receipts", job = "burgershot" }, },
		  distance = 2.0
	})

	if Config.MLO == "LP" then
		for k, v in pairs(Config.LPJobLocations) do
			exports['qb-target']:AddBoxZone("burgershotJob"..k, v.location, v.width, v.height, { name="burgershotJob"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, job = "burgershot", id = v.eventID }, },
				  distance = v.distance
			})
		end
		for k, v in pairs(Config.LPLocations) do
			exports['qb-target']:AddBoxZone("burgershot"..k, v.location, v.width, v.height, { name="burgershot"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, id = v.eventID }, },
				  distance = v.distance
			})
		end
		exports['qb-target']:AddCircleZone("Receipt", vector3(-1192.84, -906.47, 15.8), 0.5, { name="Receipt", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot" }, },
			  distance = 1.0
		})
		exports['qb-target']:AddCircleZone("Receipt2", vector3(-1196.41, -890.84, 15.25), 0.5, { name="Receipt2", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot", }, },
			  distance = 1.0
		})
		exports['qb-target']:AddCircleZone("Receipt3", vector3(-1194.27, -893.93, 15.24), 0.5, { name="Receipt3", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot",}, },
			  distance = 1.0
		})	
	elseif Config.MLO == "GN" then
		for k, v in pairs(Config.GNJobLocations) do
			exports['qb-target']:AddBoxZone("burgershotJob"..k, v.location, v.width, v.height, { name="burgershotJob"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, job = "burgershot", id = v.eventID }, },
				  distance = v.distance
			})
		end
		for k, v in pairs(Config.GNLocations) do
			exports['qb-target']:AddBoxZone("burgershot"..k, v.location, v.width, v.height, { name="burgershot"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, id = v.eventID }, },
				  distance = v.distance
			})
		end
		exports['qb-target']:AddCircleZone("Receipt", vector3(-1192.84, -906.47, 15.8), 0.5, { name="Receipt", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot" }, },
			  distance = 1.0
		})
		exports['qb-target']:AddCircleZone("Receipt2", vector3(-1196.41, -890.84, 15.25), 0.5, { name="Receipt2", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot", }, },
			  distance = 1.0
		})
		exports['qb-target']:AddCircleZone("Receipt3", vector3(-1194.27, -893.93, 15.24), 0.5, { name="Receipt3", debugPoly=false, useZ=true, },
		{ options = { { event = "jim-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Charge Customer", job = "burgershot",}, },
			  distance = 1.0
		})	
	end
end)

RegisterNetEvent('jim-burgershot:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('jim-burgershot:washHands')
AddEventHandler('jim-burgershot:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Washing hands', 5000, false, false, {
        disableMovement = true, --
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mp_arresting", 
        anim = "a_uncuff", 
        flags = 8,
    }, {}, {}, function()  
		TriggerEvent('QBCore:Notify', "You\'ve washed your hands!", 'success')
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

RegisterNetEvent('jim-burgershot:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		if data.item == "slicedpotato" or data.item == "slicedonion" or data.item == "mysteryburger" or data.item == "wrappedweiner" or data.item == "cheesewrap" or data.item == "chickenwrap" or data.item == "shotfries" or data.item == "shotrings" or data.item == "shotnuggets" or data.item == "burgermeat" or data.item == "milkshake" or data.item == "heartstopper" or data.item == "bleeder" or data.item == "torpedo" or data.item == "meatfree" or data.item == "moneyshot" then
			QBCore.Functions.TriggerCallback('jim-burgershot:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "You don't have the correct ingredients", 'error') else FoodProgress(data.item) end		
			end)
		end
	end
end)

RegisterNetEvent('jim-burgershot:Stash')
AddEventHandler('jim-burgershot:Stash',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", data.id)
	TriggerEvent("inventory:client:SetCurrentStash", data.id)
end)

RegisterNetEvent('jim-burgershot:shop')
AddEventHandler('jim-burgershot:shop',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Items)
	end
end)

-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "water_bottle" or ItemMake == "bscoke" or ItemMake == "milkshake" or ItemMake == "bscoffee" then
		bartext = "Pouring "..QBCore.Shared.Items[ItemMake].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
		animflag = 8
	elseif ItemMake == "rimjob" or ItemMake == "creampie" then
		bartext = "Receiving "..QBCore.Shared.Items[ItemMake].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
		animflag = 8

	elseif ItemMake == "slicedpotato" or ItemMake == "slicedonion" then
		QBCore.Functions.TriggerCallback('jim-burgershot:amount:'..ItemMake, function(cb) amount = cb end)
		bartext = "Slicing "..amount.." "..QBCore.Shared.Items[ItemMake].label
		bartime = amount * 2000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 3
	elseif ItemMake == "cheesewrap" or ItemMake == "chickenwrap" then
		bartext = "Preparing "..QBCore.Shared.Items[ItemMake].label
		bartime = 8000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 8
	elseif ItemMake == "shotfries" or ItemMake == "shotrings" or ItemMake == "shotnuggets" then
		bartext = "Frying "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "mp_arresting"
        animNow = "a_uncuff"
		animflag = 8
	elseif ItemMake == "burgermeat" then
		bartext = "Cooking Meat"
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
		animflag = 8
	elseif ItemMake == "heartstopper" or ItemMake == "bleeder" or ItemMake == "wrappedweiner" or ItemMake == "mysteryburger" or ItemMake == "torpedo" or ItemMake == "meatfree" or ItemMake == "moneyshot" then
		bartext = "Preparing "..QBCore.Shared.Items[ItemMake].label
		bartime = 12500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"			
		animflag = 8
	end
	
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true, --
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = animflag,
	}, {}, {}, function()  
		TriggerServerEvent('jim-burgershot:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end)
end

-- // Utilities \\ 

RegisterNetEvent('jim-burgershot:Ticket:Menu', function()
    exports['qb-menu']:openMenu({ 
		{ isMenuHeader = true, header = "Burgershot Payment", txt = "Do you want trade your tickets for payment?" },	
        { header = "Yes", server = true, params = { event = "jim-burgershot:Tickets:Sell" } },
        { header = "No", params = { event = "jim-burgershot:Tickets:Sell:no" } },
    })
end)

RegisterNetEvent('jim-burgershot:Menu:ChopBoard', function()
    exports['qb-menu']:openMenu({ 
		{ isMenuHeader = true, header = "Chopping Board" },
        { header = QBCore.Shared.Items['slicedpotato'].label, txt = "- "..QBCore.Shared.Items['potato'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'slicedpotato' } } },
        { header = QBCore.Shared.Items['slicedonion'].label, txt = "- "..QBCore.Shared.Items['onion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'slicedonion' } } },
        { header = QBCore.Shared.Items['chickenwrap'].label, txt = "- "..QBCore.Shared.Items['shotnuggets'].label.."<br>- "..QBCore.Shared.Items['lettuce'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'chickenwrap' } } },
        { header = QBCore.Shared.Items['cheesewrap'].label, txt = "- "..QBCore.Shared.Items['cheddar'].label.."<br>- "..QBCore.Shared.Items['lettuce'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'cheesewrap' } } },
    })
end)

RegisterNetEvent('jim-burgershot:Menu:Fryer', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Deep Fat Fryer" },
        { header = QBCore.Shared.Items['shotfries'].label, txt = "- "..QBCore.Shared.Items['slicedpotato'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'shotfries' } } },
        { header = QBCore.Shared.Items['shotrings'].label, txt = "- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'shotrings' } } },
        { header = QBCore.Shared.Items['shotnuggets'].label, txt = "- "..QBCore.Shared.Items['frozennugget'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'shotnuggets' } } },
    })
end)

RegisterNetEvent('jim-burgershot:Menu:Grill', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Burger Grill" },
        { header = QBCore.Shared.Items['burgermeat'].label, txt = "- "..QBCore.Shared.Items['burgerpatty'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'burgermeat' } } }, 
    })
end)

RegisterNetEvent('jim-burgershot:Menu:Prepare', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Prepare Food" },
        { header = QBCore.Shared.Items['heartstopper'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'heartstopper' } } },
        { header = QBCore.Shared.Items['mysteryburger'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'mysteryburger' } } },
        { header = QBCore.Shared.Items['wrappedweiner'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'wrappedweiner' } } },
        { header = QBCore.Shared.Items['bleeder'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'bleeder' } } }, 
        { header = QBCore.Shared.Items['torpedo'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'torpedo' } } },  
        { header = QBCore.Shared.Items['meatfree'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'meatfree' } } },  
        { header = QBCore.Shared.Items['moneyshot'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'moneyshot' } } },  
    })
end)

RegisterNetEvent('jim-burgershot:Menu:Drink', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Drinks Dispenser" },
        { header = QBCore.Shared.Items['water_bottle'].label, params = { event = "jim-burgershot:JustGive", args = { id = 'water_bottle' } } },
        { header = QBCore.Shared.Items['bscoke'].label, params = { event = "jim-burgershot:JustGive", args = { id = 'bscoke' } } },
        { header = QBCore.Shared.Items['bscoffee'].label, params = { event = "jim-burgershot:JustGive", args = { id = 'bscoffee' } } },
        { header = QBCore.Shared.Items['milkshake'].label, txt = "- "..QBCore.Shared.Items['milk'].label.."<br>- "..QBCore.Shared.Items['icecream'].label, params = { event = "jim-burgershot:MakeItem", args = { item = 'milkshake' } } },
    })
end)
RegisterNetEvent('jim-burgershot:Menu:Cabinet', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Food Cabinet" },
        { header = "", txt = QBCore.Shared.Items['rimjob'].label, params = { event = "jim-burgershot:JustGive", args = { id = 'rimjob' } } },
        { header = "", txt = QBCore.Shared.Items['creampie'].label, params = { event = "jim-burgershot:JustGive", args = { id = 'creampie' } } },
    })
end)

RegisterNetEvent('jim-burgershot:JustGive', function(data) 	if not onDuty then TriggerEvent('QBCore:Notify', "Not clocked in!", 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('jim-burgershot:client:Charge', function()
	if not onDuty then TriggerEvent("QBCore:Notify", "Not Clocked in!", "error") return end
    local dialog = exports['qb-input']:ShowInput({
        header = "Charge Customer",
        submitText = "Send",
        inputs = {
            { type = 'number', isRequired = true, name = 'citizen', text = 'Citizen\'s ID' },
            { type = 'number', isRequired = true, name = 'price', text = 'Amount to Charge' },
        }
    })
    if dialog then
        if not dialog.citizen or not dialog.price then return end
        TriggerServerEvent('jim-burgershot:server:Charge', dialog.citizen, dialog.price)
    end
end)

RegisterNetEvent('jim-burgershot:client:Eat', function(itemName)
	if itemName == "moneyshot" or itemName == "heartstopper" or itemName == "mysteryburger" or itemName == "wrappedweiner" or itemName == "bleeder" or itemName == "meatfree" then TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
	elseif itemName == "torpedo" or itemName == "cheesewrap" or itemName == "chickenwrap" then TriggerEvent('animations:client:EmoteCommandStart', {"torpedo"})
	elseif itemName == "shotrings" or itemName == "shotnuggets" or itemName == "shotfries" then TriggerEvent('animations:client:EmoteCommandStart', {"bsfries"})
	elseif itemName == "rimjob" or itemName == "creampie" then TriggerEvent('animations:client:EmoteCommandStart', {"donut2"}) end
	QBCore.Functions.Progressbar("eat_something", "Eating "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if itemName == "heartstopper" then
            exports['tnj-buffs']:AddBuff("super-hunger", 650000)
        end
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)

RegisterNetEvent('jim-burgershot:client:Drink', function(itemName)
	if itemName == "bscoke" then  TriggerEvent('animations:client:EmoteCommandStart', {"bscoke"})
	elseif itemName == "bscoffee" then TriggerEvent('animations:client:EmoteCommandStart', {"bscoffee"})
	elseif itemName == "milk" then TriggerEvent('animations:client:EmoteCommandStart', {"milk"})
	elseif itemName == "milkshake" then TriggerEvent('animations:client:EmoteCommandStart', {"glass"}) end
    QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		--if itemName == "sprunk" then TriggerServerEvent("consumables:server:Give", "can") end
	end)
end)
