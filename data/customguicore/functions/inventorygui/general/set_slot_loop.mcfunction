#> customguicore:inventorygui/general/set_slot_loop
# @within function customguicore:inventorygui/set

execute unless data storage customguicore Temp.InventoryGUI.Data.Parts[0].Slot run data modify storage customguicore Temp.InventoryGUI.Data.Parts[0].Slot set from storage customguicore Temp.InventoryGUI.Data.Parts[0].tag.InventoryGUI.Slot
execute unless data storage customguicore Temp.InventoryGUI.Data.Parts[0].tag.InventoryGUI.Slot run data modify storage customguicore Temp.InventoryGUI.Data.Parts[0].tag.InventoryGUI.Slot set from storage customguicore Temp.InventoryGUI.Data.Parts[0].Slot
data modify storage customguicore: InventoryGUI.Data.Parts append from storage customguicore Temp.InventoryGUI.Data.Parts[0]
data remove storage customguicore Temp.InventoryGUI.Data.Parts[0]

execute if data storage customguicore Temp.InventoryGUI.Data.Parts[0] run function customguicore:inventorygui/general/set_slot_loop