#> customguicore:blockgui/api/consume
# @input storage customguicore: Input.Consume
#           Slot        :byte
#           Count       :byte
# @api

execute store result score $Consume.Slot Temporary run data get storage customguicore: Input.Consume.Slot 1
execute store result score $Consume.Count Temporary run data get storage customguicore: Input.Consume.Count 1

data modify storage customguicore: Temp.Clone.Block.Items set from storage customguicore: Temp.Block.Items
data modify storage customguicore: Temp.Block.Items set value []

execute if data storage customguicore: Temp.Clone.Block.Items[0] run function customguicore:blockgui/api/private/consume_loop
