#> customguicore:blockgui/general/check_gui_change/push_blockgui_remaining
# @within function customguicore:blockgui/general/check_gui_change/_

    ## Get BlockGUI Data
    execute store result score $BlockGUI.Slot Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Parts[0].Slot 1
    execute store result score $BlockGUI.isAir Temporary run data get storage customguicore: Temp.Clone.BlockGUI.Parts[0].BlockGUI.isAir 1

    ###                             => ChangedItems
    execute if score $BlockGUI.isAir Temporary matches 0 run data modify storage customguicore: Callback.ChangedItems append value {Slot:0b, id:"air"}
    execute if score $BlockGUI.isAir Temporary matches 0 store result storage customguicore: Callback.ChangedItems[-1].Slot byte 1 run scoreboard players get $BlockGUI.Slot Temporary
    ###                             => RestoreItem
    execute if score $BlockGUI.isAir Temporary matches 0 run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.BlockGUI.Parts[0]
    ### Step
    data remove storage customguicore: Temp.Clone.BlockGUI.Parts[0]

    execute if data storage customguicore: Temp.Clone.BlockGUI.Parts[0] run function customguicore:blockgui/general/check_gui_change/push_blockgui_remaining