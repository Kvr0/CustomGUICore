#> customguicore:blockgui/api/set_item/loop
# @within function customguicore:blockgui/api/set_item/_


    execute store result score $Item.Slot Temporary run data get storage customguicore: Temp.Clone.RestoreItems[0].Slot

## $Item.Slot > $SetItem.Slot
    execute if score $Item.Slot Temporary > $SetItem.Slot Temporary run data modify storage customguicore: Temp.RestoreItems append value {Slot:0b,Count:1b,id:"air"}
    execute if score $Item.Slot Temporary > $SetItem.Slot Temporary run data modify storage customguicore: Temp.RestoreItems[-1].Slot set from storage customguicore: Input.SetItem.Slot
    execute if score $Item.Slot Temporary > $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.id run data modify storage customguicore: Temp.RestoreItems[-1].id set from storage customguicore: Input.SetItem.id
    execute if score $Item.Slot Temporary > $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.Count run data modify storage customguicore: Temp.RestoreItems[-1].Count set from storage customguicore: Input.SetItem.Count
    execute if score $Item.Slot Temporary > $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.tag run data modify storage customguicore: Temp.RestoreItems[-1].tag merge from storage customguicore: Input.SetItem.tag

## $Item.Slot = $SetItem.Slot
    execute if score $Item.Slot Temporary = $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.id run data modify storage customguicore: Temp.Clone.RestoreItems[0].id set from storage customguicore: Input.SetItem.id
    execute if score $Item.Slot Temporary = $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.Count run data modify storage customguicore: Temp.Clone.RestoreItems[0].Count set from storage customguicore: Input.SetItem.Count
    execute if score $Item.Slot Temporary = $SetItem.Slot Temporary if data storage customguicore: Input.SetItem.tag run data modify storage customguicore: Temp.Clone.RestoreItems[0].tag merge from storage customguicore: Input.SetItem.tag

## Step
    data modify storage customguicore: Temp.RestoreItems append from storage customguicore: Temp.Clone.RestoreItems[0]
    data remove storage customguicore: Temp.Clone.RestoreItems[0]

    execute unless score $Item.Slot Temporary = $SetItem.Slot Temporary if data storage customguicore: Temp.Clone.RestoreItems[0] run function customguicore:blockgui/api/set_item/loop