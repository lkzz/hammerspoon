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

-- window manager
local win = require 'lua/init-window'
win:init()

-- app manager
local app = require 'lua/init-app'
app:init()
-- screen manager
local screen = require 'lua/init-screen'
screen:init()

-- input method manager
require 'lua/init-inputmethod'

-- config auto reload.
local load = require 'lua/init-reload'
load:init()

