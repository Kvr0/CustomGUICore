#> customguicore:blockgui/api/consume/_
# @input storage customguicore: Input.Consume
#           Slot        :byte
#           Count       :byte
# @api

## Load Values
    execute store result score $Consume.Slot Temporary run data get storage customguicore: Input.Consume.Slot 1
    execute store result score $Consume.Count Temporary run data get storage customguicore: Input.Consume.Count 1

## Clone Data
    data modify storage customguicore: Temp.Clone.RestoreItems set from storage customguicore: Temp.RestoreItems

## Reset
    data modify storage customguicore: Temp.RestoreItems set value []

## Loop
    execute if data storage customguicore: Temp.Clone.RestoreItems[0] run function customguicore:blockgui/api/consume/loop

## Reset Input
    data modify storage customguicore: Input.Consume set value {Slot: -1b, Count: 0b}