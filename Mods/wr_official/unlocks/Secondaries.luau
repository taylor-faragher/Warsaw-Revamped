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

local Secondaries_ = {}
Secondaries_.__index = Secondaries_
local Secondaries = Secondaries_

function Secondaries:on_load(weapons: CustomizationUnlockParts)
	local remainingWeapons = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 }
	if weapons.selectableUnlocks:len() == 17 then
		for i = 17, 1, -1 do
			if not has_value(remainingWeapons, i) then
				weapons.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("79808AE2-5FED-47F2-B82C-B31BF202519E"),
	instance = Guid("B713396B-2A3F-475B-AA3D-3E91F28C5BA2"), --USAssault
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("0229CBD7-FB79-4A26-9580-60DB0CF1DC51"),
	instance = Guid("D542A4EC-966E-45F0-920A-2374AF7D90D1"), --USEngineer
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("E1338441-1B84-4BFD-976B-AF8A58911359"),
	instance = Guid("464274BE-F6B6-4F95-AECB-7903D4DCBF11"), --USSupport
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("59BE7D79-2E7F-49C7-B5C7-15AFCD00065D"),
	instance = Guid("9E48DB59-8670-472F-BCB5-C61A098E87BC"), --USRecon
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("9F856C4A-66E1-4344-B3C8-BCC36F9BE52F"),
	instance = Guid("733F5CAB-5B28-4591-A678-552BDC59AFDF"), --RUAssault
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("7C7B9BAB-71C5-4585-92B8-910584FC2642"),
	instance = Guid("0F5CABB7-CC06-486D-B3CC-E5238254D879"), --RUEngineer
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("2BB6C8CD-64A6-4A8A-A531-D230997F17C8"),
	instance = Guid("59D7B0C2-6CA2-41BD-9A9E-55F44795190C"), --RUSupport
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("4CED9A67-032D-435C-84CB-72A4B310DAFB"),
	instance = Guid("AE8B8EDE-D6D3-4C75-A87C-D25C254F9678"), --RURecon
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("5C4A8A34-4549-4FBB-B06B-B19E5E602722"),
	instance = Guid("3F7FEF20-4BA1-4C36-B066-1078936E9702"), --CHAssault
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("A7A185A5-68DB-45EB-B17A-2793053A84B0"),
	instance = Guid("20FD9C1A-2EFE-404A-A067-3192EF1C553B"), --CHEngineer
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("456F1129-DF91-48B0-B2D3-CA4B93D300DF"),
	instance = Guid("ED60D095-4B17-4B05-822D-9D544AEDCAAA"), --CHSupport
})
partitions.onAllInstancesLoaded(Secondaries, Secondaries.on_load, {
	partition = Guid("A098F032-2972-411F-A44D-7DBACD9F9402"),
	instance = Guid("33DF6927-26B1-4589-98B4-3436E30FCED5"), --CHRecon
})

return nil
