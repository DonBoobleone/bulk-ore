require("prototypes.item")
require("prototypes.recipe")
require("prototypes.resource")
require("prototypes.technology")

-- Register ore to planet
data.raw.planet.nauvis.map_gen_settings.autoplace_controls["bulk-ore"] = {}
data.raw.planet.nauvis.map_gen_settings.autoplace_settings.entity.settings["bulk-ore"] = {}