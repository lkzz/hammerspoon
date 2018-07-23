local MonitorManager = {}

local hyper = {"alt", "cmd"}

-- move application to screen
function MonitorManager.move(win, direction)
  if not win then
    return
  end
  local s = nil
  if direction == "left" then
    s = win:screen():toWest()
  elseif direction == "right" then
    s = win:screen():toEast()
  end
  if s then
    win:moveToScreen(s)
  end
end

--Predicate that checks if a window belongs to a screen
function isInScreen(screen, win)
  return win:screen() == screen
end

-- focus to screen
function MonitorManager.focus(screen)
  --Get windows within screen, ordered from front to back.
  --If no windows exist, bring focus to desktop. Otherwise, set focus on
  --front-most application window.
  local windows = hs.fnutils.filter(hs.window.orderedWindows(), hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()

  -- Move mouse to center of screen
  local pt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(pt)
end


function MonitorManager:init()
  -- move to left screen
  hs.hotkey.bind(hyper, "[", function()
                   self.move(hs.window.focusedWindow(), "left")
  end)

  -- move to right screen
  hs.hotkey.bind(hyper, "]", function()
                   self.move(hs.window.focusedWindow(), "right")
  end)

  -- change screen focus
  hs.hotkey.bind(hyper, "o", function ()
                   self.focus(hs.window.focusedWindow():screen():next())
  end)

end

return MonitorManager
