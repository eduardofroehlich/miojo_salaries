local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)


RegisterServerEvent('miojo_salaries:payment')
AddEventHandler('miojo_salaries:payment', function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter

    for _, salary in ipairs(Config.groupSalaries) do
        if Character.group == salary.group then
            Character.addCurrency(salary.typeMoney, salary.valueToPay)
            TriggerClientEvent('vorp:NotifyLeft', _source, Config.Translate[1] ,"" .. salary.group .. " "  .. tostring(salary.valueToPay) .. "$", "inventory_items",
				"money_moneystack",  4000, "COLOR_WHITE")
        end
    end

    for _, salary in ipairs(Config.jobSalaries) do
        if Character.job == salary.job and Character.jobGrade == salary.jobgrade  then
            Character.addCurrency(salary.typeMoney, salary.valueToPay)
            TriggerClientEvent('vorp:NotifyLeft', _source, Config.Translate[1] ,"" .. Character.jobLabel .. " "  .. tostring(salary.valueToPay) .. "$", "inventory_items",
            "money_moneystack",  4000, "COLOR_WHITE") 
        end
    end
end)