#> customguicore:blockgui/general/check_gui_change/push_block_remaining
# @within function customguicore:blockgui/general/check_gui_change/_

    ## Get Block Data
        execute store result score $Block.Slot Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].Slot 1

    ###                             => RestoreItem
    data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.Block.Items[0]
    ### Step
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/general/check_gui_change/push_block_remaining