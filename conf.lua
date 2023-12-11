function love.conf(t)
	t.identity              = "binary_animations"

	t.window.title          = "Binary Animations"
	t.window.icon           = "er.png"
	t.window.fullscreen     = true
	t.window.fullscreentype = "desktop"

	t.modules.joystick      = false
	t.modules.physics       = false
	t.modules.thread        = false
	t.modules.touch         = false
end