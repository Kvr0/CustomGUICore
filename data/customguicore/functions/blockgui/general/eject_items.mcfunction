#> customguicore:blockgui/general/eject_items
# @within function customguicore:blockgui/general/_

## Clone Data
    data modify storage customguicore: Temp.Clone.EjectItems set from storage customguicore: Temp.EjectItems

## Eject Loop
    execute if data storage customguicore: Temp.Clone.EjectItems[0] run function customguicore:blockgui/general/eject_loop