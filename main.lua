--==============================================================
-- init some global settings
--==============================================================
X_SIZE = 640
Y_SIZE = 640

UP_ARROW = 357
DOWN_ARROW = 359
LEFT_ARROW = 356
RIGHT_ARROW = 358
print ( 'LUA_PATH: ' .. package.path )


-- could use load file instead of require, 
-- in that case, I wouln't need to init global variables in another file
require 'lua/setupView'

mainDecks = {}
require 'lua/setupDecks'

require 'lua/setupInput'

-- TODO: create a table of props. update setupInput.lua
p1 = MOAIProp2D.new ()
p1:setDeck ( mainDecks.characters )
p1:setIndex ( 1 )
p1:setLoc ( 0, -20 )
mainLayer:insertProp ( p1 )

-- TODO: make font and textbox local somehow 
local charcodes = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 .,:;!?()&/-'
font = MOAIFont.new ()
font:loadFromTTF ( 'fonts/arialbd.ttf', charcodes, 16, 163 )

textbox = MOAITextBox.new ()
textbox:setFont ( font )
textbox:setTextSize ( font:getScale () )
textbox:setRect ( -50, -50, 50, 50 )
textbox:setYFlip ( true )


-- TODO: move more of the movement stuff into setupInput
mainRoutine = MOAICoroutine.new ()
mainRoutine:run (
   function ()
      local run = true
      playerSpeed = 75 
      while run do

         local dt = coroutine.yield ()
         local dx, dy = 0, 0

         if MOAIInputMgr.device.keyboard:keyIsDown (UP_ARROW) then
            dy = dy + 1
         end
         if MOAIInputMgr.device.keyboard:keyIsDown ( DOWN_ARROW ) then 
            dy = dy - 1
         end
         if MOAIInputMgr.device.keyboard:keyIsDown ( LEFT_ARROW ) then 
            dx = dx - 1
         end
         if MOAIInputMgr.device.keyboard:keyIsDown ( RIGHT_ARROW ) then 
            dx = dx + 1
         end
         p1:moveLoc (dx * playerSpeed * dt, dy * playerSpeed * dt, 0)


         if MOAIInputMgr.device.mouseLeft:down () then
            print 'Mouse Left Pressed'
         end 
      end 
   end
)

