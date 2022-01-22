# CustomGUICore 
>     CustomGUiの基底制御

## Requires
> * `Minecraft 1.18`
> * `RootCore` (https://github.com/Kvr0/RootCore)

## GUIs
> * [`BlockGUI`](#BlockGUI)  
> * [`InventoryGUI`](#InventoryGUI)  
> * [`FloatingGUI`](#FloatingGUI)  

# BlockGUI
>     ブロックインベントリーを利用するGUI
## Features
> * `Callback` - GUIの内容が変更されたとき、コールバック呼出
> * `Slot` - アイテム設置可能なスロット
> * `Eject` - 非GUIパーツのアイテムを排出
> * `Restore` - GUIパーツの再配置
> * `Delete Parts` - GUI外パーツの削除
## Callbacks
> * `customgui:blockgui/init`
> * `customgui:blockgui/end`
> * `customgui:blockgui/changed`
> 
> * Callback Data
> ```
> root
>   └ Callback
>       └ ChangedItems        :item[]
> ```
> * API
> >* `Consume` - `{Slot:0b, Count: 0b}`
> >* `SetItem` - `{Slot:0b, [id: ""], [Count: 0b], [tag: {}]}`
## Entity Tags
> * `BlockGUI.Base`
## General Process
> 1. `Check BlockGUI Initialized`
>     1. `Initialize BlockGUI`
> 1. `Check Block Destroy`
>     1. `Invoke End Callback`
>     1. `Kill BlockGUI Base Entity`
> 1. `Check GUI Change`
>     1. `Find Changed Slot`
>     1. `Invoke Changed Callback`
> 1. `Ejects Out-of-slot Items`
> 1. `Restore GUI Parts`
> 1. `Delete Parts Outside GUI`
## GUI Data
> * GUIPart Data
>   ```
>   root
>     ├ id              :string
>     ├ Count           :int
>     ├ tag             :compound
>     └ BlockGUI        :compound
>         ├ isAir       :bool
>         └ isSlot      :bool
>   ```
> * GUI Data
>   ```
>   root
>     ├ id          :string
>     ├ Name        :nbt-string
>     ├ Parts       :part[]
>     └ Initialized :bool
>   ```
## Example
> ```
> ## Set GUI Data
>     data modify storage customguicore: BlockGUI.Data set value {id:"example",Parts:[],Name:'{"text":"CustomGUI"}'}
> 
> ## Add GUI Part
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:0b, BlockGUI:{}, id:"stone", Count:1b,tag:{display:{Name:'{"text":"GreatPerfectHugeBig-Stone"}'}}}
> 
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:1b, BlockGUI:{isSlot:1b}, id:"glass_pane", Count:1b, tag:{display:{Name:'{"text":"EMPTTYYYY-Slot"}'}}}
> 
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:2b, BlockGUI:{isSlot:1b,isAir:1b}}
> 
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:3b, BlockGUI:{isAir:1b}}
> 
> ## Place BlockGUI
>     function customguicore:blockgui/place
> ```

# InventoryGUI
>     プレイヤーインベントリーを利用するGUI
## Features
> * `Callback` - GUIの内容が変更されたとき、コールバック呼出
> * `Slot` - アイテム設置可能なスロット
> * `Eject` - 非GUIパーツのアイテムを排出
> * `Restore` - GUIパーツの再配置
> * `Delete Parts` - GUI外パーツの削除
## Callbacks
> * `customgui:inventorygui/init`
> * `customgui:inventorygui/end`
> * `customgui:inventorygui/changed`
> 
> * Callback Data
> ```
> root
>   └ Callback
>       └ ChangedItems        :item[]
> ```
## Entity Tags
> * `InventoryGUI.Base`
## General Process
> 1. `Check InventoryGUI Initialized`
>     1. `Initialize InventoryGUI`
> 1. `Check ENd`
>     1. `Invoke End Callback`
> 1. `Check GUI Change`
>     1. `Find Changed Slot`
>     1. `Invoke Changed Callback`
> 1. `Ejects Out-of-slot Items`
> 1. `Restore GUI Parts`
> 1. `Delete Parts Outside GUI`
## GUI Data
> * GUIPart Data
>   ```
>   root
>     ├ id                  :string
>     ├ Count               :int
>     └ tag                 :compound
>         └ InventoryGUI    :compound
>             └ isSlot      :bool
>   ```
> * GUI Data
>   ```
>   root
>     ├ id          :string
>     ├ Parts       :part[]
>     ├ Initialized :bool
>     └ End :bool
>   ```
## Slots
> * `HotBar`    ...    0 -   8
> * `Inventory` ...    9 -  35
## Example
> ```
> ## Set GUI Data
>     data modify storage customguicore: InventoryGUI.Data set value {id:"example",Parts:[]}
> 
> ## Add GUI Part
>     data modify storage customguicore: InventoryGUI.Data.Parts append value {Slot:0b, id:"stone", Count:1b,tag:{InventoryGUI:{},display:{Name:'{"text":"GreatPerfectHugeBig-Stone"}'}}}
> ## Add GUI Slot
>     data modify storage customguicore: InventoryGUI.Data.Parts append value {Slot:1b, id:"glass_pane", Count:1b, tag:{InventoryGUI:{isSlot:1b},display:{Name:'{"text":"EMPTTYYYY-Slot"}'}}}
> 
> ## Place BlockGUI
>     function customguicore:inventorygui/set
> ```

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
