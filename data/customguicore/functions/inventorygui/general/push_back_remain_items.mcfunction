#> customguicore:inventorygui/general/push_back_remain_items
# @within function customguicore:inventorygui/general/eject_out_of_slot_items

    data modify storage customguicore: Temp.Block.Items append from storage customguicore: Temp.Clone.Block.Items[0]
    data remove storage customguicore: Temp.Clone.Block.Items[0]

    execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:inventorygui/general/push_back_remain_items