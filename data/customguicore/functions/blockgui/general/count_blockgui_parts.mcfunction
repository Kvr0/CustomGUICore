#> customguicore:blockgui/general/count_blockgui_parts
# @within function customguicore:blockgui/general/check_gui_change

    execute if data storage customguicore: Temp.Clone.BlockGUI.Items[0].tag.BlockGUI run scoreboard players add $BlockGUI.Count Temporary 1
    data remove storage customguicore: Temp.Clone.BlockGUI.Items[0]

    execute if data storage customguicore: Temp.Clone.BlockGUI.Items[0] run function customguicore:blockgui/general/count_blockgui_parts