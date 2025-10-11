local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__.prototypes.tile.tile-sounds")
require("__base__/prototypes/factoriopedia-util")
local factoriopedia_bulk_ore_simulations = { init = make_resource("bulk-ore") }

-- Initialize patch
resource_autoplace.initialize_patch_set("bulk-ore", true)

local bulk_ore_resource = {
    type = "resource",
    name = "bulk-ore",
    icon = "__bulk-ore__/graphics/icons/bulk-ore.png",
    flags = { "placeable-neutral" },
    order = "b[bulk-ore]",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = {
        mining_particle = "stone-particle",
        mining_time = 0.85,
        result = "bulk-ore"
    },
    category = "basic-solid",
    walking_sound = tile_sounds.walking.ore,
    driving_sound = tile_sounds.driving.stone,
    collision_box = { { -0.1, -0.1 }, { 0.1, 0.1 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    autoplace = resource_autoplace.resource_autoplace_settings {
        name = "bulk-ore",
        order = "b",
        base_density = 8,
        base_spots_per_km2 = 1.25,
        has_starting_area_placement = true,
        regular_rq_factor_multiplier = 1.1,
        starting_rq_factor_multiplier = 0.8,
        candidate_spot_count = 21
    },
    stage_counts = { 15000, 9500, 5500, 2900, 1300, 400, 150, 80 },
    stages = {
        sheet = {
            filename = "__bulk-ore__/graphics/entity/bulk-ore.png",
            priority = "extra-high",
            size = 128,
            frame_count = 8,
            variation_count = 8,
            scale = 0.5
        }
    },
    map_color = {0.2, 0.7, 0.3}, -- TODO, only changes color with new map
    mining_visualisation_tint = { r = 0.5, g = 0.5, b = 0.5, a = 1.0 },
    factoriopedia_simulation = factoriopedia_bulk_ore_simulations
}

local bulk_ore_autoplace_control = {
    type = "autoplace-control",
    name = "bulk-ore",
    localised_name = { "", "[entity=bulk-ore] ", { "entity-name.bulk-ore" } },
    richness = true,
    order = "b-a",
    category = "resource"
}

data:extend({ bulk_ore_resource })
data:extend({ bulk_ore_autoplace_control })