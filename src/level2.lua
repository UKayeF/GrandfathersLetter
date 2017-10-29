function createOuterWalls2()
  for i = 2, 28 do
    tileSet[1][i] = wH
    tileSet[16][i] = wH
  end
  for i = 1, 16 do
    tileSet[i][1] = wV
    tileSet[i][29] = wV
  end
end

function createInnerWalls2()
  for i = 1, 6 do
    tileSet[i][13] = wV
    tileSet[i][17] = wV
  end
  for i = 10, 15 do
    tileSet[i][19] = wV
  end
  for i = 7, 9 do
    tileSet[i][5] = wV
  end
  tileSet[2][15] = wV
  tileSet[2][14] = wH
  tileSet[3][15] = wH
  tileSet[3][16] = wH
  for i = 2, 4 do
    tileSet[7][i] = wH
  end
  for i = 6, 13 do
    tileSet[7][i] = wH
  end
  for i = 17, 28 do
    tileSet[7][i] = wH
  end
  for i = 2, 18 do
    tileSet[10][i] = wH
  end
  for i = 20, 28 do
    tileSet[10][i] = wH
  end
end

function createDoors2()
  tileSet[7][24] = dHO
  tileSet[10][15] = dHO
  tileSet[10][21] = dHO
  -- ab hier vertikale türen
  tileSet[5][13] = dVO
  tileSet[5][17] = dVO
  if closetDoorObj.open then tileSet[8][5] = dVO
  else tileSet[8][5] = dV
  end
end

function createObjects2()
  tileSet[3][14] = sC
  if not hasKey2 then
    tileSet[2][10] = pup
  else tileSet[2][10] = cheapVfx
  end
  if hasLadder then tileSet[8][2] = g
  else tileSet[8][2] = lad
  end
  for i = 2, 13 do
    tileSet[11][i] = bS
    tileSet[13][i] = bS
  end
  if ladderPlaced then tileSet[14][23] = lad
  else tileSet[14][23] = cH
  end
end
