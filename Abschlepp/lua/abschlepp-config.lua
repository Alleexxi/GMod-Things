AddCSLuaFile()

Alleexxii = Alleexxii or {}
Alleexxii.Abschlepp = Alleexxii.Abschlepp or {}


Alleexxii.Abschlepp.Config = {}
-- Wie viel geld der spieler fürs abschleppen bekommt
Alleexxii.Abschlepp.Config.Reward = 1000

-- Give Money function don't touch if u don't know what u doing (So u can add support to custom money system/Give money to the bank etc.)
Alleexxii.Abschlepp.Config.GiveMoney = function(ply, amount)
    if CLIENT then return end
    ply:addMoney(amount)
end