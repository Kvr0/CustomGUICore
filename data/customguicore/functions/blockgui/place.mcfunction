#> customguicore:blockgui/place
# @api

summon armor_stand ~ ~ ~ {Tags:[BlockGUI.Base,new],Marker:1b,Invisible:1b}
setblock ~ ~ ~ barrel

execute as @e[tag=new] at @s run function #oh_my_dat:plaese

data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI set from storage customguicore: BlockGUI.Data

tag @e remove new