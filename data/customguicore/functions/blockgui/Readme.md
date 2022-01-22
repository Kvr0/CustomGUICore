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
>       └ BlockGUI
>           └ ChangedItems        :item[]
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