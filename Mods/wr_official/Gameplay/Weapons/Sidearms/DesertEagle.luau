--!strict

local partitions = require("./partitions")

local DesertEagle_ = {}
DesertEagle_.__index = DesertEagle_
local DesertEagle = DesertEagle_

function DesertEagle:on_load(weapon: SoldierWeaponBlueprint)
	local m_weapon = weapon.object :: SoldierWeaponData

	--Sprint-to-Fire Delay
	m_weapon.weaponFiring.sprintRecoverTimeOverride = 0.133

	--Aiming Simulation
	local aimingControllerDefault = m_weapon.aimingController:clone()

	--hipfire to ADS
	aimingControllerDefault.zoomTransitionTimeArray[1].fovTransitionTime = 0.2
	--ADS to hipfire
	aimingControllerDefault.zoomTransitionTimeArray[2].fovTransitionTime = 0.2

	m_weapon.aimingController = aimingControllerDefault

	--1.00x Zoom & 80% ADS Move Speed
	local Zoom1x_Speed80 = m_weapon.aimingController.zoomLevels[2]:clone()
	Zoom1x_Speed80.fieldOfView = 54.5

	Zoom1x_Speed80.lookSpeedMultiplier = 0.9909
	Zoom1x_Speed80.moveSpeedMultiplier = 0.8

	Zoom1x_Speed80.supportedSwayPitchMagnitude = 0
	Zoom1x_Speed80.supportedSwayYawMagnitude = 0

	Zoom1x_Speed80.suppressedSwayPitchMagnitude = 0
	Zoom1x_Speed80.suppressedSwayYawMagnitude = 0
	Zoom1x_Speed80.suppressedSwayMinFactor = 0

	aimingControllerDefault.zoomLevels[2] = Zoom1x_Speed80

	--IRON SIGHTS [1X]
	--Unzoomed
	local m_weapon_irons = m_weapon.zoomLevels[1] :: WeaponZoomLevelData
	m_weapon_irons.animationSettings.zoomOutSpeed = 1.5

	--Zoomed
	local m_weapon_irons_zoomed = m_weapon.zoomLevels[2] :: WeaponZoomLevelData
	m_weapon_irons_zoomed.renderFov = 35
	m_weapon_irons_zoomed.animationSettings.weaponOffsetY = 0.001
	m_weapon_irons_zoomed.animationSettings.zoomInSpeed = 1.5

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
				weaponOffsetY = -0.105,
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
	m_weapon_rmr_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.5
	m_weapon_rmr_zoomed.zoomLevel = Zoom1x_Speed80

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
				weaponOffsetY = -0.119,
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
	m_weapon_delta_zoomed.weaponZoomLevel.animationSettings.zoomInSpeed = 1.5
	m_weapon_delta_zoomed.zoomLevel = Zoom1x_Speed80

	--Bullet 44Magnum_Auto
	local m_weapon_bullet = m_weapon.weaponFiring.primaryFire.shot.projectileData :: BulletEntityData
	local m_weapon_bullet_clone = m_weapon_bullet:clone()
	m_weapon_bullet_clone.materialPair.packed = 1290174464
	m_weapon_bullet_clone.gravity = -9.81

	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 22.5, y = 60 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 22.5, y = 50 }))
	m_weapon_bullet_clone.damageCurve:push(Vec2.fromTable({ x = 37.5, y = 36 }))

	m_weapon.weaponFiring.primaryFire.shot.projectileData = m_weapon_bullet_clone

	--Rate of Fire
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFire = 199
	m_weapon.weaponFiring.primaryFire.fireLogic.rateOfFireForBurst = 199

	--removes Suppressor's downsides
	if m_weapon.weaponModifierData[5].modifiers:len() == 4 then
		m_weapon.weaponModifierData[5].modifiers:remove(3)
	end
end

partitions.onAllInstancesLoaded(DesertEagle, DesertEagle.on_load, {
	partition = Guid("67E9B789-2756-42D3-A7A8-A2709FA4B0F2"),
	instance = Guid("773AEA0A-3426-4CA2-9511-B2CEAC540F82"),
})

return nil
