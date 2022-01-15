#> customguicore:blockgui/general/find_loop
# @within function customguicore:blockgui/general/find_changed_slot

## Load Data
    execute store result score $Slot.Block Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].Slot 1
    execute store result score $Slot.BlockGUI Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Items[0].Slot 1
    #execute store result score $isSlot Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Items[0].tag.BlockGUI.isSlot 1

## Push Back
    execute if score $Slot.Block Temporary = $Slot.BlockGUI Temporary run data modify storage customguicore: Callback.ChangedItems append from storage customguicore: Temp.Clone.Block.Items[0]

    execute if score $Slot.Block Temporary <= $Slot.BlockGUI Temporary run data remove storage customguicore: Temp.Clone.Block.Items[0]
    execute if score $Slot.Block Temporary >= $Slot.BlockGUI Temporary run data remove storage customguicore: Temp.Clone.BlockGUI.Items[0]

## Eject Loop
    execute if data storage customguicore: Temp.Clone.Block.Items[0] if data storage customguicore: Temp.Clone.BlockGUI.Items[0] run function customguicore:blockgui/general/find_loop