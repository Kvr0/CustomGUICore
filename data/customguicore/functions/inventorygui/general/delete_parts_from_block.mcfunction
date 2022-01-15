#> customguicore:inventorygui/general/delete_parts_from_block
# @within function customguicore:inventorygui/general/_

## Delete Parts
    data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
    data modify storage customguicore: Temp.Block.Items set value []
    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:inventorygui/general/delete_gui_parts

