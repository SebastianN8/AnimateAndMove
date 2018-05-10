-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Sebastian N
-- Created on: May 8
--
-- This program animates a character and allows it to move.
-----------------------------------------------------------------------------------------

-- Hide display status bar
display.setStatusBar(display.HiddenStatusBar)

-- Important Variables
centerX = display.contentWidth * 0.5
centerY = display.contentHeight * 0.5

-- The ninja elements
-- Idle
local sheetOptionsIdleNinja = {
	width = 232,
	height = 439,
	numFrames = 10
}
local sheetIdleNinja = graphics.newImageSheet('./Assets/SpriteSheets/ninjaBoyIdle.png', sheetOptionsIdleNinja)

-- Walk
local sheetOptionsWalkNinja = {
	width = 363,
	height = 458,
	numFrames = 10
}
local sheetWalkNinja = graphics.newImageSheet('./Assets/SpriteSheets/ninjaBoyRun.png', sheetOptionsWalkNinja)

-- Sequence data for ninja
local sequence_data_ninja = {
{
	name = 'idle',
	start = 1,
	count = 10,
	time = 800,
	loopCount = 0,
	sheet = sheetIdleNinja
},
{
	name = 'walk',
	start = 1,
	count = 10,
	time = 800,
	loopCount = 0,
	sheet = sheetWalkNinja
}
}

-- The robot elements
-- Idle
local sheetOptionsIdleRobot = {
	width = 567,
	height = 556,
	numFrames = 10
}
local sheetIdleRobot = graphics.newImageSheet('./Assets/SpriteSheets/robotIdle.png', sheetOptionsIdleRobot)

-- Walk
local sheetOptionsWalkRobot = {
	width = 567,
	height = 556,
	numFrames = 8
}
local sheetWalkRobot = graphics.newImageSheet('./Assets/SpriteSheets/robotRun.png', sheetOptionsWalkRobot)

-- Sequence data for robot
local sequence_data_robot = {
{
	name = 'idle',
	start = 1,
	count = 10,
	time = 800,
	loopCount = 0,
	sheet = sheetIdleRobot
},
{
	name = 'walk',
	start = 1,
	count = 8,
	time = 800,
	loopCount = 0,
	sheet = sheetWalkRobot
}
}

-- Sprites
-- D-pad
local thedPad = display.newImage('./Assets/Sprites/d-pad.png')
thedPad.x = 160
thedPad.y = display.contentHeight - 160
thedPad.id = 'The d-pad'
thedPad.alpha = 0.5

-- Up arrow
local upArrow = display.newImage('./Assets/Sprites/upArrow.png')
upArrow.x = 160
upArrow.y = display.contentHeight - 268.7
upArrow.id = 'Up arrow'

-- Right arrow
local rightArrow = display.newImage('./Assets/Sprites/rightArrow.png')
rightArrow.x = 268.7
rightArrow.y = display.contentHeight - 160
rightArrow.id = 'Right arrow'

-- Animation for the ninja
local ninja = display.newSprite(sheetIdleNinja, sequence_data_ninja)
ninja.x = centerX 
ninja.y = centerY * 1.5
ninja:setSequence('idle')
ninja:play()

local robot = display.newSprite(sheetIdleRobot, sequence_data_robot)
robot.x = centerX 
robot.y = centerY * 0.5
robot:setSequence('idle')
robot:play()

-- Functions
function rightArrow:touch(event)
	if (event.phase == 'ended') then
		transition.moveBy(robot, {
			x = 150,
			y = 0,
			time = 800
			})

		robot:setSequence( 'walk' )
    	robot:play()
    	print("walk")
    end
end


-- Event Listeners
rightArrow:addEventListener('touch', rightArrow)