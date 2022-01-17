#> customguicore:floatinggui/general/install/button
# @within function customguicore:floatinggui/general/install/_

## Summon Entity
    summon armor_stand ~ ~ ~ {Tags:[new,installing,FloatingGUI.ButtonBase,FloatingGUI],CustomNameVisible:1b,Silent:1b,Small:1b,Marker:1b,Invisible:1b,Passengers:[{id:"minecraft:slime",Tags:[new,installing,FloatingGUI.Button,FloatingGUI],Silent:1b,NoAI:1b,DeathLootTable:"api:no_drop",Team:"no_collision",ActiveEffects:[{Id:11b,Amplifier:127b,Duration:1000000,ShowParticles:0b},{Id:14b,Amplifier:0b,Duration:1000000,ShowParticles:0b}]}],CustomName:'{"text":""}'}

## Get EntityID
    execute as @e[tag=new] run function api:relative_pos/get_id

## Get Relative Base EntityID
    scoreboard players operation @e[tag=new,tag=FloatingGUI.ButtonBase,limit=1] RelativePos.Base = $BaseID Temporary
    scoreboard players operation @e[tag=new,tag=FloatingGUI.Button,limit=1] RelativePos.Base = $BaseID Temporary

## Set Data
### Button
    execute as @e[tag=new,tag=FloatingGUI.Button,limit=1] run function #oh_my_dat:please
    
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI set from storage customguicore: Temp.FloatingGUI.Buttons[0]
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI.id set from storage customguicore: Temp.FloatingGUI.id
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI.BaseID int 1 run scoreboard players get $BaseID Temporary

### ButtonBase
    execute as @e[tag=new,tag=FloatingGUI.ButtonBase,limit=1] run function #oh_my_dat:please

    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI set from storage customguicore: Temp.FloatingGUI.Buttons[0]
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI.id set from storage customguicore: Temp.FloatingGUI.id
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].RelativePos set from storage customguicore: Temp.FloatingGUI.Buttons[0].RelativePos
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FloatingGUI.BaseID int 1 run scoreboard players get $BaseID Temporary
### Text
    data modify entity @e[tag=new,tag=FloatingGUI.ButtonBase,limit=1] CustomName set from storage customguicore: Temp.FloatingGUI.Buttons[0].Text

## Remove Tag
    tag @e remove new

## Loop
    data remove storage customguicore: Temp.FloatingGUI.Buttons[0]
    execute if data storage customguicore: Temp.FloatingGUI.Buttons[0] run function customguicore:floatinggui/general/install/button