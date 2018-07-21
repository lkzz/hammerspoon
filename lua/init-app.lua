local AppManager = {}

local leader = {"alt", "cmd"}

local key2App = {
  e = 'Emacs',
  g = 'Google Chrome',
  i = 'iTerm',
  w = 'WeChat',
}

-- Toggle an application between being the frontmost app, and being hidden
function AppManager.toggle(app)
  local app = hs.application.find(app)

  if not app then
    -- application not running, launch app
    application.launchOrFocus(app)
    return
  end

  -- application running, toggle hide/unhide
  local win = app:mainWindow()
  if win then
    if true == app:isFrontmost() then
      win:application():hide()
    else
      win:application():activate(true)
      win:application():unhide()
      win:focus()
    end
  else
    -- no windows, maybe hide
    if true == app:hide() then
      -- focus app
      hs.application.launchOrFocus(app)
    else
      -- nothing to do
    end
  end
end

function AppManager:init()
  for key, app in pairs(key2App) do
    hs.hotkey.bind(leader, key, function() AppManager.toggle(app) end)
  end
end

return AppManager
