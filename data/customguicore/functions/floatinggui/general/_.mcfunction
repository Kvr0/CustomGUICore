#> customguicore:floatinggui/general/_
# @within function customguicore:floatinggui/private/main

## ベースエンティティがない場合削除
    execute as @e[tag=FloatingGUI,tag=!FloatingGUI.Base] at @s run function customguicore:floatinggui/general/delete_end/_
