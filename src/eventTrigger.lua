function triggerEventsLevel1()

  if inRange(1, moose) and not hasKey1 then
    elkHead()
  end
  if inRange(1, garlicObj) and not hasGarlic then
    garlic()
  end
  if inRange(1, vampireObj) and not vampireObj.isDead then
    vampire()
  end
  if inRange(0, stairCaseObj) and not level1Completed then
    ascendToLevel2()
  end
end

function elkHead()
  msg("You investigate the stuffed moose head on the wall. In a niche behind it you find a key")
    hasKey1 = love.keyboard.isScancodeDown("return")
end

function garlic()
  if hasKey1 then
    msg("You use the key you found to open the storage cabinet. Inside There is some garlic. You take it with you.")
    hasGarlic = love.keyboard.isScancodeDown("return")
  else
    msg("The stock cabinet is locked. It seems a key is needed to open it.")
  end
end

function vampire()
  if hasGarlic then
    msg("The vampire flees in terror due to the stink of the garlic you are holding.")
    vampireObj.isDead = love.keyboard.isScancodeDown("return")
  else
    msg("A fearsome vampire is blocking the Way. There is no way through.")
  end
end

function ascendToLevel2()
  msg("You have completed Level 1! You badass mofo!")
  level1Completed = love.keyboard.isScancodeDown("return")
end

function triggerEventsLevel2()
  if inRange(1, noteObj) then
    readNote()
  end
  if inRange(1, puppetObj) and not hasKey2 then
    ripKeyOut()
  end
  if inRange(1, closetDoorObj) and not closetDoorObj.open then
    closetDoor()
  end
  if inRange(1, ladderObj) then
    aquireLadder()
  end
  if inRange(0, hatchObj) then
    attic()
  end
end

-- benötigte globale Variablen: bookX, bookY, bookFacing, keyX2, keyY2, keyFacing2, closetX, closetY, closetFacing, atticX, atticY,
-- ladderX, ladderY, ladderFacing, hasKey2 = false, hasLadder = false, closetDoorOpen = false

function readNote()
  if inRange(1, noteObj) then
    msg("You look through the bookshelf and find a note inside your grandfathers favorite book. It reads: Do not dwell in the past. Rip it apart in order to become a new man.")
  end
end

function ripKeyOut()
  msg("In an unexpected explosion of Rage, you rip apart the doll that you loved as a child. Inside you find another key.")
  hasKey2 = love.keyboard.isScancodeDown("return")
end

function closetDoor()
  if hasKey2 then
    msg("You open the door with the second key you got. Behind it seems to be a small closet")
    closetDoorObj.open = love.keyboard.isScancodeDown("return")
  elseif inRange(1, closetDoorObj) then
    msg("The door is locked. It seems a key is needed to open it")
  end
end

function aquireLadder()
  msg("You find a ladder an take it with you")
  hasLadder = love.keyboard.isScancodeDown("return")
end

function attic()
  if hasLadder then
    msg("You place the ladder under the hatch. Now you are able to acces the attic!")
    ladderPlaced = love.keyboard.isScancodeDown("return")
  else
    msg("There is a hatch in the ceiling. It probably gives acces to the attic. Unfortunately it is to high to reach")
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
