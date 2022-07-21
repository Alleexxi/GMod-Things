AddCSLuaFile()

if CLIENT then
    SWEP.Slot = 1
    SWEP.SlotPos = 3
end

DEFINE_BASECLASS("stick_base")
SWEP.Instructions = ""
SWEP.PrintName = "Abschlepp Stock"
SWEP.Spawnable = true
SWEP.StickColor = Color(255, 0, 234)

function SWEP:Deploy()
    return BaseClass.Deploy(self)
end

function SWEP:Initialize()
    BaseClass.Initialize(self)
end

function SWEP:DoAttack(dmg)
    if CLIENT then return end
    local Owner = self:GetOwner()
    if not IsValid(Owner) then return end

    Owner:LagCompensation(true)
    local trace = util.QuickTrace(Owner:EyePos(), Owner:GetAimVector() * 90, {Owner})
    Owner:LagCompensation(false)

    local ent = trace.Entity
    if IsValid(ent) and ent:IsVehicle() then
        ent:TakeDamage(dmg, Owner, self)
        return
    end
end

function SWEP:PrimaryAttack()
    BaseClass.PrimaryAttack(self)
    self:DoAttack(0)
end