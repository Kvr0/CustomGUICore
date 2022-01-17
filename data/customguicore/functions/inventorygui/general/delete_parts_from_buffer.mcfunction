#> customguicore:inventorygui/general/delete_parts_from_buffer
# @within function customguicore:inventorygui/general/_

## Delete Parts
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
    data modify storage customguicore: Temp.Player.Items set value []
    execute if data storage customguicore: Temp.Clone.Player.Items[0] run function customguicore:inventorygui/general/delete_gui_parts
