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

function adjust_washing_yield_amount(results, multiplier)
    local adjusted_results = {}
    for _, result in ipairs(results) do
        local new_result = {}
        for key, value in pairs(result) do
            new_result[key] = key == "amount" and value * multiplier or value
        end
        table.insert(adjusted_results, new_result)
    end
    return adjusted_results
end

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
-- Might need to be deprecated if washing is better.
if settings.startup["easy-sorting"].value then
    table.insert(bulk_ore_separation_recipe.additional_categories, "crafting")
end

local additional_recipie_cataegories = nil
if mods["space-age"] then
    additional_recipie_cataegories = { "chemistry-or-cryogenics" }
end

local bulk_ore_washing_recipe =
{
    type = "recipe",
    name = "bulk-ore-washing",
    icons = {
        {
            icon = "__bulk-ore__/graphics/icons/bulk-ore.png",
            scale = 0.4,
            shift = { 0, 4 }
        },
        {
            icon = "__base__/graphics/icons/fluid/water.png",
            scale = 0.25,
            shift = { -8, -8 }
        },
        {
            icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
            scale = 0.25,
            shift = { 8, -8 }
        }
    },
    category = "chemistry",
    additional_categories = additional_recipie_cataegories,
    subgroup = "raw-resource",
    order = "b[bulk-ore]-a[bulk-ore-washing]",
    enabled = false,
    auto_recycle = false,
    energy_required = 2,
    ingredients = {
        { type = "item",  name = "bulk-ore",      amount = 10 },
        { type = "fluid", name = "water",         amount = 100 },
        { type = "fluid", name = "sulfuric-acid", amount = 1 }
    },
    always_show_made_in = true,
    allow_productivity = true,
    results = adjust_washing_yield_amount(basic_resource_results, 11)
}

data:extend({ bulk_ore_separation_recipe })
data:extend({ bulk_ore_washing_recipe })
