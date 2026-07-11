-- Commands
include("commands.lua")

-- Menu
include("menu/menu.lua")

-- Player
include("player/StateWatcher.lua")

local script = Script()
script.Entities = {}

function script:OnLoad()
	print("Script trainer main loaded!")
end

function script:OnUpdate()
    self.StateWatcher:OnUpdate()
end

function script:OnRender()
	--
end

function script:InitCallbacks()
    self.StateWatcher:Init()
end

function script:OnUnload()
    self.StateWatcher:Shutdown()

    for _,v in pairs(self.Entities) do
        RemoveEntity(v)
    end
end