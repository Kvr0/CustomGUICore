#> customguicore:inventorygui/private/main
# @within tag/function customguicore:main

## Delete Parts Outside GUI
    kill @e[type=item,nbt={Item:{tag:{InventoryGUI:{}}}}]

## General
    execute as @a[tag=InventoryGUI.Base] at @s run function customguicore:inventorygui/general/_
