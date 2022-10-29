widthScreen, heightScreen = love.graphics.getDimensions()

racket = {}
racket.x = 0
racket.y = 0
racket.width = 20
racket.height = 80

ball = {}
ball.x = widthScreen / 2
ball.y = heightScreen / 2
ball.width = 20
ball.height = 20
ball.speed_x = 2
ball.speed_y = -2

-- To load images and sounds that we will use, 1 time
function love.load()
  ball.x = ball.x - (ball.width/2)
  ball.y = ball.y - (ball.height/2)
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
    
  ball.x = ball.x + ball.speed_x
  ball.y = ball.y + ball.speed_y
  
end

-- To draw all the game, 60 times per second
function love.draw()
  love.graphics.rectangle("fill", racket.x, racket.y, racket.width, racket.height)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
end