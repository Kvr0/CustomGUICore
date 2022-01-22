#> customguicore:blockgui/general/check_gui_change/check_loop
# @within function customguicore:blockgui/general/check_gui_change/_

## Get Block Data
    execute store result score $Block.Slot Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].Slot 1
    execute store result score $Block.isGUIPart Temporary if data storage customguicore: Temp.Clone.Block.Items[0].tag.BlockGUI

## Get BlockGUI Data
    execute store result score $BlockGUI.Slot Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Parts[0].Slot 1
    execute store result score $BlockGUI.isSlot Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Parts[0].BlockGUI.isSlot 1
    execute store result score $BlockGUI.isAir Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Parts[0].BlockGUI.isAir 1

## Check
    ## $Block.Slot < $BlockGUI.Slot
    ###                             => RestoreItem
    execute if score $Block.Slot Temporary < $BlockGUI.Slot Temporary run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.Block.Items[0]
    ### Step
    execute if score $Block.Slot Temporary < $BlockGUI.Slot Temporary run data remove storage customguicore: Temp.Clone.Block.Items[0]

    ## $Block.Slot = $BlockGUI.Slot
    ### If !isGUIPart               => ChangedItems
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary if score $Block.isGUIPart Temporary matches 0 run data modify storage customguicore: Callback.BlockGUI.ChangedItems append from storage customguicore: Temp.Clone.Block.Items[0]
    ### If !isSlot && !isGUIPart    => EjectItem
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary if score $BlockGUI.isSlot Temporary matches 0 if score $Block.isGUIPart Temporary matches 0 run data modify storage customguicore: Temp.EjectItems append from storage customguicore: Temp.Clone.Block.Items[0]
    ### If isSlot                   => RestoreItem
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary if score $BlockGUI.isSlot Temporary matches 1 run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.Block.Items[0]
    ### If !isSlot && !isAir        => RestoreItem
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary if score $BlockGUI.isSlot Temporary matches 0 if score $BlockGUI.isAir Temporary matches 0 run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.BlockGUI.Parts[0]
    ### Step
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary run data remove storage customguicore: Temp.Clone.Block.Items[0]
    execute if score $Block.Slot Temporary = $BlockGUI.Slot Temporary run data remove storage customguicore: Temp.Clone.BlockGUI.Parts[0]

    ## $Block.Slot > $BlockGUI.Slot
    ### If !isAir                   => ChangedItems
    execute if score $Block.Slot Temporary > $BlockGUI.Slot Temporary if score $BlockGUI.isAir Temporary matches 0 run data modify storage customguicore: Callback.BlockGUI.ChangedItems append value {Slot:0b, id:"air"}
    execute if score $Block.Slot Temporary > $BlockGUI.Slot Temporary if score $BlockGUI.isAir Temporary matches 0 store result storage customguicore: Callback.BlockGUI.ChangedItems[-1].Slot byte 1 run scoreboard players get $BlockGUI.Slot Temporary
    ### If !isAir                   => RestoreItem
    execute if score $Block.Slot Temporary > $BlockGUI.Slot Temporary if score $BlockGUI.isAir Temporary matches 0 run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.BlockGUI.Parts[0]
    ### Step
    execute if score $Block.Slot Temporary > $BlockGUI.Slot Temporary run data remove storage customguicore: Temp.Clone.BlockGUI.Parts[0]

## Loop
    execute if data storage customguicore: Temp.Clone.Block.Items[0] if data storage customguicore: Temp.Clone.BlockGUI.Parts[0] run function customguicore:blockgui/general/check_gui_change/check_loop