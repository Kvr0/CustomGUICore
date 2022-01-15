#> customguicore:inventorygui/general/find_changed_slot
# @within function customguicore:inventorygui/general/_

## Reset
    data modify storage customguicore: Callback.ChangedItems set value []

## Clone Data
    data modify storage customguicore: Temp.Clone.Player.Items set from storage customguicore: Temp.Player.Items
    data modify storage customguicore: Temp.Clone.InventoryGUI.Items set from storage customguicore: Temp.InventoryGUI.Parts

## Find Loop
    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/find_loop