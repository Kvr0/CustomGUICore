#> customguicore:blockgui/private/uninstall
# @within tag/function customguicore:uninstall

## Kill Base
    kill @e[tag=BlockGUI.Base]

## Entity Tag
    tag @e remove BlockGUI.Base

## Install Flag
    data remove storage core: Installed.CustomGUICore.BlockGUI