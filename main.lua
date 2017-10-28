function love.load()
	playerX, playerY, x,y,w,h =15,15, 0, 0, 1920, 1080
	ghost = love.graphics.newImage("Ghost.png")
	g = love.graphics.newImage("Fliesenmuster.png")
	wV = love.graphics.newImage("Wall_Vertical.png")
	wH = love.graphics.newImage("Wall_Horizontal.png")
	dH = love.graphics.newImage("Door_Horizontal.png")
	player  =  love.graphics.newImage("Balotelli.png")
	ghostTable = {}
	cheapVfx = love.graphics.newImage("crappyExplosion.png")
 
end

function love.draw()
	love.graphics.setColor(224, 224, 224)
	love.graphics.rectangle("fill", x, y, w, h)
	createMesh()
	createFloor()
	for i = 1, 29, 1 do
		draw(wH, i, 1)
		draw(wH, i, 16)
	end
	for i = 1, 16, 1 do 
		draw(wV, 1, i)
		draw(wV, 29, i)
	end
	love.graphics.setColor(255,255,255)
	--love.graphics.draw(ghost, 1, 1)
	draw(ghost, 3, 3)
	ghostTable.ghostP = {}
	ghostTable.ghostP.x, ghostTable.ghostP.y = 3, 3 
	draw(player, playerX, playerY)
	for key, val in pairs(ghostTable)  do 
		if val.x == playerX and val.y == playerY then
		draw(cheapVfx, playerX, playerY)
		end
	end
end

function love.keypressed(key)
	keyP = key
	if keyP == "w"
	then	playerY = playerY - 1
	elseif keyP == "s"
	then	playerY = playerY + 1 
	elseif keyP == "a"
	then	playerX = playerX - 1
	elseif keyP == "d"  then
		playerX = playerX + 1
	end
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

function draw(object,posX, posY)
	posX, posY = posX -1 , posY -1
	ax, ay = posX * 66, posY * 66
	love.graphics.draw(object, ax, ay)
end

function createFloor()
	love.graphics.setColor(255,255,255)
	for i = 0, 29, 1 do
		for j = 0, 16, 1 do
			draw(g, i, j)
		end
	end
end
