function setVisionArea(x, y, visionRange)
	vArea = {}
  for i 0, visionRange do
    for j 0, visionrange do
      vPos = {}
      vPos.x = x - visionRange + i
      vPos.y = y - visionRange + j
      table.insert(vArea, pos)
    end
  end
  return vArea
end

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
end
