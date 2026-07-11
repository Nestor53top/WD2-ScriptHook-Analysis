# WD2 ScriptHook API Analysis

## Exported Functions (from core.dll strings analysis)

### Core ScriptHook Functions

| Function | Description |
|----------|-------------|
| `RegisterCommand` | Register a Lua command |
| `ShowNotification` | Show in-game notification |
| `SetProgression` | Set cash/followers (0=cash, 3=followers) |
| `SetFollowersCount` | Set follower count |
| `ResetProgression` | Reset all progression |

### Player Functions

| Function | Description |
|----------|-------------|
| `GetLocalPlayerEntityId` | Get local player entity ID |
| `GetCurrentVehicleEntityId` | Get vehicle player is in |
| `ActivateInvincibility` | Enable god mode |
| `RemoveInvincibility` | Disable god mode |
| `SetPawnImmuneToDeath` | Set immune to death |
| `SetPawnArmor` | Set player armor |
| `GetEntityPosition` | Get entity position (axis 0-2) |
| `GetEntityAngle` | Get entity rotation |
| `GetEntityName` | Get entity name |
| `GetCurrentHealth` | Get entity health |
| `KillEntity` | Kill entity |
| `SendDamageToEntity` | Send damage to entity |
| `SetLocalPlayerNoclip` | Toggle noclip |
| `HasLocalPlayerNoclip` | Check noclip state |
| `HasLocalPlayerFreeCamera` | Check free camera state |
| `GetPlayerPosition` | Get player position |

### Vehicle Functions

| Function | Description |
|----------|-------------|
| `SpawnEntityFromArchetype` | Spawn vehicle by archetype |
| `SpawnEntityFromArchetypeHash` | Spawn vehicle by hash |
| `SetVehicleLockState` | Lock/unlock vehicle |
| `RepairVehicle` | Repair vehicle |
| `ExplodeVehicle` | Explode vehicle |
| `EnableVehicleEngine` | Toggle engine |
| `EnableVehicleSiren` | Toggle siren |
| `SetVehicleLicensePlateText` | Set license plate |
| `SetVehicleLightBehaviorFlag` | Control vehicle lights |
| `EnableVehicleEmergencyLight` | Toggle emergency lights |
| `EnableVehicleSpotLight` | Toggle spotlights |
| `EnableVehicleIndicator` | Toggle indicators |
| `EnableVehicleConvenienceLight` | Toggle convenience light |
| `GetVehiclePartCount` | Get vehicle part count |
| `GetVehiclePartHash` | Get vehicle part hash |
| `SetVehiclePartPosition` | Set vehicle part position |
| `PutPlayerInVehicleDelayed` | Warp into vehicle with delay |
| `ReserveAndUseSeat` | Reserve vehicle seat |
| `UnassignVehicleSeat` | Unassign vehicle seat |
| `ForceVehicleAlaram` | Trigger car alarm |

### Camera Functions

| Function | Description |
|----------|-------------|
| `CameraSetCustom` | Set custom camera position/rotation |
| `CameraReset` | Reset camera to default |

### World Functions

| Function | Description |
|----------|-------------|
| `Teleport` | Teleport player |
| `GetReticleHitLocation` | Get aim position |
| `GetReticleHitEntity` | Get aimed entity |
| `GetEntitiesInRange` | Get entities in range |
| `GetAllEntities` | Get all entities |
| `GetEntitiesWithComponent` | Get entities with component |
| `EntityHasComponent` | Check entity component |
| `GetEntityComponents` | Get entity components |
| `GetEntityClassName` | Get entity class name |
| `GetArchetypeHashByEntityId` | Get archetype hash |
| `GetGraphicKitModelByEntityId` | Get graphic kit model |
| `GetGlobalTrafficLightState` | Get traffic light state |

### Time/Weather Functions

| Function | Description |
|----------|-------------|
| `SetTimeOfDayHourAndMinute` | Set time |
| `GetTimeOfDayMinute` | Get current minute |
| `SetTimeScale` | Set game speed |
| `PushEnvironmentWeatherOverride` | Set weather |

### Progression/Items Functions

| Function | Description |
|----------|-------------|
| `ExecuteReward_V2` | Execute reward |
| `AddReputationPoints` | Add reputation |
| `SetItem` | Set item count |
| `RemoveItem` | Remove item |
| `GetLocalPlayerResearchComponent` | Get research component |
| `AddPerkWithDbObjToPlayer` | Add perk |
| `DisplayReputationBar` | Display reputation |
| `ReputationToString` | Convert reputation to string |

