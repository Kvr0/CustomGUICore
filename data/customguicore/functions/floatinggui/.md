# FloatingGUI
>     空中に表示されたテキストを利用するGUI

## Features
> * `Callback`
> * `RelativePos`

## Callbacks
> * `customgui:floatinggui/clicked`
> ### Callback EntityTag
> * `ClickedButton`
> * `ClickedBase`
> * `SameBase.Button`
> * `SameBase.ButtonBase`
> * `ClickedPlayer`
> ### Callback API
> * `Kill Invisible`
> * `Delete Buttons`
> * `Add Buttons`
> * `End GUI`
> ### Callback Data
> ```
> root
>   └ Callback
>       └ FloatingGUI
>           ├ id        :string
>           ├ BaseID    :int
>           └ ButtonID  :int
> ```

## Entity Tags
> * `FloatingGUI.Base`
> * `FloatingGUI.ButtonBase`
> * `FloatingGUI.Button`

## Install Data
> ### Button Data
> ```
> root
>   ├ ButtonID          :int
>   ├ Text              :nbt-string
>   └ RelativePos
>       ├ Pos [double[3]]
>       ├ Rotate [bool]
>       └ isLocal [bool]
> ```
> ### Install Data
> ```
> root            :FloatingGUI
>     id          :string
>     Buttons     :button[]
> ```

## Example
> ```
> ## Set GUI Data
>     data modify storage customguicore: FloatingGUI set value {id:"example",Buttons:[]}
> ### Add Buttons
>     data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:0,Text:'{"text":" - A - "}',RelativePos:{Pos:[-1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:1,Text:'{"text":" - B - "}',RelativePos:{Pos:[0.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:0,Text:'{"text":" - C - "}',RelativePos:{Pos:[1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
> ### Install GUI
>     execute positioned ~ ~1 ~ run function customguicore:floatinggui/install
> ```
> ### Callback
> ```
> ## Set GUI Data
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example"}}} run data modify storage customguicore: FloatingGUI set value {id:"example",Buttons:[]}
> 
> ## Add Buttons 1
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:0}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:1,Text:'{"text":" - D - "}',RelativePos:{Pos:[-1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:0}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:1,Text:'{"text":" - E - "}',RelativePos:{Pos:[0.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:0}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:1,Text:'{"text":" - F - "}',RelativePos:{Pos:[1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
> 
> ## Add Buttons 0
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:1}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:0,Text:'{"text":" - A - "}',RelativePos:{Pos:[-1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:1}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:0,Text:'{"text":" - B - "}',RelativePos:{Pos:[0.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example",ButtonID:1}}} run data modify storage customguicore: FloatingGUI.Buttons append value {ButtonID:0,Text:'{"text":" - C - "}',RelativePos:{Pos:[1.0d,0.0d,0.0d],Rotate:1b,isLocal:0b}}
> 
> ## Delete Buttons
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example"}}} run function customguicore:floatinggui/api/delete_buttons
> ## Add Buttons
>     execute if data storage customguicore: {Callback:{FloatingGUI:{id:"example"}}} run function customguicore:floatinggui/api/add_buttons
> ```