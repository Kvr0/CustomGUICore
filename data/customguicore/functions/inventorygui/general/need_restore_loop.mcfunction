#> customguicore:inventorygui/general/need_restore_loop
# @within function customguicore:inventorygui/general/restore_gui_parts

    execute if data storage customguicore: Temp.Restore.NeedRestoreItems[0].tag.NeedRestore run data modify storage customguicore: Temp.Restore.Items append from storage customguicore: Temp.Restore.NeedRestoreItems[0]
    data remove storage customguicore: Temp.Restore.NeedRestoreItems[0]

    execute if data storage customguicore: Temp.Restore.NeedRestoreItems[0] run function customguicore:inventorygui/general/need_restore_loop