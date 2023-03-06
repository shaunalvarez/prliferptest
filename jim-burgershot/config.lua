print("Jim-Burgershot v1.6 - BurgerShot Job Script by Jimathy")

Config = {}

Config.Locations = { ["main"] = { label = "BurgerShot", coords = vector3(-1195.53, -893.31, 13.98 ) }, }

--Info To load depends on chosen MLO's

Config.MLO = "GN"       --use "LP" if you are using Smallo's burgershot MLO
						--use "GN" if you are using GNMods burgershot MLO
						
Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.Items = {
    label = "Storage",
    slots = 20,
    items = { 
        [1] = { name = 'burgerpatty', price = 0, amount = 200, info = {}, type = 'item', slot = 1, },
        [2] = { name = 'potato', price = 0, amount = 200, info = {}, type = 'item', slot = 2, },
        [3] = { name = 'onion', price = 0, amount = 200, info = {}, type = 'item', slot = 3, },
        [4] = { name = 'frozennugget', price = 0, amount = 200, info = {}, type = 'item', slot = 4, },
        [5] = { name = 'milk', price = 0, amount = 200, info = {}, type = 'item', slot = 5, }, 
        [6] = { name = 'icecream', price = 0, amount = 200, info = {}, type = 'item', slot = 6, },
        [7] = { name = 'burgerbun', price = 0, amount = 200, info = {}, type = 'item', slot = 7, },
        [8] = { name = 'cheddar', price = 0, amount = 200, info = {}, type = 'item', slot = 8, },
        [9] = { name = 'lettuce', price = 0, amount = 200, info = {}, type = 'item', slot = 9, },
    },
}

