function triggerEventsLevel1()

  if inRange(1, moose) and not hasKey1 then
    elkHead(facing)
  end
  if inRange(1, garlicObj) and not hasGarlic then
    garlic()
  end
  if playerX == vampireX and playerY == vampireY and facing == vampireFacing then
    vampire()
  end
  if playerX == stairCaseX and playerY == stairCaseY then
    ascendToLevel2()
  end
end

function elkHead(a)
  msg("You investigate the stuffed moose head on the wall. In a niche behind it you find a key")
  if inRange(0, moose) then
    hasKey1 = true
  end
end

function garlic()
  if hasKey1 then
    msg("You use the key you found to open the storage cabinet. Inside There is some garlic. You take it with you.")
    hasGarlic = true
  else
    msg("The stock cabinet is locked. It seems a key is needed to open it.")
  end
end

function vampire()
  if hasGarlic then
    msg("The vampire flees in terror due to the stink of the garlic you are holding.")
    --remove vampire tile
  else
    msg("A fearsome vampire is blocking the Way. There is no way through.")
  end
end

function ascendToLevel2()
  --load level 2
end

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

function msg(message)
  msgFont = love.graphics.newFont(48)
  love.graphics.setColor(48,48,48)
  love.graphics.rectangle("fill", 480, 240, 960, 600)
  love.graphics.setColor(224, 224, 224)
	love.graphics.setFont(msgFont)
	love.graphics.print(message, 720, 480)
end


  -- benötigte globale Variablen: bookX, bookY, bookFacing, keyX, keyY, keyFacing, closetX, closetY, closetFacing, atticX, atticY, ladderX, ladderY, ladderFacing, hasKey = false, hasLadder = false, closetDoorOpen = false
