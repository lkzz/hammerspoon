-- my personal hammerspoon config file.

--[[
  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  iMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]


-- window switch.
switcher = hs.window.switcher.new(
  hs.window.filter.new()
    :setAppFilter('Emacs', {allowRoles = '*', allowTitles = 1}), -- make emacs window show in switcher list
  {
    showTitles = false,		-- don't show window title
    thumbnailSize = 240,		-- window thumbnail size
    showSelectedThumbnail = false,	-- don't show bigger thumbnail
    backgroundColor = {0, 0, 0, 0.8}, -- background color
    highlightColor = {0.5, 0.5, 0.5, 0.8}, -- selected color
  }
)
hs.hotkey.bind("alt", "tab", function() switcher:next() end)
hs.hotkey.bind("alt-shift", "tab", function() switcher:previous() end)


-- window manager
local win = require 'init-window'
win:init()


-- config auto reload.
local load = require 'init-reload'
load:init()
