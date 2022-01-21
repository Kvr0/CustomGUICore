#> customguicore:blockgui/general/place/apply_blockgui_tag
# @within function customguicore:blockgui/general/place/_


data modify storage customguicore: Temp.BlockGUI.Data.Parts set from storage customguicore: BlockGUI.Data.Parts
data modify storage customguicore: BlockGUI.Data.Parts set value []
execute if data storage customguicore: Temp.BlockGUI.Data.Parts[0] run function customguicore:blockgui/general/place/apply_loop

data remove storage customguicore: Temp
