#> customguicore:private/install
# @within tag/function core:install

## Callback
    function #customguicore:install

## Install Flag
    execute unless data storage core: Installed.CustomGUICore run data modify storage core: Installed.CustomGUICore set value {}
