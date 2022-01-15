#> customguicore:blockgui/general/count_block_parts
# @within function customguicore:blockgui/general/check_gui_change

    execute if data storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI run scoreboard players add $Block.Count Temporary 1
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/count_block_parts