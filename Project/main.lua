
racket = {}
racket.x = 0
racket.y = 0
racket.width = 20
racket.height = 80

widthScreen, heightScreen = love.graphics.getDimensions()

-- To load images and sounds that we will use, 1 time
function love.load()
end

-- All the logic's game, 60 times per second
function love.update()
  
  -- controls management
    if love.keyboard.isDown("down") and racket.y < (heightScreen - racket.height) then
      racket.y = racket.y + 2
    end
    
    if love.keyboard.isDown("up") and racket.y > 0 then
      racket.y = racket.y - 2
    end

end

-- To draw all the game, 60 times per second
function love.draw()
  love.graphics.rectangle("fill", racket.x, racket.y, racket.width, racket.height)
end