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

--Assault Primaries
local AssaultPrimaries_ = {}
AssaultPrimaries_.__index = AssaultPrimaries_
local AssaultPrimaries = AssaultPrimaries_

function AssaultPrimaries:on_load(
	USAssault: CustomizationUnlockParts,
	RUAssault: CustomizationUnlockParts,
	CHAssault: CustomizationUnlockParts
)
	local remainingWeapons = { 1, 2, 4, 8, 13, 20, 22, 27, 31, 34, 45, 46 }
	for _, primaries in { USAssault, RUAssault, CHAssault } do
		if primaries.selectableUnlocks:len() == 46 then
			-- for i = 46, 1, -1 do
			-- 	if not has_value(remainingWeapons, i) then
			-- 		primaries.selectableUnlocks:remove(i)
			-- 	end
			-- end
		end
	end
end

partitions.onAllInstancesLoaded(AssaultPrimaries, AssaultPrimaries.on_load, {
	partition = Guid("79808AE2-5FED-47F2-B82C-B31BF202519E"),
	instance = Guid("6CDCA942-4DA2-4A92-B778-CEC92CE75749"), --USAssault
}, {
	partition = Guid("9F856C4A-66E1-4344-B3C8-BCC36F9BE52F"),
	instance = Guid("360745CD-4499-4EA4-876E-5463C2A180CF"), --RUAssault
}, {
	partition = Guid("5C4A8A34-4549-4FBB-B06B-B19E5E602722"),
	instance = Guid("7D422B4F-17AA-4151-A657-08473AE5B9D4"), --CHAssault
})

--Engineer Primaries
local EngineerPrimaries_ = {}
EngineerPrimaries_.__index = EngineerPrimaries_
local EngineerPrimaries = EngineerPrimaries_

function EngineerPrimaries:on_load(
	USEngineer: CustomizationUnlockParts,
	RUEngineer: CustomizationUnlockParts,
	CHEngineer: CustomizationUnlockParts,
	SAR21: SoldierWeaponUnlockAsset
)
	local remainingWeapons = { 1, 4, 5, 11, 18, 20, 25, 29, 32, 38, 43 }
	for _, primaries in { USEngineer, RUEngineer, CHEngineer } do
		-- if primaries.selectableUnlocks:len() == 44 then
		-- 	for i = 44, 1, -1 do
		-- 		if not has_value(remainingWeapons, i) then
		-- 			primaries.selectableUnlocks:remove(i)
		-- 		end
		-- 	end
		-- end
	end

	for _, unlockParts in { USEngineer, RUEngineer, CHEngineer } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() < 12 then
			selectableUnlocks:insert(4, SAR21)
		end
	end
end

partitions.onAllInstancesLoaded(EngineerPrimaries, EngineerPrimaries.on_load, {
	partition = Guid("0229CBD7-FB79-4A26-9580-60DB0CF1DC51"),
	instance = Guid("9520701D-100E-4E38-9A21-1416CE3ABA6B"), --USEngineer
}, {
	partition = Guid("7C7B9BAB-71C5-4585-92B8-910584FC2642"),
	instance = Guid("CEAFBDE4-50A9-4627-A0B9-51794DC1E5EB"), --RUEngineer
}, {
	partition = Guid("A7A185A5-68DB-45EB-B17A-2793053A84B0"),
	instance = Guid("DDAB324A-2152-4918-9E54-11D54902552C"), --CHEngineer
}, {
	partition = Guid("3B0B62D8-A391-4493-9C19-031D4BCB35CB"),
	instance = Guid("D6B0E769-CB07-4BAA-8736-CE8635D44E7D"), --SAR-21
})

--Support Primaries
local SupportPrimaries_ = {}
SupportPrimaries_.__index = SupportPrimaries_
local SupportPrimaries = SupportPrimaries_

function SupportPrimaries:on_load(
	USSupport: CustomizationUnlockParts,
	RUSupport: CustomizationUnlockParts,
	CHSupport: CustomizationUnlockParts,
	SAR21: SoldierWeaponUnlockAsset
)
	local remainingWeapons = { 1, 4, 5, 11, 18, 20, 25, 29, 32, 38, 43 }
	for _, primaries in { USSupport, RUSupport, CHSupport } do
		if primaries.selectableUnlocks:len() == 43 then
			-- for i = 43, 1, -1 do
			-- 	if not has_value(remainingWeapons, i) then
			-- 		primaries.selectableUnlocks:remove(i)
			-- 	end
			-- end
		end
	end

	for _, unlockParts in { USSupport, RUSupport, CHSupport } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() < 12 then
			selectableUnlocks:insert(4, SAR21)
		end
	end
end

partitions.onAllInstancesLoaded(SupportPrimaries, SupportPrimaries.on_load, {
	partition = Guid("E1338441-1B84-4BFD-976B-AF8A58911359"),
	instance = Guid("A09592F1-48E1-4667-BA7D-805A1731F056"), --USSupport
}, {
	partition = Guid("2BB6C8CD-64A6-4A8A-A531-D230997F17C8"),
	instance = Guid("C04D88B8-B71C-48D4-94AE-3EDBDBC9D7F6"), --RUSupport
}, {
	partition = Guid("456F1129-DF91-48B0-B2D3-CA4B93D300DF"),
	instance = Guid("5B5C852C-E4FA-4C81-8330-20DD7A543BA9"), --CHSupport
}, {
	partition = Guid("3B0B62D8-A391-4493-9C19-031D4BCB35CB"),
	instance = Guid("D6B0E769-CB07-4BAA-8736-CE8635D44E7D"), --SAR-21
})

--Recon Primaries
local ReconPrimaries_ = {}
ReconPrimaries_.__index = ReconPrimaries_
local ReconPrimaries = ReconPrimaries_

function ReconPrimaries:on_load(
	USRecon: CustomizationUnlockParts,
	RURecon: CustomizationUnlockParts,
	CHRecon: CustomizationUnlockParts,
	SAR21: SoldierWeaponUnlockAsset
)
	local remainingWeapons = { 8, 11, 18, 20, 25, 29, 32, 40, 43 }
	for _, primaries in { USRecon, RURecon, CHRecon } do
		if primaries.selectableUnlocks:len() == 43 then
			-- for i = 43, 1, -1 do
			-- 	if not has_value(remainingWeapons, i) then
			-- 		primaries.selectableUnlocks:remove(i)
			-- 	end
			-- end
		end
	end

	for _, unlockParts in { USRecon, RURecon, CHRecon } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() < 10 then
			selectableUnlocks:insert(2, SAR21)
		end
	end
end

partitions.onAllInstancesLoaded(ReconPrimaries, ReconPrimaries.on_load, {
	partition = Guid("59BE7D79-2E7F-49C7-B5C7-15AFCD00065D"),
	instance = Guid("2FC1E50F-2FEC-480C-91E2-4C46930BC8FE"), --USRecon
}, {
	partition = Guid("4CED9A67-032D-435C-84CB-72A4B310DAFB"),
	instance = Guid("81FDA2DE-24EE-4380-B7BC-41A2EDD3CB8B"), --RURecon
}, {
	partition = Guid("A098F032-2972-411F-A44D-7DBACD9F9402"),
	instance = Guid("FFD50E8A-5BA3-4DE4-B194-0D8653B43F0A"), --CHRecon
}, {
	partition = Guid("3B0B62D8-A391-4493-9C19-031D4BCB35CB"),
	instance = Guid("D6B0E769-CB07-4BAA-8736-CE8635D44E7D"), --SAR-21
})

return nil
