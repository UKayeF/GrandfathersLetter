function createGhost (x, y) -- creates a ghost. returns the new ghost
	ghost = {}
	ghost.xPos = x
	ghost.yPos = y
	draw ()
	ghost.status = 0 -- 0 = playerNotVisible, 1 = playerVisible, 2 = inLightCone
	ghost.visionRange = 3
	ghost.visonArea = visionArea(ghost.xPos, ghost.yPos, ghost.visionRange)
	return ghost
end

function checkSetStatus(ghost) --checks and sets the status of a ghost. returns the ghost with the new status
	xRelPos = playerX - ghost.xPos
	yRelPos = playerY - ghost.yPos
	xDist = math.abs(xRelPos)
	yDist = math.abs(yRelPos)
	gSP = ghostSeesPlayer(ghost)
	iLC = inLightCone(ghost)
	if gSP and not iLC then
		ghost.status = 1
	elseif iLC then
		ghost.status = 2
	else
		ghost.status = 0
	end
	return ghost
end

function ghostSeesPlayer (ghost) --checks if the player is in the visionrange of a ghost. retruns true if this is the case
	for i,v in ipairs(ghost.visionArea) do
		if ghost.xPos == v.x and ghost.yPos == v.y then
			return true
		end
	end
	return false
end

function inLightCone(ghost) -- checks if a ghost is in the Lightcone. returns true if this is the case
	for i,v in ipairs(lightCone) do
		if ghost.xPos == v.x and ghost.yPos == v.x then
			return true
		end
	end
	return false
end


function moveGhost(ghost) -- sets new Position and visionArea for a ghost, according to his status. returns the changed ghost
	if ghost.xPos == 1 then ghost.xPos = ghost.xPos + 1
	elseif ghost.xPos == xMax then ghost.xPos = ghost.xPos - 1
	elseif ghost.yPos == 1 then ghost.yPos = ghost.xPos + 1
	elseif ghost.yPos == yMax then ghost.yPos = ghost.xPos - 1
	elseif ghost.status == 0 then
		direction = math.random(4)
		if direction == 1 then ghost.yPos = ghost.yPos - 1
		elseif direction == 2 then ghost.xPos = ghost.xPos + 1
		elseif direction == 3 then ghost.yPos = ghost.yPos + 1
		elseif direction == 4 then ghost.xPos = ghost.xPos - 1
		end
	elseif ghost.status == 1 then
		xRelPos = playerX - ghost.xPos
		yRelPos = playerY - ghost.yPos
		if xRelPos ~= 0 and yRelPos ~= 0 then
			direction = math.random(2)
			if direction == 1 then ghost = moveGhostX(ghost, yRelPos)
			elseif direction == 2 then ghost = moveGhostY(ghost, yRelPos)
			end
		elseif xRelPos ~= 0 then
		 ghost = moveGhostX(ghost, yRelPos)
		elseif yRelPos ~= 0 then
			ghost = moveGhostY(ghost, yRelPos)
		end
	elseif ghost.status == 2 then
		if facing == 0 then ghost.yPos = ghost.yPos -1
		elseif facing == 1 then ghost.xPos = ghost.xPos +1
		elseif facing == 2 then ghost.yPos = ghost.yPos +1
		elseif facing == 1 then ghost.xPos = ghost.xPos -1
		end
	end
	ghost.visionArea = setVisionArea(ghost.xPos, ghost.yPos, ghost.visionRange)
	return ghost
end

function moveGhostX(ghost, xRelPos)  -- moves a ghost one tile on the x-axis towards the player. returns a ghost with the new Position
	if xRelPos < 0 then
		ghost.xPos = ghost.xPos + 1
	elseif xRelPos > 0 then
		ghost.xPos = ghost.xPos - 1
	end
	return ghost
end

function moveGhostY(ghost, yRelPos)  -- moves a ghost one tile on the y-axis towards the player. returns a ghost with the new Position
	if xRelPos < 0 then
		ghost.xPos = ghost.xPos + 1
	elseif xRelPos > 0 then
		ghost.xPos = ghost.xPos - 1
	end
	return ghost
end
