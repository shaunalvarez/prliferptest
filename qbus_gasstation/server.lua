
QBCore = exports['qb-core']:GetCoreObject()
 

ghmattimysql = exports.oxmysql

local b = {}
local c = nil

function SendWebhookMessage(d, e)
    if d ~= nil and d ~= "" then
        PerformHttpRequest( d,function(f, g, h) end,"POST",json.encode({content = e}),{["Content-Type"] = "application/json"})
    end
end

Citizen.CreateThread(function()
    Wait(5000)
    ghmattimysql:execute("UPDATE `gas_station_jobs` SET progress = 0", {})
end)

local i = 1
c = true



RegisterServerEvent("gas_station:getData")
AddEventHandler("gas_station:getData",function(r)
            local source = source
            local xPlayer = QBCore.Functions.GetPlayer(source)
            local t = xPlayer.PlayerData.citizenid
            if t then
                ghmattimysql:execute("SELECT user_id FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query) 
                    if query and query[1] then
                        if query[1].user_id == t then
                            openUI(source,r,false)
                        else
                            TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['already_has_owner'])
                        end

                    else
                        ghmattimysql:execute("SELECT gas_station_id FROM `gas_station_business` WHERE user_id = @user_id", {['@user_id'] = t}, function (query) 
                            if query and query[1] and #query >= Config.max_stations_per_player then
                                TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]["already_has_business"])
                            else
                                TriggerClientEvent("gas_station:openRequest", source, Config.gas_station_locations[r].buy_price)
                            end
                        end);
                    end
                end);
            end
        end
    
)

RegisterServerEvent("gas_station:buyMarket")
AddEventHandler("gas_station:buyMarket",function(r)
        if c then
            local source = source
            local s = QBCore.Functions.GetPlayer(source)
            local t = s.PlayerData.citizenid
            local u = Config.gas_station_locations[r].buy_price
            money = s.PlayerData.money.bank
            if money >= u then
                s.Functions.RemoveMoney('bank', u)
               
                local o = "INSERT INTO `gas_station_business` (user_id,gas_station_id,stock,timer) VALUES (@user_id,@gas_station_id,@stock,@timer);"
                ghmattimysql:execute(
                    o,
                    {["@gas_station_id"] = r, ["@user_id"] = t, ["@stock"] = 0, ["@timer"] = os.time()}
                )
                TriggerClientEvent("gas_station:Notify", source, "sucesso", Lang[Config.lang]["businnes_bougth"])
                SendWebhookMessage(
                    Config.webhook,
                    Lang[Config.lang]["logs_bought"]:format(
                        r,
                        t ..
                            os.date(
                                "\n[" ..
                                    Lang[Config.lang]["logs_date"] ..
                                        "]: %d/%m/%Y [" .. Lang[Config.lang]["logs_hour"] .. "]: %H:%M:%S"
                            )
                    )
                )
            else
                TriggerClientEvent(
                    "gas_station:Notify",
                    source,
                    "negado",
                    Lang[Config.lang]["insufficient_funds_store"]:format(u)
                )
            end
        end
    end
)
-- RegisterServerEvent("gas_station:getJob")
-- AddEventHandler(
--     "gas_station:getJob",
--     function(r)
--         local source = source
--         local s = QBCore.Functions.GetPlayer(source)
--         local t = s.PlayerData.citizenid
--         if t then
--             ghmattimysql:execute("SELECT id,name,reward FROM `gas_station_jobs` WHERE gas_station_id = @gas_station_id AND progress = 0 ORDER BY id ASC", {['@gas_station_id'] = r}, function (query) 
--                 query = query[1]
--                 if query == nil then
--                     TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["no_available_jobs"])
--                 end
--             end);

--             ghmattimysql:execute("SELECT user_id FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (queryg) 
--                 v = queryg[1]
--                 if v ~= nil and v.user_id == t then
--                     TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["cannot_do_own_job"])
--                     queryg = nil
--                 end
--             end);
--             TriggerClientEvent("gas_station:getJob", source, r, query)
--         end
--     end
-- )

RegisterServerEvent("gas_station:getJob")
AddEventHandler("gas_station:getJob",function(key)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
		ghmattimysql:execute("SELECT id,name,reward FROM gas_station_jobs WHERE gas_station_id = @gas_station_id AND progress = 0 ORDER BY id ASC", {['@gas_station_id'] = key},
		function (query)
			query = query[1]
			if query == nil then
				TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['no_available_jobs'])
			end
			local query_2 = ghmattimysql:execute("SELECT user_id FROM gas_station_business WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = key}, 
			function(query_2)
				query_2 = query_2[1]
				if query_2.user_id == user_id then
					TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['cannot_do_own_job'])
					query = nil
				end
				TriggerClientEvent("gas_station:getJob",source,key,query)
			end);
		end)
	end
