local MonitorManager = {}

local hyper = {"alt", "cmd"}

function MonitorManager.move(win, direction)
  if not win then
    return
  end
  if direction == "left" then
    local s = win:screen():toWest()
  elseif direction == "right" then
    local s = win:screen():toEast()
  end
  if s then
    win:moveToScreen(s)
  end
end

function MonitorManager:init()
  -- move to left screen
  hs.hotkey.bind(hyper, ",", function()
                   self.move(hs.window.focusedWindow(), "left")
  end)

  -- move to right screen
  hs.hotkey.bind(hyper, ".", function()
                   self.move(hs.window.focusedWindow(), "right")
  end)
end

return MonitorManager
