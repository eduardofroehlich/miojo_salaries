Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.MinutesToPay*60*1000)
        TriggerServerEvent('miojo_salaries:payment')
    end
end)