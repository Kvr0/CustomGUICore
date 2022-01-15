#> customguicore:inventorygui/general/_
# @within function customguicore:inventorygui/private/main

## Load Data
    function #oh_my_dat:plaese
    data modify storage customguicore: Temp.Block.Items set value []
    data modify storage customguicore: Temp.Block.Items set from block ~ ~ ~ Items
    data modify storage customguicore: Temp.BlockGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI

## Check BlockGUI Initialized
    execute store result score $Initialized Temporary if data storage customguicore: Temp.BlockGUI.Initialized

## Initialize BlockGUI
    execute unless score $Initialized Temporary matches 1 run function #customguicore:inventorygui/init
    execute unless score $Initialized Temporary matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI.Initialized set value 1b

## Check Block Destroy
    execute store result score $BlockDestroy Temporary unless block ~ ~ ~ #api:container

## Invoke End Callback
    execute if score $BlockDestroy Temporary matches 1 run function #customguicore:inventorygui/end

## Kill BlockGUI Base Entity
    execute if score $BlockDestroy Temporary matches 1 run kill @s

## Check GUI Change
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:inventorygui/general/check_gui_change

## Delete Parts From Block
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:inventorygui/general/delete_parts_from_block

## Find Changed Slot
    execute unless score $BlockDestroy Temporary matches 1 if score $GUIChanged Temporary matches 1.. run function customguicore:inventorygui/general/find_changed_slot

## Invoke Changed Callback
    execute unless score $BlockDestroy Temporary matches 1 if score $GUIChanged Temporary matches 1.. run function #customguicore:inventorygui/changed
### GUIデータを更新
    execute unless score $BlockDestroy Temporary matches 1 run data modify storage customguicore: Temp.BlockGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI

## Eject Out of slot Items
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:inventorygui/general/eject_out_of_slot_items

## Restore GUI Parts
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:inventorygui/general/restore_gui_parts

## Reset Temp
    scoreboard players reset * Temporary
    data remove storage customguicore: Temp