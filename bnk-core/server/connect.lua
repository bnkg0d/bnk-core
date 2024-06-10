local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local steamIdentifier
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    Wait(0)

    deferrals.update(string.format("BNK-CORE: Hello %s. sorry for the inconvenience, we check your steam to proceed to the game!", name))

    for _, v in pairs(identifiers) do
        if string.find(v, "steam") then
            steamIdentifier = v
            break
        end
    end

    Wait(0)

    if not steamIdentifier then
        deferrals.done("BNK-CORE: Base on our checking, your Steam is not running.")
    else
        deferrals.done("BNK-CORE: Hello good day! Welcome to BNK-CORE")
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)