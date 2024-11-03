--!strict

local partitions = require("./partitions")

local function has_value(tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

local P226_Customization_ = {}
P226_Customization_.__index = P226_Customization_
local P226_Customization = P226_Customization_

function P226_Customization:on_load(barrels: CustomizationUnlockParts)
	--removes TGPA5 Suppressor and QSW6 Suppressor
	local removedBarrels = { 7, 8 }
	if barrels.selectableUnlocks:len() == 8 then
		for i = 8, 1, -1 do
			if has_value(removedBarrels, i) then
				barrels.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(P226_Customization, P226_Customization.on_load, {
	partition = Guid("63C1DC59-6157-11E2-B936-EC3A3A2DB9E4"),
	instance = Guid("36D97FC5-E507-4526-9A0A-AF0B80235E80"),
})

return nil
