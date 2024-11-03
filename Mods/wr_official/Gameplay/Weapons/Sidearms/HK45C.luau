--!strict

local partitions = require("./partitions")

local HK45C_ = {}
HK45C_.__index = HK45C_
local HK45C = HK45C_

function HK45C:on_load(weapon: SoldierWeaponBlueprint)
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
	--FirstPersonCamera
	local m_weapon_firstPersonCamera_clone = m_weapon.firstPersonCamera:clone()
	m_weapon_firstPersonCamera_clone.rotation.x = -0.0035
	m_weapon.firstPersonCamera = m_weapon_firstPersonCamera_clone

	--Unzoomed
	local m_weapon_irons = m_weapon.zoomLevels[1] :: WeaponZoomLevelData
	m_weapon_irons.animationSettings.zoomOutSpeed = 1.5

	--Zoomed
	local m_weapon_irons_zoomed = m_weapon.zoomLevels[2] :: WeaponZoomLevelData
	m_weapon_irons_zoomed.renderFov = 45
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
				weaponOffsetY = -0.125,
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
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = 0
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.weaponOffsetY = -0.125
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
				weaponOffsetX = 0,
				weaponOffsetY = -0.138,
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
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.weaponOffsetX = 0
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.weaponOffsetY = -0.138
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.8
	m_weapon_delta_zoomed.zoomLevel = Zoom1x_Speed90

	--Bullet 45Cal_Pistol
	local m_weapon_bullet = m_weapon.weaponFiring.primaryFire.shot.projectileData :: BulletEntityData
	local m_weapon_bullet_clone = m_weapon_bullet:clone()
	m_weapon_bullet_clone.gravity = -9.81

	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 15, y = 36 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 15, y = 33.34 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 22.5, y = 25 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 33, y = 18 }))

	m_weapon.weaponFiring.primaryFire.shot.projectileData = m_weapon_bullet_clone

	--Rate of Fire
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFire = 327
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFireForBurst = 327

	--removes Suppressor's downsides
	if m_weapon.weaponModifierData[5].modifiers:len() == 4 then
		m_weapon.weaponModifierData[5].modifiers:remove(3)
	end
end

partitions.onAllInstancesLoaded(HK45C, HK45C.on_load, {
	partition = Guid("585B09D4-E572-4831-90C5-D300B08AF44E"),
	instance = Guid("6C06F364-2FC5-448D-9CB2-DA135A7F5FC6"),
})

return nil
