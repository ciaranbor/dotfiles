local awful = require("awful")
local bindings = require("bindings")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local utils = require("utils")

local mytextclock = require("widgets.clock")
local volume = require("widgets.volume")
local net_widget = require("widgets.net")
local mylauncher = require("mywibar.launcher")

local mywibar = {}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ bindings.modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ bindings.modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                {raise = true}
            )
        end
    end),
    awful.button({ }, 3, function()
                             awful.menu.client_list({ theme = { width = 250 } })
                         end),
    awful.button({ }, 4, function ()
                             awful.client.focus.byidx(1)
                         end),
    awful.button({ }, 5, function ()
                             awful.client.focus.byidx(-1)
                         end)
)

local widget_template = {
  {
    {
      id     = 'text_role',
      widget = wibox.widget.textbox,
    },
    left  = beautiful.big_gap,
    right = beautiful.big_gap,
    widget = wibox.container.margin
  },
  id     = 'background_role',
  widget = wibox.container.background,
  -- Add support for hover colors
  create_callback = function(self, tag)
    local bg_empty = table.concat{gears.color(beautiful.taglist_bg_empty):get_rgba()}
    local bg_occupied = table.concat{gears.color(beautiful.taglist_bg_occupied):get_rgba()}
    local bg_hover = table.concat{gears.color(beautiful.taglist_bg_hover):get_rgba()}
    self:connect_signal('mouse::enter', function()
      local bg = table.concat{self.bg:get_rgba()}
      if  bg == bg_empty or bg == bg_occupied then
        self.bg = beautiful.taglist_bg_hover
      end
    end)
    self:connect_signal('mouse::leave', function()
      if table.concat{self.bg:get_rgba()} == bg_hover then
        self.bg = #tag:clients() == 0 and beautiful.taglist_bg_empty or beautiful.taglist_bg_occupied
      end
    end)
  end,
}

function mywibar.init(tags)
    tags = tags or { 1, 2, 3, 4, 5, 6, 7, 8, 9 }
    awful.screen.connect_for_each_screen(function(s)
        -- Each screen has its own tag table.
        awful.tag(tags, s, awful.layout.layouts[1])

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()
        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox(s)
        s.mylayoutbox:buttons(gears.table.join(
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc( 1) end),
            awful.button({ }, 5, function () awful.layout.inc(-1) end)))
        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            style = {
                shape = utils.shape.parallelogram.left
            },
            widget_template = widget_template,
            buttons = taglist_buttons
        }

        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
            buttons = tasklist_buttons
        }

        -- Create the wibox
        s.mywibox = awful.wibar({ position = "top", screen = s, height = beautiful.wibar_height })
        s.title_container = wibox.container.margin()

        -- Add widgets to the wibox
        s.mywibox:setup {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
            },
            {
                layout = wibox.layout.fixed.horizontal,
                s.title_container,
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                spacing = beautiful.negative_gap,
                fill_space = true,

                -- Internet widget
                utils.widget.compose{
                    {
                        net_widget.wired_image,
                        color = beautiful.bg_focus,
                        shape = utils.shape.parallelogram.right,
                        margin = beautiful.gap,
                    },
                    {
                        net_widget.wireless_text,
                        color = beautiful.fg_normal,
                        shape = utils.shape.parallelogram.right
                    },
                    {
                        net_widget.wireless_image,
                        color = beautiful.bg_focus,
                        shape = utils.shape.parallelogram.right,
                        margin = beautiful.gap,
                    }
                },
                -- Audio Volume
                utils.widget.compose{
                    {
                        volume.text,
                        color = beautiful.fg_normal,
                        shape = utils.shape.parallelogram.right
                    },
                    {
                        volume.image,
                        color = beautiful.bg_focus,
                        shape = utils.shape.parallelogram.right,
                        margin = beautiful.gap,
                    }
                },
                -- Clock / Layout / Global Titlebar Buttons
                utils.widget.compose{
                    {
                        mytextclock,
                        color = beautiful.fg_normal,
                        shape = utils.shape.parallelogram.right
                    },
                    {
                        {
                            bindings.mykeyboardlayout,
                            s.mylayoutbox,
                            s.buttonsbox_container,
                            spacing = beautiful.small_gap,
                            layout = wibox.layout.fixed.horizontal
                        },
                        color = beautiful.bg_focus,
                        shape = utils.shape.rightangled.right,
                        margin = beautiful.gap,
                    }
                },
            },
        }
    end)
end

return mywibar
