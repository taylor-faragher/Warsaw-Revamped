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

local DesertEagle_Customization_ = {}
DesertEagle_Customization_.__index = DesertEagle_Customization_
local DesertEagle_Customization = DesertEagle_Customization_

function DesertEagle_Customization:on_load(optics: CustomizationUnlockParts, barrels: CustomizationUnlockParts)
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

partitions.onAllInstancesLoaded(DesertEagle_Customization, DesertEagle_Customization.on_load, {
	partition = Guid("34BC0580-F53A-4C12-ADAC-1D5694C1D9EE"),
	instance = Guid("4349B1FA-7B55-4721-BD90-F6CA2194ECE1"),
}, {
	partition = Guid("34BC0580-F53A-4C12-ADAC-1D5694C1D9EE"),
	instance = Guid("7EAF58B5-8978-466F-B30E-5F964B9F9F26"),
})

return nil
