function love.run()

	function love.keypressed(k)
		if k == "escape" then
			if active then
				anim.done()
				active = false
			else love.event.quit() end
		elseif k == "space" then
			if not playing then
				anim.start()
				playing = true
			else
				if anim.advance then anim.advance() end
			end
		end
	end
	
	animations = {}
	enable_audio = true
	
	love.graphics.setBackgroundColor(0, 0, 0, 1)
	love.graphics.setDefaultFilter("nearest", "nearest")
	
	local arg = love.arg.parseGameArguments(arg)[1]
	if love.filesystem.isFused() then
		if arg then
			local filename = arg:gsub("\\", "/"):match(".*%/([^%/]*)")
			local animation = filename:gsub(".zip", "")
			local file = io.open(arg, "rb"):read("a")
			local data = love.filesystem.newFileData(file, filename)
			love.filesystem.mount(data, "data")
			anim = love.filesystem.load("data/" .. animation .. ".lua")()
		else
			love.event.quit()
		end
	end
	
	anim.init()
	active = true
	
	return function()
	
		love.event.pump()
		for name, a,b,c,d,e,f in love.event.poll() do
			if name == "quit" then
				if not love.quit or not love.quit() then
					return a or 0
				end
			end
			love.handlers[name](a,b,c,d,e,f)
		end
		
		if active then
			anim.draw()
			if playing then anim.update() end
		else
			love.graphics.clear(0, 0, 0, 0)
		end
		love.graphics.present()
		
		love.timer.sleep(0.001)
	
	end
end