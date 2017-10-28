function createOuterWalls()
  for i = 2, 28 do
    tileSet[1][i] = wH
    tileSet[16][i] = wH
  end
  for i = 1, 16 do
    tileSet[i][1] = wV
    tileSet[i][29] = wV
  end
end

function createInnerWalls()
  for i = 1, 6 do
    tileSet[i][13] = wV
    tileSet[i][17] = wV
  end
  for i = 10, 15 do
    tileSet[i][19] = wV
  end
  for i = 7, 9 do
    tileSet[i][5]
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

function createDoors()
  tileSet[7][24] = dH
  tileSet[10][15] = dH
  tileSet[10][21] = dH
  -- ab hier vertikale türen
  tileSet[5][13] = dV
  tileSet[5][17] = dV
  tileSet[8][5] = dV
end

function createObjects()
  tileSet[3][14] = sC
  tileSet[2][10] = pup
  tileSet[8][2] = lad
  tileSet[11][2] = bS
  tileSet[14][23] = cH
end
