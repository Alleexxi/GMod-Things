-- This should work..... i don't have a server with wiltos installed

if SERVER then
    util.AddNetworkString("GetHasFocus")
    net.Receive("GetHasFocus", function(len,ply)
        ply.Focused = net.ReadBool()
    end)

    local old = meta.SetSkillXP
    function meta:SetSkillXP(xp)
        net.Start("GetHasFocus")
        net.Send(self)

        timer.Simple(0.1, function()
            if self.Focused then
                old(self,xp)
            end
        end)
    end
elseif CLIENT then
    net.Receive("GetHasFocus", function()
        net.Start("GetHasFocus")
        net.WriteBool(system.HasFocus())
        net.SendToServer()
    end)
end
