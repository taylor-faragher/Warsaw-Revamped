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

--Assault Gadgets
local AssaultGadgets_ = {}
AssaultGadgets_.__index = AssaultGadgets_
local AssaultGadgets = AssaultGadgets_

function AssaultGadgets:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 3, 4, 8, 9, 10, 12, 13, 14, 15}
	if gadgets.selectableUnlocks:len() == 15 then
		for i = 15, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(AssaultGadgets, AssaultGadgets.on_load, {
	partition = Guid("79808AE2-5FED-47F2-B82C-B31BF202519E"),
	instance = Guid("A74A503C-A004-4C85-BA59-A7E94B156CDA"), --USAssault (Gadget 1)
})
partitions.onAllInstancesLoaded(AssaultGadgets, AssaultGadgets.on_load, {
	partition = Guid("9F856C4A-66E1-4344-B3C8-BCC36F9BE52F"),
	instance = Guid("E02DE175-6A02-44A5-ACFA-97B268BDB903"), --RUAssault (Gadget 1)
})
partitions.onAllInstancesLoaded(AssaultGadgets, AssaultGadgets.on_load, {
	partition = Guid("5C4A8A34-4549-4FBB-B06B-B19E5E602722"),
	instance = Guid("FEE57B62-E91A-4A1A-A5B4-DFEFCCB794C7"), --CHAssault (Gadget 1)
})

--Assault Gadgets 2
local AssaultGadgets2_ = {}
AssaultGadgets2_.__index = AssaultGadgets2_
local AssaultGadgets2 = AssaultGadgets2_

function AssaultGadgets2:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 3, 4, 8, 9, 10, 12, 13, 14, 15}
	if gadgets.selectableUnlocks:len() == 15 then
		for i = 15, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(AssaultGadgets2, AssaultGadgets2.on_load, {
	partition = Guid("79808AE2-5FED-47F2-B82C-B31BF202519E"),
	instance = Guid("20AF8AA9-43A6-4483-ADD8-39F13F7B8D57"), --USAssault (Gadget 2)
})

partitions.onAllInstancesLoaded(AssaultGadgets2, AssaultGadgets2.on_load, {
	partition = Guid("9F856C4A-66E1-4344-B3C8-BCC36F9BE52F"),
	instance = Guid("1C649024-0381-48D6-96CC-213E90D79478"), --RUAssault (Gadget 2)
})

partitions.onAllInstancesLoaded(AssaultGadgets2, AssaultGadgets2.on_load, {
	partition = Guid("5C4A8A34-4549-4FBB-B06B-B19E5E602722"),
	instance = Guid("E5768B2B-445E-43D4-9E7D-719E28F8CA65"), --CHAssault (Gadget 2)
})

--Engineer Gadgets
local EngineerGadgets_ = {}
EngineerGadgets_.__index = EngineerGadgets_
local EngineerGadgets = EngineerGadgets_

function EngineerGadgets:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 9, 12, 14 }
	if gadgets.selectableUnlocks:len() == 14 then
		for i = 14, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
	gadgets.defaultSelectionIndex = 0
end

partitions.onAllInstancesLoaded(EngineerGadgets, EngineerGadgets.on_load, {
	partition = Guid("0229CBD7-FB79-4A26-9580-60DB0CF1DC51"),
	instance = Guid("A8DF67F6-7CD6-4013-99A3-68A812CFC484"), --USEngineer (Gadget 1)
})
partitions.onAllInstancesLoaded(EngineerGadgets, EngineerGadgets.on_load, {
	partition = Guid("7C7B9BAB-71C5-4585-92B8-910584FC2642"),
	instance = Guid("CA417DDA-9756-4A0C-A3ED-A9DD66DA789F"), --RUEngineer (Gadget 1)
})
partitions.onAllInstancesLoaded(EngineerGadgets, EngineerGadgets.on_load, {
	partition = Guid("A7A185A5-68DB-45EB-B17A-2793053A84B0"),
	instance = Guid("FD9D37AC-02D6-4436-86DF-E51C14D9C7AD"), --CHEngineer (Gadget 1)
})

--Engineer Gadgets 2
local EngineerGadgets2_ = {}
EngineerGadgets2_.__index = EngineerGadgets2_
local EngineerGadgets2 = EngineerGadgets2_

function EngineerGadgets2:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 9, 12, 14 }
	if gadgets.selectableUnlocks:len() == 14 then
		for i = 14, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
	gadgets.defaultSelectionIndex = 0
end

partitions.onAllInstancesLoaded(EngineerGadgets2, EngineerGadgets2.on_load, {
	partition = Guid("0229CBD7-FB79-4A26-9580-60DB0CF1DC51"),
	instance = Guid("1D0DA1E6-538F-4A7C-B3BD-06ABFA729C9B"), --USEngineer (Gadget 2)
})
partitions.onAllInstancesLoaded(EngineerGadgets2, EngineerGadgets2.on_load, {
	partition = Guid("7C7B9BAB-71C5-4585-92B8-910584FC2642"),
	instance = Guid("02062FD4-6974-4C65-815B-E89EED3E4746"), --RUEngineer (Gadget 2)
})
partitions.onAllInstancesLoaded(EngineerGadgets2, EngineerGadgets2.on_load, {
	partition = Guid("A7A185A5-68DB-45EB-B17A-2793053A84B0"),
	instance = Guid("E5ECA72D-54BB-4509-8C57-4CEEFB016D50"), --CHEngineer (Gadget 2)
})

