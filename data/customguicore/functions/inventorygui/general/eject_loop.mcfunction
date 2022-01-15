#> customguicore:inventorygui/general/eject_loop
# @within function customguicore:inventorygui/general/eject_out_of_slot_items

## Load Data
    execute store result score $Slot.Player Temporary run data get storage customguicore: Temp.Clone.Player.Items[0].Slot 1
    execute store result score $Slot.InventoryGUI Temporary run data get storage customguicore: Temp.Clone.InventoryGUI.Items[0].Slot 1
    execute store result score $isSlot Temporary run data get storage customguicore: Temp.Clone.InventoryGUI.Items[0].tag.InventoryGUI.isSlot 1

## Eject
    execute if score $Slot.Player Temporary = $Slot.InventoryGUI Temporary unless score $isSlot Temporary matches 1 run function customguicore:inventorygui/general/eject

## Push Back
    execute if score $Slot.Player Temporary = $Slot.InventoryGUI Temporary if score $isSlot Temporary matches 1 run data modify storage customguicore: Temp.Player.Items append from storage customguicore: Temp.Clone.Player.Items[0]
    execute if score $Slot.Player Temporary < $Slot.InventoryGUI Temporary run data modify storage customguicore: Temp.Player.Items append from storage customguicore: Temp.Clone.Player.Items[0]

    execute if score $Slot.Player Temporary <= $Slot.InventoryGUI Temporary run data remove storage customguicore: Temp.Clone.Player.Items[0]
    execute if score $Slot.Player Temporary >= $Slot.InventoryGUI Temporary run data remove storage customguicore: Temp.Clone.InventoryGUI.Items[0]

## Eject Loop
    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/eject_loop