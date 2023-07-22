raquette = {}
raquette.largeur = 20
raquette.hauteur = 80
raquette.x = 0
raquette.y = love.graphics.getHeight() / 2 - raquette.hauteur / 2

raquette2 = {}
raquette2.largeur = 20
raquette2.hauteur = 80
raquette2.x = 780
raquette2.y = love.graphics.getHeight() / 2 - raquette.hauteur / 2

balle = {}
balle.x = 400
balle.y = 300
balle.largeur = 20
balle.hauteur = 20
balle.vitesse_x = 2
balle.vitesse_y = 2

scorejoueur1 = 0
scorejoueur2 = 0

function CentreBalle()
    balle.x = love.graphics.getWidth() / 2 - balle.largeur / 2
    balle.y = love.graphics.getHeight() / 2 - balle.hauteur / 2

    balle.vitesse_x = 2
    balle.vitesse_y = 2
end
function love.load()
    CentreBalle()
end

function love.update()
    if love.keyboard.isDown("q") and raquette.y < love.graphics.getHeight() - raquette.hauteur then -- Si la position de la raquette ets inférieur à la taille de l'écran moins la hauteur de la raquette alors
        raquette.y = raquette.y + 3 -- la raquette peut descendre
    end

    if love.keyboard.isDown("a") and raquette.y > 0 then -- Si la touche haut est préssée et que
        raquette.y = raquette.y - 3 -- la raquette a une position supérieur à 0 alors la raquette remonte
    end

    if love.keyboard.isDown("down") and raquette2.y < love.graphics.getHeight() - raquette2.hauteur then
        raquette2.y = raquette2.y + 3
    end

    if love.keyboard.isDown("up") and raquette2.y > 0 then
        raquette2.y = raquette2.y - 3
    end
    balle.x = balle.x + balle.vitesse_x -- la coordonnée x est égale à sa coordonnée plus sa vitesse
    balle.y = balle.y + balle.vitesse_y -- la coordonnée y est égale à sa coordonnée plus sa vitesse

    if balle.y > love.graphics.getHeight() - balle.hauteur then -- Si la valeur y de la balle est supérieur à la taille de la resolution de l'écran moins la hauteur de la balle alors
        balle.vitesse_y = balle.vitesse_y * -1 -- j'inverse la vitesse y
    end

    if balle.y < 0 then -- Si la coordonée y de la balle est inférieur à 0 alors
        balle.vitesse_y = balle.vitesse_y * -1 -- alors j'inverse la vitesse y
    end

    if balle.x < -20 then
        balle.vitesse_x = balle.vitesse_x * -1
        CentreBalle()
        scorejoueur2 = scorejoueur2 + 1
    end

    if balle.x > 820 then
        balle.vitesse_x = balle.vitesse_x * 1
        CentreBalle()
        scorejoueur1 = scorejoueur1 + 1
    end

    if balle.x <= raquette.x + raquette.largeur then
        if balle.y + balle.hauteur > raquette.y and balle.y < raquette.y + raquette.hauteur then
            balle.vitesse_x = balle.vitesse_x * -1
            balle.x = raquette.x + raquette.largeur
        end
    end

    if balle.x >= raquette2.x - raquette2.largeur then
        if balle.y + balle.hauteur > raquette2.y and balle.y < raquette2.y + raquette.hauteur then
            balle.vitesse_x = balle.vitesse_x * -1
            balle.x = raquette2.x - raquette2.largeur
        end
    end
end

function love.draw()
    love.graphics.rectangle("fill", raquette.x, raquette.y, raquette.largeur, raquette.hauteur)
    love.graphics.rectangle("fill", raquette2.x, raquette2.y, raquette2.largeur, raquette2.hauteur)
    love.graphics.rectangle("fill", balle.x, balle.y, balle.largeur, balle.hauteur)
    local score = scorejoueur1 .. " - " .. scorejoueur2
    love.graphics.print(score, 400, 0)
end
