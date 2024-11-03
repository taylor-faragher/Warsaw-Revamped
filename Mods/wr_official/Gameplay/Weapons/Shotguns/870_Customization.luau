--!strict

local partitions = require("./partitions")

local MCS870_Customization_ = {}
MCS870_Customization_.__index = MCS870_Customization_
local MCS870_Customization = MCS870_Customization_

function MCS870_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)

	ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(MCS870_Customization, MCS870_Customization.on_load, {
	partition = Guid("48814F76-4A2A-11E0-A181-90CCED4B9CC9"), --default value for weapon type
	instance = Guid("4708D2FE-96CC-9515-A5BE-B86D3CE236F5"), --instance type for type of value being modified eg ammo, barrel type, optics, etc
}, {
	partition = Guid("1FD2E5C9-EB74-4726-923F-639ABD344E58"), --unlock partition under CP1 prismatic
	instance = Guid("ABC0DDCE-4A48-456F-8FB5-4C312790F36F"), --unlock intance under CP1 primatic
})

return nil
