local iron_yield = settings.startup["iron-yield"].value
local copper_yield = settings.startup["copper-yield"].value
local coal_yield = settings.startup["coal-yield"].value
local stone_yield = settings.startup["stone-yield"].value
local uranium_yield = settings.startup["uranium-yield"].value

local basic_resource_results = {
    { type = "item", name = "iron-ore",    amount = 1, probability = iron_yield / 100,    show_details_in_recipe_tooltip = false },
    { type = "item", name = "copper-ore",  amount = 1, probability = copper_yield / 100,  show_details_in_recipe_tooltip = false },
    { type = "item", name = "coal",        amount = 1, probability = coal_yield / 100,    show_details_in_recipe_tooltip = false },
    { type = "item", name = "stone",       amount = 1, probability = stone_yield / 100,   show_details_in_recipe_tooltip = false },
    { type = "item", name = "uranium-ore", amount = 1, probability = uranium_yield / 100, show_details_in_recipe_tooltip = false }
}

local bulk_ore_separation_recipe =
{
    type = "recipe",
    name = "bulk-ore-recycling", -- '-recycling' in name needed for recycler to work
    icons = {
        {
            icon = "__bulk-ore__/graphics/icons/recycling.png"
        },
        {
            icon = "__bulk-ore__/graphics/icons/bulk-ore.png",
            scale = 0.4,
        },
        {
            icon = "__bulk-ore__/graphics/icons/recycling-top.png"
        }
    },
    category = "recycling-or-hand-crafting",
    additional_categories = { "centrifuging" }, -- possibly "crushing" 
    subgroup = "raw-resource",
    order = "b[bulk-ore]-a[bulk-ore-recycling]",
    enabled = false,
    auto_recycle = false,
    energy_required = 0.2,
    ingredients = { { type = "item", name = "bulk-ore", amount = 1 } },
    always_show_made_in = true,
    results = basic_resource_results
}

-- Enable easy sorting (allows ore separation in basic crafting category machines)
if settings.startup["easy-sorting"].value then
    table.insert(bulk_ore_separation_recipe.additional_categories, "crafting")
end

data:extend({ bulk_ore_separation_recipe })