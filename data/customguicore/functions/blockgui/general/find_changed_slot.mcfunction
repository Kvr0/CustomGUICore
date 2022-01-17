#> customguicore:blockgui/general/find_changed_slot
# @within function customguicore:blockgui/general/_

## Reset
    data modify storage customguicore: Callback.BlockGUI.ChangedItems set value []
    data modify storage customguicore: Callback.BlockGUI.id set from storage customguicore: Temp.BlockGUI.id

## Clone Data
    data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
    data modify storage customguicore: Temp.Clone.BlockGUI.Items set from storage customguicore: Temp.BlockGUI.Parts


## Find Loop
    execute if data storage customguicore: Temp.Clone.Block.Items[0] if data storage customguicore: Temp.Clone.BlockGUI.Items[0] run function customguicore:blockgui/general/find_loop