Config.LPJobLocations = {
	--BurgerClockin
	{ location = vector3(-1191.28, -900.45, 13.98), heading = 35.0, width = 0.6, height = 2.5, minZ = 14.2, maxZ = 15.2, distance = 1.5, label = "Toggle Duty", icon = "fas fa-user-check", event = "jim-burgershot:toggleDuty", eventID = "bs_prop_workwall" },
	--Burgershelf
	{ location = vector3(-1197.75, -894.31, 14.19), heading = 123.65, width = 1.1, height = 4.5, minZ = 13.0, maxZ = 14.9, distance = 2.0, label = "Open Shelves", icon = "fas fa-box-open", event = "jim-burgershot:Stash", eventID = "Shelf" },
	--Burgerfridge
	{ location = vector3(-1203.9, -889.75, 13.99), heading = 215.0, width = 1.2, height = 1.6, minZ = 13.0, maxZ = 14.5, distance = 1.5, label = "Open Fridge", icon = "fas fa-temperature-low", event = "jim-burgershot:Stash", eventID = "Fridge" },
	--BurgerStore
	{ location = vector3(-1196.13, -903.78, 13.98), heading = 122.65, width = 1.0, height = 4.5, minZ = 13.2, maxZ = 15.5, distance = 1.5, label = "Open Storage", icon = "fas fa-temperature-low", event = "jim-burgershot:shop", eventID = "404482" },
	--BurgerGrill
	{ location = vector3(-1200.27, -900.76, 14.0), heading = 123.65, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Burger Grill", icon = "fas fa-fire", event = "jim-burgershot:Menu:Grill", eventID = "" },
	--BurgerGrill
	{ location = vector3(-1202.64, -897.27, 14.0), heading = 122.65, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Burger Grill", icon = "fas fa-fire", event = "jim-burgershot:Menu:Grill", eventID = "" },
	--BurgerFryer
	{ location = vector3(-1201.4, -898.98, 13.98), heading = 123.65, width = 0.7, height = 2.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Deep Fryer", icon = "fas fa-temperature-high", event = "jim-burgershot:Menu:Fryer", eventID = "" },
	--BurgerChoppingBoard
	{ location = vector3(-1199.38, -902.07, 14.0), heading = 123.65, width = 0.6, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Chopping Board", icon = "fas fa-utensils", event = "jim-burgershot:Menu:ChopBoard", eventID = "" },
	--BurgerPrepare
	{ location = vector3(-1198.37, -898.36, 13.98), heading = 123.65, width = 1.8, height = 3.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Prepare Food", icon = "fas fa-hamburger", event = "jim-burgershot:Menu:Prepare", eventID = "" },
	--BurgerDrink
	-- { location = vector3(-1199.47, -895.44, 13.9953), heading = 122.65, width = 0.6, height = 1.7, minZ = 13.3, maxZ = 15.0, distance = 1.5, label = "Prepare Drinks", icon = "fas fa-mug-hot", event = "jim-burgershot:Menu:Drink", eventID = "" },
	--BurgerDonut
	{ location = vector3(-1203.35, -895.66, 13.9952), heading = 122.65, width = 0.7, height = 1.0, minZ = 13.3, maxZ = 14.8, distance = 1.5, label = "Open Cabinet", icon = "fas fa-dot-circle", event = "jim-burgershot:Menu:Cabinet", eventID = "" },
}

Config.LPLocations = {
	--Tray 1
	{ location = vector3(-1196.3, -890.7, 14.0), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray1" },
	--Tray 2
	{ location = vector3(-1195.0, -892.68, 14.0), heading = 215.0, width = 0.6, height = 1.1, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray2" },
	--Tray 3
	{ location = vector3(-1193.86, -894.4, 14.0), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray3" },
	
	--Handwash1
	{ location = vector3(-1197.12, -902.07, 13.98), heading = 215.0, width = 1.0, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash2
	{ location = vector3(-1198.23, -902.78, 13.98), heading = 215.65, width = 1.1, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash3
	{ location = vector3(-1200.7, -888.98, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.2, maxZ = 14.6, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash4
	{ location = vector3(-1198.57, -887.54, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.2, maxZ = 14.6, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },}




Config.GNJobLocations = {
	--BurgerClockin
	{ location = vector3(-1191.28, -900.45, 13.98), heading = 34, width = 0.25, height = 1.2, minZ = 13.97, maxZ = 15.22, distance = 1.5, label = "Toggle Duty", icon = "fas fa-user-check", event = "jim-burgershot:toggleDuty", eventID = "bs_prop_workwall" },
	--BurgerGrill
	{ location = vector3(-1202.68, -897.85, 13.38), heading = 34.93, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Burger Grill", icon = "fas fa-fire", event = "jim-burgershot:Menu:Grill", eventID = "" },
	--BurgerChoppingBoard
	{ location = vector3(-1198.38, -898.3, 13.92), heading = 213.93, width = 1.5, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 3.0, label = "Use Chopping Board", icon = "fas fa-utensils", event = "jim-burgershot:Menu:ChopBoard", eventID = "" },
	--BurgerPrepare
	{ location = vector3(-1200.93, -900.08, 13.25), heading = 34.93, width = 0.6, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Prepare Food", icon = "fas fa-hamburger", event = "jim-burgershot:Menu:Prepare", eventID = "" },
	--BurgerStore
	{ location = vector3(-1196.13, -903.78, 13.98), heading = 122.65, width = 1.0, height = 4.5, minZ = 13.2, maxZ = 15.5, distance = 1.5, label = "Open Storage", icon = "fas fa-temperature-low", event = "jim-burgershot:shop", eventID = "404482" },
	--Burgerfridge
	{ location = vector3(-1204.68, -894.64, 15.52), heading = 35.0, width = 3.8, height = 0.6, minZ = 13.0, maxZ = 15.37, distance = 1.5, label = "Open Fridge", icon = "fas fa-temperature-low", event = "jim-burgershot:Stash", eventID = "Fridge" },
	--BurgerFryer
	{ location = vector3(-1201.53, -899.08, 15.05), heading = 34.0, width = 0.6, height = 1.6, minZ = 12.97, maxZ = 14.57, distance = 1.5, label = "Use Deep Fryer", icon = "fas fa-temperature-high", event = "jim-burgershot:Menu:Fryer", eventID = "" },
	--Burgershelf
	{ location = vector3(-1197.24, -894.55, 13.19), heading = 35, width = 2.0, height = 2.0, minZ = 13.17, maxZ = 14.77, distance = 0.9, label = "Open Shelves", icon = "fas fa-box-open", event = "jim-burgershot:Stash", eventID = "" },
	--Burgershelf
	{ location = vector3(-1198.21, -893.33, 13.28), heading = 35, width = 2.0, height = 2.0, minZ = 13.17, maxZ = 14.77, distance = 0.9, label = "Open Shelves", icon = "fas fa-box-open", event = "jim-burgershot:Stash", eventID = "" },
	--BurgerDrink
	{ location = vector3(-1199.47, -895.79, 13.7), heading = 35.0, width = 2.0, height = 0.6, minZ = 13.97, maxZ = 14.97, distance = 1.5, label = "Prepare Drinks", icon = "fas fa-mug-hot", event = "jim-burgershot:Menu:Drink", eventID = "" },
	--BurgerDonut
	{ location = vector3(-1203.39, -896.13, 15.49), heading = 35.0, width = 0.8, height = 0.6, minZ = 13.97, maxZ = 15.17, distance = 2.0, label = "Open Cabinet", icon = "fas fa-dot-circle", event = "jim-burgershot:Menu:Cabinet", eventID = "" },
}

Config.GNLocations = {
	--Tray 1
	{ location = vector3(-1195.98, -891.43, 15.17), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray1" },
	--Tray 2
	{ location = vector3(-1195.04, -892.81, 15.17), heading = 215.0, width = 0.6, height = 1.1, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray2" },
	--Tray 3
	{ location = vector3(-1193.96, -894.47, 15.32), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "jim-burgershot:Stash", eventID = "Tray3" },
	--Cash register 1
	{ location = vector3(-1194.42, -893.98, 15.38), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Charge Costumer", icon = "fas fa-credit-card", event = "jim-burgershot:client:Charge", eventID = "Teller1" },
	--Cash register 2
	{ location = vector3(-1195.35, -892.46, 15.26), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Charge Costumer", icon = "fas fa-credit-card", event = "jim-burgershot:client:Charge", eventID = "Teller1" },
	--Cash register 3
	{ location = vector3(-1196.42, -890.88, 15.32), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Charge Costumer", icon = "fas fa-credit-card", event = "jim-burgershot:client:Charge", eventID = "Teller1" },
	--Cash register 4
	{ location = vector3(-1192.89, -906.27, 15.34), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Charge Costumer", icon = "fas fa-credit-card", event = "jim-burgershot:client:Charge", eventID = "Teller1" },
	--Handwash1
	{ location = vector3(-1200.21, -900.97, 15.09), heading = 300.0, width = 0.6, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash2
	{ location = vector3(-1201.97, -888.04, 15.14), heading = 122.65, width = 0.6, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash3
	{ location = vector3(-1199.38, -886.32, 15.11), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash4
	{ location = vector3(-1181.56, -899.59, 15.22), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
	--Handwash5
	{ location = vector3(-1201.16, -891.14, 13.98), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "jim-burgershot:washHands", eventID = "" },
}