end)
RegisterServerEvent("gas_station:startJob")
AddEventHandler(
    "gas_station:startJob",
    function(r, w)
        local source = source
        if b[source] == nil then
            b[source] = true
            ghmattimysql:execute("SELECT * FROM `gas_station_jobs` WHERE id = @id", {['@id'] = w}, function (query) 
                local query = query[1]
                if query.progress == 0 then
                    local o = "UPDATE `gas_station_jobs` SET progress = 1 WHERE id = @id"
                    ghmattimysql:execute(o, {["@id"] = w})
                    TriggerClientEvent("gas_station:startContract", source, query.amount, 0, 1, 1, query)
                else
                    TriggerClientEvent("gas_station:getJob", source, r, nil)
                    TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["job_already_in_progress"])
                end
            end);
           
            
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)
RegisterServerEvent("gas_station:failed")
AddEventHandler(
    "gas_station:failed",
    function(x)
        if x then
            local o = "UPDATE `gas_station_jobs` SET progress = 0 WHERE id = @id"
            ghmattimysql:execute(o, {["@id"] = x.id})
        end
    end
)
RegisterServerEvent("gas_station:startContract")
AddEventHandler(
    "gas_station:startContract",
    function(r, p)
        local source = source
        if b[source] == nil then
            b[source] = true
            local y = Config.gas_station_types[Config.gas_station_locations[r].type]
            p.ressuply_id = p.ressuply_id + 1
            ghmattimysql:execute("SELECT truck_upgrade, relationship_upgrade, stock FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query) 
                if query[1].truck_upgrade >= y.ressuply[p.ressuply_id].truck_level then
                    local z =
                        y.ressuply[p.ressuply_id].liters +
                        math.floor(
                            y.ressuply[p.ressuply_id].liters * y.upgrades.truck.level_reward[query[1].truck_upgrade] / 100
                        )
                    if p.type == 1 then
                        local u = y.ressuply[p.ressuply_id].price_per_liter_to_import * z
                        local A = y.upgrades.relationship.level_reward[query[1].relationship_upgrade]
                       
                        A = math.floor(u * A / 100)
                        local B = u - A
                        if tryGetMarketMoney(r, B) then
                            insertBalanceHistory(
                                r,
                                1,
                                Lang[Config.lang]["buy_products_expenses"]:format(y.ressuply[p.ressuply_id].name, z),
                                B
                            )
                            TriggerClientEvent(
                                "gas_station:startContract",
                                source,
                                z,
                                query[1].truck_upgrade,
                                p.ressuply_id,
                                p.type
                            )
                        else
                            TriggerClientEvent(
                                "gas_station:Notify",
                                source,
                                "negado",
                                Lang[Config.lang]["insufficient_funds"]
                            )
                        end
                    else
                        if tonumber(query[1].stock) >= z then
                            local o =
                                "UPDATE `gas_station_business` SET stock = @stock WHERE gas_station_id = @gas_station_id"
                            ghmattimysql:execute(o, {["@gas_station_id"] = r, ["@stock"] = tonumber(query[1].stock) - z})
                            TriggerClientEvent(
                                "gas_station:startContract",
                                source,
                                z,
                                query[1].truck_upgrade,
                                p.ressuply_id,
                                p.type
                            )
                        else
                            TriggerClientEvent(
                                "gas_station:Notify",
                                source,
                                "negado",
                                Lang[Config.lang]["not_enought_stock"]
                            )
                        end
                    end
                else
                    TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["upgrade_your_truck"])
                end
            end);

        
            
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)
RegisterServerEvent("gas_station:finishContract")
AddEventHandler(
    "gas_station:finishContract",
    function(r, z, C, D, type, x)
        local source = source
        ghmattimysql:execute("SELECT stock, truck_upgrade, stock_upgrade FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query) 

            local E = query[1].stock
            if x then
                D = 0
                z = tonumber(x.amount)
                local s = QBCore.Functions.GetPlayer(source)
                s.Functions.AddMoney("bank", tonumber(x.reward) or 0)
                local o = "DELETE FROM `gas_station_jobs` WHERE id = @id;"
                ghmattimysql:execute(o, {["@id"] = x.id})
            end
            if type == 1 then
                if
                    query[1].stock + z <=
                        Config.gas_station_types[Config.gas_station_locations[r].type].stock_capacity +
                            Config.gas_station_types[Config.gas_station_locations[r].type].upgrades.stock.level_reward[
                                query[1].stock_upgrade
                            ]
                then
                    E = E + z
                else
                    z =
                        Config.gas_station_types[Config.gas_station_locations[r].type].stock_capacity +
                        Config.gas_station_types[Config.gas_station_locations[r].type].upgrades.stock.level_reward[
                            query[1].stock_upgrade
                        ] -
                        query[1].stock
                    E = E + z
                    TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["stock_full"])
                end
                local o =
                    "UPDATE `gas_station_business` SET stock = @stock, gas_bought = gas_bought + @amount, distance_traveled = distance_traveled + @distance WHERE gas_station_id = @gas_station_id"
                ghmattimysql:execute(o, {["@gas_station_id"] = r, ["@stock"] = E, ["@amount"] = z, ["@distance"] = D})
            else
                local u =
                    Config.gas_station_types[Config.gas_station_locations[r].type].ressuply[C].price_per_liter_to_export * z
                giveMarketMoney(r, u)
                local o =
                    "UPDATE `gas_station_business` SET distance_traveled = distance_traveled + @distance, total_money_earned = total_money_earned + @price WHERE gas_station_id = @gas_station_id"
                ghmattimysql:execute(o, {["@gas_station_id"] = r, ["@distance"] = D, ["@price"] = u})
                insertBalanceHistory(
                    r,
                    0,
                    Lang[Config.lang]["exported_income"]:format(
                        Config.gas_station_types[Config.gas_station_locations[r].type].ressuply[C].name,
                        z
                    ),
                    u
                )
            end
        end);
 end
)
RegisterServerEvent("gas_station:createJob")
AddEventHandler("gas_station:createJob",function(r, p)
        local source = source
        if b[source] == nil then
            b[source] = true

            ghmattimysql:execute("SELECT COUNT(id) as qtd FROM gas_station_jobs WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function(F)
                F = F[1].qtd
                if F == nil or F < 50 then -- Limite interno
                    ghmattimysql:execute("SELECT relationship_upgrade FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query) 
                        local u = Config.gas_station_types[Config.gas_station_locations[r].type].ressuply_deliveryman.price_per_liter * p.amount
                        local A = Config.gas_station_types[Config.gas_station_locations[r].type].upgrades.relationship.level_reward[query[1].relationship_upgrade]
                        A = math.floor(u * A / 100)
                        

                        local B = p.reward + u - A
                        B = math.floor(B)
                        if tryGetMarketMoney(r, B) then
                            local o =
                                "INSERT INTO `gas_station_jobs` (gas_station_id,name,reward,amount) VALUES (@gas_station_id,@name,@reward,@amount);"
                            ghmattimysql:execute(
                                o,
                                {["@gas_station_id"] = r, ["@name"] = p.name, ["@reward"] = p.reward, ["@amount"] = p.amount}
                            )
                            insertBalanceHistory(r, 1, Lang[Config.lang]["create_job_expenses"]:format(p.name), B)
                            openUI(source, r, true)
                        else
                            TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["insufficient_funds"])
                        end
                    end);
                end
            end);

            
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)
RegisterServerEvent("gas_station:deleteJob")
AddEventHandler(
    "gas_station:deleteJob",
    function(r, p)
        local source = source
        if b[source] == nil then
            b[source] = true
            ghmattimysql:execute("SELECT name,reward,amount,progress FROM `gas_station_jobs` WHERE id = @id", {['@id'] = p.job_id}, function (query) 
                if query[1] then
                    if query[1].progress == 0 then
                        local o = "DELETE FROM `gas_station_jobs` WHERE id = @id;"
                        ghmattimysql:execute(o, {["@id"] = p.job_id})
                        ghmattimysql:execute("SELECT relationship_upgrade FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (v) 
                            local u =
                                Config.gas_station_types[Config.gas_station_locations[r].type].ressuply_deliveryman.price_per_liter *
                                query[1].amount
                            local A =
                                Config.gas_station_types[Config.gas_station_locations[r].type].upgrades.relationship.level_reward[
                                v[1].relationship_upgrade
                            ]
                            A = math.floor(u * A / 100)
                            local B = query[1].reward + u - A
                            local o =
                                "UPDATE `gas_station_business` SET total_money_spent = total_money_spent - @amount WHERE gas_station_id = @gas_station_id"
                            ghmattimysql:execute(o, {["@amount"] = B, ["@gas_station_id"] = r})
                            giveMarketMoney(r, B)
                            insertBalanceHistory(r, 0, Lang[Config.lang]["create_job_income"]:format(query[1].name), B)
                            openUI(source, r, true)
                        end);
                    else
                        TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["cant_delete_job"])
                    end
                end
            end);
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)
RegisterServerEvent("gas_station:applyPrice")
AddEventHandler(
    "gas_station:applyPrice",
    function(r, p)
        local source = source
        if b[source] == nil then
            b[source] = true
            local s = QBCore.Functions.GetPlayer(source)
            local t = s.PlayerData.citizenid
            if t then
                local o = "UPDATE `gas_station_business` SET price = @price WHERE gas_station_id = @gas_station_id"
                ghmattimysql:execute(o, {["@gas_station_id"] = r, ["@price"] = p.value})
            end
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)


