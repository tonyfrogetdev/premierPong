require("player") -- les requires permettent de dire à notre main, notre jeu, que nous avons créer un joueur, une balle et une IA
require("ball")
require("ai")
require("background")

function love.load() -- le code qui se lance quand le jeu commence, la fonction est appelée une fois
   Player:load() 
   Ball:load()
   AI:load()
   Background:load()

   Score = {player = 0, ai = 0}
   font = love.graphics.newFont(30)
end


function love.update(dt) -- le code qui se lance à chaque frame avec le Delta time(dt) et le temps pour produire la frame
   Player:update(dt) -- les fonctionnaalités du joueur
   Ball:update(dt) -- les fonctionnalités du ballon
   AI:update(dt) -- les fonctionnalités de l'IA
   Background:update(dt)
end


function love.draw() -- le code pour les graphismes
    Background:draw()
   Player:draw() -- L'apparence du joueur
   Ball:draw() -- l'apparence de la balle
   AI:draw() -- l'apparence de l'IA
   drawScore()
   
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("Ennemi: "..Score.ai, 1000, 50)
end
function checkCollision(a, b) -- Je crée avec deux arguments , la collision avec la balle
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
    return true
    else
        return false
    end 
end