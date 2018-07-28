-- refer link: https://emacs-china.org/t/topic/6348

local function Chinese()
  hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
end

local function English()
  hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

local function set_app_input_method(app_name, set_input_method_function, event)
  event = event or hs.window.filter.windowFocused
  hs.window.filter.new(app_name)
  :subscribe(event, function() set_input_method_function() end)
end

set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
set_app_input_method('Spotlight', English, hs.window.filter.windowCreated)
set_app_input_method('Alfred 3', English, hs.window.filter.windowCreated)
set_app_input_method('Emacs', English)
set_app_input_method('iTerm2', English)
set_app_input_method('Google Chrome', English)
set_app_input_method('WeChat', Chinese)
set_app_input_method('WeChat Work', Chinese)
set_app_input_method('QQ', Chinese)
set_app_input_method('微信', Chinese)
set_app_input_method('企业微信', Chinese)

-- ctrl_cmd_. show current application name and input method name.
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
                    ..hs.window.focusedWindow():application():path()
                    .."\n"
                    .."App name:      "
                    ..hs.window.focusedWindow():application():name()
                    .."\n"
                    .."IM source id:  "
                    ..hs.keycodes.currentSourceID())
end)
