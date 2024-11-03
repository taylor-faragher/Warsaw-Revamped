--!strict

local partitions = require("./partitions")

local Spas12_Customization_ = {}
Spas12_Customization_.__index = Spas12_Customization_
local Spas12_Customization = Spas12_Customization_

function Spas12_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)

    ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(Spas12_Customization, Spas12_Customization.on_load, {
	partition = Guid("B3A7C252-818A-44A5-A28C-74EC16D0C5B0"),
	instance = Guid("54EA24C2-CE2D-40CA-AA49-DBA9CE9528FF"),
},{
    partition = Guid("055195D9-C25F-4030-B15F-40808DF9D1E5"),
    instance = Guid("6691291C-F321-4B89-9C3A-3CC24F086848")
})

return nil
