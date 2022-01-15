#> customguicore:inventorygui/general/restore_gui_parts
# @within function customguicore:inventorygui/general/_

## Delete Filled Slot
### Copy
    data modify storage customguicore: Temp.Clone.InventoryGUI.Items set from storage customguicore: Temp.InventoryGUI.Parts
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
### Reset
    data modify storage customguicore: Temp.InventoryGUI.Parts set value []
### Delete Loop
    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/delete_loop
### Push Remain
    execute if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/push_remain_gui_parts

## Get Restore Item
    data modify block -30000000 0 43885 Items set from storage customguicore: Temp.InventoryGUI.Parts
    data modify block -30000000 0 43885 Items[].tag.NeedRestore set value 1b
    data modify block -30000000 0 43885 Items append from storage customguicore: Temp.Player.Items[]
    data modify storage customguicore: Temp.Restore.Items set from block -30000000 0 43885 Items

## Need Restore Loop
    data modify storage customguicore: Temp.Restore.NeedRestoreItems set from storage customguicore: Temp.Restore.Items
    data modify storage customguicore: Temp.Restore.Items set value []
    execute if data storage customguicore: Temp.Restore.NeedRestoreItems[0] run function customguicore:inventorygui/general/need_restore_loop

## Remove NeedRestore Tag
    data remove storage customguicore: Temp.Restore.Items[].tag.NeedRestore

## Restore Item Loop
    data modify storage customguicore: Temp.Clone.Restore.Items set from storage customguicore: Temp.Restore.Items
    execute if data storage customguicore: Temp.Clone.Restore.Items[0] run function customguicore:inventorygui/general/restore_item_loop