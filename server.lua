require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

--[[ ***** EVENTS GUI ***** ]]
RegisterServerEvent("antirpquestion:kick")
AddEventHandler("antirpquestion:kick", function()
	DropPlayer(source, "Vous n'avez pas reussi le questionnaire, reessayez.")
end)

RegisterServerEvent("antirpquestion:success")
AddEventHandler("antirpquestion:success", function()
	TriggerEvent("es:getPlayerFromId", source, function(player)
		MySQL:executeQuery("UPDATE users SET question_rp='made' WHERE identifier = '@username'", { ['@username'] = player.identifier})
	end)
end)

--[[ ***** SPAWN ***** ]]
RegisterServerEvent("antirpquestion:didQuestion")
AddEventHandler("antirpquestion:didQuestion", function()
    TriggerEvent("es:getPlayerFromId", source, function(player)
		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@username'",{['@username'] = player.identifier})
		local result = MySQL:getResults(executed_query, {'question_rp'}, "question_rp")
        local questionMade = result[1].question_rp
        if (questionMade == "false") then
            TriggerClientEvent('antirpquestion:notMade',source)
        end
    end)
end)

