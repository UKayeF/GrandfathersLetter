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
  for i = 1, 10 do
    tileSet[i][13] = wV
    tileSet[i][17] = wV
  end
  for i = 7, 15 do
    tileSet[i][21] = wV
  end
  for i = 11, 15 do
    tileSet[i][11] = wV
  end
  tileSet[1][15] = wV
  tileSet[2][15] = wV
  tileSet[3][15] = wH
  for i = 2, 12 do
    tileSet[5][i] = wH
  end
  for i = 2, 10 do
    tileSet[11][i] = wH
  end
  for i = 12, 20 do
    tileSet[11][i] = wH
  end
  for i = 18, 20 do
    tileSet[i][7] = wH
  end
end

function createDoors()
  tileSet[5][7] = dH
  tileSet[11][6] = dH
  tileSet[11][15] = dH
  -- ab hier vertikele türeturn
  tileSet[6][13] = dH
  tileSet[6][17] = dH
  tileSet[9][17] = dH
  tileSet[14][11] = dH
  tileSet[14][21] = dH
end

function createObjects()
  tileSet[2][1] = storeCabinet
  tileSet[2][25] = elkHeadOnTheWall
  tileSet[4][16] = vampireBlockingTheWay
  tileSet[3][16] = stairCaseToLevel2