RegisterServerEvent("gas_station:buyUpgrade")
AddEventHandler("gas_station:buyUpgrade",function(key, data)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
		ghmattimysql:execute("SELECT "..data.id.."_upgrade FROM `gas_station_business` WHERE gas_station_id = @gas_station_id",{['@gas_station_id'] = key}, function (query)
			query = query[1]
			if query[data.id.."_upgrade"] < 5 then
				local amount = Config.gas_station_types[Config.gas_station_locations[key].type].upgrades[data.id].price
				local hasmoney = tryGetMarketMoney(key,amount)
				Citizen.Wait(100)
				if hasmoney then
					ghmattimysql:execute("UPDATE `gas_station_business` SET "..data.id.."_upgrade = "..data.id.."_upgrade + 1 WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = key}, function ()
						insertBalanceHistory(key,1,Lang[Config.lang]['upgrade_expenses']:format(Lang[Config.lang][data.id.."_upgrade"]),amount)
						openUI(source,key,true)
					end)
				else
					TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
				end
			else

				TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['max_level'])
			end
		end);
	end
end)



RegisterServerEvent("gas_station:withdrawMoney")
AddEventHandler("gas_station:withdrawMoney",function(key)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
		ghmattimysql:execute("SELECT money FROM `gas_station_business` WHERE gas_station_id = @gas_station_id",{['@gas_station_id'] = key}, function (query)
			query = query[1]
			local amount = tonumber(query.money)
			if amount and amount > 0 then
				ghmattimysql:execute("UPDATE `gas_station_business` SET money = 0 WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = key}, function ()
					xPlayer.Functions.AddMoney("bank", amount)
					insertBalanceHistory(key,1,Lang[Config.lang]['money_withdrawn'],amount)
					TriggerClientEvent("gas_station:Notify",source,"sucesso",Lang[Config.lang]['money_withdrawn'])
					openUI(source,key,true)
				end);
			end
		end)
	end
end)

