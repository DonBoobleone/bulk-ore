local bulk_ore_separation_technology = {
    type = "technology",
    name = "ore-separation",
    icons = {
        {
            icon = "__bulk-ore__/graphics/icons/recycling.png",
            scale = 1
        },
        {
            icon = "__base__/graphics/icons/uranium-ore.png",
            scale = 0.5,
            shift = {55, 0}
        },
        {
            icon = "__base__/graphics/icons/copper-ore.png",
            scale = 0.5,
            shift = {15, 55}
        },
        {
            icon = "__base__/graphics/icons/coal.png",
            scale = 0.5,
            shift = {-48, 34}
        },
        {
            icon = "__base__/graphics/icons/stone.png",
            scale = 0.5,
            shift = {-48, -34}
        },
        {
            icon = "__base__/graphics/icons/iron-ore.png",
            scale = 0.5,
            shift = {15, -55}
        },
        {
            icon = "__bulk-ore__/graphics/icons/bulk-ore.png",
            scale = 0.75
        },
        {
            icon = "__bulk-ore__/graphics/icons/recycling-top.png",
            scale = 1
        }
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "bulk-ore-recycling"
        }
    },
    prerequisites = nil,
    research_trigger = {
        type = "mine-entity",
        entity = "bulk-ore"
    },
    order = "c-a"
}

data:extend({ bulk_ore_separation_technology })