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
  a = "You investigate the stuffed moose head on the wall. Although you are sure that most of his Stories were fairytails, you must admit:\n"
  b = "his hunting skills were always extraordinary. After a thorough examination you find a key in a niche behing the moose head."
  msg( a..b )
    hasKey1 = love.keyboard.isScancodeDown("e")
end

function garlic()
  if hasKey1 then
    a = "You use the key that you found behind the stuffed moose head to open the storage cabinet. "
    b = "Inside there are some cloves of garlic. for some reason you decide take them with you."
    msg( a..b )
    hasGarlic = love.keyboard.isScancodeDown("e")
  else
    msg("You try to open the stock cabinet. Unfortunately it is locked. It seems a key is needed to open it.")
  end
end

function vampire()
  if hasGarlic then
    msg("The vampire flees in terror due to the stink of the garlic you are holding. The way upstairs is now free!")
    vampireObj.isDead = love.keyboard.isScancodeDown("e")
  else
    msg("A fearsome vampire is blocking the way. There is no way through. Maybe you can dispel him somhow...")
  end
end

function ascendToLevel2()
  msg("You have finally reached the staircase. Hooray! Only one more story is between you and the attic.")
  level1Completed = love.keyboard.isScancodeDown("e")
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
  if inRange(1, ladderObj) and not hasLadder then
    acquireLadder()
  end
  if inRange(0, hatchObj) then
    attic()
  end
end

function readNote()
  if inRange(1, noteObj) then
    a = "You look through the bookshelf and find a note inside your grandfathers favorite book, the ways of a true adventurer. "
    b = "The note reads: Do not dwell in the past. Sometimes you need to let go or even destroy, what lies behind you in order to become a new man."
    msg( a..b )
  end
end

function ripKeyOut()
  a = "You find your old doll that you used to play with as a child. You got a feeling that there is something inside it. "
  b = "and indeed: After taking apart your once beloved doll, you hold another key in your hands."
  msg( a..b )
  hasKey2 = love.keyboard.isScancodeDown("e")
end

function closetDoor()
  if hasKey2 then
    msg("You open the door with the second key you got. Behind it seems to be a small closet")
    closetDoorObj.open = love.keyboard.isScancodeDown("e")
  elseif inRange(1, closetDoorObj) then
    msg("This door is locked. It seems another key is needed to open it. Let the search begin anew!")
  end
end

function acquireLadder()
  msg("You find a ladder and decide to take it with you, because: why not?")
  hasLadder = love.keyboard.isScancodeDown("e")
end

function attic()
  if hasLadder then
    msg("You place the ladder under the hatch. Now you are able to acces the attic!")
    ladderPlaced = love.keyboard.isScancodeDown("e")
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
	love.graphics.printf(message, 540, 300, 840, "center")
end


  -- benötigte globale Variablen: bookX, bookY, bookFacing, keyX, keyY, keyFacing, closetX, closetY, closetFacing, atticX, atticY, ladderX, ladderY, ladderFacing, hasKey = false, hasLadder = false, closetDoorOpen = false
