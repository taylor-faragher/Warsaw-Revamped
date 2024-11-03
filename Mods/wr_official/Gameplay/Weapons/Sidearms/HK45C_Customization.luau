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

local HK45C_Customization_ = {}
HK45C_Customization_.__index = HK45C_Customization_
local HK45C_Customization = HK45C_Customization_

function HK45C_Customization:on_load(optics: CustomizationUnlockParts, barrels: CustomizationUnlockParts)
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

partitions.onAllInstancesLoaded(HK45C_Customization, HK45C_Customization.on_load, {
	partition = Guid("496A4A93-0EC3-11E2-B9DA-A72E5CAF78B5"),
	instance = Guid("D7B309D2-B0E7-4604-B396-EAEBA44B966D"),
}, {
	partition = Guid("496A4A93-0EC3-11E2-B9DA-A72E5CAF78B5"),
	instance = Guid("A75CBBBF-F3CB-4AF7-9879-1D984EEB1B7E"),
})

return nil