RegisterServerEvent("gas_station:depositMoney")
AddEventHandler("gas_station:depositMoney",function(key,data)
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
		local amount = tonumber(data.amount)
		if amount and amount > 0 then
			money = xPlayer.PlayerData.money.bank
			if money >= amount then
				xPlayer.Functions.RemoveMoney('bank', amount)
				giveMarketMoney(key,amount)
				insertBalanceHistory(key,0,Lang[Config.lang]['money_deposited'],amount)
				TriggerClientEvent("gas_station:Notify",source,"sucesso",Lang[Config.lang]['money_deposited'])
				openUI(source,key,true)
			else
				TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['insufficient_funds'])
			end
		else
			TriggerClientEvent("gas_station:Notify",source,"negado",Lang[Config.lang]['invalid_value'])
		end
	end
end)

RegisterServerEvent("gas_station:sellMarket")
AddEventHandler("gas_station:sellMarket",function(r)
        local source = source
        if b[source] == nil then
            b[source] = true
            local s = QBCore.Functions.GetPlayer(source)
            local t = s.PlayerData.citizenid
            if t then
                ghmattimysql:execute("SELECT user_id FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query) 
                    local query = query[1]
                    if query.user_id == t then
                        local o = "DELETE FROM `gas_station_business` WHERE gas_station_id = @gas_station_id;"
                        ghmattimysql:execute(o, {["@gas_station_id"] = r})
                        local o = "DELETE FROM `gas_station_balance` WHERE gas_station_id = @gas_station_id;"
                        ghmattimysql:execute(o, {["@gas_station_id"] = r})
                        local o = "DELETE FROM `gas_station_jobs` WHERE gas_station_id = @gas_station_id;"
                        ghmattimysql:execute(o, {["@gas_station_id"] = r})
                        s.Functions.AddMoney("bank", Config.gas_station_locations[r].sell_price)

                        TriggerClientEvent("gas_station:Notify", source, "sucesso", Lang[Config.lang]["store_sold"])
                        SendWebhookMessage(
                            Config.webhook,
                            Lang[Config.lang]["logs_close"]:format(
                                r,
                                t ..
                                    os.date(
                                        "\n[" ..
                                            Lang[Config.lang]["logs_date"] ..
                                                "]: %d/%m/%Y [" .. Lang[Config.lang]["logs_hour"] .. "]: %H:%M:%S"
                                    )
                            )
                        )
                    else
                        TriggerClientEvent("gas_station:Notify", source, "negado", Lang[Config.lang]["sell_error"])
                    end
                end);
            end
            SetTimeout(
                500,
                function()
                    b[source] = nil
                end
            )
        end
    end
)
function giveMarketMoney(gas_station_id,amount)
	ghmattimysql:executeSync("UPDATE `gas_station_business` SET money = money + @amount WHERE gas_station_id = @gas_station_id", {['@amount'] = amount, ['@gas_station_id'] = gas_station_id});
