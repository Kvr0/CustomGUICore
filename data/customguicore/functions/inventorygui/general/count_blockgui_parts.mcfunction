#> customguicore:inventorygui/general/count_blockgui_parts
# @within function customguicore:inventorygui/general/check_gui_change

## Load Data
    execute store result score $Slot.Player Temporary run data get storage customguicore: Temp.Clone.Player.Items[0].Slot 1
    execute store result score $Slot.InventoryGUI Temporary run data get storage customguicore: Temp.Clone.InventoryGUI.Items[0].tag.InventoryGUI.Slot 1
    execute store result score $isSlot.Player Temporary run data get storage customguicore: Temp.Clone.Player.Items[0].tag.InventoryGUI.isSlot 1
    execute store result score $isSlot.InventoryGUI Temporary run data get storage customguicore: Temp.Clone.InventoryGUI.Items[0].tag.InventoryGUI.isSlot 1

## Compare
    execute if data storage customguicore: Temp.Clone.InventoryGUI.Items[0].tag.InventoryGUI run scoreboard players add $InventoryGUI.Count Temporary 1
    execute if score $Slot.Player Temporary = $Slot.InventoryGUI Temporary unless score $isSlot.Player Temporary matches 1 if score $isSlot.InventoryGUI Temporary matches 1 run scoreboard players add $InventoryGUI.FilledSlot.Count Temporary 1

    execute if score $Slot.Player Temporary <= $Slot.InventoryGUI Temporary run data remove storage customguicore: Temp.Clone.Player.Items[0]
    execute if score $Slot.Player Temporary >= $Slot.InventoryGUI Temporary run data remove storage customguicore: Temp.Clone.InventoryGUI.Items[0]

    execute if data storage customguicore: Temp.Clone.Player.Items[0] if data storage customguicore: Temp.Clone.InventoryGUI.Items[0] run function customguicore:inventorygui/general/count_blockgui_parts