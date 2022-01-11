# CustomGUICore 
>     CustomGUiの基底制御

## Requires
> * `Minecraft 1.18`
> * `RootCore` (https://github.com/Kvr0/RootCore)

## Common Features
> * `Delete GUIParts From Player Inventory` - GUIパーツをプレイヤーのインベントリーから削除
> * `Kill GUIParts Item Entity` - GUIパーツのアイテムエンティティを削除

## GUIs
> * [`BlockGUI`](#BlockGUI)  
> * [`InventoryGUI`](#InventoryGUI)  
> * [`FloatingGUI`](#FloatingGUI)  

## BlockGUI
>     ブロックインベントリーを利用するGUI
> ### __Features__
> * `GUIParts Detection Priority` - 選択優先度を設定
> * `Selected GUIParts Detection` - パーツ選択を感知
> * `Auto-Restoring GUIParts` - 自動的なパーツの再設置
> * `Call Action Callbacks` - コールバック関数の呼び出し
> * `Ejection of non-GUIParts` - 非GUIパーツの排出
> ### __Methods__
> * `customgui:blockgui/restore` - パーツの再設置
> ### __Callbacks__
> * `customgui:blockgui/init` - 初期化処理
> * `customgui:blockgui/end` - 終了処理
> * `customgui:blockgui/selected` - パーツ選択時処理
> * `customgui:blockgui/load_restoreitem` - 再設置アイテムの読み込み
> ### __Values for callback__
> ```
> customgui: [storage]
>   └ BlockGUI [compound]
>       ├ Selected [compound]
>       │   ├ Slot [byte]           :out
>       │   ├ Data [compound]       :out
>       │   └ GUITag[] [string[]]   :out
>       └ Restore [compound]
>           ├ Items[] [item[]]      :in
>           ├ Data [compound]       :out
>           └ GUITag[] [string[]]   :out
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
