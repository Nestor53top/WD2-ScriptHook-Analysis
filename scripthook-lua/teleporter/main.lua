local script = Script()
-- loader
include("/loader.lua")
-- location data
include("/data.lua")

-- https://stackoverflow.com/a/2705804
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
  

function script:OnLoad()
    local menu = UI.SimpleMenu()
    menu:AddSearch("Search...")

    menu:SetTitle("Teleporter | Nickwasused")

    -- key: Category name e.g. Blume
    -- value: the data inside
    for key, value in pairsByKeys(DATA) do
        menu:AddButton(key, function()
            local tmp_menu = UI.SimpleMenu()
            tmp_menu:SetTitle(key)

            -- key2: The item name e.g. Blume CTOS Server Farm (Outside)
            -- value2: the data: lma layer, x, y, z, is_mission and description
            for key2, value2 in pairsByKeys(value) do
                local layer, x, y, z, is_mission, description = unpack(value2)

                local layer_lenght = tablelength(layer)

                if layer_lenght == 0 then
                    tmp_menu:AddButton(key2, description, function()
                        just_tp(x, y, z)
                    end)
                else
                    tmp_menu:AddButton(key2, description, function()
                        -- loop over the table and load all layers except for the last one
                        -- on the last layer wait for callback and then teleport
                        for key, tmp_layer in pairsByKeys(layer) do
                            if key == layer_lenght then
                                -- last layer
                                Script().tp_state:LoadLayer_and_tp(tmp_layer, x, y, z, is_mission)
                            else
                                -- not last layer
                                Script().tp_state:LoadLayer(tmp_layer)
                            end
                        end                        
                    end)
                end
            end
            return tmp_menu
        end)
	end

    ScriptHook.RegisterKeyHandler("menu", function()
        menu:Toggle()
    end)
end