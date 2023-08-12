Config = {}

Config.LootZones =
{
    {
        -- Zone CONFIGURATION --
        zoneCoords = vec3(-2360.8940, 3067.3999, 32.8264),
        radius = 20.0, -- need to have .0
        EnableDebug = false,
        -- BLIP CONFIGURATION --
        EnableBlip = true,
        blipName = 'Looting Zone',
        blipSprite = 436,     --https://docs.fivem.net/docs/game-references/blips/
        blipColor = 50,       -- https://docs.fivem.net/docs/game-references/blips/
        blipCircleColor = 50, --https://docs.fivem.net/docs/game-references/blips/
        -- NOTIFY CONFIGURATION --
        EnableJoinNotify = true,
        EnableLeaveNotify = true,
        AllNotifyPosition =
        'top' -- 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left' (if you use lib.notify)
    }
}
