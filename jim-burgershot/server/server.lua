local QBCore = exports['qb-core']:GetCoreObject()

function MurderMealID(id, bool)
    local path = GetResourcePath(GetCurrentResourceName())
    path = path:gsub('//', '/')..'/used.lua'   
    local file = io.open(path, 'a+')
    file:write("\nmurdercheck["..id.."] = "..bool)
    murdercheck[id] = bool
    file:close()
end

QBCore.Functions.CreateUseableItem("burger-murdermeal", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        if murdercheck[item.info.bagid] == nil then
            local randomToy = math.random(1,5)
			exports.oxmysql:insert('INSERT INTO stashitems (stash, items) VALUES (@stash, @items)', {
				['@stash'] ='murdermeal_'..item.info.bagid,
				['@items'] = '[{"info":[],"useable":true,"unique":false,"label":"HeartStopper","type":"item","name":"heartstopper","slot":1,"image":"burger-heartstopper.png","weight":200,"amount":1},{"info":[],"useable":true,"unique":false,"label":"Shot Fries","type":"item","name":"shotfries","slot":2,"image":"burger-fries.png","weight":200,"amount":1},{"info":[],"useable":true,"unique":false,"label":"BurgerShot Coke","type":"item","name":"bscoke","slot":3,"image":"burger-softdrink.png","weight":200,"amount":1},{"info":[],"useable":false,"unique":true,"label":"Boosterpack","type":"item","name":"boosterpack","slot":4,"image":"boosterPack.png","weight":0,"amount":1}]'
			})
        end
        MurderMealID(item.info.bagid, "true")
        TriggerClientEvent("qb-burgershot:MurderMeal", source, item.info.bagid)
    end
end)


