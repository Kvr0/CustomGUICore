#> customguicore:blockgui/general/restore_gui_parts
# @within function customguicore:blockgui/general/_

## Restore
    data modify block ~ ~ ~ Items set from storage customguicore: Temp.BlockGUI.Parts
    data modify block ~ ~ ~ Items append from storage customguicore: Temp.Block.Items[]
