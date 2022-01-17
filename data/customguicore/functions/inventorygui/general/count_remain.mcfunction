#> customguicore:inventorygui/general/count_remain
# @within function customguicore:inventorygui/general/check_gui_change

    scoreboard players add $InventoryGUI.Count Temporary 1
    data remove storage customguicore: Temp.Clone.InventoryGUI.Items[0]

    execute if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/count_remain