QBCore.Functions.CreateUseableItem("heartstopper", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("shotfries", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("shotnuggets", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("shotrings", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("moneyshot", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("meatfree", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("bleeder", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("torpedo", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("rimjob", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("creampie", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("cheesewrap", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("chickenwrap", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("wrappedweiner", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)
QBCore.Functions.CreateUseableItem("mysteryburger", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Eat", source, item.name) end end)

QBCore.Functions.CreateUseableItem("bscoke", function(source, item)	if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("bscoffee", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("milkshake", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Drink", source, item.name) end end)
QBCore.Functions.CreateUseableItem("milk", function(source, item) if QBCore.Functions.GetPlayer(source).Functions.RemoveItem(item.name, 1, item.slot) then TriggerClientEvent("jim-burgershot:client:Drink", source, item.name) end end)

RegisterServerEvent('jim-burgershot:GetFood')
AddEventHandler('jim-burgershot:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source) 
	if ItemMake == "slicedpotato" then
		amount = QBCore.Functions.GetPlayer(source).Functions.GetItemByName('potato').amount
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['potato'], "remove", amount) 
		Player.Functions.RemoveItem('potato', amount)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", amount) 
		Player.Functions.AddItem(ItemMake, amount, false, {["quality"] = nil})
		return
	elseif ItemMake == "slicedonion" then
		amount = QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion').amount
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['onion'], "remove", amount) 
		Player.Functions.RemoveItem('onion', amount)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", amount) 
		Player.Functions.AddItem(ItemMake, amount, false, {["quality"] = nil})
		return
	elseif ItemMake == "shotfries" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedpotato'], "remove", 1) 
		Player.Functions.RemoveItem('slicedpotato', 1)
	elseif ItemMake == "shotrings" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1) 
		Player.Functions.RemoveItem('slicedonion', 1)
	elseif ItemMake == "shotnuggets" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['frozennugget'], "remove", 1) 
		Player.Functions.RemoveItem('frozennugget', 1)
	elseif ItemMake == "burgermeat" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerpatty'], "remove", 1) 
		Player.Functions.RemoveItem('burgerpatty', 1)
	elseif ItemMake == "milkshake" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['icecream'], "remove", 1) 
		Player.Functions.RemoveItem('icecream', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "heartstopper" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1)	
	elseif ItemMake == "mysteryburger" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1)	
	elseif ItemMake == "wrappedweiner" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1)	
	elseif ItemMake == "bleeder" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1)	
	elseif ItemMake == "torpedo" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1) 
	elseif ItemMake == "meatfree" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('lettuce', 1)	
	elseif ItemMake == "moneyshot" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgerbun'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['slicedonion'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burgermeat'], "remove", 1)
		Player.Functions.RemoveItem('burgerbun', 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('slicedonion', 1)
		Player.Functions.RemoveItem('lettuce', 1)
		Player.Functions.RemoveItem('burgermeat', 1)		
	elseif ItemMake == "cheesewrap" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cheddar'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		Player.Functions.RemoveItem('cheddar', 1)
		Player.Functions.RemoveItem('lettuce', 1)
	elseif ItemMake == "chickenwrap" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['shotnuggets'], "remove", 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1)
		Player.Functions.RemoveItem('shotnuggets', 1)
		Player.Functions.RemoveItem('lettuce', 1)
	end
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1) 
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
end)

QBCore.Functions.CreateCallback('jim-burgershot:get:milkshake', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('icecream') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:heartstopper', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:bleeder', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:torpedo', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:meatfree', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:moneyshot', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:chickenwrap', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('shotnuggets') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:cheesewrap', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:shotnuggets', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('frozennugget') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:shotrings', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:shotfries', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedpotato') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:burgermeat', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerpatty') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:slicedpotato', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('potato') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:slicedonion', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:mysteryburger', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('jim-burgershot:get:wrappedweiner', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgerbun') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('cheddar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('burgermeat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('slicedonion') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('jim-burgershot:amount:slicedonion', function(source, cb) amount = QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion').amount cb(amount) end)
QBCore.Functions.CreateCallback('jim-burgershot:amount:slicedpotato', function(source, cb) amount = QBCore.Functions.GetPlayer(source).Functions.GetItemByName('potato').amount cb(amount) end)


-- // Register \\ 

RegisterServerEvent('jim-burgershot:Tickets:Give')
AddEventHandler('jim-burgershot:Tickets:Give', function(amount)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == 'burgershot' and Player.PlayerData.job.onduty then
				if amount >= Config.MinAmountforTicket then
					Player.Functions.AddItem('burger-ticket', 1, false, {["quality"] = nil})
					TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'BurgerShot receipt received', 'success')
					TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['burger-ticket'], "add", 1) 
				elseif amount < Config.MinAmountforTicket then
					TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "Amount too low, didn't receive a receipt", "error")
				end
            end
        end
    end
end)

RegisterServerEvent('jim-burgershot:Tickets:Sell')
AddEventHandler('jim-burgershot:Tickets:Sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName("burger-ticket") ~= nil then
		tickets = Player.Functions.GetItemByName("burger-ticket").amount
		pay = (tickets * Config.PayPerTicket)
		Player.Functions.RemoveItem('burger-ticket', tickets)
		Player.Functions.AddMoney('bank', pay, 'burgershot-payment')
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burger-ticket'], "remove", tickets)
		TriggerClientEvent('QBCore:Notify', src, "Tickets: "..tickets.." Total: $"..pay, 'success')
	else 
		TriggerClientEvent('QBCore:Notify', src, "No tickets to trade", 'error')
	end
end)

RegisterServerEvent("jim-burgershot:server:Charge", function(citizen, price)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(citizen))
    local amount = tonumber(price)
	if billed ~= nil then
		if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
			if amount and amount > 0 then
				exports.oxmysql:insert(
					'INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',
					{billed.PlayerData.citizenid, amount, biller.PlayerData.job.name,
					 biller.PlayerData.charinfo.firstname, biller.PlayerData.citizenid})
				TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
				TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
				TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
				
			else TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')	end
		else TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error') end
	else TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error') end
end)