local keyWindow = {"alt", "cmd"}

local WindowManager = {}

-- window switch.
switcher = hs.window.switcher.new(
  hs.window.filter.new()
    :setAppFilter('Emacs', {allowRoles = '*', allowTitles = 1}), -- make emacs window show in switcher list
  {
    showTitles = false,		-- don't show window title
    thumbnailSize = 240,		-- window thumbnail size
    showSelectedThumbnail = false,	-- don't show bigger thumbnail
    backgroundColor = {0.14, 0.17, 0.2, 1.0}, -- background color
    highlightColor = {0, 0, 0, 0.4}, -- selected color
  }
)
hs.hotkey.bind("alt", "tab", function() switcher:next() end)
hs.hotkey.bind("alt-shift", "tab", function() switcher:previous() end)

function WindowManager.center(window)
  if window then
    local frame = hs.screen.mainScreen():frame()
    frame.x = frame.w/4
    frame.w = frame.w/2
    window:setFrame(frame)
  end
end

function WindowManager.right(window)
  if window then
    local frame = hs.screen.mainScreen():frame()
    frame.x = frame.x + (frame.w/2)
    frame.w = frame.w/2
    window:setFrame(frame)
  end
end

function WindowManager.left(window)
  if window then
    local frame = hs.screen.mainScreen():frame()
    frame.w = frame.w/2
    window:setFrame(frame)
  end
end

function WindowManager.top(window)
  if window then
    local frame = hs.screen.mainScreen():frame()
    frame.h = frame.h/2
    window:setFrame(frame)
  end
end

function WindowManager.bottom(window)
  if window then
    local frame = hs.screen.mainScreen():frame()
    frame.y = frame.y + (frame.h/2)
    frame.h = frame.h/2
    window:setFrame(frame)
  end
end

function WindowManager.maximize(window)
  if window then
    window:setFrame(hs.screen.mainScreen():fullFrame())
  end
end

function WindowManager.minimize(window)
  if window then
    window:setFrame()
  end
end

function WindowManager.fullscreen(window)
  if window then
    window:setFullScreen(not window:isFullScreen())
  end
end

function WindowManager:init()
  --no window animations--
      hs.window.animationDuration = 0

      --window right half of screen--
      hs.hotkey.bind(keyWindow, "l", function()
                       WindowManager.right(hs.window.focusedWindow())
      end)

      --window left half of screen--
      hs.hotkey.bind(keyWindow, "h", function()
                       WindowManager.left(hs.window.focusedWindow())
      end)

      --window top half of screen--
      hs.hotkey.bind(keyWindow, "k", function()
                       WindowManager.top(hs.window.focusedWindow())
      end)

      --window bottom half of screen--
      hs.hotkey.bind(keyWindow, "j", function()
                       WindowManager.bottom(hs.window.focusedWindow())
      end)

      --window maximize screen--
      hs.hotkey.bind(keyWindow, "m", function()
                       WindowManager.maximize(hs.window.focusedWindow())
      end)

      --window center screen--
      hs.hotkey.bind(keyWindow, "c", function()
                       WindowManager.center(hs.window.focusedWindow())
      end)

      --window fullscreen--
      hs.hotkey.bind(keyWindow,"f",function()
                       WindowManager.fullscreen(hs.window.focusedWindow())
      end)
end

return WindowManager
