local lush = require("lush")
local hsl = lush.hsl

return {
    -- Background
    base    = hsl(248, 33, 16),
    surface = hsl(248, 33, 26),

    -- Foreground
    normal  = hsl(248, 67, 96),
    subtle  = hsl(248, 71, 84),
    muted   = hsl(248, 38, 49),
    accent  = hsl( 15, 99, 88),

    -- Color Palette
    red     = hsl(345, 86, 78),
    orange  = hsl( 35, 86, 77),
    yellow  = hsl( 85, 87, 76),
    green   = hsl(135, 87, 76),
    blue    = hsl(185, 86, 77),
    purple  = hsl(235, 86, 78),
    pink    = hsl(295, 86, 78)
}
