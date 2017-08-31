name = "Health EV: Ruins of Alph (near Violet City)"
author = "The7L"
description = [[This script will train the first pokémon of your team.
It will only attack pokémon giving Health EV.
It will also try to capture shinies by throwing pokéballs.
Start anywhere between Violet City and Ruins of Alph.]]

function onPathAction()
    if isPokemonUsable(1) then
        if getMapName() == "Pokecenter Violet City" then
            moveToMap("Violet City")
        elseif getMapName() == "Violet City" then
            moveToMap("Route 36 Stop")
        elseif getMapName() == "Route 36 Stop" then
            moveToMap("Route 36")
        elseif getMapName() == "Route 36" then
            moveToMap("Ruins Of Alph Stop House 1")
        elseif getMapName() == "Ruins Of Alph Stop House 1" then
            moveToMap("Ruins Of Alph")
        elseif getMapName() == "Ruins Of Alph" then        
            moveToWater()
        end
    else
        if getMapName() == "Ruins Of Alph" then
            moveToMap("Ruins Of Alph Stop House 1")
        elseif getMapName() == "Ruins Of Alph Stop House 1" then
            moveToMap("Route 36")
        elseif getMapName() == "Route 36" then
            moveToMap("Route 36 Stop")
        elseif getMapName() == "Route 36 Stop" then
            moveToMap("Violet City")
        elseif getMapName() == "Violet City" then
            moveToMap("Pokecenter Violet City")
        elseif getMapName() == "Pokecenter Violet City" then
            usePokecenter()
        end
    end
end

function onBattleAction()
    if isWildBattle() and isOpponentShiny() then
        if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Pokeball") then
            return
        end
    end
    if getActivePokemonNumber() == 1 and isOpponentEffortValue("Health") then
        return attack() or run() or sendUsablePokemon() or sendAnyPokemon()
    else
        return run() or attack() or sendUsablePokemon() or sendAnyPokemon()
    end
end