### Felony/Squad Functions

| Function | Description |
|----------|-------------|
| `FelonyStartChase` | Start felony chase |
| `FelonyEndChaseOrSearch` | End felony chase/search |
| `ClearHeatLevel` | Clear heat level |
| `SquadTryToCreateTargetedSearch_v3` | Create targeted search |
| `SquadTryToCreateUntargetedSearch_v2` | Create untargeted search |
| `SquadTryToCreateCombat` | Create combat |
| `SquadForceVanish` | Force squad vanish |
| `SetSquadRelationship` | Set squad relationship |
| `SetSquadSupportWanderState` | Set wander state |

### Hacking/Interaction Functions

| Function | Description |
|----------|-------------|
| `ForceHackIngredient` | Force hack |
| `UseSelectedIngredient` | Use ingredient |
| `ForceCompleteInteraction` | Force interaction complete |

### UI Functions

| Function | Description |
|----------|-------------|
| `AddArgument` | Add command argument |
| `AddButton` | Add menu button |
| `AddCheckbox` | Add checkbox |
| `AddSearch` | Add search bar |
| `SendShowOrHideAllUIEvent` | Toggle HUD |

### Game Functions

| Function | Description |
|----------|-------------|
| `SaveTheGame` | Save game |
| `GameOver` | Game over/reload |
| `AbortMission_v2` | Abort mission |
| `MissionEnded` | Mission ended |
| `StartPostFxOnPlayer` | Start post-FX effect |
| `AddInventoryItem` | Add inventory item |

### CDominoManager Functions

| Function | Description |
|----------|-------------|
| `CDominoManager_GetInstance` | Get CDomino manager |
| `SendRegisteredEventToEntity` | Send event to entity |
| `CDominoDelayManager_GetInstance` | Get delay manager |
| `CreateDelay` | Create delay |
| `RemoveDelay` | Remove delay |
| `GetDelay` | Get delay time |
| `SendCommand` | Send delay command |

### Sound Functions

| Function | Description |
|----------|-------------|
| `CDominoSoundManager_GetInstance` | Get sound manager |
| `PlaySound` | Play sound |

### Lua VM Functions (internal)

| Function | Description |
|----------|-------------|
| `lua_main` | Lua main entry |
| `lua_run` | Run Lua code |
| `lua_reload` | Reload Lua |
| `lua_dumpstack` | Dump Lua stack |

## Global Variables

| Variable | Description |
|----------|-------------|
| `Globals.FREEROAM.Trainer_InfiniteAmmo` | Infinite ammo toggle |
| `Globals.FREEROAM.Trainer_InfiniteBattery` | Infinite battery toggle |
| `Globals.FREEROAM.RegenState` | Regen state |
| `Globals.FREEROAM.Busted` | Busted state |

## Lua Extensions

| Module | Functions |
|--------|-----------|
| `timer` | Create, Simple, Get, Remove, RemoveIfExists |
| `util` | Type, GetKeyName, GetKeyCodeFromString, Implement, CopyTable, PrintTable |
| `UI` | SimpleMenu, SimpleTextInput |
| `ScriptHook` | All above functions |
| `Script` | CurrentScript, CacheMenu, OnLoad, OnUpdate, OnRender, OnUnload |

## Vehicle Archetypes (from VehicleArchetype.lua)

See `data/lua/game/VehicleArchetype.lua` for full list of spawnable vehicles.

## Weather IDs (from WeatherIds.lua)

See `data/lua/game/WeatherIds.lua` for all weather types.

## Felony Types (from FelonyTypes.lua)

| ID | Faction |
|----|---------|
| 0 | Police |
| 1 | FBI |
| 3 | Prime Eight |
| 6 | Tezcas |
| 9 | Auntie Shu Boys |
| 10 | 580s |
| 11 | Umeni Zulu |
| 12 | Bratva |
| 15 | Sons Of Ragnarok |

## Weapon IDs (from WeaponIds.lua)

See `data/lua/game/WeaponIds.lua` for all weapons.

## Item IDs (from Items.lua)

| Item | ID |
|------|-----|
| Research Point | `Items.9223372048352280892` |
| Ammo Refill | `Items.9223372048779332208` |
| Botnet Recharge | `Items.13654314691341285506` |
| Health Boost | `Items.11905948399914855160` |
| Reputation Item | `Items.12381395094839334792` |
