#> customguicore:blockgui/general/_
# @within function customguicore:blockgui/private/main

## Load Data
    function #oh_my_dat:plaese
    data modify storage customguicore: Temp.Block.Items set from block ~ ~ ~ Items
    data modify storage customguicore: Temp.BlockGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI

##BlockGUI Initialize
    ## Check BlockGUI Initialized
        execute store result score $Initialized Temporary if data storage customguicore: Temp.BlockGUI.Initialized

    ## Initialize BlockGUI
        execute unless score $Initialized Temporary matches 1 run function #customguicore:blockgui/init
        execute unless score $Initialized Temporary matches 1 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI.Initialized set value 1b

## Block Destroy
    ## Check Block Destroy
        execute store result score $BlockDestroy Temporary unless block ~ ~ ~ #api:container

    ## Invoke End Callback
        execute if score $BlockDestroy Temporary matches 1 run function #customguicore:blockgui/end

    ## Kill BlockGUI Base Entity
        execute if score $BlockDestroy Temporary matches 1 run kill @s

## Check GUI Change
# Callback.BlockGUI.ChangedItems
# Temp.RestoreItems
# Temp.EjectItems
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:blockgui/general/check_gui_change/_

## Invoke Changed Callback
    execute unless score $BlockDestroy Temporary matches 1 if score $GUIChanged Temporary matches 1.. run function #customguicore:blockgui/changed

## Eject Out of slot Items
    execute unless score $BlockDestroy Temporary matches 1 run function customguicore:blockgui/general/eject_items

## Restore GUI Parts
    execute unless score $BlockDestroy Temporary matches 1 run data modify block ~ ~ ~ Items set from storage customguicore: Temp.RestoreItems

## Reset Temp
    scoreboard players reset * Temporary
    data remove storage customguicore: Temp