function love.load()
	require('./src/eventTrigger')
	require('./src/level1')
	playerX, playerY,facing, x,y,w,h =5,5,0, 0, 0, 1920, 1080
  elkX, elkY, elkFacing, garlicX, garlicY, garlicFacing = 25, 3, 0, 3, 3, 0
  vampireX, vampireY, vampireFacing, stairCaseX, stairCaseY = 16, 5, 0, 16, 3
  hasKey1, hasGarlic = false, false
	ghost = love.graphics.newImage("DisturbedGuy.png")
	g = love.graphics.newImage("Fliesenmuster.png")
	wV = love.graphics.newImage("Wall_Vertical.png")
	wH = love.graphics.newImage("Wall_Horizontal.png")
	dV = love.graphics.newImage("VerticalDoor.png")
	dH = love.graphics.newImage('Door_Horizontal.png')
	darkness = love.graphics.newImage("Black.png")
	player  =  love.graphics.newImage("Balotelli.png")
	ghostTable = {}
	cheapVfx = love.graphics.newImage("crappyExplosion.png")
	monster = {}
	monster.x, monster.y = 1, 1
	mainFont = love.graphics.newFont(20)
	largeFont = love.graphics.newFont(64)
	tileSet = {}
	setTiles()
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	createInnerWalls()
	createOuterWalls()
	createDoors()
	love.graphics.setColor(224, 224, 224)
	love.graphics.rectangle("fill", x, y, w, h)
	createMesh()
	--createFloor()
	drawTiles(darkness)

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
	if inRange(1, ghostTable.ghostP) then
		youDied()
	end
	triggerEventsLevel1()
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

function inRange(a, b)
	if  math.abs(playerY - b.y) + math.abs(playerX - b.x) <= a  then
	return true
	else
	return false
	end
end

function youDied()
	love.graphics.setColor(0,0,0)
	love.graphics.rectangle("fill", 480, 240, 960, 600)
	love.graphics.setColor(224, 64, 64)
	love.graphics.setFont(largeFont)
	love.graphics.print("You Died!", 720, 480)
end

function setTiles()
	for i = 1, 33 do
		tileSet[i] = {}
		for j = 1, 47 do
				tileSet[i][j] = g
		end
	end
end

function drawTiles(a)
	love.graphics.setColor(255,255,255)
	for py = 1, #tileSet do
		for px = 1, #tileSet[py] do
			a = tileSet[py][px]
			draw(a, px, py)
		end
	end
end
