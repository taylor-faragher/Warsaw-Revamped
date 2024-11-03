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

local Glock18_Customization_ = {}
Glock18_Customization_.__index = Glock18_Customization_
local Glock18_Customization = Glock18_Customization_

function Glock18_Customization:on_load(optics: CustomizationUnlockParts, barrels: CustomizationUnlockParts)
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

partitions.onAllInstancesLoaded(Glock18_Customization, Glock18_Customization.on_load, {
	partition = Guid("35475AE0-404B-11E1-8BFA-C61D7A8D0601"),
	instance = Guid("26EC483B-6D32-453E-81F0-5A300CC0B450"),
}, {
	partition = Guid("35475AE0-404B-11E1-8BFA-C61D7A8D0601"),
	instance = Guid("2FC27EC6-E3C8-4CE2-9BD8-7BDAE8CFC130"),
})

return nil
