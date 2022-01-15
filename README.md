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
>     ├ id                  :string
>     ├ Count               :int
>     └ tag                 :compound
>         └ BlockGUI        :compound
>             └ isSlot      :bool
>   ```
> * GUI Data
>   ```
>   root
>       id          :string
>       Parts       :part[]
>       Initialized :bool
>   ```
## Example
> ```
> ## Set GUI Data
>     data modify storage customguicore: BlockGUI.Data set value {id:"example",Parts:[]}
> 
> ## Add GUI Part
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:0b, id:"stone", Count:1b,tag:{BlockGUI:{},display:{Name:'{"text":"GreatPerfectHugeBig-Stone"}'}}}
> ## Add GUI Slot
>     data modify storage customguicore: BlockGUI.Data.Parts append value {Slot:1b, id:"glass_pane", Count:1b, tag:{BlockGUI:{isSlot:1b},display:{Name:'{"text":"EMPTTYYYY-Slot"}'}}}
> 
> ## Place BlockGUI
>     function customguicore:blockgui/place
> ```

## InventoryGUI
>     プレイヤーインベントリーを利用したGUI
> ### __Features__
> * `GUIParts Detection Priority` - 選択優先度を設定
> * `Selected GUIParts Detection` - パーツ選択を感知
> * `Auto-Restoring GUIParts` - 自動的なパーツの再設置
> * `Call Action Callbacks` - コールバック関数の呼び出し
> * `Ejection of non-GUIParts` - 非GUIパーツの排出
> ### __Methods__
> * `customgui:inventorygui/restore` - パーツの再設置
> ### __Callbacks__
> * `customgui:inventorygui/init` - 初期化処理
> * `customgui:inventorygui/end` - 終了処理
> * `customgui:inventorygui/selected` - パーツ選択時処理
> * `customgui:inventorygui/load_restoreitem` - 再設置アイテムの読み込み
> ### __Values for callback__
> ```
> customgui: [storage]
>   └ InventoryGUI [compound]
>       ├ Selected [compound]
>       │   ├ Slot [byte]           :out
>       │   ├ Data [compound]       :out
>       │   └ GUITag[] [string[]]   :out
>       └ Restore [compound]
>           ├ Items[] [item[]]      :in
>           ├ Data [compound]       :out
>           └ GUITag[] [string[]]   :out
> ```

## FloatingGUI
>     空中に表示されたテキストを利用するGUI
> ### __Features__
> * `GUIParts Detection Priority` - 選択優先度を設定
> * `Selected GUIParts Detection` - パーツ選択を感知
> * `Call Action Callbacks` - コールバック関数の呼び出し
> * `Summon and TP Specific Position` - 相対位置の指定
> * `Enable to Operate by Group` - グループ単位で操作可能
> * `Limitation of players who can operate` - 操作可能プレイヤーの制限
> ### __Methods__
> * `customgui:floatinggui/install` - GUIの設置
> * `customgui:floatinggui/reset` - GUIパーツの再設置
> * `customgui:floatinggui/delete` - GUIパーツの削除
> * `customgui:floatinggui/end` - GUIの終了処理
> ### __Callbacks__
> * `customgui:floatinggui/selected` - パーツ選択時処理
> * `customgui:floatinggui/load_restoreparts` - 再設置GUIパーツの読み込み
> ### __Values for callback__
> ```
> customgui: [storage]
>   └ FloatingGUI [compound]
>       ├ Selected [compound]
>       │   ├ Id [byte]             :out
>       │   ├ Data [compound]       :out
>       │   └ GUITag[] [string[]]   :out
>       └ Restore [compound]
>           ├ Parts[] [guipart[]]   :in
>           ├ Data [compound]       :out
>           └ GUITag[] [string[]]   :out
> ```
