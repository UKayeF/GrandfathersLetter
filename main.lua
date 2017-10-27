function love.load()
	x,y,w,h = 0, 0, 1920, 1080
--	ghost = love.graphics.newImage("Ghost.png")
end

function love.draw()
	love.graphics.setColor(224, 224, 224)
	love.graphics.rectangle("fill", x, y, w, h)
	createMesh()
end

function createMesh() 
	love.graphics.setColor(192,128,128)	
	for i = 0, 1914, 66 do
		love.graphics.line(i,0,i, 1056)
	end
	for j = 0, 1056, 66 do
		love.graphics.line(0,j,1914,j)
	end
end
