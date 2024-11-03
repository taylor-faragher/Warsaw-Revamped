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

local Taurus44_Customization_ = {}
Taurus44_Customization_.__index = Taurus44_Customization_
local Taurus44_Customization = Taurus44_Customization_

function Taurus44_Customization:on_load(optics: CustomizationUnlockParts)
	--removes Ghost Ring
	local removedOptics = { 2 }
	if optics.selectableUnlocks:len() == 5 then
		for i = 5, 1, -1 do
			if has_value(removedOptics, i) then
				optics.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(Taurus44_Customization, Taurus44_Customization.on_load, {
	partition = Guid("EBA28D5F-3DFF-11E1-AB57-8A2D47E2B266"),
	instance = Guid("00412758-3F07-4703-BA08-A2E100214D77"),
})

return nil
