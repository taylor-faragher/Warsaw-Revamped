--!strict

local partitions = require("./partitions")

local SAIGA_20k_Customization_ = {}
SAIGA_20k_Customization_.__index = SAIGA_20k_Customization_
local SAIGA_20k_Customization = SAIGA_20k_Customization_

function SAIGA_20k_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)
	ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(SAIGA_20k_Customization, SAIGA_20k_Customization.on_load, {
	partition = Guid("6A00054D-4AF5-11E0-BE58-A4565229B5AA"),
	instance = Guid("A95718B2-83C6-49FD-B8AF-0592D98FDFA1"),
}, {
	partition = Guid("098DAA1D-FD91-4B26-87A4-CE70DB0DC005"),
	instance = Guid("7283C230-AA0D-4ABD-B2C3-1BA1FAD37213"),
})

return nil
