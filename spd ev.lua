name = "Timid"
author = "redskhie"
description = [[EV Trainer]]

function onStart()

    startime = os.time()
    
end

function onPause()
    log(" ")
    log("***"..getPokemonName(1).." EV STATS***")
    log("Attack: "..getPokemonEffortValue(1, "Attack"))
    log("Defense: "..getPokemonEffortValue(1, "Defense"))
    log("Speed: "..getPokemonEffortValue(1, "Speed"))
    log("Special Attack: "..getPokemonEffortValue(1, "Spattack"))
    log("Special Defense: "..getPokemonEffortValue(1, "Spdefense"))
    log("Health Points: "..getPokemonEffortValue(1, "HP"))
    log(" ")
    endtime = os.time()
    log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/3600 ).. " hours")
    log("or")
    log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/60 ).. " minutes")
    log(" ")
        
end

function onStop()
    log(" ")
    log("***"..getPokemonName(1).." STATS***")
    log("Attack: "..getPokemonEffortValue(1, "Attack"))
    log("Defense: "..getPokemonEffortValue(1, "Defense"))
    log("Speed: "..getPokemonEffortValue(1, "Speed"))
    log("Special Attack: "..getPokemonEffortValue(1, "Spattack"))
    log("Special Defense: "..getPokemonEffortValue(1, "Spdefense"))
    log("Health Points: "..getPokemonEffortValue(1, "HP"))
    log(" ")
    
    endtime = os.time()
    log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/3600 ).. " hours")
    log("or")
    log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/60 ).. " minutes")
    log(" ")

end

function onPathAction()
    
    if isPokemonUsable(1) and getPokemonEffortValue(1, "Speed") < 252 then
        if getMapName() == "Pokecenter Cerulean" then
            moveToMap("Cerulean City")
        elseif getMapName() == "Cerulean Cave 1F" then
            moveToMap("Cerulean City")
        elseif ( getPlayerX() == 1 and getPlayerY() == 20 ) or ( getPlayerX() == 1 and getPlayerY() == 21 ) or ( getPlayerX() == 1 and getPlayerY() == 19 ) then
            return moveToCell(14,50)
        elseif getMapName() == "Cerulean City" then
        
            return moveToMap("Route 5")
            
        elseif getMapName() == "Pokecenter Vermilion" then
            moveToMap("Vermilion City")
        elseif getMapName() == "Route 4" then
            moveToGrass()Bicycle
        elseif getMapName() == "Vermilion City" then
            if not isMounted() then
                useItem("Bicycle")
            elseif isMounted() then
                moveToMap("Route 6")
            end
        elseif getMapName() == "Route 5" then
            moveToMap("Route 5 Stop House")
        elseif getMapName() == "Route 5 Stop House" then
            
            moveToMap("Saffron City")
            
        elseif getMapName() == "Saffron City" then
            if not isMounted() then
                useItem("Bicycle")
            elseif isMounted() then
                moveToMap("Route 6 Stop House")
            end
        elseif getMapName() == "Route 6 Stop House" then
            moveToMap("Route 6")
        elseif getMapName() == "Route 6" then
            moveToGrass()
           end

    else

        if getMapName() == "Route 6" then    
            moveToMap("Vermilion City")
        elseif getMapName() == "Vermilion City" then
            if not isMounted() then
                useItem("Bicycle")
            elseif isMounted() then    
                moveToMap("Pokecenter Vermilion")
            end
        end
        
    end
end

function onBattleAction()
    if isWildBattle() and ( isOpponentShiny() ) then
        return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run()
    elseif getActivePokemonNumber() == 1 and isOpponentEffortValue("Speed") and getPokemonEffortValue(1,"Speed") < 252 then
        log("Your "..getPokemonName(1).." have "..getPokemonEffortValue(1,"Speed").. " SPe EVs.")
        return attack() or sendPokemon(2) or sendPokemon(6) or run() or sendAnyPokemon()
    end

    
    return run() or sendUsablePokemon() or sendAnyPokemon()
    
end

function onBattleMessage(error)
    if stringContains(error, "You can not") then
        fatal("Ev training destroyed")
    end
end
