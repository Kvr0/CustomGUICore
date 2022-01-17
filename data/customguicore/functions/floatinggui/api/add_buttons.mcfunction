#> customguicore:floatinggui/api/add_buttons
# @api

    data modify storage customguicore: Temp.FloatingGUI set from storage customguicore: FloatingGUI
    execute if data storage customguicore: Temp.FloatingGUI.Buttons[0] run function customguicore:floatinggui/general/install/button
