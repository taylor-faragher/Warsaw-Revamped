--!strict

local partitions = require("./partitions")

local M93R_ = {}
M93R_.__index = M93R_
local M93R = M93R_

function M93R:on_load(weapon: SoldierWeaponBlueprint)
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

	--1.00x Zoom & 90% ADS Move Speed
	local Zoom1x_Speed90 = m_weapon.aimingController.zoomLevels[2]:clone()
	Zoom1x_Speed90.fieldOfView = 54.5

	Zoom1x_Speed90.lookSpeedMultiplier = 0.9909
	Zoom1x_Speed90.moveSpeedMultiplier = 0.9

	Zoom1x_Speed90.supportedSwayPitchMagnitude = 0
	Zoom1x_Speed90.supportedSwayYawMagnitude = 0

	Zoom1x_Speed90.suppressedSwayPitchMagnitude = 0
	Zoom1x_Speed90.suppressedSwayYawMagnitude = 0
	Zoom1x_Speed90.suppressedSwayMinFactor = 0

	aimingControllerDefault.zoomLevels[2] = Zoom1x_Speed90

	--IRON SIGHTS [1X]
	--Unzoomed
	local m_weapon_irons = m_weapon.zoomLevels[1] :: WeaponZoomLevelData
	m_weapon_irons.animationSettings.weaponOffsetX = -0.019
	m_weapon_irons.animationSettings.weaponOffsetY = 0.013
	m_weapon_irons.animationSettings.zoomOutSpeed = 1.5

	--Zoomed
	local m_weapon_irons_zoomed = m_weapon.zoomLevels[2] :: WeaponZoomLevelData
	m_weapon_irons_zoomed.renderFov = 45
	m_weapon_irons_zoomed.animationSettings.weaponOffsetX = -0.019
	m_weapon_irons_zoomed.animationSettings.weaponOffsetY = 0.013
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
				weaponOffsetX = -0.019,
				weaponOffsetY = -0.12,
				weaponOffsetZ = 0,
				zoomOutSpeed = 1.5,
				zoomInSpeed = 1,
			}),
		}),
	})

	if m_weapon.weaponModifierData[2].modifiers:len() < 2 then
		m_weapon.weaponModifierData[2].modifiers:push(m_weapon_rmr)
	end

	--Zoomed
	local m_weapon_rmr_zoomed = m_weapon.weaponModifierData[2].modifiers[1] :: WeaponZoomLevelModifier
	m_weapon_rmr_zoomed.weaponZoomLevel.renderFov = 40
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = -0.019
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.8
	m_weapon_rmr_zoomed.zoomLevel = Zoom1x_Speed90

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
				weaponOffsetX = -0.019,
				weaponOffsetY = -0.145,
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
	m_weapon_delta_zoomed.weaponZoomLevel.renderFov = 40
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = -0.019
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.8
	m_weapon_delta_zoomed.zoomLevel = Zoom1x_Speed90

	--Bullet 9x19mm_BurstPistol
	local m_weapon_bullet = m_weapon.weaponFiring.primaryFire.shot.projectileData :: BulletEntityData
	local m_weapon_bullet_default = m_weapon_bullet:clone()
	m_weapon_bullet_default.gravity = -9.81

	m_weapon_bullet_default.damageCurve:push(Vec2.fromTable({ x = 15, y = 22 }))
	m_weapon_bullet_default.damageCurve:push(Vec2.fromTable({ x = 15, y = 20 }))
	m_weapon_bullet_default.damageCurve:push(Vec2.fromTable({ x = 22.5, y = 16.67 }))
	m_weapon_bullet_default.damageCurve:push(Vec2.fromTable({ x = 30.92, y = 14 }))

	m_weapon.weaponFiring.primaryFire.shot.projectileData = m_weapon_bullet_default

	--adds Burst Delay
	m_weapon.weaponFiring.primaryFire.fireLogic.delayBetweenBursts = 0.033

	--removes Suppressor's downsides
	if m_weapon.weaponModifierData[5].modifiers:len() == 4 then
		m_weapon.weaponModifierData[5].modifiers:remove(3)
	end
end

partitions.onAllInstancesLoaded(M93R, M93R.on_load, {
	partition = Guid("06374F08-F23B-11DF-A182-B47F2E879897"),
	instance = Guid("95EB502E-D5F7-5793-A108-5EC4E77802DA"),
})

return nil
