#> customguicore:index
# @private

#> CustomGUICore
# @public
    #> Storage
        #declare storage customguicore:
    #> Callback
        #declare tag/function customguicore:install
        #declare tag/function customguicore:uninstall
        #declare tag/function customguicore:main
        #declare tag/function customguicore:load

#> CustomGUICore.BlockGUI
# @public
    #> Callback
        #declare tag/function customguicore:blockgui/changed
        #declare tag/function customguicore:blockgui/init
        #declare tag/function customguicore:blockgui/end
    #> EntityTag
        #declare tag BlockGUI.Base

#> CustomGUICore.InventoryGUI
# @public
    #> Callback
        #declare tag/function customguicore:inventorygui/changed
        #declare tag/function customguicore:inventorygui/init
        #declare tag/function customguicore:inventorygui/end
    #> EntityTag
        #declare tag InventoryGUI.Base
    #> Function
        #declare function customguicore:inventorygui/set
        #declare function customguicore:inventorygui/end

#> CustomGUICore.FloatingGUI
# @public
    #> Callback
        #declare tag/function customguicore:floatinggui/clicked
        #> EntityTag
            #declare tag ClickedButton
            #declare tag ClickedBase
            #declare tag SameBase.Button
            #declare tag SameBase.ButtonBase
            #declare tag ClickedPlayer
    #> EntityTag
        #declare tag FloatingGUI.Base
        #declare tag FloatingGUI.ButtonBase
        #declare tag FloatingGUI.Button
    #> Function
        #declare function customguicore:floatinggui/install
