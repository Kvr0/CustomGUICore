#> customguicore:inventorygui/general/push_remain_gui_parts
# @within function customguicore:inventorygui/general/restore_gui_parts

    data modify storage customguicore: Temp.InventoryGUI.Parts append from storage customguicore: Temp.Clone.InventoryGUI.Items[0]
    data remove storage customguicore: Temp.Clone.InventoryGUI.Items[0]

    execute if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/push_remain_gui_parts