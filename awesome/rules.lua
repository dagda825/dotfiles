-- these are my auto loading programs. I like to have all the programs I use load automatically on log in.
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_focus,
                     border_color = beautiful.border_focus,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },

    -- Set Firefox to always map on tag number 1:
    { rule = { class = "Blender" },
      properties = { tag = awful.tag.getidx(1) } },

    -- Set Thunderbird to always map on tag number 2:
    { rule = { class = "Lazarus" },
      properties = { tag = awful.tag.getidx(2) } },

    -- ... more rules ...
}

--client.connect_signal("manage", function(c)
    ---- Apply initial properties or actions to new clients
    ---- This might include setting default tags if not handled by rules
--end)

---- You can include other client signal handlers here as well
--client.connect_signal("focus", function(c)
    ---- Actions to take when a client gains focus
--end)
