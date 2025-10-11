local item_sounds = require("__base__.prototypes.item_sounds")

local bulk_ore_item = {
    type = "item",
    name = "bulk-ore",
    icon = "__bulk-ore__/graphics/icons/bulk-ore.png",
    pictures =
    {
        { size = 64, filename = "__bulk-ore__/graphics/icons/bulk-ore.png",   scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__bulk-ore__/graphics/icons/bulk-ore-1.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__bulk-ore__/graphics/icons/bulk-ore-2.png", scale = 0.5, mipmap_count = 4 },
        { size = 64, filename = "__bulk-ore__/graphics/icons/bulk-ore-3.png", scale = 0.5, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "b[bulk-ore]",
    stack_size = 50,
    weight = 2 * kg,
    default_import_location = "nauvis",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_move,
    drop_sound = item_sounds.resource_inventory_move
}

data:extend({ bulk_ore_item })
