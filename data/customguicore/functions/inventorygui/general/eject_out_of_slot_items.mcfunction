#> customguicore:inventorygui/general/eject_out_of_slot_items
# @within function customguicore:inventorygui/general/_

## Clone Data
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
    data modify storage customguicore: Temp.Clone.InventoryGUI.Items set from storage customguicore: Temp.InventoryGUI.Parts

## Reset
    data modify storage customguicore: Temp.Player.Items set value []

## Eject Loop
    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/eject_loop

## Push Back Remain
    execute if data storage customguicore: Temp.Clone.Player.Items[0] run function customguicore:inventorygui/general/push_back_remain_items
