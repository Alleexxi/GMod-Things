include("abschlepp-config.lua")

if SERVER then
    hook.Add( "EntityTakeDamage", "Abschlepp-Vehicle-On-Hit", function( target, dmginfo )
        local ply = dmginfo:GetAttacker();
        if ply:IsPlayer() then 
            if target:IsVehicle() and ply:GetActiveWeapon():GetClass() == "weapon_abschlepp_stick" then
                Alleexxii.Abschlepp.Config.GiveMoney(ply, Alleexxii.Abschlepp.Config.Reward)
                target:Remove()
            end
        end
    end)
end