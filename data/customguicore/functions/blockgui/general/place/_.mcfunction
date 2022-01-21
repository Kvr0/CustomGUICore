#> customguicore:blockgui/general/place/_
# @within function customguicore:blockgui/place

execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:[BlockGUI.Base,new]}
setblock ~ ~ ~ barrel

execute as @e[tag=new] at @s run function #oh_my_dat:plaese

function customguicore:blockgui/general/place/apply_blockgui_tag
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BlockGUI set from storage customguicore: BlockGUI.Data

data modify block ~ ~ ~ CustomName set from storage customguicore: BlockGUI.Data.Name

tag @e remove new