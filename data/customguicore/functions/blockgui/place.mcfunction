#> customguicore:blockgui/place
# @api

summon marker ~ ~ ~ {Tags:[BlockGUI.Base,new]}
setblock ~ ~ ~ barrel

execute as @e[tag=new] at @s run function #oh_my_dat:plaese

data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI set from storage customguicore: BlockGUI.Data

tag @e remove new