local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/Library.lua'))() 
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/ThemeManager.lua'))() 
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/addons/SaveManager.lua'))() 
local old 
local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Client.Camera) 
local norecoil = false 
local WallHackOn = false 
local TreeRemOn = false 
local LeavesRemover = false 
local AimbotTrue = false 
local HeadExtends = false 
local gmt = getrawmetatable(game) 
setreadonly(gmt, false) 
local oldindex = gmt.__index 
local Players = game:GetService("Players"); 
local LocalPlayer = Players.LocalPlayer; 
local Mouse = LocalPlayer:GetMouse(); 
local Cameras = game:GetService("Workspace").Camera; 
local CurrentCamera = game:GetService("Workspace").CurrentCamera 
local worldToViewportPoint = CurrentCamera.worldToViewportPoint 
local HeadOff = Vector3.new(0, 0.5, 0) 
local LegOff = Vector3.new(0,3,0) 
local XRTransparency = 0.9 
local _Character = getrenv()._G.Character; getgenv()._Aimbot = { Enabled = false, AimSmooth = 1, X_Offset = 0, Y_Offset = 0 } 
getgenv().ASSettings = { AimType = "To Cursor", AimDis = 300, AimSleepers = false, VisibleCheck = false } 
local HedsOn = Instance.new("Part") 
HedsOn.Name = "HedsOn" HedsOn.Anchored = false 
HedsOn.CanCollide = false 
HedsOn.Transparency = 1 
HedsOn.Size = Vector3.new(4, 7, 3) 
HedsOn.Parent = game.ReplicatedStorage
 local fovcircle = Drawing.new("Circle")
fovcircle.Visible = false
fovcircle.Radius = 120 
fovcircle.Color = Color3.fromRGB(255,255,255) 
fovcircle.Thickness = 1 
fovcircle.Filled = false 
fovcircle.Transparency = 0.5 
fovcircle.Position = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2) 
function getClosestPlayerToPlayer() 
    local closestPlayer = nil; 
    local shortestDistance = ASSettings["AimDis"]; 
    for i, v in pairs(workspace:GetChildren()) do 
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Name then if v.Humanoid.Health ~= 0 and v.PrimaryPart ~= nil and v:FindFirstChild("Head") then 
            local pos = Cameras.WorldToViewportPoint(Cameras, v.PrimaryPart.Position) 
            local magnitude = (_Character.character.Middle.Position - v.PrimaryPart.Position).magnitude 
            local fovmagnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude 
            if magnitude < shortestDistance then 
                if fovmagnitude < 120 then 
                    closestPlayer = v 
                    shortestDistance = magnitude 
                end 
            end 
        end 
    end 
end 
    return closestPlayer 
end 
-- | WateRmark | -- 
Library:SetWatermark('Apocalypse | v1.2 [Dev] | Trident Survival') 
local Window = Library:CreateWindow({ Title = 'Apocalypse | Trident Survival', Center = true, AutoShow = true, }) 
-- | Visual | --
local VisualTab = Window:AddTab('Visual')
local CrossHairSector = VisualTab:AddLeftGroupbox('Cross Hair')
 ----------------------- 
 local Players = game:GetService("Players") 
 local RunService = game:GetService("RunService") 
 local UserInputService = game:GetService("UserInputService") 
 local Camera = workspace.CurrentCamera local Typing = false 
 local ViewportSize_ = Camera.ViewportSize / 2 local Axis_X, Axis_Y = ViewportSize_.X, ViewportSize_.Y 
 local HorizontalLine = Drawing.new("Line") 
 local VerticalLine = Drawing.new("Line") 
 _G.SendNotifications = true -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false) 
 _G.DefaultSettings = false -- If set to true then the script would create a crosshair with the default settings regardless of any changes. 
 _G.ToMouse = false -- If set to true then the crosshair will be positioned to your mouse cursor's position. If set to false it will be positioned to the center of your screen. 
 _G.CrosshairVisible = false -- If set to true then the crosshair would be visible and vice versa. 
 _G.CrosshairSize = 10 -- The size of the crosshair. 
 _G.CrosshairThickness = 1 -- The thickness of the crosshair. 
 _G.CrosshairColor = Color3.fromRGB(0, 255, 0) -- The color of the crosshair 
 _G.CrosshairTransparency = 1 -- The transparency of the crosshair. 
 _G.DisableKey = Enum.KeyCode.Q -- The key that enables / disables the crosshair. RunService.RenderStepped:Connect(function() 
 local Real_Size = _G.CrosshairSize / 2 
 HorizontalLine.Color = _G.CrosshairColor 
 HorizontalLine.Thickness = _G.CrosshairThickness 
 HorizontalLine.Visible = _G.CrosshairVisible 
 HorizontalLine.Transparency = _G.CrosshairTransparency 
 VerticalLine.Color = _G.CrosshairColor 
 VerticalLine.Thickness = _G.CrosshairThickness 
 VerticalLine.Visible = _G.CrosshairVisible 
 VerticalLine.Transparency = _G.CrosshairTransparency 
 if _G.ToMouse == true then 
    HorizontalLine.From = Vector2.new(UserInputService:GetMouseLocation().X - Real_Size, UserInputService:GetMouseLocation().Y) 
    HorizontalLine.To = Vector2.new(UserInputService:GetMouseLocation().X + Real_Size, UserInputService:GetMouseLocation().Y) 
    VerticalLine.From = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y - Real_Size) 
    VerticalLine.To = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y + Real_Size) 
