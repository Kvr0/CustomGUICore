#> customguicore:blockgui/api/set_item/_
# @input storage customguicore: Input.SetItem
#           Slot        :byte
#           [id]        :string
#           [Count]     :byte
#           [tag]       :compound
# @api

## Load Values
    execute store result score $SetItem.Slot Temporary run data get storage customguicore: Input.SetItem.Slot 1

## Clone Data
    data modify storage customguicore: Temp.Clone.RestoreItems set from storage customguicore: Temp.RestoreItems

## Reset
    data modify storage customguicore: Temp.RestoreItems set value []

## Loop
    execute if data storage customguicore: Temp.Clone.RestoreItems[0] run function customguicore:blockgui/api/set_item/loop

    data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.RestoreItems[]
    data remove storage customguicore: Temp.Clone.RestoreItems

    ## $Item.Slot < $SetItem.Slot
    execute if score $Item.Slot Temporary < $SetItem.Slot Temporary run data modify storage customguicore: Temp.RestoreItems append value {Slot:26b,Count:1b,id:"air"}
    execute if score $Item.Slot Temporary < $SetItem.Slot Temporary run data modify storage customguicore: Temp.RestoreItems[-1].Slot set from storage customguicore: Input.SetItem.Slot
    execute if score $Item.Slot Temporary < $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.id run data modify storage customguicore: Temp.RestoreItems[-1].id set from storage customguicore: Input.SetItem.id
    execute if score $Item.Slot Temporary < $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.Count run data modify storage customguicore: Temp.RestoreItems[-1].Count set from storage customguicore: Input.SetItem.Count
    execute if score $Item.Slot Temporary < $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.tag run data modify storage customguicore: Temp.RestoreItems[-1].tag merge from storage customguicore: Input.SetItem.tag


## Reset Input
    data modify storage customguicore: Input.SetItem set value {Slot: -1b}