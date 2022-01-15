#> customguicore:inventorygui/general/restore_item_loop
# @within function customguicore:inventorygui/general/restore_gui_parts

## Slot
    execute store result score $Slot Temporary run data get storage customguicore: Temp.Clone.Restore.Items[0].tag.InventoryGUI.Slot 1
    data remove storage customguicore: Temp.Clone.Restore.Items[0].Slot

## Load Data
    data modify block -30000000 0 43885 Items set value []
    data modify block -30000000 0 43885 Items append from storage customguicore: Temp.Clone.Restore.Items[0]

## Restore
### Hotbar      (0 - 8)
    execute if score $Slot Temporary matches 0 run item replace entity @s hotbar.0 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 1 run item replace entity @s hotbar.1 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 2 run item replace entity @s hotbar.2 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 3 run item replace entity @s hotbar.3 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 4 run item replace entity @s hotbar.4 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 5 run item replace entity @s hotbar.5 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 6 run item replace entity @s hotbar.6 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 7 run item replace entity @s hotbar.7 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 8 run item replace entity @s hotbar.8 from block -30000000 0 43885 container.0
### Inventory   (9 - 35)
    execute if score $Slot Temporary matches 9 run item replace entity @s inventory.0 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 10 run item replace entity @s inventory.1 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 11 run item replace entity @s inventory.2 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 12 run item replace entity @s inventory.3 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 13 run item replace entity @s inventory.4 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 14 run item replace entity @s inventory.5 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 15 run item replace entity @s inventory.6 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 16 run item replace entity @s inventory.7 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 17 run item replace entity @s inventory.8 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 18 run item replace entity @s inventory.9 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 19 run item replace entity @s inventory.10 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 20 run item replace entity @s inventory.11 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 21 run item replace entity @s inventory.12 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 22 run item replace entity @s inventory.13 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 23 run item replace entity @s inventory.14 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 24 run item replace entity @s inventory.15 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 25 run item replace entity @s inventory.16 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 26 run item replace entity @s inventory.17 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 27 run item replace entity @s inventory.18 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 28 run item replace entity @s inventory.19 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 29 run item replace entity @s inventory.20 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 30 run item replace entity @s inventory.21 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 31 run item replace entity @s inventory.22 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 32 run item replace entity @s inventory.23 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 33 run item replace entity @s inventory.24 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 34 run item replace entity @s inventory.25 from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 35 run item replace entity @s inventory.26 from block -30000000 0 43885 container.0
### Armor       (100 - 103)
    execute if score $Slot Temporary matches 100 run item replace entity @s armor.feet from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 101 run item replace entity @s armor.legs from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 102 run item replace entity @s armor.chest from block -30000000 0 43885 container.0
    execute if score $Slot Temporary matches 103 run item replace entity @s armor.head from block -30000000 0 43885 container.0
### OffHand     (-106)
    execute if score $Slot Temporary matches -106 run item replace entity @s weapon.offhand from block -30000000 0 43885 container.0

## Remove
    data remove storage customguicore: Temp.Clone.Restore.Items[0]

## Restore Item Loop
    execute if data storage customguicore: Temp.Clone.Restore.Items[0] run function customguicore:inventorygui/general/restore_item_loop