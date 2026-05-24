data:extend({
    {
        type = "bool-setting",
        name = "easy-sorting",
        setting_type = "startup",
        default_value = false,
        order = "a"
    },
    -- Common info for yields: it is in %
    {
        type = "int-setting",
        name = "iron-yield",
        setting_type = "startup",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 40,
        order = "b-a"
    },
    {
        type = "int-setting",
        name = "copper-yield",
        setting_type = "startup",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 28,
        order = "b-b"
    },
    {
        type = "int-setting",
        name = "coal-yield",
        setting_type = "startup",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 16,
        order = "b-c"
    },
    {
        type = "int-setting",
        name = "stone-yield",
        setting_type = "startup",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 15,
        order = "b-d"
    },
    {
        type = "int-setting",
        name = "uranium-yield",
        setting_type = "startup",
        minimum_value = 0,
        maximum_value = 100,
        default_value = 1,
        order = "b-e"
    },
    {
        type = "bool-setting",
        name = "starting-area-placement",
        setting_type = "startup",
        default_value = true,
        order = "c"
    }
})


--Supported planet settings come here
-- TODO: Analysis: resource generation settings probably only work on newly generated chunks if enabled late, or not at all
-- At first we put this in the description as a warning.