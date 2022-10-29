screenWidth, screenHeight = love.graphics.getDimensions()

racket = {}
racket.x = 0
racket.y = 100
racket.width = 20
racket.height = 80

ball = {}
ball.x = screenWidth / 2
ball.y = screenHeight / 2
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
    if love.keyboard.isDown("down") and racket.y < (screenHeight - racket.height) then
      racket.y = racket.y + 2
    end
    
    if love.keyboard.isDown("up") and racket.y > 0 then
      racket.y = racket.y - 2
    end
    
  -- move the ball at the beginning of the game
    ball.x = ball.x + ball.speed_x
    ball.y = ball.y - ball.speed_y
    
  -- bounces of the ball on walls
    if ball.x < 0 then
      ball.speed_x = ball.speed_x * (-1)
    end
    
    if ball.x > (screenWidth - ball.width) then
      ball.speed_x = ball.speed_x * (-1) -- reverse the speed
    end
    
    if ball.y < 0 then
      ball.speed_y = ball.speed_y * (-1)
    end
    
    if ball.y > (screenHeight - ball.height) then
      ball.speed_y = ball.speed_y * (-1)
    end
    
  -- ball / racket collision
    if ball.x <= (racket.x + racket.width) then
      if (ball.y + ball.height) >= racket.y and ball.y <= (racket.y + racket.height) then
        ball.speed_x = ball.speed_x * (-1)
        ball.x = racket.x + racket.width -- for more precision
      end
    end
  
end

-- To draw all the game, 60 times per second
function love.draw()
  love.graphics.rectangle("fill", racket.x, racket.y, racket.width, racket.height)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
end