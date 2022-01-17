#> customguicore:floatinggui/general/delete_end/_
# @within function customguicore:floatinggui/general/_

scoreboard players operation $BaseID Temporary = @s RelativePos.Base
scoreboard players set $Exist Temporary 0

execute as @e[tag=FloatingGUI.Base] if score @s RelativePos.ID = $BaseID Temporary run scoreboard players add $Exist Temporary 1

execute if score $Exist Temporary matches 0 run function customguicore:floatinggui/api/kill_invisible

scoreboard players reset * Temporary