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
>             ├ Slot        :int
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