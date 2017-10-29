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
		local posX, posY = playerX, playerY - 1
		local tile = tileSet[posY][posX]
		if tile ~= wV and tile ~= wH then
			return true
		end
		elseif keyPressed == "s" then
		local posX, posY = playerX, playerY + 1
		local tile = tileSet[posY][posX]
		if tile ~= wV and tile ~= wH then
			return true
		end
		elseif keyPressed == "a" then
			local posX, posY = playerX - 1, playerY
			local tile = tileSet[posY][posX]
			if tile ~= wV and tile ~= wH then
				return true
			end
		elseif keyPressed == "d" then
			local posX, posY = playerX + 1, playerY
			local tile = tileSet[posY][posX]
			if tile ~= wV and tile ~= wH then
				return true
			end
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
