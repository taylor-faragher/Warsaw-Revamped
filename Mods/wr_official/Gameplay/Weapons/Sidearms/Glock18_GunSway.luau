--!strict

local partitions = require("./partitions")

local Glock18_Gunsway_ = {}
Glock18_Gunsway_.__index = Glock18_Gunsway_
local Glock18_Gunsway = Glock18_Gunsway_

function Glock18_Gunsway:on_load(gunsway: GunSwayData)
	gunsway.shootingRecoilDecreaseScale = 0
	gunsway.firstShotRecoilMultiplier = 2

	--Stand.Zoom
	--BaseValue
	gunsway.stand.zoom.baseValue.minAngle = 0.3
	gunsway.stand.zoom.baseValue.maxAngle = 1.125
	gunsway.stand.zoom.baseValue.increasePerShot = 0
	gunsway.stand.zoom.baseValue.decreasePerSecond = 0
	gunsway.stand.zoom.baseValue.noFireDecreasePerSecond = 4.95
	gunsway.stand.zoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.stand.zoom.moving.minAngle = 0.412
	gunsway.stand.zoom.moving.maxAngle = 1.125
	gunsway.stand.zoom.moving.increasePerShot = 0
	gunsway.stand.zoom.moving.decreasePerSecond = 0
	gunsway.stand.zoom.moving.noFireDecreasePerSecond = 4.35
	gunsway.stand.zoom.moving.noFireTimeThreshold = 0.1

	--Jumping
	gunsway.stand.zoom.jumping.minAngle = 0.412
	gunsway.stand.zoom.jumping.maxAngle = 2.25
	gunsway.stand.zoom.jumping.increasePerShot = 0
	gunsway.stand.zoom.jumping.decreasePerSecond = 0
	gunsway.stand.zoom.jumping.noFireDecreasePerSecond = 11.1
	gunsway.stand.zoom.jumping.noFireTimeThreshold = 0.1

	--Sprinting
	gunsway.stand.zoom.sprinting.minAngle = 0.412
	gunsway.stand.zoom.sprinting.maxAngle = 2.25
	gunsway.stand.zoom.sprinting.increasePerShot = 0
	gunsway.stand.zoom.sprinting.decreasePerSecond = 0
	gunsway.stand.zoom.sprinting.noFireDecreasePerSecond = 11.1
	gunsway.stand.zoom.sprinting.noFireTimeThreshold = 0.1

	--VaultingSmallObject
	gunsway.stand.zoom.vaultingSmallObject.minAngle = 0.412
	gunsway.stand.zoom.vaultingSmallObject.maxAngle = 2.25
	gunsway.stand.zoom.vaultingSmallObject.increasePerShot = 0
	gunsway.stand.zoom.vaultingSmallObject.decreasePerSecond = 0
	gunsway.stand.zoom.vaultingSmallObject.noFireDecreasePerSecond = 11.1
	gunsway.stand.zoom.vaultingSmallObject.noFireTimeThreshold = 0.1

	--VaultingMediumObject
	gunsway.stand.zoom.vaultingMediumObject.minAngle = 0.412
	gunsway.stand.zoom.vaultingMediumObject.maxAngle = 2.25
	gunsway.stand.zoom.vaultingMediumObject.increasePerShot = 0
	gunsway.stand.zoom.vaultingMediumObject.decreasePerSecond = 0
	gunsway.stand.zoom.vaultingMediumObject.noFireDecreasePerSecond = 11.1
	gunsway.stand.zoom.vaultingMediumObject.noFireTimeThreshold = 0.1

	--Recoil
	gunsway.stand.zoom.recoil.recoilAmplitudeMax = 20
	gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot = 0.53
	gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin = -0.38
	gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax = 0.38
	gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax = 10
	gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor = 30

	--Crouch.Zoom
	--BaseValue
	gunsway.crouch.zoom.baseValue.minAngle = 0.3
	gunsway.crouch.zoom.baseValue.maxAngle = 0.84375
	gunsway.crouch.zoom.baseValue.increasePerShot = 0
	gunsway.crouch.zoom.baseValue.decreasePerSecond = 0
	gunsway.crouch.zoom.baseValue.noFireDecreasePerSecond = 3.2625
	gunsway.crouch.zoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.crouch.zoom.moving.minAngle = 0.412
	gunsway.crouch.zoom.moving.maxAngle = 0.84375
	gunsway.crouch.zoom.moving.increasePerShot = 0
	gunsway.crouch.zoom.moving.decreasePerSecond = 0
	gunsway.crouch.zoom.moving.noFireDecreasePerSecond = 2.6625
	gunsway.crouch.zoom.moving.noFireTimeThreshold = 0.1

	--Recoil
	gunsway.crouch.zoom.recoil.recoilAmplitudeMax = gunsway.stand.zoom.recoil.recoilAmplitudeMax
	gunsway.crouch.zoom.recoil.recoilAmplitudeIncPerShot = gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot * 0.75
	gunsway.crouch.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin
		* 0.75
	gunsway.crouch.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax
		* 0.75
	gunsway.crouch.zoom.recoil.horizontalRecoilAmplitudeMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax
	gunsway.crouch.zoom.recoil.recoilAmplitudeDecreaseFactor = gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor

	--Prone.Zoom
	--BaseValue
	gunsway.prone.zoom.baseValue.minAngle = 0.3
	gunsway.prone.zoom.baseValue.maxAngle = 0.75
	gunsway.prone.zoom.baseValue.increasePerShot = 0
	gunsway.prone.zoom.baseValue.decreasePerSecond = 0
	gunsway.prone.zoom.baseValue.noFireDecreasePerSecond = 2.7
	gunsway.prone.zoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.prone.zoom.moving.minAngle = 0.412
	gunsway.prone.zoom.moving.maxAngle = 1.5
	gunsway.prone.zoom.moving.increasePerShot = 0
	gunsway.prone.zoom.moving.decreasePerSecond = 0
	gunsway.prone.zoom.moving.noFireDecreasePerSecond = 6.6
	gunsway.prone.zoom.moving.noFireTimeThreshold = 0.1

	--Recoil
	gunsway.prone.zoom.recoil.recoilAmplitudeMax = gunsway.stand.zoom.recoil.recoilAmplitudeMax
	gunsway.prone.zoom.recoil.recoilAmplitudeIncPerShot = gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot * 2 / 3
	gunsway.prone.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin
		* 2
		/ 3
	gunsway.prone.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax
		* 2
		/ 3
	gunsway.prone.zoom.recoil.horizontalRecoilAmplitudeMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax
	gunsway.prone.zoom.recoil.recoilAmplitudeDecreaseFactor = gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor

	--Stand.NoZoom
	--BaseValue
	gunsway.stand.noZoom.baseValue.minAngle = 1.125
	gunsway.stand.noZoom.baseValue.maxAngle = 2.25
	gunsway.stand.noZoom.baseValue.increasePerShot = 0.225
	gunsway.stand.noZoom.baseValue.decreasePerSecond = 6.75
	gunsway.stand.noZoom.baseValue.noFireDecreasePerSecond = 15
	gunsway.stand.noZoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.stand.noZoom.moving.minAngle = 1.125
	gunsway.stand.noZoom.moving.maxAngle = 2.25
	gunsway.stand.noZoom.moving.increasePerShot = 0.225
	gunsway.stand.noZoom.moving.decreasePerSecond = 6.75
	gunsway.stand.noZoom.moving.noFireDecreasePerSecond = 15
	gunsway.stand.noZoom.moving.noFireTimeThreshold = 0.1

	--Jumping
	gunsway.stand.noZoom.jumping.minAngle = 2.25
	gunsway.stand.noZoom.jumping.maxAngle = 2.25
	gunsway.stand.noZoom.jumping.increasePerShot = 0.225
	gunsway.stand.noZoom.jumping.decreasePerSecond = 6.75
	gunsway.stand.noZoom.jumping.noFireDecreasePerSecond = 15
	gunsway.stand.noZoom.jumping.noFireTimeThreshold = 0.1

	--Sprinting
	gunsway.stand.noZoom.sprinting.minAngle = gunsway.stand.noZoom.moving.minAngle
	gunsway.stand.noZoom.sprinting.maxAngle = gunsway.stand.noZoom.moving.maxAngle
	gunsway.stand.noZoom.sprinting.increasePerShot = gunsway.stand.noZoom.moving.increasePerShot
	gunsway.stand.noZoom.sprinting.decreasePerSecond = gunsway.stand.noZoom.moving.decreasePerSecond
	gunsway.stand.noZoom.sprinting.noFireDecreasePerSecond = gunsway.stand.noZoom.moving.noFireDecreasePerSecond
	gunsway.stand.noZoom.sprinting.noFireTimeThreshold = gunsway.stand.noZoom.moving.noFireTimeThreshold

	--VaultingSmallObject
	gunsway.stand.noZoom.vaultingSmallObject.minAngle = gunsway.stand.noZoom.jumping.minAngle
	gunsway.stand.noZoom.vaultingSmallObject.maxAngle = gunsway.stand.noZoom.jumping.maxAngle
	gunsway.stand.noZoom.vaultingSmallObject.increasePerShot = gunsway.stand.noZoom.jumping.increasePerShot
	gunsway.stand.noZoom.vaultingSmallObject.decreasePerSecond = gunsway.stand.noZoom.jumping.decreasePerSecond
	gunsway.stand.noZoom.vaultingSmallObject.noFireDecreasePerSecond =
		gunsway.stand.noZoom.jumping.noFireDecreasePerSecond
	gunsway.stand.noZoom.vaultingSmallObject.noFireTimeThreshold = gunsway.stand.noZoom.jumping.noFireTimeThreshold

	--VaultingMediumObject
	gunsway.stand.noZoom.vaultingMediumObject.minAngle = gunsway.stand.noZoom.jumping.minAngle
	gunsway.stand.noZoom.vaultingMediumObject.maxAngle = gunsway.stand.noZoom.jumping.maxAngle
	gunsway.stand.noZoom.vaultingMediumObject.increasePerShot = gunsway.stand.noZoom.jumping.increasePerShot
	gunsway.stand.noZoom.vaultingMediumObject.decreasePerSecond = gunsway.stand.noZoom.jumping.decreasePerSecond
	gunsway.stand.noZoom.vaultingMediumObject.noFireDecreasePerSecond =
		gunsway.stand.noZoom.jumping.noFireDecreasePerSecond
	gunsway.stand.noZoom.vaultingMediumObject.noFireTimeThreshold = gunsway.stand.noZoom.jumping.noFireTimeThreshold

	--Recoil
	gunsway.stand.noZoom.recoil.recoilAmplitudeMax = gunsway.stand.zoom.recoil.recoilAmplitudeMax
	gunsway.stand.noZoom.recoil.recoilAmplitudeIncPerShot = gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot
	gunsway.stand.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMin =
		gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin
	gunsway.stand.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMax =
		gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax
	gunsway.stand.noZoom.recoil.horizontalRecoilAmplitudeMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax
	gunsway.stand.noZoom.recoil.recoilAmplitudeDecreaseFactor = gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor

	--Crouch.NoZoom
	--BaseValue
	gunsway.crouch.noZoom.baseValue.minAngle = 0.84375
	gunsway.crouch.noZoom.baseValue.maxAngle = 1.96875
	gunsway.crouch.noZoom.baseValue.increasePerShot = 0.225
	gunsway.crouch.noZoom.baseValue.decreasePerSecond = 6.75
	gunsway.crouch.noZoom.baseValue.noFireDecreasePerSecond = 15
	gunsway.crouch.noZoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.crouch.noZoom.moving.minAngle = 0.84375
	gunsway.crouch.noZoom.moving.maxAngle = 1.96875
	gunsway.crouch.noZoom.moving.increasePerShot = 0.225
	gunsway.crouch.noZoom.moving.decreasePerSecond = 6.75
	gunsway.crouch.noZoom.moving.noFireDecreasePerSecond = 15
	gunsway.crouch.noZoom.moving.noFireTimeThreshold = 0.1

	--Recoil
	gunsway.crouch.noZoom.recoil.recoilAmplitudeMax = gunsway.stand.zoom.recoil.recoilAmplitudeMax
	gunsway.crouch.noZoom.recoil.recoilAmplitudeIncPerShot = gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot * 0.75
	gunsway.crouch.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMin = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin
		* 0.75
	gunsway.crouch.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax
		* 0.75
	gunsway.crouch.noZoom.recoil.horizontalRecoilAmplitudeMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax
	gunsway.crouch.noZoom.recoil.recoilAmplitudeDecreaseFactor = gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor

	--Prone.NoZoom
	--BaseValue
	gunsway.prone.noZoom.baseValue.minAngle = 0.75
	gunsway.prone.noZoom.baseValue.maxAngle = 1.875
	gunsway.prone.noZoom.baseValue.increasePerShot = 0.225
	gunsway.prone.noZoom.baseValue.decreasePerSecond = 6.75
	gunsway.prone.noZoom.baseValue.noFireDecreasePerSecond = 15
	gunsway.prone.noZoom.baseValue.noFireTimeThreshold = 0.1

	--Moving
	gunsway.prone.noZoom.moving.minAngle = 1.5
	gunsway.prone.noZoom.moving.maxAngle = 1.5
	gunsway.prone.noZoom.moving.increasePerShot = 0.225
	gunsway.prone.noZoom.moving.decreasePerSecond = 6.75
	gunsway.prone.noZoom.moving.noFireDecreasePerSecond = 15
	gunsway.prone.noZoom.moving.noFireTimeThreshold = 0.1

	--Recoil
	gunsway.prone.noZoom.recoil.recoilAmplitudeMax = gunsway.stand.zoom.recoil.recoilAmplitudeMax
	gunsway.prone.noZoom.recoil.recoilAmplitudeIncPerShot = gunsway.stand.zoom.recoil.recoilAmplitudeIncPerShot * 2 / 3
	gunsway.prone.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMin = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMin
		* 2
		/ 3
	gunsway.prone.noZoom.recoil.horizontalRecoilAmplitudeIncPerShotMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeIncPerShotMax
		* 2
		/ 3
	gunsway.prone.noZoom.recoil.horizontalRecoilAmplitudeMax = gunsway.stand.zoom.recoil.horizontalRecoilAmplitudeMax
	gunsway.prone.noZoom.recoil.recoilAmplitudeDecreaseFactor = gunsway.stand.zoom.recoil.recoilAmplitudeDecreaseFactor

	--CrouchToProne
	gunsway.crouchToProne.coolDown = 0

	--StandToProne
	gunsway.standToProne.coolDown = 0

	--SuppressionModifierUnzoomed
	gunsway.suppressionModifierUnzoomed.recoilMagnitudeMod = 0
	gunsway.suppressionModifierUnzoomed.recoilAngleMod = 0
	gunsway.suppressionModifierUnzoomed.firstShotRecoilMod = 0
	gunsway.suppressionModifierUnzoomed.lagYawMod = 0
	gunsway.suppressionModifierUnzoomed.lagPitchMod = 0

	--DispersionMod
	gunsway.suppressionModifierUnzoomed.dispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.dispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.dispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierUnzoomed.dispersionMod.decreasePerSecondModifier = 0

	--MovingDispersionMod
	gunsway.suppressionModifierUnzoomed.movingDispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.movingDispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.movingDispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierUnzoomed.movingDispersionMod.decreasePerSecondModifier = 0

	--SprintingDispersionMod
	gunsway.suppressionModifierUnzoomed.sprintingDispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.sprintingDispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierUnzoomed.sprintingDispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierUnzoomed.sprintingDispersionMod.decreasePerSecondModifier = 0

	--SuppressionModifierZoomed
	gunsway.suppressionModifierZoomed.recoilMagnitudeMod = 0
	gunsway.suppressionModifierZoomed.recoilAngleMod = 0
	gunsway.suppressionModifierZoomed.firstShotRecoilMod = 0
	gunsway.suppressionModifierZoomed.lagYawMod = 0
	gunsway.suppressionModifierZoomed.lagPitchMod = 0

	--DispersionMod
	gunsway.suppressionModifierZoomed.dispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierZoomed.dispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierZoomed.dispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierZoomed.dispersionMod.decreasePerSecondModifier = 0

	--MovingDispersionMod
	gunsway.suppressionModifierZoomed.movingDispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierZoomed.movingDispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierZoomed.movingDispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierZoomed.movingDispersionMod.decreasePerSecondModifier = 0

	--SprintingDispersionMod
	gunsway.suppressionModifierZoomed.sprintingDispersionMod.minAngleModifier = 0
	gunsway.suppressionModifierZoomed.sprintingDispersionMod.maxAngleModifier = 0
	gunsway.suppressionModifierZoomed.sprintingDispersionMod.increasePerShotModifier = 0
	gunsway.suppressionModifierZoomed.sprintingDispersionMod.decreasePerSecondModifier = 0

	--ModifierUnlocks
	--Barrel_Heavy
	local hbar_clone = gunsway.modifierUnlocks[5].modifier:clone()

	hbar_clone.standZoomModifier.dispersionMod.minAngleModifier = 2 / 3
	hbar_clone.standZoomModifier.movingDispersionMod.minAngleModifier = 0.525

	hbar_clone.crouchZoomModifier.dispersionMod.minAngleModifier = 2 / 3
	hbar_clone.crouchZoomModifier.movingDispersionMod.minAngleModifier = 0.525

	hbar_clone.proneZoomModifier.dispersionMod.minAngleModifier = 2 / 3
	hbar_clone.proneZoomModifier.movingDispersionMod.minAngleModifier = 0.525

	gunsway.modifierUnlocks[5].modifier = hbar_clone

	--Accessory_PistolTargetPointer
	local laser_clone = gunsway.modifierUnlocks[1].modifier:clone()

	laser_clone.standNoZoomModifier.movingDispersionMod.minAngleModifier = 0
	laser_clone.standNoZoomModifier.sprintingDispersionMod.minAngleModifier = 0
	laser_clone.crouchNoZoomModifier.movingDispersionMod.minAngleModifier = 0

	gunsway.modifierUnlocks[1].modifier = laser_clone
	gunsway.modifierUnlocks[2].modifier = laser_clone
	gunsway.modifierUnlocks[3].modifier = laser_clone
	gunsway.modifierUnlocks[8].modifier = laser_clone

	--adds Flash Hider modifier which was missing previously
	local Barrel_FlashHider = GunSwayModifierData.fromTable({
		onlyInSupportedShooting = false,
		onlyOnWeaponLightEnabled = false,
		standZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
		standNoZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
		crouchZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
		crouchNoZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
		proneZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
		proneNoZoomModifier = GunSwayStanceZoomModifierData.fromTable({
			dispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			movingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			sprintingDispersionMod = GunSwayDispersionModData.fromTable({
				minAngleModifier = 1,
				maxAngleModifier = 1,
				increasePerShotModifier = 1,
				decreasePerSecondModifier = 1,
			}),
			recoilMagnitudeMod = 0.9,
			recoilAngleMod = 0.9,
			firstShotRecoilMod = 1,
			lagYawMod = 0,
			lagPitchMod = 0,
		}),
	})

	local flashhider = GunSwayModifierUnlock.fromTable({
		unlockAssetGuid = Guid("AFDABEA5-C233-02C6-5DFF-A8EA8DCF3B19"),
		modifier = Barrel_FlashHider,
	})

	if gunsway.modifierUnlocks:len() < 11 then
		gunsway.modifierUnlocks:push(flashhider)
	end
end

partitions.onAllInstancesLoaded(Glock18_Gunsway, Glock18_Gunsway.on_load, {
	partition = Guid("9D13A69D-B261-4122-9D6C-79CF6715862B"),
	instance = Guid("3D774786-61F9-4AFA-981F-BA6874C1A494"),
})

return nil
