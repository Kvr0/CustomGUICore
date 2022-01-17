#> customguicore:floatinggui/general/install/base
# @within function customguicore:floatinggui/general/install/_

## Summon Entity
    summon armor_stand ~ ~ ~ {Tags:[new,installing,FloatingGUI.Base,FloatingGUI],NoAI:1b,Marker:1b,Silent:1b,Invisible:1b}

## Get EntityID
    execute as @e[tag=new,limit=1] run function api:relative_pos/get_id

## Remove Tag
    tag @e remove new

