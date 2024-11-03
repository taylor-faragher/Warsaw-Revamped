--!strict

local partitions = require("./partitions")

local QBS09_Customization_ = {}
QBS09_Customization_.__index = QBS09_Customization_
local QBS09_Customization = QBS09_Customization_

function QBS09_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)
	ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(QBS09_Customization, QBS09_Customization.on_load, {
	partition = Guid("4571585C-8080-4ED7-9D26-A2EDBAFCEE9B"),
	instance = Guid("15EEB227-43CD-4665-A82B-11726A44C451"),
}, {
	partition = Guid("A0E2358F-768D-11E2-9074-97D75A40886F"),
	instance = Guid("8AFCB165-8398-0816-2ED1-C76B791CA0A5"),
})

return nil