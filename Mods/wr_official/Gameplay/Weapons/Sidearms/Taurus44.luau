--!strict

local partitions = require("./partitions")

local Taurus44_ = {}
Taurus44_.__index = Taurus44_
local Taurus44 = Taurus44_

function Taurus44:on_load(weapon: SoldierWeaponBlueprint, FOVZoomCurveSlow: FOVTransitionData)
	local m_weapon = weapon.object :: SoldierWeaponData

	--Sprint-to-Fire Delay
	m_weapon.weaponFiring.sprintRecoverTimeOverride = 0.1

	--Aiming Simulation
	local aimingControllerDefault = m_weapon.aimingController:clone()

	--hipfire to ADS
	aimingControllerDefault.zoomTransitionTimeArray[1].fovTransitionTime = 0.166
	--ADS to hipfire
	aimingControllerDefault.zoomTransitionTimeArray[2].fovTransitionTime = 0.2

	m_weapon.aimingController = aimingControllerDefault

	--Aiming Simulation (slow)
	local aimingControllerSlow = m_weapon.aimingController:clone()

	--hipfire to ADS
	aimingControllerSlow.zoomTransitionTimeArray[1].fovTransitionTime = 0.2
	aimingControllerSlow.zoomTransitionTimeArray[1].zoomTransitionTime = 0.116
	--ADS to hipfire
	aimingControllerSlow.zoomTransitionTimeArray[2].fovTransitionTime = 0.233

	--1.00x Zoom & 65% ADS Move Speed
	local Zoom1x_Speed65 = m_weapon.aimingController.zoomLevels[2]:clone()
	Zoom1x_Speed65.fieldOfView = 54.5

	Zoom1x_Speed65.lookSpeedMultiplier = 0.9909
	Zoom1x_Speed65.moveSpeedMultiplier = 0.65

	Zoom1x_Speed65.supportedSwayPitchMagnitude = 0
	Zoom1x_Speed65.supportedSwayYawMagnitude = 0

	Zoom1x_Speed65.suppressedSwayPitchMagnitude = 0
	Zoom1x_Speed65.suppressedSwayYawMagnitude = 0
	Zoom1x_Speed65.suppressedSwayMinFactor = 0

	aimingControllerDefault.zoomLevels[2] = Zoom1x_Speed65

	--3.00x Zoom & 60% ADS Move Speed
	local Zoom3x_Speed60 = Zoom1x_Speed65:clone()
	Zoom3x_Speed60.fieldOfView = 19.7

	Zoom3x_Speed60.lookSpeedMultiplier = 0.358
	Zoom3x_Speed60.moveSpeedMultiplier = 0.6

	Zoom3x_Speed60.fieldOfViewTransition = FOVZoomCurveSlow

	--IRON SIGHTS [1X]
	--FirstPersonCamera
	local m_weapon_firstPersonCamera_clone = m_weapon.firstPersonCamera:clone()
	m_weapon_firstPersonCamera_clone.rotation.x = -0.0033
	m_weapon.firstPersonCamera = m_weapon_firstPersonCamera_clone

	--Unzoomed
	local m_weapon_irons = m_weapon.zoomLevels[1] :: WeaponZoomLevelData
	m_weapon_irons.animationSettings.zoomOutSpeed = 1.5

	--Zoomed
	local m_weapon_irons_zoomed = m_weapon.zoomLevels[2] :: WeaponZoomLevelData
	m_weapon_irons_zoomed.renderFov = 35
	m_weapon_irons_zoomed.animationSettings.weaponOffsetY = 0
	m_weapon_irons_zoomed.animationSettings.zoomInSpeed = 1.8

	--MINI [1X]
	--Unzoomed
	local m_weapon_rmr = WeaponZoomLevelModifier.fromTable({
		applyOrder = -1,
		zoomLevelIndex = 0,
		zoomLevel = nil,
		weaponZoomLevel = WeaponZoomLevelData.fromTable({
			renderFov = 55,
			renderFovTransition = nil,
			zoomInOutMeshTransitionFactors = nil,
			zoomDisabledTransitionTimer = 0,
			sightType = SightType.SightType_None,
			animationSettings = WeaponAnimationSettingsData.fromTable({
				kickbackFactor = 1,
				kickbackSpeedFactor = 1,
				weaponOffsetX = 0,
				weaponOffsetY = -0.131,
				weaponOffsetZ = 0,
				zoomOutSpeed = 1.5,
				zoomInSpeed = 1,
			}),
		}),
	})

	if m_weapon.weaponModifierData[1].modifiers:len() < 2 then
		m_weapon.weaponModifierData[1].modifiers:push(m_weapon_rmr)
	end

	--Zoomed
	local m_weapon_rmr_zoomed = m_weapon.weaponModifierData[1].modifiers[1] :: WeaponZoomLevelModifier
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = 0
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.weaponOffsetY = -0.131
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.8
	m_weapon_rmr_zoomed.zoomLevel = Zoom1x_Speed65

	--DELTA [1X]
	--Unzoomed
	local m_weapon_delta = WeaponZoomLevelModifier.fromTable({
		applyOrder = -1,
		zoomLevelIndex = 0,
		zoomLevel = nil,
		weaponZoomLevel = WeaponZoomLevelData.fromTable({
			renderFov = 55,
			renderFovTransition = nil,
			zoomInOutMeshTransitionFactors = nil,
			zoomDisabledTransitionTimer = 0,
			sightType = SightType.SightType_None,
			animationSettings = WeaponAnimationSettingsData.fromTable({
				kickbackFactor = 1,
				kickbackSpeedFactor = 1,
				weaponOffsetX = 0,
				weaponOffsetY = -0.139,
				weaponOffsetZ = 0,
				zoomOutSpeed = 1.5,
				zoomInSpeed = 1,
			}),
		}),
	})

	if m_weapon.weaponModifierData[3].modifiers:len() < 2 then
		m_weapon.weaponModifierData[3].modifiers:push(m_weapon_delta)
	end

	--Zoomed
	local m_weapon_delta_zoomed = m_weapon.weaponModifierData[3].modifiers[1] :: WeaponZoomLevelModifier
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = 0
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.weaponOffsetY = -0.139
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.8
	m_weapon_delta_zoomed.zoomLevel = Zoom1x_Speed65

	--ACOG [3X]
	--Unzoomed
	local m_weapon_acog = m_weapon.weaponModifierData[4].modifiers[3] :: WeaponZoomLevelModifier
	m_weapon_acog.weaponZoomLevel.animationSettings.weaponOffsetY = -0.306
	m_weapon_acog.weaponZoomLevel.animationSettings.zoomOutSpeed = 1.25

	--Zoomed
	local m_weapon_acog_zoomed = WeaponZoomLevelModifier.fromTable({
		applyOrder = -1,
		zoomLevelIndex = 1,
		zoomLevel = Zoom3x_Speed60,
		weaponZoomLevel = WeaponZoomLevelData.fromTable({
			renderFov = 13.5,
			renderFovTransition = nil,
			zoomInOutMeshTransitionFactors = nil,
			zoomDisabledTransitionTimer = 0,
			sightType = SightType.SightType_None,
			animationSettings = WeaponAnimationSettingsData.fromTable({
				kickbackFactor = 0.5,
				kickbackSpeedFactor = 1,
				weaponOffsetX = 0,
				weaponOffsetY = -0.306,
				weaponOffsetZ = 0,
				zoomOutSpeed = 1,
				zoomInSpeed = 1.5,
			}),
		}),
	})

	m_weapon.weaponModifierData[4].modifiers[2] = m_weapon_acog_zoomed

	--Aiming Simulation
	local m_weapon_acog_aimingController = m_weapon.weaponModifierData[4].modifiers[1] :: WeaponAimingSimulationModifier
	m_weapon_acog_aimingController.aimingController = aimingControllerSlow

	--Bullet 44Magnum
	local m_weapon_bullet = m_weapon.weaponFiring.primaryFire.shot.projectileData :: BulletEntityData
	local m_weapon_bullet_clone = m_weapon_bullet:clone()
	m_weapon_bullet_clone.materialPair.packed = 1290174464
	m_weapon_bullet_clone.gravity = -9.81

	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 30, y = 60 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 30, y = 50 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 52.5, y = 36 }))

	m_weapon.weaponFiring.primaryFire.shot.projectileData = m_weapon_bullet_clone

	--Rate of Fire
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFire = 149
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFireForBurst = 149
end

partitions.onAllInstancesLoaded(Taurus44, Taurus44.on_load, {
	partition = Guid("21E91507-2AF6-11E0-9848-9E9BC51DCED8"),
	instance = Guid("EAB58F8A-382F-529F-B8AA-D73E90BA15D0"),
}, {
	partition = Guid("E896678E-3BAE-47A5-8BD4-686156DB6643"),
	instance = Guid("06792888-AE09-49BA-8FD1-DC6992CDA1F4"),
})

return nil
