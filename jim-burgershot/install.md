Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

Update v1.6:
	- Fixed heartstopper recipie not requiring slciedonions
	- Added Custom prop emotes
	- Fixed Clockin board prop not loading
		- This was due to it not being loaded in memory properly, delaying its load and requesting the model fixed this (hopefully)
	- Updated layout of Menu's
		- Using names of items in shared rather than manually typed
	- New Milk Icon from the ingame Prop
	- CHANGED SHARED.LUA ITEM INFO, UPDATE THIS OR HUNGER AND THIRST WONT CHANGE
	
Update v1.5:
	- Tidied Smallo's MLO up
		- Removed Rubbish and props on the ground
		- Removed Graffiti and boxes from toilets
		- Removed rubbish from side hallway
		- Added ATM outside
	- GN BurgerShot MLO config changes
		- Tidied up a few qb-target job locations slightly for QoL
		- Changed clockin location from lockers to a new clockin board outside changing rooms
		- Added trays to counter for passing items to customer
		- Added ATM outside
	- ALL CHAIRS RELATED INFO MOVED TO CHAIRS.LUA
		- If you don't want to override the config file, just remove the chair config info from it and use the chairs.lua instead.
		- Added teleport fixes for standing up on tables
		- Backspace now stands you up and teleports you if needed
	- Chopping Onions or Potatos will consume every of the item held and extend the progressbar
	- Two New Food items:
		- Chicken Wrap
		- Goat Cheese Wrap
		- These are available at the chopping board
	- New Nuggets icon based on GN Mods Food Menu
	- New Onion Rings icon
	

Update v1.4:
	- Updated payment system to use QB-Input and QB-Phone
		- NUI system is no longer used
		- To keep use of the receipt check the installation on how to receive them in the new system
	- Small QoL Fixes
	
Update v1.3:
	- Removed obsolete code

Update v1.2
	- Added Support for GN Mod's Burgershot: https://youtu.be/h47N3ES_4tA

Update v1.1
	- Full Re-Write of the seating code, had to place every single chair location again..

----------------------------------------------------------------------------------------------------

INSTALL:

Add the item images to your inventory script

	[qb] > qb-inventory > html > images

THESE GO IN YOUR SHARED.LUA IN qb-core:

