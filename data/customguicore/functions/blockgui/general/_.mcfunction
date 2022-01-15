#> customguicore:blockgui/general/_
# @within function customguicore:blockgui/private/main

## Load Data
    function #oh_my_dat:plaese
    data modify storage customguicore: Temp.Block.Items set value []
    data modify storage customguicore: Temp.Block.Items set from block ~ ~ ~ Items
    data modify storage customguicore: Temp.BlockGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI

## Check BlockGUI Initialized
    execute store result score $Initialized Temporary if data storage customguicore: Temp.BlockGUI.Initialized

## Initialize BlockGUI
    execute unless score $Initialized Temporary matches 1 run function #customguicore:blockgui/init
    execute unless score $Initialized Temporary matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI.Initialized set value 1b

## Check Block Destroy
    execute store result score $BlockDestroy Temporary unless block ~ ~ ~ barrel

## Invoke End Callback
    execute if score $BlockDestroy Temporary matches 1 run function #customguicore:blockgui/end

## Kill BlockGUI Base Entity
    execute if score $BlockDestroy Temporary matches 1 run kill @s

## Check GUI Change
    execute store result score $GUIChanged Temporary run function customguicore:blockgui/general/check_gui_change

## Invoke Changed Callback
    execute if score $GUIChanged Temporary matches 1.. run function #customguicore:blockgui/changed
### GUIデータを更新
    data modify storage customguicore: Temp.BlockGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI

## Delete Parts From Block
    function customguicore:blockgui/general/delete_parts_from_block

## Eject Out of slot Items
    function customguicore:blockgui/general/eject_out_of_slot_items

## Restore GUI Parts
    function customguicore:blockgui/general/restore_gui_parts

## Delete Parts Outside GUI
    function customguicore:blockgui/general/delete_parts_outside_gui

## Reset Temp
    scoreboard players reset * Temporary
    data remove storage customguicore: Temp