elseif _G.ToMouse == false then 
    HorizontalLine.From = Vector2.new(Axis_X - Real_Size, Axis_Y)
    HorizontalLine.To = Vector2.new(Axis_X + Real_Size, Axis_Y) 
    VerticalLine.From = Vector2.new(Axis_X, Axis_Y - Real_Size) 
    VerticalLine.To = Vector2.new(Axis_X, Axis_Y + Real_Size) 
end 


if _G.DefaultSettings == true then 
    _G.CrosshairVisible = true 
    _G.CrosshairSize = 10 
    _G.CrosshairThickness = 1 
    _G.CrosshairColor = Color3.fromRGB(40, 90, 255) 
    _G.CrosshairTransparency = 0.15

    _G.DisableKey = Enum.KeyCode.Q 
end 
UserInputService.TextBoxFocused:Connect(function() 
    Typing = true 
end)

UserInputService.TextBoxFocusReleased:Connect(function() 
    Typing = false 
end) 
--------------------- 
--Toggle1 
CrossHairSector:AddToggle('CHTTT', { Text = 'Off/On', Default = false, Tooltip = 'Off/On Cross Hair', })
Toggles.CHTTT:OnChanged(function(CrosshairVisibl33e) _G.CrosshairVisible = CrosshairVisibl33e 
end) 
--ColorPiker1 
CrossHairSector:AddLabel('Color'):AddColorPicker('CPGGG', { Default = Color3.new(0, 1, 0), Title = 'Color', }) 
Options.CPGGG:OnChanged(function(CrossHairColo3r) _G.CrosshairColor = CrossHairColo3r end) 
--Slider1 
CrossHairSector:AddSlider('CHSSS', { Text = 'Size', Default = 0, Min = 0, Max = 200, Rounding = 1, Compact = false, }) 
Options.CHSSS:OnChanged(function(Cro4sshairSize) 
    _G.CrosshairSize = Cro4sshairSize 
end) 
local WoroldSector = VisualTab:AddLeftGroupbox('Worold') 
WoroldSector:AddButton('3D Sky Remover', function() 
    game:GetService("Workspace").Terrain.Clouds:Destroy() 
end) 
WoroldSector:AddButton('Leavs Remover', function() 
    if LeavesRemover == false then 
        LeavesRemover = true 
        while LeavesRemover == true do 
            for v, i in pairs(game:GetService("Workspace"):GetChildren()) do 
                if i:FindFirstChild("Part") then 
                    if i:FindFirstChild("top") then 
                        i.top:Remove() 
                    else 
                        for x,b in pairs(i:GetChildren()) do 
                            if b.ClassName == "MeshPart" and b.MeshId == "rbxassetid://743205322" then 
                                b:Remove() 
                            end 
                        end 
                    end 
                end 
            end 
            wait(5) 
        end 
    else 
        LeavesRemover = false 
    end 
end) 
local Socolo = Instance.new("Sky",game:GetService("Lighting")) 
Socolo.Name = "CustomSky" WoroldSector:AddDropdown('SkyC', { Values = { 'Default', 'Sponge Bob', 'Among Us' }, Default = 1, Multi = false, Text = 'Sky', Tooltip = 'sky lol', }) 
Options.SkyC:OnChanged(function(HOMO)
        if HOMO == "Default" then 
        Socolo.SkyboxBk = "rbxasset://textures/sky/sky512_bk.tex" 
        Socolo.SkyboxDn = "rbxasset://textures/sky/sky512_dn.tex" 
        Socolo.SkyboxFt = "rbxasset://textures/sky/sky512_ft.tex" 
        Socolo.SkyboxLf = "rbxasset://textures/sky/sky512_lf.tex" 
        Socolo.SkyboxRt = "rbxasset://textures/sky/sky512_rt.tex" 
        Socolo.SkyboxUp = "rbxasset://textures/sky/sky512_up.tex" 
    elseif HOMO == "Sponge Bob" then 
        Socolo.SkyboxBk = "http://www.roblox.com/asset/?id=7633178166" 
        Socolo.SkyboxDn = "http://www.roblox.com/asset/?id=7633178166" 
        Socolo.SkyboxFt = "http://www.roblox.com/asset/?id=7633178166" 
        Socolo.SkyboxLf = "http://www.roblox.com/asset/?id=7633178166" 
        Socolo.SkyboxRt = "http://www.roblox.com/asset/?id=7633178166" 
        Socolo.SkyboxUp = "http://www.roblox.com/asset/?id=7633178166" 
    elseif HOMO == "Among Us" then 
        Socolo.SkyboxBk = "rbxassetid://5752463190" 
        Socolo.SkyboxDn = "rbxassetid://5872485020" 
        Socolo.SkyboxFt = "rbxassetid://5752463190" 
        Socolo.SkyboxLf = "rbxassetid://5752463190" 
        Socolo.SkyboxRt = "rbxassetid://5752463190" 
        Socolo.SkyboxUp = "rbxassetid://5752463190" 
    end 
end)
local EspSector = VisualTab:AddLeftGroupbox('Esp')
--Toggle2 
EspSector:AddToggle('ESPTT', { Text = 'Off/On', Default = false, Tooltip = 'Off/On Esp', }) 
Toggles.ESPTT:OnChanged(function(ESPEnabled) 
    if ESPEnabled == true then 
        while ESPEnabled do wait(1) 
            for i, a in ipairs(workspace:GetChildren()) do 
                if a:FindFirstChild("Humanoid") then 
                    if not a:FindFirstChild("Chamse") then 
                        if a ~= game:GetService("Workspace").Ignore.FPSArms then 
                            local b = Instance.new("Highlight",a) 
                            b.Adornee = a 
                            b.Name = "Chamse"
                            b.FillColor = Color3.fromRGB(128, 187, 219) 
                            b.FillTransparency = 0.6 
                            b.OutlineColor = Color3.fromRGB(13, 105, 172) 
                        end 
                    end 
                end 
            end 
        end 
    end 
end) 
local FovSector = VisualTab:AddLeftGroupbox('Fov') 
--Slider2 
FovSector:AddSlider('SPFVVV', { Text = 'Fov', Default = 80, Min = 0, Max = 120, Rounding = 1, Compact = false, }) 
Options.SPFVVV:OnChanged(function(t) 
    gmt.__index = newcclosure(function(self,b) 
        if b == "FieldOfView" then 
            return t 
        end 
            return oldindex(self,b) 
        end) 
    end) 
    local ArmsSector = VisualTab:AddRightGroupbox('Arms') ArmsSector:AddButton('Set Color', function() 
        game:GetService("Workspace").Ignore.FPSArms.RightUpperArm.BrickColor = BrickColor.new("Linen") 
        game:GetService("Workspace").Ignore.FPSArms.RightLowerArm.BrickColor = BrickColor.new("Linen") 
        game:GetService("Workspace").Ignore.FPSArms.RightHand.BrickColor = BrickColor.new("Linen") 
        game:GetService("Workspace").Ignore.FPSArms.LeftUpperArm.BrickColor = BrickColor.new("Linen") 
        game:GetService("Workspace").Ignore.FPSArms.LeftLowerArm.BrickColor = BrickColor.new("Linen") 
        game:GetService("Workspace").Ignore.FPSArms.LeftHand.BrickColor = BrickColor.new("Linen") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Handle.BrickColor = BrickColor.new("Cool yellow") 
    end) 
    --ColorPiker3 
    ArmsSector:AddLabel('Color'):AddColorPicker('ARCCCC', { Default = Color3.new(0, 1, 0), Title = 'Arms Color', }) 
    Options.ARCCCC:OnChanged(function(ARMC) 
        game:GetService("Workspace").Ignore.FPSArms.RightUpperArm.Color = ARMC 
        game:GetService("Workspace").Ignore.FPSArms.RightLowerArm.Color = ARMC 
        game:GetService("Workspace").Ignore.FPSArms.RightHand.Color = ARMC 
        game:GetService("Workspace").Ignore.FPSArms.LeftUpperArm.Color = ARMC 
        game:GetService("Workspace").Ignore.FPSArms.LeftLowerArm.Color = ARMC 
        game:GetService("Workspace").Ignore.FPSArms.LeftHand.Color = ARMC 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Handle.Color = ARMC 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Handle.Color = ARMC 
        game:GetService("ReplicatedStorage").HandModels.USP.Handle.Color = ARMC 
    end) 
    ArmsSector:AddToggle('AYTTT', { Text = 'ForceField Material', Default = false, Tooltip = '', }) 
    Toggles.AYTTT:OnChanged(function(jjholo) 
        if jjholo == true then 
            game:GetService("Workspace").Ignore.FPSArms.RightUpperArm.Material = Enum.Material.ForceField 
            game:GetService("Workspace").Ignore.FPSArms.RightLowerArm.Material = Enum.Material.ForceField 
            game:GetService("Workspace").Ignore.FPSArms.RightHand.Material = Enum.Material.ForceField 
            game:GetService("Workspace").Ignore.FPSArms.LeftUpperArm.Material = Enum.Material.ForceField 
            game:GetService("Workspace").Ignore.FPSArms.LeftLowerArm.Material = Enum.Material.ForceField 
            game:GetService("Workspace").Ignore.FPSArms.LeftHand.Material = Enum.Material.ForceField 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Handle.Material = Enum.Material.ForceField
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Handle.Material = Enum.Material.ForceField 
            game:GetService("ReplicatedStorage").HandModels.USP.Handle.Material = Enum.Material.ForceField 
        elseif jjholo == false then 
            game:GetService("Workspace").Ignore.FPSArms.RightUpperArm.Material = Enum.Material.Plastic 
            game:GetService("Workspace").Ignore.FPSArms.RightLowerArm.Material = Enum.Material.Plastic 
            game:GetService("Workspace").Ignore.FPSArms.RightHand.Material = Enum.Material.Plastic 
            game:GetService("Workspace").Ignore.FPSArms.LeftUpperArm.Material = Enum.Material.Plastic 
            game:GetService("Workspace").Ignore.FPSArms.LeftLowerArm.Material = Enum.Material.Plastic 
            game:GetService("Workspace").Ignore.FPSArms.LeftHand.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Handle.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Handle.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.USP.Handle.Material = Enum.Material.Plastic 
        end 
    end) 
    local GunsSector = VisualTab:AddRightGroupbox('Guns') 
    GunsSector:AddButton('Set Color', function() 
        -----HMAR 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Barrel.BrickColor = BrickColor.new("Dark grey") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Body.BrickColor = BrickColor.new("Dark stone grey") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Bolt.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Stock.BrickColor = BrickColor.new("Bronze") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Grip.BrickColor = BrickColor.new("Bronze") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Mag.BrickColor = BrickColor.new("Dark stone grey") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.Muzzle.BrickColor = BrickColor.new("Bronze") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.ADS.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.Union.BrickColor = BrickColor.new("Medium stonne grey") 
        -----PipeSMG 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.ADS.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.Union.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Mag.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Flap.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Muzzle.BrickColor = BrickColor.new("Medium stonne grey")
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Body.BrickColor = BrickColor.new("Dark stone grey") 
        game:GetService("ReplicatedStorage").HandModels.PipeSMG.Bolt.BrickColor = BrickColor.new("Medium stonne grey") 
        -----USP 
        game:GetService("ReplicatedStorage").HandModels.USP.IronSights.ADS.BrickColor = BrickColor.new("Lime green") 
        game:GetService("ReplicatedStorage").HandModels.USP.IronSights.Union.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.USP.Muzzle.BrickColor = BrickColor.new("Medium stone grey") 
        game:GetService("ReplicatedStorage").HandModels.USP.Mag.BrickColor = BrickColor.new("Medium stonne grey") 
        game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Slide"].BrickColor = BrickColor.new("Sliver flip/flop") 
        game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Body"].BrickColor = BrickColor.new("Dark stone grey") end) 
        -- 
        GunsSector:AddLabel('Color'):AddColorPicker('GGGCCPP', { Default = Color3.new(0, 1, 0), Title = 'Guns Color', }) Options.GGGCCPP:OnChanged(function(GCS) 
            -----HMAR 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Barrel.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Body.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Bolt.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Stock.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Grip.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Mag.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Muzzle.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.ADS.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.Union.Color = GCS 
            -----PipeSMG 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.ADS.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.Union.Color = GCS
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Mag.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Flap.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Muzzle.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Body.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Bolt.Color = GCS 
            -----USP 
            game:GetService("ReplicatedStorage").HandModels.USP.IronSights.ADS.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.USP.IronSights.Union.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.USP.Muzzle.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.USP.Mag.Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Slide"].Color = GCS 
            game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Body"].Color = GCS 
        end) 
        --]] 
        GunsSector:AddDropdown('GColorDrop', { Values = { 'Default', 'Force Field', 'Neon' }, Default = 1, Multi = false, Text = 'Guns Materials', Tooltip = 'yup', })
        Options.GColorDrop:OnChanged(function(ggggggg1) if ggggggg1 == "Default" then
            -----HMAR 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Barrel.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Body.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Bolt.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Stock.Material = Enum.Material.Wood 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Grip.Material = Enum.Material.Wood 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Mag.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.HMAR.Muzzle.Material = Enum.Material.Wood 
            game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.ADS.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.Union.Material = Enum.Material.Metal 
            -----PipeSMG 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.ADS.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.Union.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Mag.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Flap.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Muzzle.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Body.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.PipeSMG.Bolt.Material = Enum.Material.Metal 
            -----USP 
            game:GetService("ReplicatedStorage").HandModels.USP.IronSights.ADS.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.USP.IronSights.Union.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.USP.Muzzle.Material = Enum.Material.Plastic 
            game:GetService("ReplicatedStorage").HandModels.USP.Mag.Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Slide"].Material = Enum.Material.Metal 
            game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Body"].Material = Enum.Material.Metal elseif ggggggg1 == "Force Field" then 
                -----HMAR 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Barrel.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Body.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Bolt.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Stock.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Grip.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Mag.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Muzzle.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.ADS.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.Union.Material = Enum.Material.ForceField 
                -----PipeSMG 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.ADS.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.Union.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Mag.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Flap.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Muzzle.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Body.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Bolt.Material = Enum.Material.ForceField 
                -----USP 
                game:GetService("ReplicatedStorage").HandModels.USP.IronSights.ADS.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.USP.IronSights.Union.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.USP.Muzzle.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.USP.Mag.Material = Enum.Material.ForceField 
                game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Slide"].Material = Enum.Material.ForceField
                game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Body"].Material = Enum.Material.ForceField 
            elseif ggggggg1 == "Neon" then
                -----HMAR 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Barrel.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Body.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Bolt.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Stock.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Grip.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Mag.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.Muzzle.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.ADS.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.HMAR.IronSights.Union.Material = Enum.Material.Neon 
                -----PipeSMG 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.ADS.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.IronSights.Union.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Mag.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Flap.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Muzzle.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Body.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.PipeSMG.Bolt.Material = Enum.Material.Neon 
                -----USP game:GetService("ReplicatedStorage").HandModels.USP.IronSights.ADS.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.USP.IronSights.Union.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.USP.Muzzle.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.USP.Mag.Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Slide"].Material = Enum.Material.Neon 
                game:GetService("ReplicatedStorage").HandModels.USP["Meshes/USP_Body"].Material = Enum.Material.Neon 
            end 
        end) 
        local MiscTab = Window:AddTab('Misc') local HHHSector = MiscTab:AddLeftGroupbox('....') 
        --KeyBind1 
        HHHSector:AddLabel('X-Ray'):AddKeyPicker('XRKB', { Default = 'T', SyncToggleState = false, Mode = 'Toggle', Text = 'X-Ray', NoUI = false, }) 
        Options.XRKB:OnClick(function() 
            if WallHackOn == false 
            then WallHackOn = true 
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
                    if v:FindFirstChild("Hitbox") then 
                        v.Hitbox.Transparency = XRTransparency 
                    end 
                end 
            else 
                WallHackOn = false 
                for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
                    if v:FindFirstChild("Hitbox") then 
                        v.Hitbox.Transparency = 0
                    end 
                end 
            end 
        end) 
        --Slider3 
        HHHSector:AddSlider('XRTS', { Text = 'X-Ray Transparency', Default = 0.9, Min = 0, Max = 1, Rounding = 1, Compact = false, }) 
        Options.XRTS:OnChanged(function(TT) XRTransparency = TT end) 
        --KeyBind2 
        HHHSector:AddLabel('Give all'):AddKeyPicker('gakb', { Default = 'F', SyncToggleState = false, Mode = 'Toggle', Text = 'Give all', NoUI = false, }) 
        Options.gakb:OnClick(function() 
            game:GetService("ReplicatedStorage").e:FireServer(106, 1, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 2, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 3, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 4, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 5, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 6, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 7, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 8, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 9, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 10, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 11, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 12, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 13, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 14, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 15, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 16, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 17, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 18, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 19, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 20, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 21, true) 
            game:GetService("ReplicatedStorage").e:FireServer(106, 22, true) 
        end) 
        local SoundsSector = MiscTab:AddLeftGroupbox('Sounds') 
        SoundsSector:AddDropdown('HitSoundssss', { Values = { 'Stock', 'Neverlose', 'Rust', 'HZ','Bruh', 'TF2' }, Default = 1, Multi = false, Text = 'Hit Sound', Tooltip = 'This is a tooltip', }) 
        Options.HitSoundssss:OnChanged(function(Suuu) 
            if Suuu == "Stock" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://9114487369") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            elseif Suuu == "Neverlose" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://6607204501") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            elseif Suuu == "Rust" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://4764109000") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            elseif Suuu == "HZ" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://705502934") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            elseif Suuu == "Bruh" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://4275842574") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            elseif Suuu == "TF2" then 
                game:GetService("SoundService").PlayerHit2.SoundId = ("rbxassetid://2868331684") 
                game:GetService("SoundService").PlayerHit2.Playing = true 
            end 
        end) 
        local GunmodsSector = MiscTab:AddLeftGroupbox('Gun mods') 
        ---// Gun Deect Functions \\--- 
        local PipePistolDerect = require(game.ReplicatedStorage.ItemConfigs.PipePistol) 
        local PipeSMGDerect = require(game.ReplicatedStorage.ItemConfigs.PipeSMG) 
        local USPDerect = require(game.ReplicatedStorage.ItemConfigs.USP) 
        local HMARDerect = require(game.ReplicatedStorage.ItemConfigs.HMAR) 
        local CrossbowDerect = require(game.ReplicatedStorage.ItemConfigs.Crossbow) 
        local BowDerect = require(game.ReplicatedStorage.ItemConfigs.Bow) 
        ---// Guns Mods Toggles \\--- 
        GunmodsSector:AddToggle('RFire', { Text = 'Rapid Fire', Default = false, Tooltip = '', }) 
        Toggles.RFire:OnChanged(function(RFi) 
            if RFi == true then 
            PipePistolDerect.attackCooldown = 0 
            PipeSMGDerect.attackCooldown = 0 
            USPDerect.attackCooldown = 0 
            HMARDerect.attackCooldown = 0 
            --// Чтобы юсп был авто \\-- 
            USPDerect.fireAction = "auto" 
            --// Чтобы пистолет из труб был авто \\-- 
            PipePistolDerect.fireAction = "auto" 
        elseif RFi == false then 
            PipePistolDerect.attackCooldown = 0.2 
            PipeSMGDerect.attackCooldown = 0.15 
            USPDerect.attackCooldown = 0.2 
            HMARDerect.attackCooldown = 0.11 
            --// Чтобы юсп был стандартным \\-- 
            USPDerect.fireAction = "semi" 
            --// Чтобы пистолет из труб был стандартным \\-- 
            PipePistolDerect.fireAction = "semi" 
        end 
    end) 
    GunmodsSector:AddToggle('NoRe', { Text = 'NoRecoil', Default = false, Tooltip = '', }) 
    Toggles.NoRe:OnChanged(function(callback) 
        norecoil = callback 
        old = hookfunction(a.Recoil,function(...) 
            if norecoil == true then 
                return nil 
            else return old(...) 
            end 
        end) 
    end) 
    GunmodsSector:AddToggle('NoS', { Text = 'No Scatter', Default = false, Tooltip = '', }) 
    Toggles.NoS:OnChanged(function(NoSCA) if NoSCA == true then 
        PipePistolDerect.accuracy = 10000 
        PipeSMGDerect.accuracy = 10000 
        USPDerect.accuracy = 100000 
        HMARDerect.accuracy = 70000 
    elseif NoSCA == false then 
        PipePistolDerect.accuracy = 5000 
        PipeSMGDerect.accuracy = 5000 
        USPDerect.accuracy = 4000 
        HMARDerect.accuracy = 7000 
    end 
end) 
local CombatTab = Window:AddTab('Combat') 
local AimLockSector = CombatTab:AddLeftGroupbox('Aim Lock') 
--KeyBind2 
AimLockSector:AddLabel('Key'):AddKeyPicker('AIMKBK', { Default = 'Y', SyncToggleState = false, Mode = 'Toggle', Text = 'Key', NoUI = false, }) 
Options.AIMKBK:OnClick(function(Value) 
    local Target; 
    if AimbotTrue == false then 
        AimbotTrue = true 
        while AimbotTrue == true do 
            Target = getClosestPlayerToPlayer(); 
            if Target then 
                local Head = Target:FindFirstChild("Head"); 
                if Head then 
                    local pos, _ = Cameras:WorldToScreenPoint(Head.Position) 
                    mousemoverel((pos.X - (Mouse.X))/_Aimbot["AimSmooth"], (pos.Y - (Mouse.Y))/_Aimbot["AimSmooth"]) 
                end 
            end 
            wait(0.01) 
        end 
    else 
        AimbotTrue = false 
    end 
end) 
--Toggle3 
AimLockSector:AddToggle('vftt', { Text = 'Visible Fov', Default = false, Tooltip = 'Off/On Visible Fov', }) 
Toggles.vftt:OnChanged(function(J) 
    fovcircle.Visible = J 
end) 
AimLockSector:AddToggle('FTT', { Text = 'Filled', Default = false, Tooltip = 'Off/On Visible Fov', }) 
Toggles.FTT:OnChanged(function(FFOV) 
    fovcircle.Filled = FFOV 
end) 
AimLockSector:AddSlider('ft', { Text = 'Filled Transparency', Default = 0.5, Min = 0, Max = 1, Rounding = 1, Compact = false, }) 
Options.ft:OnChanged(function(fffrt) 
    fovcircle.Transparency = fffrt 
end) 
--ColorPiker2 
AimLockSector:AddLabel('Fov Color'):AddColorPicker('CCFF', { Default = Color3.new(0, 1, 0), Title = 'Fov Color', }) 
Options.CCFF:OnChanged(function(KKK) 
    fovcircle.Color = KKK 
end) 
--Slider3 
AimLockSector:AddSlider('ADSSS', { Text = 'Aim ditance', Default = 300, Min = 300, Max = 1200, Rounding = 1, Compact = false, }) 
Options.ADSSS:OnChanged(function(t) 
    ASSettings["AimDis"] = t 
end) 
--Slider4 
AimLockSector:AddSlider('frsss', { Text = 'Fov radius', Default = 0, Min = 0, Max = 600, Rounding = 1, Compact = false, }) 
Options.frsss:OnChanged(function(t) 
    fovcircle.Radius = t 
end) 
--Slider5
AimLockSector:AddSlider('ASSSS', { Text = 'Aim smothnes', Default = 21, Min = 0, Max = 100, Rounding = 1, Compact = false, }) 
Options.ASSSS:OnChanged(function(t) 
    _Aimbot["AimSmooth"] = t/10 
end) 
local HitBoxSector = CombatTab:AddLeftGroupbox('HitBox') 
-- 
local HTTransparency = 0.8 
local XSize = 3 
local YSize = 6 
local ZSize = 2 
-- 
--Toggle4 
HitBoxSector:AddToggle('HBTTTT', { Text = 'Extends Torso HitBox', Default = false, Tooltip = 'Off/On HitBox', }) 
Toggles.HBTTTT:OnChanged(function(HeadExtends) 
    if HeadExtends == true then 
        while HeadExtends == true do 
            for v, i in pairs(game:GetService("Workspace"):GetChildren()) do 
                if i:FindFirstChild("Humanoid") then if i:FindFirstChild("HumanoidRootPart") then 
                    if not i:FindFirstChild("HedsOn") then 
                        if i ~= game.Players.LocalPlayer.Character then 
                            local BigHeadsPart = Instance.new("Part") 
                            BigHeadsPart.Name = "Torso" 
                            BigHeadsPart.Anchored = false 
                            BigHeadsPart.CanCollide = false 
                            BigHeadsPart.Transparency = HTTransparency 
                            BigHeadsPart.Size = Vector3.new(XSize, YSize, ZSize) 
                            local HeadsParts = BigHeadsPart:Clone() 
                            HeadsParts.Parent = i 
                            HeadsParts.Orientation = i.HumanoidRootPart.Orientation 
                            local HedsOn = HedsOn:Clone() 
                            HedsOn.Parent = i 
                            local Headswelding = Instance.new("Weld") 
                            Headswelding.Parent = HeadsParts 
                            Headswelding.Part0 = i.HumanoidRootPart 
                            Headswelding.Part1 = HeadsParts 
                            HeadsParts.Position = Vector3.new(i.HumanoidRootPart.Position.X,i.HumanoidRootPart.Position.Y - 0.4, i.HumanoidRootPart.Position.Z) 
                        end 
                    end 
                end 
            end 
        end 
        wait(3) 
    end 
else 
    if HeadExtends == false then 
        for v, i in pairs(game:GetService("Workspace"):GetChildren()) do 
            if i:FindFirstChild("Humanoid") then 
                if i:FindFirstChild("HumanoidRootPart") then 
                    if i:FindFirstChild("HedsOn") then 
                        i.HedsOn:Remove() 
                        for x,a in pairs(i:GetChildren()) do 
                            if a.Name == "Torso" then 
                                if not a:FindFirstChild("Nametag") and not a:FindFirstChild("Face") then 
                                    a:Remove() 
                                end 
                            end 
                        end
                    end 
                end 
            end 
        end 
    end 
end 
end) 
HitBoxSector:AddSlider('CHSSS', { Text = 'Transparency', Default = 0.8, Min = 0, Max = 1, Rounding = 1, Compact = false, }) 
Options.CHSSS:OnChanged(function(HT) 
    HTTransparency = HT 
end) 
HitBoxSector:AddSlider('XHBSS', { Text = 'X Size', Default = 3, Min = 0, Max = 10, Rounding = 1, Compact = false, }) 
Options.XHBSS:OnChanged(function(X) 
    XSize = X 
end) 
HitBoxSector:AddSlider('yHBSS', { Text = 'Y Size', Default = 6, Min = 0, Max = 10, Rounding = 1, Compact = false, }) 
Options.yHBSS:OnChanged(function(Y) 
    YSize = Y 
end) 
HitBoxSector:AddSlider('zHBSS', { Text = 'Z Size', Default = 2, Min = 0, Max = 10, Rounding = 1, Compact = false, }) 
Options.zHBSS:OnChanged(function(Z) 
    ZSize = Z 
end) 
-- | UI Settings | -- 
local Tabs = { ['UI Settings'] = Window:AddTab('Info'), } 
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu') 
MenuGroup:AddButton('Unload', function() 
    Library:Unload() 
end) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'Home', NoUI = true, Text = 'Menu keybind' }) 
Library.ToggleKeybind = Options.MenuKeybind 
MenuGroup:AddToggle('WMTT', { Text = 'Watermark', Default = true, Tooltip = 'Off/On Watermark', }) 
Toggles.WMTT:OnChanged(function(wttt) 
    Library:SetWatermarkVisibility(wttt) 
end) 
MenuGroup:AddToggle('KBTT', { Text = 'Keybind', Default = true, Tooltip = 'Off/On Keybind', }) 
Toggles.KBTT:OnChanged(function(KBTTTT) 
    Library.KeybindFrame.Visible = KBTTTT 
end) 
Library.KeybindFrame.Visible = true;
Library:OnUnload(function() 
    Library.Unloaded = true 
end) 
ThemeManager:SetLibrary(Library) 
SaveManager:SetLibrary(Library) 
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 
ThemeManager:SetFolder('MyScriptHub') 
SaveManager:SetFolder('MyScriptHub/specific-game') 
SaveManager:BuildConfigSection(Tabs['UI Settings']) 
ThemeManager:ApplyToTab(Tabs['UI Settings'])
