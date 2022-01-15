#> customguicore:blockgui/general/check_gui_change
# @within function customguicore:blockgui/general/_

scoreboard players set $GUIChanged Temporary 0

## Check Item Count
### Count Block Parts
    scoreboard players set $Block.Count Temporary 0
    data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/count_block_parts

### Count BlockGUI Parts
    scoreboard players set $BlockGUI.Count Temporary 0
    data modify storage customguicore: Temp.Clone.BlockGUI.Items set from storage customguicore: Temp.BlockGUI.Parts
    execute if data storage customguicore: Temp.Clone.BlockGUI.Items[0] run function customguicore:blockgui/general/count_blockgui_parts

### Compare Parts Count
    execute unless score $Block.Count Temporary = $BlockGUI.Count Temporary run scoreboard players add $GUIChanged Temporary 1

scoreboard players get $GUIChanged Temporary