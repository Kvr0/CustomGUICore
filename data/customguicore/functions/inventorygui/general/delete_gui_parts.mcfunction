#> customguicore:inventorygui/general/delete_gui_parts
# @within function customguicore:inventorygui/general/restore_gui_parts

    execute unless data storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI run data modify storage customguicore: Temp.Block.Items append from storage customguicore: Temp.Clone.Block.Items[0]
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:inventorygui/general/delete_gui_parts