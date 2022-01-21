#> customguicore:blockgui/general/place/apply_loop
# @within function customguicore:blockgui/general/place/apply_blockgui_tag

data modify storage customguicore: Temp.BlockGUI.Data.Parts[0].tag.BlockGUI set from storage customguicore: Temp.BlockGUI.Data.Parts[0].BlockGUI

data modify storage customguicore: BlockGUI.Data.Parts append from storage customguicore: Temp.BlockGUI.Data.Parts[0]
data remove storage customguicore: Temp.BlockGUI.Data.Parts[0]

execute if data storage customguicore: Temp.BlockGUI.Data.Parts[0] run function customguicore:blockgui/general/place/apply_loop