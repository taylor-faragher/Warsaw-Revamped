--!strict

local partitions = require("./partitions")

local M1014_Customization_ = {}
M1014_Customization_.__index = M1014_Customization_
local M1014_Customization = M1014_Customization_

function M1014_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)
	ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(M1014_Customization, M1014_Customization.on_load, {
	partition = Guid("F927C950-50A7-11E0-B0BF-BEDCC5009D7A"),
	instance = Guid("6EECF529-6568-4083-B33E-55581C41547E"),
}, {
	partition = Guid("2050C3EE-A80C-4189-980C-B853B8D79C76"),
	instance = Guid("5D572E8A-38EF-4036-9DEB-7FD3C7FFEE38"),
})

return nil