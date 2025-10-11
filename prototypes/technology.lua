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
    },
    order = "c-a"
}

data:extend({ bulk_ore_separation_technology })