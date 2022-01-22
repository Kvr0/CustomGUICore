#> customguicore:blockgui/general/delete_parts_outside_gui
# @within customguicore:blockgui/private/main

## Player Inventory
    clear @a #api:all_item{BlockGUI:{}}

## Item Entity
    kill @e[type=item,nbt={Item:{tag:{BlockGUI:{}}}}]
