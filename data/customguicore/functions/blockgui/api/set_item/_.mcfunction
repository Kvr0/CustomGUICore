#> customguicore:blockgui/api/set_item/_
# @input storage customguicore: Input.SetItem
#           Slot        :byte
#           [id]        :string
#           [Count]     :byte
#           [tag]       :compound
# @api

    #tellraw @p [{"text": "SetItem: "},{"nbt":"Input.SetItem","storage": "customguicore:"}]

## Load Values
    execute store result score $SetItem.Slot Temporary run data get storage customguicore: Input.SetItem.Slot 1

## Clone Data
    data modify storage customguicore: Temp.Clone.RestoreItems set from storage customguicore: Temp.RestoreItems

## Reset
    data modify storage customguicore: Temp.RestoreItems set value []

## Loop
    execute if data storage customguicore: Temp.Clone.RestoreItems[0] run function customguicore:blockgui/api/set_item/loop

## Reset Input
    data modify storage customguicore: Input.SetItem set value {Slot: -1b}