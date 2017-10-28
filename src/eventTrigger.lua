function triggerEvents()
  if playerX == bookX and playerY == bookY and facing == bookFacing then
    readNote()
  end
  if playerX == keyX and playerY == keyY and facing == keyFacing and not hasKey then
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

function readNote()
  --show note
end

function ripKeyOut()
  --show disturbing Message
  hasKey = true
end

function closetDoor()
  if hasKey then
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
