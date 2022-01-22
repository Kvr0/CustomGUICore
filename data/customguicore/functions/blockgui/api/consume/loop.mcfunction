#> customguicore:blockgui/api/consume/loop
# @within function customguicore:blockgui/api/consume/_

    execute store result score $Item.Slot Temporary run data get storage customguicore: Temp.Clone.RestoreItems[0].Slot
    execute store result score $Item.Count Temporary run data get storage customguicore: Temp.Clone.RestoreItems[0].Count

    execute if score $Item.Slot Temporary = $Consume.Slot Temporary run scoreboard players operation $Item.Count Temporary -= $Consume.Count Temporary
    execute store result storage customguicore: Temp.Clone.RestoreItems[0].Count byte 1 run scoreboard players get $Item.Count Temporary

    execute if score $Item.Count Temporary matches 1.. run data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.RestoreItems[0]
    data remove storage customguicore: Temp.Clone.RestoreItems[0]

    execute if data storage customguicore: Temp.Clone.RestoreItems[0] run function customguicore:blockgui/api/consume/loop