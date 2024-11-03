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

local M93R_Customization_ = {}
M93R_Customization_.__index = M93R_Customization_
local M93R_Customization = M93R_Customization_

function M93R_Customization:on_load(optics: CustomizationUnlockParts, barrels: CustomizationUnlockParts)
	--removes Ghost Ring
	local removedOptics = { 2 }
	if optics.selectableUnlocks:len() == 4 then
		for i = 4, 1, -1 do
			if has_value(removedOptics, i) then
				optics.selectableUnlocks:remove(i)
			end
		end
	end

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

partitions.onAllInstancesLoaded(M93R_Customization, M93R_Customization.on_load, {
	partition = Guid("B762165F-3DFF-11E1-AB57-8A2D47E2B266"),
	instance = Guid("8365B5CC-9A94-45A8-9584-0F2F3DB804D9"),
}, {
	partition = Guid("B762165F-3DFF-11E1-AB57-8A2D47E2B266"),
	instance = Guid("AC0B297D-D927-4A55-8080-816FA454543C"),
})

return nil
