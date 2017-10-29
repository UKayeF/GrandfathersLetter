function setVisionArea(x, y, visionRange)
	vArea = {}
  for i = 0, visionRange do
    for j = 0, visionrange do
      vPos = {}
      vPos.x = x - visionRange + i
      vPos.y = y - visionRange + j
      table.insert(vArea, pos)
    end
  end
  return vArea
end

function testMovement(playerX,playerY, keyPressed)
	if keyPressed == "w" then
		 posX, posY = playerX, playerY - 1
		 tile = tileSet[posY][posX]
		for i = 1, #nA do
			if  nA[i] == tile  then
				return false
			end
		end
		return true
	elseif keyPressed == "s" then
		 posX, posY = playerX, playerY + 1
		 tile = tileSet[posY][posX]
		for i = 1, #nA do
			if  nA[i] == tile  then
				return false
			end
		end
		return true
		elseif keyPressed == "a" then
			 posX, posY = playerX - 1, playerY
			 tile = tileSet[posY][posX]
			for i = 1, #nA do
				if  nA[i] == tile  then
					return false
				end
			end
			return true
		elseif keyPressed == "d" then
			 posX, posY = playerX + 1, playerY
			 tile = tileSet[posY][posX]
			for i = 1, #nA do
				if  nA[i] == tile  then
					return false
				end
			end
			return true
		else

		end
end

	--[[
function setLightCone()
  lightCone{}
  if facing == 0 then
    for i 1,lightRange do
      lCPos = {}
      lCPos.x = playerX
      lCPos.y = playerY - i
      table.insert(lightCone, lCPos)
    end
  elseif facing == 1 then
    for i 1,lightRange do
      lCPos = {}
      lCPos.x = playerX + i
      lCPos.y = playerY
      table.insert(lightCone, lCPos)
    end
  elseif facing == 2 then
    for i 1,lightRange do
      lCPos = {}
      lCPos.x = playerX
      lCPos.y = playerY + i
      table.insert(lightCone, lCPos)
    end
  elseif facing == 3 then
    for i 1,lightRange do
      lCPos = {}
      lCPos.x = playerX - i
      lCPos.y = playerY
      table.insert(lightCone, lCPos)
    end
  end
end]]--
