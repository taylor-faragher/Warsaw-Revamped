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

local FN57_Customization_ = {}
FN57_Customization_.__index = FN57_Customization_
local FN57_Customization = FN57_Customization_

function FN57_Customization:on_load(optics: CustomizationUnlockParts, barrels: CustomizationUnlockParts)
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

partitions.onAllInstancesLoaded(FN57_Customization, FN57_Customization.on_load, {
	partition = Guid("0A547909-14A1-4A16-A54A-3983CFE7B9D9"),
	instance = Guid("A09DF282-C883-4139-BA90-151C2E5C4767"),
}, {
	partition = Guid("0A547909-14A1-4A16-A54A-3983CFE7B9D9"),
	instance = Guid("AA628748-03D2-45B7-86B8-AF2BCF3CB8FE"),
})

return nil
