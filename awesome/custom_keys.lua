local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"    }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"    }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control"  }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control"  }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control"  }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"    }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey,           }, "l",      function () awful.tag.incmwfact( 0.05)      end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",      function () awful.tag.incmwfact(-0.05)      end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"    }, "h",      function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"    }, "l",      function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control"  }, "h",      function () awful.tag.incncol( 1, nil, true)      end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control"  }, "l",      function () awful.tag.incncol(-1, nil, true)      end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(  1)          end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"    }, "space", function () awful.layout.inc( -1)          end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control"  }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal(
                    "request::activate", "key.unminimize", {raise = true}
                )
            end
        end,
        {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",      function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),

    -- Launch Blender on the "Blender" tag (Launcher 5)
    awful.key({ }, "XF86Launch5", function ()
        awful.spawn.with_shell("blender &")
        local client = client.get({ class = "Blender" })[1]
        if client then
            local blender_tag = awful.tag.find(awful.screen.focused(), "Blender") -- Use awful.screen.focused()
            if blender_tag then
                client:move_to_tag(blender_tag)
            end
        end
    end,
    {description = "Launch Blender on Blender tag (Launcher 5)", group = "launcher"}),

    -- Launch Lazarus on the "Lazarus" tag (Launcher 6)
    awful.key({ }, "XF86Launch6", function ()
        awful.spawn.with_shell("lazarus &")
        local client = client.get({ class = "Lazarus" })[1]
        if client then
            local lazarus_tag = awful.tag.find(awful.screen.focused(), "Lazarus") -- Use awful.screen.focused()
            if lazarus_tag then
                client:move_to_tag(lazarus_tag)
            end
        end
    end,
    {description = "Launch Lazarus on Lazarus tag (Launcher 6)", group = "launcher"})
)

return globalkeys
