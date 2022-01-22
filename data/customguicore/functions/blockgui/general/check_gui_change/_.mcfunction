#> customguicore:blockgui/general/check_gui_change/_
# @within function customguicore:blockgui/general/_

# Callback.BlockGUI.ChangedItems
# Temp.RestoreItems
# Temp.EjectItems

## Changed Flag
    scoreboard players set $GUIChanged Temporary 0

## Clone Values
    data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
    data modify storage customguicore: Temp.Clone.BlockGUI.Parts set from storage customguicore: Temp.BlockGUI.Parts

## Reset Buffers
    data modify storage customguicore: Callback.BlockGUI.ChangedItems set value []
    data modify storage customguicore: Temp.RestoreItems set value []
    data modify storage customguicore: Temp.EjectItems set value []

## Check Loop
    execute if data storage customguicore: Temp.Clone.Block.Items[0] if data storage customguicore: Temp.Clone.BlockGUI.Parts[0] run function customguicore:blockgui/general/check_gui_change/check_loop

## Push Remaining
    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/check_gui_change/push_block_remaining
    execute if data storage customguicore: Temp.Clone.BlockGUI.Parts[0] run function customguicore:blockgui/general/check_gui_change/push_blockgui_remaining

## Changed Flag
    execute store result score $GUIChanged Temporary if data storage customguicore: Callback.BlockGUI.ChangedItems[]
