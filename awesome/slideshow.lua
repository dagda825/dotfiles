-- Require necessary modules
local gears = require("gears")
local awful = require("awful")

-- Define the scandir function
local function scandir(directory, filter)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('ls "'..directory..'"'):lines() do
        if not filter or filter(filename) then
            i = i + 1
            t[i] = filename
        end
    end
    return t
end

---- Set up wallpaper
--local timer_length = 1 * 60
--local wp_index = 1
--local wp_path = "/home/jon/Pictures/Starships/"
--local wp_filter = function(s) return string.match(s, "%.png$") or string.match(s, "%.jpg$") end
--local wp_files = scandir(wp_path, wp_filter)

--gears.timer.start_new(timer_length, function()
    --for s = 1, screen.count() do
        --gears.wallpaper.maximized(wp_path .. wp_files[wp_index], s, true)
    --end
    --math.randomseed(os.time())
    --wp_index = math.random(1, #wp_files)
    --return true
--end)
local timer_length = 5 * 60
local wp_path = "/home/jon/Pictures/Starships/"
local wp_filter = function(s) return string.match(s, "%.png$") or string.match(s, "%.jpg$") end
local wp_files = scandir(wp_path, wp_filter)
local screen_indices = {}

gears.timer.start_new(timer_length, function()
    math.randomseed(os.time())
    for s = 1, screen.count() do
        local new_index
        repeat
            new_index = math.random(1, #wp_files)
        until new_index ~= screen_indices[s] -- Ensure it's different from the current one (optional)

        screen_indices[s] = new_index
        gears.wallpaper.maximized(wp_path .. wp_files[screen_indices[s]], s, true)
    end
    return true
end)
