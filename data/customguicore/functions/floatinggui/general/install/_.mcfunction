#> customguicore:floatinggui/general/install/_
# @within function customguicore:floatinggui/install

## Base
    function customguicore:floatinggui/general/install/base

## BaseID
    execute as @e[tag=installing,tag=FloatingGUI.Base,limit=1] store result score $BaseID Temporary run function api:relative_pos/get_id

## Button
    data modify storage customguicore: Temp.FloatingGUI set from storage customguicore: FloatingGUI
    execute if data storage customguicore: Temp.FloatingGUI.Buttons[0] run function customguicore:floatinggui/general/install/button

## Remove Tag
    tag @e remove installing

## Reset
    data remove storage customguicore: Temp
    scoreboard players reset * Temporary