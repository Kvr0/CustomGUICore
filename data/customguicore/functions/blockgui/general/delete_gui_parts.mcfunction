#> customguicore:blockgui/general/delete_gui_parts
# @within function customguicore:blockgui/general/restore_gui_parts

    execute unless data storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI run data modify storage customguicore: Temp.Block.Items append from storage customguicore: Temp.Clone.Block.Items[0]
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/delete_gui_parts