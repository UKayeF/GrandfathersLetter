function triggerEventsLevel1()
  if playerX == elkX and playerY == elkY and facing == elkFacing and not hasKey1 then
    elkHead()
  end
  if playerX == garlicX and playerY == garlicY and facing == garlicFacing and not hasGarlic then
    garlic()
  end
  if playerX == vampireX and playerY == vampireY and facing == vampireFacing then
    vampire()
  end
  if playerX == stairCaseX and playerY == stairCaseY then
    ascendToLevel2()
  end
end

function elkHead()
  --message about hidden key
  hasKey1 = true
end

function garlic()
  if hasKey1 then
    --message about finding some garlic in the stock cabinet
    hasGarlic = true
  else
    --message: the stock cabinet is locked. It seems a key is needed to open it
  end
end

function vampire()
  if hasGarlic then
    --message about the vampire fleeing
    --remove vampire tile
  else
    --message about the vampire blocking the way
    --move player back one tile
  end
end

function ascendToLevel2()
  --load level 2
end

-- benötigte globale Variablen: elkX, elkY, elkFacing, garlicX, garlicY, garlicFacing, vampireX, vampireY, vampireFacing, stairCaseX, stairCaseY,
-- hasKey1 = false, hasGarlic = false

function triggerEventsLevel2()
  if playerX == bookX and playerY == bookY and facing == bookFacing then
    readNote()
  end
  if playerX == keyX and playerY == keyY and facing == keyFacing and not hasKey2 then
    ripKeyOut()
  end
  if playerX == closetX and playerY == closetY and facing == closetFacing and not closetDoorOpen then
    closetDoor()
  end
  if playerX == ladderX and playerY == ladderY and facing == ladderFacing then
    aquireLadder()
  end
  if playerX == atticX and playerY == atticY then
    attic()
  end
end

-- benötigte globale Variablen: bookX, bookY, bookFacing, keyX2, keyY2, keyFacing2, closetX, closetY, closetFacing, atticX, atticY,
-- ladderX, ladderY, ladderFacing, hasKey2 = false, hasLadder = false, closetDoorOpen = false

function readNote()
  --show note
end

function ripKeyOut()
  --show disturbing Message
  hasKey2 = true
end

function closetDoor()
  if hasKey2 then
    --show Message: The door is now unlocked
    --swtich door tile to open door tile
    closetDoorOpen = true
  else
    --show Message: the door is locked, it seems a key is needed to open it
  end
end

function aquireLadder()
  --show message: you take the ladder
  --delete LadderTile
  hasLadder = true
end

function attic()
  if hasLadder then
    --show Message about placing the ladder and gaining access to the attic
    --place LadderTile
  else
    --show message: their is a hatch in the ceiling, it probably gives acces to the attic. Unfortunately it is to high to reach
  end
end


  -- benötigte globale Variablen: bookX, bookY, bookFacing, keyX, keyY, keyFacing, closetX, closetY, closetFacing, atticX, atticY, ladderX, ladderY, ladderFacing, hasKey = false, hasLadder = false, closetDoorOpen = false
