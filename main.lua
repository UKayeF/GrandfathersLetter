function love.load()
	require('./src/eventTrigger')
	require('./src/level1')
	require('./src/functions')
	require('./src/level2')
	--  Alle Sprites hier rein! --
	g = love.graphics.newImage("spritesheets/Fliesenmuster.png")
	ghost = love.graphics.newImage("spritesheets/DisturbedGuy.png")
	wV = love.graphics.newImage("spritesheets/Wall_Vertical.png")
	wH = love.graphics.newImage("spritesheets/Wall_Horizontal.png")
	dV = love.graphics.newImage("spritesheets/VerticalDoor.png")
	dH = love.graphics.newImage('spritesheets/Door_Horizontal.png')
	vBtW = love.graphics.newImage('spritesheets/Vampire.png')
	storeCabinet = love.graphics.newImage('spritesheets/storeCabinet.png')
	elkHeadOnTheWall = love.graphics.newImage('spritesheets/Moose.png')
	sC = love.graphics.newImage('spritesheets/Staircase.png')
	darkness = love.graphics.newImage("spritesheets/Black.png")
	player  =  love.graphics.newImage("spritesheets/BoyI.png")
	cheapVfx = love.graphics.newImage("spritesheets/crappyExplosion.png")
	pup = love.graphics.newImage("spritesheets/Puppet.png")
	lad = love.graphics.newImage("spritesheets/Ladder.png")
	bS = love.graphics.newImage("spritesheets/Bookshelf.png")
	cH = love.graphics.newImage("spritesheets/ceilingHatch.png")
	dVO = love.graphics.newImage("spritesheets/doorVerticalOpen.png")
	--  Globale Variablen hier rein! --
	currentLevel, playerX, playerY,facing, x,y,w,h = 2, 15,15,0, 0, 0, 1920, 1080
	-- für Level 1--
	monster, moose, garlicObj, vampireObj, stairCaseObj, ghostTable, tileSet = {}, {}, {}, {}, {}, {}, {}
	vampireObj.x, vampireObj.y, stairCaseObj.x, stairCaseObj.y, monster.x, moose.x, garlicObj.x, monster.y, moose.y, garlicObj.y = 16, 4, 16, 3,1, 25, 3, 1, 2, 2
	hasKey1, hasGarlic, moose.hasVisited, vampireObj.isDead  = false, false, false, false
	-- für Level 2 --
	ladderObj, noteObj, hatchObj, puppetObj, closetDoorObj = {}, {}, {}, {}, {}
	ladderObj.x, ladderObj.y, noteObj.x, noteObj.y, hatchObj.x, hatchObj.y, puppetObj.x, puppetObj.y, closetDoorObj.x, closetDoorObj.y = 2, 8, 2, 11, 23, 14, 10, 2, 5, 8
	hasKey2, closetDoorObj.open, hasLadder, ladderPlaced, level1Completed = false, false, false, false, false
	mainFont = love.graphics.newFont(20)
	largeFont = love.graphics.newFont(64)
	setTiles()
end

function love.update()
	if level1Completed then
		currentLevel = 2
	end
end


function love.draw()
	love.graphics.setColor(255, 255, 255)
	if currentLevel == 1 then
		createInnerWalls()
		createOuterWalls()
		createDoors()
		createObjects()
	elseif currentLevel == 2 then
		createInnerWalls2()
		createOuterWalls2()
		createDoors2()
		createObjects2()
	end
	love.graphics.setColor(224, 224, 224)
	love.graphics.rectangle("fill", x, y, w, h)
	createMesh()
	--createFloor()
	drawTiles()
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
	if currentLevel == 1 then
		triggerEventsLevel1()
	elseif currentLevel == 2 then
		triggerEventsLevel2()
	end
end


function love.keypressed(key)
	keyP = key
	if (testMovement(playerX, playerY,keyP)) == true then
		if keyP == "w"
		then	playerY, facing = playerY - 1, 0
		elseif keyP == "s"
		then	playerY, facing = playerY + 1, 2
		elseif keyP == "a"
		then	playerX, facing = playerX - 1, 3
		elseif keyP == "d"  then
			playerX, facing = playerX + 1, 1
		end
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
	if  math.abs(playerY - b.y) + math.abs(playerX - b.x) == a  then
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

function drawTiles()
	love.graphics.setColor(255,255,255)
	for py = 1, #tileSet do
		for px = 1, #tileSet[py] do
			a = tileSet[py][px]
			draw(a, px, py)
		end
	end
end
