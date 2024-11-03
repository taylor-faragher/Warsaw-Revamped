--!strict

local partitions = require("./partitions")

local HAWK_Customization_ = {}
HAWK_Customization_.__index = HAWK_Customization_
local HAWK_Customization = HAWK_Customization_

function HAWK_Customization:on_load(
	ammo: CustomizationUnlockParts,
	prisma: UnlockAsset
)
	ammo.selectableUnlocks:remove(3)
end

partitions.onAllInstancesLoaded(HAWK_Customization, HAWK_Customization.on_load, {
	partition = Guid("6CEB46C1-83CC-40C8-B689-64FC7053A719"),
	instance = Guid("D25754B7-74F6-42FC-84BD-8FE5BF46B653"),
}, {
	partition = Guid("2997FF1D-9619-473B-8280-45716AC966CE"),
	instance = Guid("177EF4F9-EAAA-41F0-A62E-010CDE5089D5"),
})

return nil