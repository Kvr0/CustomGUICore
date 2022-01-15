#> customguicore:blockgui/general/eject
# @within function customguicore:blockgui/general/eject_loop

summon item ~ ~ ~ {Item:{id:"minecraft:barrier",Count:1b},Tags:[new]}

execute if data storage customguicore: Temp.Clone.Block.Items[0].id run data modify entity @e[tag=new,limit=1] Item.id set from storage customguicore: Temp.Clone.Block.Items[0].id
execute if data storage customguicore: Temp.Clone.Block.Items[0].Count run data modify entity @e[tag=new,limit=1] Item.Count set from storage customguicore: Temp.Clone.Block.Items[0].Count
execute if data storage customguicore: Temp.Clone.Block.Items[0].tag run data modify entity @e[tag=new,limit=1] Item.tag set from storage customguicore: Temp.Clone.Block.Items[0].tag

tag @e remove new