end

function tryGetMarketMoney(gas_station_id,amount)
	local query = ghmattimysql:executeSync("SELECT money FROM `gas_station_business` WHERE gas_station_id = @gas_station_id",{['@gas_station_id'] = gas_station_id})
    query = query[1]
    if tonumber(query.money) >= amount then
        ghmattimysql:execute("UPDATE `gas_station_business` SET money = @money, total_money_spent = total_money_spent + @amount WHERE gas_station_id = @gas_station_id", {['@money'] = (tonumber(query.money) - amount), ['@amount'] = amount, ['@gas_station_id'] = gas_station_id});
        return true
    else
        return false
    end
end


function insertBalanceHistory(G, H, I, z)
    local o =
        "INSERT INTO `gas_station_balance` (gas_station_id,income,title,amount,date) VALUES (@gas_station_id,@income,@title,@amount,@date)"
    ghmattimysql:execute(
        o,
        {["@gas_station_id"] = G, ["@income"] = H, ["@title"] = I, ["@amount"] = z, ["@date"] = os.time()}
    )
end

function openUI(source, key, isMarket)
    local query = {}
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local user_id = xPlayer.PlayerData.citizenid
	if user_id then
        query.gas_station_business = ghmattimysql:executeSync("SELECT * FROM `gas_station_business` WHERE gas_station_id = @gas_station_id",{['@gas_station_id'] = key})[1];
        query.gas_station_business.stock = query.gas_station_business.stock


		local sql = "SELECT * FROM `gas_station_jobs` WHERE gas_station_id = @gas_station_id";
		query.gas_station_jobs = ghmattimysql:executeSync(sql,{['@gas_station_id'] = query.gas_station_business.gas_station_id});

		local sql = "SELECT * FROM `gas_station_balance` WHERE gas_station_id = @gas_station_id ORDER BY id DESC";
		query.gas_station_balance = ghmattimysql:executeSync(sql,{['@gas_station_id'] = query.gas_station_business.gas_station_id});
        
        
		query.config = {}
		query.config.format = deepcopy(Config.format)
        query.config.lang = deepcopy(Config.lang)
		query.config.gas_station_locations = deepcopy(Config.gas_station_locations[key])
		query.config.gas_station_types = deepcopy(Config.gas_station_types[Config.gas_station_locations[key].type])
        TriggerClientEvent("gas_station:open", source, query, isMarket)
		-- TriggerClientEvent("vrp_stores:open",source, query, reset, isMarket or false)


        -- ghmattimysql:execute("SELECT * FROM `gas_station_business` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query1) 
            
        --     query.gas_station_business = query1

        --     ghmattimysql:execute("SELECT * FROM `gas_station_jobs` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query2) 
               
        --         query.gas_station_jobs = query2
        --         ghmattimysql:execute("SELECT * FROM `gas_station_balance` WHERE gas_station_id = @gas_station_id", {['@gas_station_id'] = r}, function (query3) 
    
        --             query.gas_station_balance = query3

        --             query.config = {}
        --             query.config.format = deepcopy(Config.format)
        --             query.config.lang = deepcopy(Config.lang)
        --             query.config.gas_station_locations = deepcopy(Config.gas_station_locations[r])
        --             query.config.gas_station_types = deepcopy(Config.gas_station_types[Config.gas_station_locations[r].type])
        --             query.config.warning = 0
        --             if query.gas_station_business.stock ~= nil and query.gas_station_business.stock < Config.gas_station_types[Config.gas_station_locations[r].type].stock_capacity * Config.clear_gas_stations.min_stock_amount /100 then
        --                 query.config.warning = 1
        --             else
        --                 local o = "UPDATE `gas_station_business` SET timer = @timer WHERE gas_station_id = @gas_station_id"
        --                 ghmattimysql:execute(o, {["timer"] = os.time(), ["@gas_station_id"] = r})
        --             end
        --             TriggerClientEvent("gas_station:open", source, query, J)
    
        --         end);

        --     end);
    

        -- end);
        
    end
