local compass = ""
local timeText = ""

Citizen.CreateThread(function()
    while true do
	    Wait(1)
        local player = PlayerPedId()
        local heading = GetEntityHeading(player)
        if heading > 0 and heading < 20 or heading > 340 and heading < 360 then
            compass = "norte"
        elseif heading > 20 and heading < 60 then
            compass = "noroeste"
        elseif heading > 60 and heading < 110 then
            compass = "oeste"
        elseif heading > 110 and heading < 160 then
            compass = "suroeste"
        elseif heading > 160 and heading < 210 then
            compass = "sur"
        elseif heading > 210 and heading < 260 then
            compass = "sureste"
        elseif heading > 260 and heading < 290 then
            compass = "este"
        elseif heading > 290 and heading < 340 then
            compass = "noreste"
        end
        DrawTxt(" " ..compass.. " ", 0.15, 0.93, 0.4, 0.4, true, 0, 255, 85, 255, true)
    end
end)

Citizen.CreateThread(function()
    while true do
	    Wait(1)
        local hour = GetClockHours()
        local minute = GetClockMinutes()
        DrawTxt(" " ..timeText.. " ", 0.03, 0.93, 0.4, 0.4, true, 0, 255, 85, 255, true)
        timeText = ("%.2d"):format((hour == 0) and 12 or hour) .. ":" .. ("%.2d"):format( minute) .. ((hour < 12) and " AM" or " PM")
    end
end)

--Citizen.CreateThread(function()
--    while true do
--        Wait(1)
--        local player = PlayerPedId()
--        local coords = GetEntityCoords(player)
--        local zone = GetMapZoneAtCoords(coords)
--        DrawTxt(" " ..zone.. " ", 0.087, 0.70, 0.4, 0.4, true, 0, 255, 85, 255, true)
--    end
--end)


RegisterCommand("heading", function()
    local player = PlayerPedId()
    local heading = GetEntityHeading(player)
    print(" " ..heading.. " " ..compass.. " ")
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end