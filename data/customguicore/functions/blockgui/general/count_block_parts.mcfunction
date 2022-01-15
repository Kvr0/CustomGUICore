#> customguicore:blockgui/general/count_block_parts
# @within function customguicore:blockgui/general/check_gui_change

    execute store result score $isSlot Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI.isSlot
    execute if data storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI unless score $isSlot Temporary matches 1 run scoreboard players add $Block.Count Temporary 1
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/count_block_parts