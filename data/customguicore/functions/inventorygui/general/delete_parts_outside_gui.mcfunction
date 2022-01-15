#> customguicore:inventorygui/general/delete_parts_outside_gui
# @within function customguicore:inventorygui/general/_

## Player Inventory
    clear @a #api:all_item{InventoryGUI:{}}

## Item Entity
    kill @e[type=item,nbt={Item:{tag:{InventoryGUI:{}}}}]
