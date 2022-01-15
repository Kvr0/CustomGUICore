#> customguicore:inventorygui/general/_
# @within function customguicore:inventorygui/private/main

## Load Data
    function #oh_my_dat:plaese
    data modify storage customguicore: Temp.Player.Items set value []
    data modify storage customguicore: Temp.Player.Items set from entity @s Inventory
    data modify storage customguicore: Temp.InventoryGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].InventoryGUI

## Check InventoryGUI Initialized
    execute store result score $Initialized Temporary if data storage customguicore: Temp.InventoryGUI.Initialized

## Initialize InventoryGUI
    execute unless score $Initialized Temporary matches 1 run function #customguicore:inventorygui/init
    execute unless score $Initialized Temporary matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].InventoryGUI.Initialized set value 1b

## Check End
    execute store result score $End Temporary run data get storage customguicore: Temp.InventoryGUI.isEnd 1

## Invoke End Callback
    execute if score $End Temporary matches 1 run function #customguicore:inventorygui/end

## Check GUI Change
    execute unless score $End Temporary matches 1 run function customguicore:inventorygui/general/check_gui_change

## Delete Parts From Buffer
    execute unless score $End Temporary matches 1 run function customguicore:inventorygui/general/delete_parts_from_buffer

## Find Changed Slot
    execute unless score $End Temporary matches 1 if score $GUIChanged Temporary matches 1.. run function customguicore:inventorygui/general/find_changed_slot

## Eject Out of slot Items
    execute unless score $End Temporary matches 1 run function customguicore:inventorygui/general/eject_out_of_slot_items

## Invoke Changed Callback
    execute unless score $End Temporary matches 1 if score $GUIChanged Temporary matches 1.. run function #customguicore:inventorygui/changed
### GUIデータを更新
    execute unless score $End Temporary matches 1 run data modify storage customguicore: Temp.InventoryGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].InventoryGUI

## Delete Player Inventory GUI Parts
    execute unless score $End Temporary matches 1 if score $GUIChanged Temporary matches 1.. run clear @a #api:all_item{InventoryGUI:{}}

## Restore GUI Parts
    execute unless score $End Temporary matches 1 run function customguicore:inventorygui/general/restore_gui_parts

## Reset Temp
    scoreboard players reset * Temporary
    data remove storage customguicore: Temp