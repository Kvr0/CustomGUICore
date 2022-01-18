#> customguicore:blockgui/api/private/consume_loop
# @within function customguicore:blockgui/api/consume

execute store result score $Slot Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].Slot 1
execute store result score $Count Temporary run data get storage customguicore: Temp.Clone.Block.Items[0].Count 1

execute if score $Slot Temporary = $Consume.Slot Temporary run scoreboard players operation $Count Temporary -= $Consume.Count Temporary
execute if score $Slot Temporary = $Consume.Slot Temporary run execute store result storage customguicore: Temp.Clone.Block.Items[0].Count byte 1 run scoreboard players get $Count Temporary

data modify storage customguicore: Temp.Block.Items append from storage customguicore: Temp.Clone.Block.Items[0]
data remove storage customguicore: Temp.Clone.Block.Items[0]

execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/api/private/consume_loop