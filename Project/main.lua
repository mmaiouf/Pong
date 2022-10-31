screenWidth, screenHeight = love.graphics.getDimensions()

racket = {}
racket.x = 0
racket.y = screenHeight / 2 - 40
racket.width = 20
racket.height = 80
racket.score = 0

racket2 = {}
racket2.x = screenWidth - racket.width
racket2.y = screenHeight / 2 - 40
racket2.width = 20
racket2.height = 80
racket2.score = 0

ball = {}
ball.x = screenWidth / 2
ball.y = screenHeight / 2
ball.width = 20
ball.height = 20
ball.speed_x = 2
ball.speed_y = -2

function centerBall()
  ball.x = screenWidth / 2 - (ball.width/2)
  ball.y = screenHeight / 2 - (ball.height/2)
end

-- To load images and sounds that we will use, 1 time
function love.load()
  centerBall()
  
  racket.x = 0
  racket.y = screenHeight / 2 - racket.height/2
  
  racket2.x = screenWidth - racket.width
  racket2.y = screenHeight / 2 - racket2.height/2
end

-- All the logic's game, 60 times per second
function love.update()
  
  -- controls management for racket 1
    if love.keyboard.isDown("s") and racket.y < (screenHeight - racket.height) then
      racket.y = racket.y + 2
    end
    
    if love.keyboard.isDown("w") and racket.y > 0 then
      racket.y = racket.y - 2
    end
    
  -- controls management for racket 2
    if love.keyboard.isDown("down") and racket2.y < (screenHeight - racket2.height) then
      racket2.y = racket2.y + 2
    end
    
    if love.keyboard.isDown("up") and racket2.y > 0 then
      racket2.y = racket2.y - 2
    end
    
  -- move the ball at the beginning of the game
    ball.x = ball.x + ball.speed_x
    ball.y = ball.y - ball.speed_y
    
  -- bounces of the ball on vertical walls
    if ball.y < 0 then
      ball.speed_y = ball.speed_y * (-1)
    end
    
    if ball.y > (screenHeight - ball.height) then
      ball.speed_y = ball.speed_y * (-1)
    end
    
  -- ball / racket1 collision
    if ball.x <= (racket.x + racket.width) then
      if (ball.y + ball.height) >= racket.y and ball.y <= (racket.y + racket.height) then
        ball.speed_x = ball.speed_x * (-1)
        ball.x = racket.x + racket.width -- for more precision
      end
    end
    
    -- ball / racket2 collision
    if (ball.x + ball.width) >= racket2.x then
      if (ball.y + ball.height) >= racket2.y and ball.y <= (racket2.y + racket2.height) then
        ball.speed_x = ball.speed_x * (-1)
        ball.x = racket2.x - ball.width
      end
    end
    
  -- when the ball goes out of the screen
    if ball.x < 0 then
      centerBall()
      ball.speed_x = ball.speed_x * (-1) -- to keep the same speed as the beginning of the game
      ball.speed_y = ball.speed_y * (-1)
      racket2.score = racket2.score + 1
    end
      
    if ball.x > (screenWidth - ball.width) then
      centerBall()
      ball.speed_x = ball.speed_x * (-1)
      ball.speed_y = ball.speed_y * (-1)
      racket.score = racket.score + 1
    end
end

-- To draw all the game, 60 times per second
function love.draw()
  love.graphics.rectangle("fill", racket.x, racket.y, racket.width, racket.height)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
  love.graphics.rectangle("fill", racket2.x, racket2.y, racket2.width, racket2.height)
  love.graphics.print(racket.score, 200, 50, 0, 2, 2)
  love.graphics.print(racket2.score, 600, 50, 0, 2, 2)
end