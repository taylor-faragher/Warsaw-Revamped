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

--Assault Grenades
local Assault_Grenades = {}
Assault_Grenades.__index = Assault_Grenades
local AssaultGrenades = Assault_Grenades

function AssaultGrenades:on_load(
	USAssault: CustomizationUnlockParts,
	RUAssault: CustomizationUnlockParts,
	CHAssault: CustomizationUnlockParts
)
	local removedExplosives = { 1, 2, 3, 4}
	for _, unlockParts in { USAssault, RUAssault, CHAssault } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() > 1 then
			for i = 8, 1, -1 do
				if has_value(removedExplosives, i) then
					selectableUnlocks:remove(i)
				end
			end
		end
	end
end

partitions.onAllInstancesLoaded(AssaultGrenades, AssaultGrenades.on_load, {
	partition = Guid("79808AE2-5FED-47F2-B82C-B31BF202519E"),
	instance = Guid("DC78EC22-9571-4078-BE78-BBE95B90841A"), --USAssault
}, {
	partition = Guid("9F856C4A-66E1-4344-B3C8-BCC36F9BE52F"),
	instance = Guid("9C46F62D-5A30-401F-9F7A-6F77C808F0E7"), --RUAssault
}, {
	partition = Guid("5C4A8A34-4549-4FBB-B06B-B19E5E602722"),
	instance = Guid("555DA983-0148-403C-A718-D76A260CB62D"), --CHAssault
})

--Engineer Grenades
local Engineer_Grenades = {}
Engineer_Grenades.__index = Engineer_Grenades
local EngineerGrenades = Engineer_Grenades

function EngineerGrenades:on_load(
	USEngineer: CustomizationUnlockParts,
	RUEngineer: CustomizationUnlockParts,
	CHEngineer: CustomizationUnlockParts,
	Decoy: SoldierWeaponUnlockAsset
)
	local removedExplosives = { 1, 2, 3, 4}
	for _, unlockParts in { USEngineer, RUEngineer, CHEngineer } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() > 1 then
			for i = 8, 1, -1 do
				if has_value(removedExplosives, i) then
					selectableUnlocks:remove(i)
				end
			end
		end
	end
end

partitions.onAllInstancesLoaded(EngineerGrenades, EngineerGrenades.on_load, {
	partition = Guid("0229CBD7-FB79-4A26-9580-60DB0CF1DC51"),
	instance = Guid("DA92980E-AFF1-4BE4-9ACB-DF837FE0A676"), --USEngineer
}, {
	partition = Guid("7C7B9BAB-71C5-4585-92B8-910584FC2642"),
	instance = Guid("A977C94A-CD22-4849-A881-B44674789AEB"), --RUEngineer
}, {
	partition = Guid("A7A185A5-68DB-45EB-B17A-2793053A84B0"),
	instance = Guid("EFB9C417-06B4-407D-978A-C1F641EB2F4B"), --CHEngineer
}, {
	partition = Guid("7E0F9248-0718-43B5-8B40-0DD82C0C0D0A"),
	instance = Guid("B9C94635-8FC8-4A1A-99ED-F99CA7194616"), --Decoy
})

--Support Grenades
local Support_Grenades = {}
Support_Grenades.__index = Support_Grenades
local SupportGrenades = Support_Grenades

function SupportGrenades:on_load(
	USSupport: CustomizationUnlockParts,
	RUSupport: CustomizationUnlockParts,
	CHSupport: CustomizationUnlockParts,
	Decoy: SoldierWeaponUnlockAsset
)
	local removedExplosives = { 1, 2, 3, 4}
	for _, unlockParts in { USSupport, RUSupport, CHSupport } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() > 1 then
			for i = 8, 1, -1 do
				if has_value(removedExplosives, i) then
					selectableUnlocks:remove(i)
				end
			end
		end
	end
end

partitions.onAllInstancesLoaded(SupportGrenades, SupportGrenades.on_load, {
	partition = Guid("E1338441-1B84-4BFD-976B-AF8A58911359"),
	instance = Guid("4190C5EE-352D-4BBA-8D7B-539D5BDD9941"), --USSupport
}, {
	partition = Guid("2BB6C8CD-64A6-4A8A-A531-D230997F17C8"),
	instance = Guid("9E126042-1BE5-48FD-9ECA-30085FE747FF"), --RUSupport
}, {
	partition = Guid("456F1129-DF91-48B0-B2D3-CA4B93D300DF"),
	instance = Guid("5209708F-4673-4593-89E3-1C76CCB9F2C4"), --CHSupport
}, {
	partition = Guid("7E0F9248-0718-43B5-8B40-0DD82C0C0D0A"),
	instance = Guid("B9C94635-8FC8-4A1A-99ED-F99CA7194616"), --Decoy
})

--Recon Grenades
local Recon_Grenades = {}
Recon_Grenades.__index = Recon_Grenades
local ReconGrenades = Recon_Grenades

function ReconGrenades:on_load(
	USRecon: CustomizationUnlockParts,
	RURecon: CustomizationUnlockParts,
	CHRecon: CustomizationUnlockParts,
	Decoy: SoldierWeaponUnlockAsset
)
	local removedExplosives = { 1, 2, 3, 4}
	for _, unlockParts in { USRecon, RURecon, CHRecon } do
		local selectableUnlocks = unlockParts.selectableUnlocks
		if selectableUnlocks:len() > 1 then
			for i = 8, 1, -1 do
				if has_value(removedExplosives, i) then
					selectableUnlocks:remove(i)
				end
			end
		end
	end
end

partitions.onAllInstancesLoaded(ReconGrenades, ReconGrenades.on_load, {
	partition = Guid("59BE7D79-2E7F-49C7-B5C7-15AFCD00065D"),
	instance = Guid("C304FBAA-2766-48E7-8EAD-EFEF9CF9D3DA"), --USRecon
}, {
	partition = Guid("4CED9A67-032D-435C-84CB-72A4B310DAFB"),
	instance = Guid("BCB09D34-14FC-4311-AB8F-22CD1A6602D9"), --RURecon
}, {
	partition = Guid("A098F032-2972-411F-A44D-7DBACD9F9402"),
	instance = Guid("F156B819-4E13-4BDE-A17A-33269F0B5883"), --CHRecon
}, {
	partition = Guid("7E0F9248-0718-43B5-8B40-0DD82C0C0D0A"),
	instance = Guid("B9C94635-8FC8-4A1A-99ED-F99CA7194616"), --Decoy
})

return nil