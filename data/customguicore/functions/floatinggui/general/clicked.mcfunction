#> customguicore:floatinggui/general/clicked
# @within function customguicore:floatinggui/general/clicl_check

function #oh_my_dat:please

## Load Callback Data
    data modify storage customguicore: Callback.FloatingGUI set value {}
    data modify storage customguicore: Callback.FloatingGUI set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI

## Get BaseID
    execute store result score $BaseID Temporary run data get storage customguicore: Callback.FloatingGUI.BaseID 1

## Add Tags
    tag @s add ClickedButton
    execute as @e[tag=FloatingGUI.Base] if score @s RelativePos.ID = $BaseID Temporary run tag @s add ClickedBase

    execute as @e[tag=FloatingGUI.Button] if score @s RelativePos.Base = $BaseID Temporary run tag @s add SameBase.Button
    execute as @e[tag=FloatingGUI.ButtonBase] if score @s RelativePos.Base = $BaseID Temporary run tag @s add SameBase.ButtonBase

    tag @e[tag=AttackingEntity] add ClickedPlayer

## Invoke Callback
    execute as @e[tag=ClickedBase] at @s run function #customguicore:floatinggui/clicked

## Remove Tag
    tag @e remove ClickedButton
    tag @e remove ClickedBase

    tag @e remove SameBase.Button
    tag @e remove SameBase.ButtonBase

    tag @e remove ClickedPlayer

## Reset
    scoreboard players reset * Temporary