#> customguicore:inventorygui/general/check_gui_change
# @within function customguicore:inventorygui/general/_

scoreboard players set $GUIChanged Temporary 0

## Check Item Count
### Count Block Parts
    scoreboard players set $Player.Count Temporary 0
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
    execute if data storage customguicore: Temp.Clone.Player.Items[0] run function customguicore:inventorygui/general/count_block_parts

### Count BlockGUI Parts
    scoreboard players set $InventoryGUI.Count Temporary 0
    scoreboard players set $InventoryGUI.FilledSlot.Count Temporary 0
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
    data modify storage customguicore: Temp.Clone.InventoryGUI.Items set from storage customguicore: Temp.InventoryGUI.Parts
    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/count_blockgui_parts
    execute if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/count_remain
    scoreboard players operation $InventoryGUI.Count Temporary -= $InventoryGUI.FilledSlot.Count Temporary

### Compare Parts Count
    execute store result score $PlayerCount.Last Temporary run data get storage customguicore: Temp.InventoryGUI.LastPlayerCount 1
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].InventoryGUI.LastPlayerCount int 1 run scoreboard players get $Player.Count Temporary
    execute unless score $Player.Count Temporary = $InventoryGUI.Count Temporary run scoreboard players add $GUIChanged Temporary 1
    execute unless score $Player.Count Temporary = $PlayerCount.Last Temporary run scoreboard players add $GUIChanged Temporary 1
    execute unless score $InventoryGUI.Count Temporary = $PlayerCount.Last Temporary run scoreboard players add $GUIChanged Temporary 1
