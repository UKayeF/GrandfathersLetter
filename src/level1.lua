function createOuterWalls()
  for i = 2, 28 do
    tileSet[i][1] = wH
    tileSet[i][16] = wH
  end
  for i = 1, 16 do
    tileSet[1][i] = wV
    tileSet[29][i] = wV
  end
end

function createInnerWalls()
  for i = 1, 10 do
    tileSet[13][i] = wV
    tileSet[17][i] = wV
  end
  for i = 7, 15 do
    tileSet[21][i] = wV
  end
  for i = 11, 15 do
    tileSet[11][i] = wV
  end
  for i = 2, 12 do
    tileSet[i][5]
  end
  for i = 2, 10 do
    tileSet[i][11]
  end
  for i = 12, 20 do
    tileSet[i][11]
  end
  for i = 18, 20 do
    tileSet[i][7]
  end
end

function createDoors()


function createObjects()
