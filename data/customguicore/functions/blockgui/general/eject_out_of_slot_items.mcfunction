#> customguicore:blockgui/general/eject_out_of_slot_items
# @within function customguicore:blockgui/general/_

## Clone Data
    data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
    data modify storage customguicore: Temp.Clone.BlockGUI.Items set from storage customguicore: Temp.BlockGUI.Parts

## Reset
    data modify storage customguicore: Temp.Block.Items set value []

## Eject Loop
    execute if data storage customguicore: Temp.Clone.Block.Items[0] if data storage customguicore: Temp.Clone.BlockGUI.Items[0] run function customguicore:blockgui/general/eject_loop

## Push Back Remain
    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/push_back_remain_items