end
function tablelength(K)
    local F = 0
    for L in pairs(K) do
        F = F + 1
    end
    return F
end
function deepcopy(M)
    local N = type(M)
    local O
    if N == "table" then
        O = {}
        for P, Q in next, M, nil do
            O[deepcopy(P)] = deepcopy(Q)
        end
        setmetatable(O, deepcopy(getmetatable(M)))
    else
        O = M
    end
    return O
end
RegisterServerEvent("gas_station:vehicleLock")
AddEventHandler(
    "gas_station:vehicleLock",
    function()
        local source = source
        TriggerClientEvent("gas_station:vehicleClientLock", source)
    end
)
local R = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
function dec(p)
    p = string.gsub(p, "[^" .. R .. "=]", "")
    return p:gsub(
        ".",
        function(S)
            if S == "=" then
                return ""
            end
            local T, U = "", R:find(S) - 1
            for V = 6, 1, -1 do
                T = T .. (U % 2 ^ V - U % 2 ^ (V - 1) > 0 and "1" or "0")
            end
            return T
        end
    ):gsub(
        "%d%d%d?%d?%d?%d?%d?%d?",
        function(S)
            if #S ~= 8 then
                return ""
            end
            local W = 0
            for V = 1, 8 do
                W = W + (S:sub(V, V) == "1" and 2 ^ (8 - V) or 0)
            end
            return string.char(W)
        end
    )
end
function print_table(X)
    local function Y(Z)
        local _ = ""
        for V = 1, Z do
            _ = _ .. "\t"
        end
        return _
    end
    local a0, a1, a2 = {}, {}, {}
    local a3 = 1
    local a4 = "{\n"
    if type(X) == "table" then
        while true do
            local a5 = 0
            for m, n in pairs(X) do
                a5 = a5 + 1
            end
            local a6 = 1
            for m, n in pairs(X) do
                if a0[X] == nil or a6 >= a0[X] then
                    if string.find(a4, "}", a4:len()) then
                        a4 = a4 .. ",\n"
                    elseif not string.find(a4, "\n", a4:len()) then
                        a4 = a4 .. "\n"
                    end
                    table.insert(a2, a4)
                    a4 = ""
                    local r
                    if type(m) == "number" or type(m) == "boolean" then
                        r = "[" .. tostring(m) .. "]"
                    else
                        r = "['" .. tostring(m) .. "']"
                    end
                    if type(n) == "number" or type(n) == "boolean" then
                        a4 = a4 .. Y(a3) .. r .. " = " .. tostring(n)
                    elseif type(n) == "table" then
                        a4 = a4 .. Y(a3) .. r .. " = {\n"
                        table.insert(a1, X)
                        table.insert(a1, n)
                        a0[X] = a6 + 1
                        break
                    else
                        a4 = a4 .. Y(a3) .. r .. " = '" .. tostring(n) .. "'"
                    end
                    if a6 == a5 then
                        a4 = a4 .. "\n" .. Y(a3 - 1) .. "}"
                    else
                        a4 = a4 .. ","
                    end
                else
                    if a6 == a5 then
                        a4 = a4 .. "\n" .. Y(a3 - 1) .. "}"
                    end
                end
                a6 = a6 + 1
            end
            if #a1 > 0 then
                X = a1[#a1]
                a1[#a1] = nil
                a3 = a0[X] == nil and a3 + 1 or a3 - 1
            else
                break
            end
        end
        table.insert(a2, a4)
        a4 = table.concat(a2)
    else
        a4 = X
    end
    print(a4)
end


--[[ Cleaned: 2023/03/02 16:12 ]]--