--Support Gadgets
local SupportGadgets_ = {}
SupportGadgets_.__index = SupportGadgets_
local SupportGadgets = SupportGadgets_

function SupportGadgets:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 3, 4, 5, 7, 9, 12, 13 }
	if gadgets.selectableUnlocks:len() == 13 then
		for i = 13, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(SupportGadgets, SupportGadgets.on_load, {
	partition = Guid("E1338441-1B84-4BFD-976B-AF8A58911359"),
	instance = Guid("E56ED753-7841-4C66-B8C0-C6905105B910"), --USSupport (Gadget 1)
})
partitions.onAllInstancesLoaded(SupportGadgets, SupportGadgets.on_load, {
	partition = Guid("2BB6C8CD-64A6-4A8A-A531-D230997F17C8"),
	instance = Guid("52A3B21B-7FA3-45F9-A813-A4098641D81E"), --RUSupport (Gadget 1)
})
partitions.onAllInstancesLoaded(SupportGadgets, SupportGadgets.on_load, {
	partition = Guid("456F1129-DF91-48B0-B2D3-CA4B93D300DF"),
	instance = Guid("644FA4CD-5AF5-4EF5-9364-113FC0A87DDC"), --CHSupport (Gadget 1)
})

--Support Gadgets 2
local SupportGadgets2_ = {}
SupportGadgets2_.__index = SupportGadgets2_
local SupportGadgets2 = SupportGadgets2_

function SupportGadgets2:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 3, 4, 5, 7, 9, 12, 13 }
	if gadgets.selectableUnlocks:len() == 13 then
		for i = 13, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(SupportGadgets2, SupportGadgets2.on_load, {
	partition = Guid("E1338441-1B84-4BFD-976B-AF8A58911359"),
	instance = Guid("DE9A0921-A0A3-45D8-B6F1-17739355792F"), --USSupport (Gadget 2)
})
partitions.onAllInstancesLoaded(SupportGadgets2, SupportGadgets2.on_load, {
	partition = Guid("2BB6C8CD-64A6-4A8A-A531-D230997F17C8"),
	instance = Guid("57C88B00-6DE6-4AE4-B101-0AE077BBFC03"), --RUSupport (Gadget 2)
})
partitions.onAllInstancesLoaded(SupportGadgets2, SupportGadgets2.on_load, {
	partition = Guid("456F1129-DF91-48B0-B2D3-CA4B93D300DF"),
	instance = Guid("1230669B-3CA5-4515-830A-37DFC41C3F32"), --CHSupport (Gadget 2)
})

--Recon Gadgets
local ReconGadgets_ = {}
ReconGadgets_.__index = ReconGadgets_
local ReconGadgets = ReconGadgets_

function ReconGadgets:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 2, 4, 5, 6, 7, 8, 11 }
	if gadgets.selectableUnlocks:len() == 11 then
		for i = 11, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(ReconGadgets, ReconGadgets.on_load, {
	partition = Guid("59BE7D79-2E7F-49C7-B5C7-15AFCD00065D"),
	instance = Guid("42AB9502-29F8-4DF1-A301-536090693CD6"), --USRecon (Gadget 1)
})
partitions.onAllInstancesLoaded(ReconGadgets, ReconGadgets.on_load, {
	partition = Guid("4CED9A67-032D-435C-84CB-72A4B310DAFB"),
	instance = Guid("175C3AE3-2BE8-4D5E-A2A8-D791BCD040E4"), --RURecon (Gadget 1)
})
partitions.onAllInstancesLoaded(ReconGadgets, ReconGadgets.on_load, {
	partition = Guid("A098F032-2972-411F-A44D-7DBACD9F9402"),
	instance = Guid("B9D00769-8DFE-40E6-A62D-50EC4DDF66D0"), --CHRecon (Gadget 1)
})

--Recon Gadgets 2
local ReconGadgets2_ = {}
ReconGadgets2_.__index = ReconGadgets2_
local ReconGadgets2 = ReconGadgets2_

function ReconGadgets2:on_load(gadgets: CustomizationUnlockParts)
	local remainingGadgets = { 1, 2, 4, 5, 6, 7, 8, 11 }
	if gadgets.selectableUnlocks:len() == 11 then
		for i = 11, 1, -1 do
			if not has_value(remainingGadgets, i) then
				gadgets.selectableUnlocks:remove(i)
			end
		end
	end
end

partitions.onAllInstancesLoaded(ReconGadgets2, ReconGadgets2.on_load, {
	partition = Guid("59BE7D79-2E7F-49C7-B5C7-15AFCD00065D"),
	instance = Guid("B97C6E0C-2380-4155-B3B4-F69C60B383A5"), --USRecon (Gadget 2)
})
partitions.onAllInstancesLoaded(ReconGadgets2, ReconGadgets2.on_load, {
	partition = Guid("4CED9A67-032D-435C-84CB-72A4B310DAFB"),
	instance = Guid("EF35557F-3A98-4733-8F78-A04C2B7DD338"), --RURecon (Gadget 2)
})
partitions.onAllInstancesLoaded(ReconGadgets2, ReconGadgets2.on_load, {
	partition = Guid("A098F032-2972-411F-A44D-7DBACD9F9402"),
	instance = Guid("D34E9CAA-F2A2-4F51-B6F2-C0DBBC91A38D"), --CHRecon (Gadget 2)
})

return nil
