#> customguicore:inventorygui/general/count_block_parts
# @within function customguicore:inventorygui/general/check_gui_change

    execute if data storage customguicore: Temp.Clone.Player.Items[0].tag.InventoryGUI run scoreboard players add $Player.Count Temporary 1
    data remove storage customguicore: Temp.Clone.Player.Items[0]

    execute if data storage customguicore: Temp.Clone.Player.Items[0] run function customguicore:inventorygui/general/count_block_parts