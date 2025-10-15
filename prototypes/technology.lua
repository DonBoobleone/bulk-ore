local bulk_ore_separation_technology = {
    type = "technology",
    name = "ore-separation",
    icon = "__bulk-ore__/graphics/technology/bulk-ore-separation-technology.png",
    icon_size = 256,
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
    }
}

local bulk_ore_washing_technology = {
    type = "technology",
    name = "ore-washing",
    icon = "__bulk-ore__/graphics/technology/bulk-ore-washing-technology.png",
    icon_size = 256,
    prerequisites = { "ore-separation", "sulfur-processing" },
    effects = {
        {
            type = "unlock-recipe",
            recipe = "bulk-ore-washing"
        }
    },
    unit =
    {
        count = 50,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack", 1 }
        },
        time = 30
    },
}

data:extend({ bulk_ore_separation_technology })
data:extend({ bulk_ore_washing_technology })