Under the QBSare.Items = {
	--BurgerShot
	["potato"] 						 = {["name"] = "potato",					["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Potatos"},
	["slicedpotato"] 				 = {["name"] = "slicedpotato",				["label"] = "Sliced Potatoes",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedpotato.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Potato"},
	["slicedonion"] 				 = {["name"] = "slicedonion",				["label"] = "Sliced Onions",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedonion.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Onion"},
	["icecream"] 					 = {["name"] = "icecream",					["label"] = "Ice Cream",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-icecream.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Ice Cream."},
	["milk"] 						 = {["name"] = "milk",						["label"] = "Milk",						["weight"] = 500,		["type"] = "item",		["image"] = "burger-milk.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bottle of Milk"},
	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["onion"] 						 = {["name"] = "onion",						["label"] = "Onion",					["weight"] = 500,		["type"] = "item",		["image"] = "burger-onion.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "An onion"},
	["frozennugget"] 				 = {["name"] = "frozennugget",				["label"] = "Frozen Nuggets",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-frozennugget.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Frozen Nuggets"},
	["cheddar"] 					 = {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
	["burgerbun"] 		 			 = {["name"] = "burgerbun",       		    ["label"] = "Burger Bun",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "burgerbun.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Some big burger brother"},
	["burgerpatty"] 				 = {["name"] = "burgerpatty",				["label"] = "Burger Patty",				["weight"] = 500,		["type"] = "item",		["image"] = "burgerpatty.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Raw Patty"},
	["burgermeat"] 				 	 = {["name"] = "burgermeat",				["label"] = "Burger Meat",				["weight"] = 500,		["type"] = "item",		["image"] = "burgermeat.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Cooked Burger Meat"},
	["milkshake"] 					 = {["name"] = "milkshake",					["label"] = "Milkshake",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-milkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "BurgerShot Milkshake", ['thirst'] = math.random(35, 54) },
	["shotnuggets"] 				 = {["name"] = "shotnuggets", 			  	["label"] = "Shot Nuggets", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotnuggets.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Nuggets", ['hunger'] = math.random(40, 50) },
	["shotrings"] 				 	 = {["name"] = "shotrings", 			  	["label"] = "Ring Shots", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotrings.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Onion Rings", ['hunger'] = math.random(40, 50) },
	["burger-ticket"] 				 = {["name"] = "burger-ticket", 			["label"] = "Receipt", 	     			["weight"] = 150, 		["type"] = "item", 		["image"] = "ticket.png", 				["unique"] = false,   	["useable"] = false,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Cash these in at the bank!"},	
	["heartstopper"] 			 	 = {["name"] = "heartstopper",       		["label"] = "HeartStopper",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-heartstopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Heartstopper", ['hunger'] = math.random(50, 60) },
	["shotfries"] 		 			 = {["name"] = "shotfries",       			["label"] = "Shot Fries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-fries.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Shot Fries", ['hunger'] = math.random(40, 50) },
	["moneyshot"] 		 			 = {["name"] = "moneyshot",       			["label"] = "Money Shot",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-moneyshot.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Money Shot", ['hunger'] = math.random(40, 50) },
	["meatfree"] 		 			 = {["name"] = "meatfree",       			["label"] = "Meat Free",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-meatfree.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Meat Free", ['hunger'] = math.random(40, 50) },
	["bleeder"] 		 			 = {["name"] = "bleeder",       			["label"] = "The Bleeder",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-bleeder.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "The Bleeder", ['hunger'] = math.random(40, 50) },
	["bscoffee"] 		 			 = {["name"] = "bscoffee",       			["label"] = "BurgerShot Coffee",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-coffee.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Coffee", ['thirst'] = math.random(35, 54) },
	["bscoke"] 		 				 = {["name"] = "bscoke",       				["label"] = "BurgerShot Coke",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-softdrink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cola", ['thirst'] = math.random(35, 54) },
	["torpedo"] 		 			 = {["name"] = "torpedo",       			["label"] = "Torpedo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-torpedo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Torpedo", ['hunger'] = math.random(40, 50) },
	["rimjob"] 		 				 = {["name"] = "rimjob",  	     			["label"] = "Rim Job",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-rimjob.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Donut", ['hunger'] = math.random(40, 50) },
	["creampie"] 		 			 = {["name"] = "creampie",  	     		["label"] = "Creampie",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-creampie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Apple Pie", ['hunger'] = math.random(40, 50) },
	["cheesewrap"] 					 = {["name"] = "cheesewrap", 				["label"] = "BS Cheese Wrap", 	     	["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-chickenwrap.png", 	["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cheese Wrap", ['hunger'] = math.random(40, 50) },	
	["chickenwrap"] 				 = {["name"] = "chickenwrap", 				["label"] = "BS Goat Cheese Wrap", 	    ["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-goatwrap.png", 		["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Goat Cheese Wrap", ['hunger'] = math.random(40, 50)},	

Under the QBShared.Jobs = {

	['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},


-------------------------------------------------------------------------------------------------

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {

	--Jim-BurgerShot
   ["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions =
   {    Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["bscoke"] = {"mp_player_intdrink", "loop_bottle", "BS Coke", AnimationOptions =
   {    Prop = "prop_food_bs_juice01", PropBone = 18905, PropPlacement = {0.04, -0.10, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["bscoffee"] = {"mp_player_intdrink", "loop_bottle", "BS Coffee", AnimationOptions =
   {    Prop = "prop_food_bs_coffee", PropBone = 18905, PropPlacement = {0.08, -0.10, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},   
   ["glass"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tall Glass", AnimationOptions =
   {   Prop = 'prop_wheat_grass_glass', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.1, 0.0, 0.0, 0.0},
       EmoteLoop = true, EmoteMoving = true, }}, 
		
   ["torpedo"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions =
   {    Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0},
        EmoteMoving = true, EmoteLoop = true, }},     
   ["bsfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions =
   {    Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0},
        EmoteMoving = true, EmoteLoop = true, }},      		
   ["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions =
   {   Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
       EmoteMoving = true, EmoteLoop = true, }},	

--------------------------------------------------------------------------------------------------

Within the config.lua of qb-bossmenu and one of the below

This adds the boss menu location to the back of Smallo's MLO
	['burgershot'] = vector3(-1191.15, -897.94, 14.0),

This adds the boss menu location to the back of GN Mods BurgerShot
	['burgershot'] = vector3(-1177.79, -896.37, 14.0),
	
--------------------------------------------------------------------------------------------------

To make use of the ticket system:

Go to [qb] > qb-phone > client > main.lua

 - Around line 645 there should be the PayInvoice NUICallBack

	- Directly under this line:

	TriggerServerEvent('qb-phone:server:BillingEmail', data, true)
            
	- Add these lines:

	--Jim's Ticket Systems
	if data.society == "burgershot" then TriggerServerEvent('jim-burgershot:Tickets:Give', data.amount) end
	
---------------------------------------------------------------------------------------------------

To give commission per sale compeleted to the person who sent the payment through the system
	
	- Go to [qb] > qb-phone > config.lua and add burgershot to this table at the top.
	
		Config.BillingCommissions = { -- This is a percentage (0.10) == 10%
			mechanic = 0.10,
			burgershot = 0.10
		}
