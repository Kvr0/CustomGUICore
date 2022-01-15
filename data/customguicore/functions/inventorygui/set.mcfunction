#> customguicore:inventorygui/set
# @api

data modify storage customguicore Temp.InventoryGUI.Data.Parts set from storage customguicore: InventoryGUI.Data.Parts
data modify storage customguicore: InventoryGUI.Data.Parts set value []
execute if data storage customguicore Temp.InventoryGUI.Data.Parts[0] run function customguicore:inventorygui/general/set_slot_loop

tag @s add InventoryGUI.Base

function #oh_my_dat:plaese
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].InventoryGUI set from storage customguicore: InventoryGUI.Data

data remove storage customguicore: Temp