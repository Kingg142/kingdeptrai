game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "King Gui",
		Text = "Loading . . .",
	}
)
wait(1)
game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "King Gui",
		Text = "Authenticating..",
	}
)
wait(1)
game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "King Gui",
		Text = "Setting Up...",
	}
)
wait(1)
game.StarterGui:SetCore(
	"SendNotification",
	{
		Title = "King Gui",
		Text = "wellcome to my scirtp >:3",
	}
)
wait(3)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slattisbabygirl/cattoware/main/Wcatto.lua"))()

local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local Notify = NotifyLibrary.Notify
Library.theme.accentcolor = Color3.fromRGB(255, 0, 0) -- Đổi sang đỏ
Library.theme.accentcolor2 = Color3.fromRGB(255, 0, 0) -- Đổi sang đỏ

local Window = Library:CreateWindow("Kingg Paid Gui", Vector2.new(492, 598), Enum.KeyCode.P)

local AimingTab = Window:CreateTab("Aiming")
local MiscTab = Window:CreateTab("Misc")

local sector1 = AimingTab:CreateSector("Targeting", "left")

sector1:AddButton("Target Aim", function()
    local Settings = {
        rewrittenmain = {
            Enabled = true,
            Key = "c",
            DOT = true,
            AIRSHOT = true,
            NOTIF = true,
            AUTOPRED = true,
            FOV = math.huge,
            RESOVLER = false
        }
    }
 
    local SelectedPart = "HumanoidRootPart"
    local Prediction = true
    local PredictionValue = 0.12642392
 
    local AnchorCount = 0
    local MaxAnchor = 50
 
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local accomidationfactor = 0.15311221541002
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
 
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = Settings.rewrittenmain.DOT
        local a = Instance.new("Frame", e)
        if Settings.rewrittenmain.DOT == true then
            a.Size = UDim2.new(1, 0, 1, 0)
        else
            a.Size = UDim2.new(0, 0, 0, 0)
        end
        if Settings.rewrittenmain.DOT == true then
            a.Transparency = 0
            a.BackgroundTransparency = 0
        else
            a.Transparency = 1
            a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if Settings.rewrittenmain.DOT == false then
            g.CornerRadius = UDim.new(0, 0)
        else
            g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
 
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(0, 0, 0), 0.5, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if Settings.rewrittenmain.DOT == true then
            placemarker.Size = Vector3.new(10, 10, 10)
        else
            placemarker.Size = Vector3.new(5, 5, 5)
        end
        placemarker.Transparency = 0.75
        if Settings.rewrittenmain.DOT then
            makemarker(placemarker, placemarker, Color3.fromRGB(255, 0, 0), 3, 0) -- Đổi sang đỏ
        end
    end)
 
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
            if enabled == true then
                enabled = false
                if Settings.rewrittenmain.NOTIF == true then
                    Plr = getClosestPlayerToCursor()
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "";
                        Text = "Unlocked!",
                        Duration = 1
                    })
                end
            else
                Plr = getClosestPlayerToCursor()
                enabled = true
                if Settings.rewrittenmain.NOTIF == true then
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Kingg Target Ready!!!";
                        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 2
                    })
                end
            end
        end
    end)
 
    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = Settings.rewrittenmain.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
    local pingvalue = nil;
    local split = nil;
    local ping = nil;
 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
            placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if Settings.re Ascendant then
            if Settings.rewrittenmain.AUTOPRED == true then
                pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                split = string.split(pingvalue,'(')
                ping = tonumber(split[1])
                if ping < 130 then
                    PredictionValue = 0.1518
                elseif ping < 125 then
                    PredictionValue = 0.14988
                elseif ping < 110 then
                    PredictionValue = 0.14553132132121255556666672
                elseif ping < 105 then
                    PredictionValue = 0.1409340
                elseif ping < 90 then
                    PredictionValue = 0.13623132
                elseif ping < 80 then
                    PredictionValue = 0.131314253678192031927365421456789331
                elseif ping < 70 then
                    PredictionValue = 0.1424567
                elseif ping < 60 then
                    PredictionValue = 0.14132646
                elseif ping < 50 then
                    PredictionValue = 0.118532
                elseif ping < 40 then
                    PredictionValue = 0.12132
                elseif ping < 30 then
                    PredictionValue = 0.14231
                elseif ping < 20 then
                    PredictionValue = 0.13
                elseif ping < 10 then
                    PredictionValue = 0.09
                end
            end
        end
    end)
 
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then
            if Prediction == true then
                args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)
            else
                args[3] = Plr.Character[SelectedPart].Position
            end
            return old(unpack(args))
        end
        return old(...)
    end)
 
    game:GetService("RunService").RenderStepped:Connect(function()
        if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
            if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end
                    SelectedPart = "LeftFoot"
                else
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                        AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
                            Prediction = false
                            wait(2)
                            AnchorCount = 0;
                        end
                    else
                        Prediction = true
                        AnchorCount = 0;
                    end
                    SelectedPart = "HumanoidRootPart"
                end
            else
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
                SelectedPart = "HumanoidRootPart"
            end
        else
            SelectedPart = "HumanoidRootPart"
        end
    end)
end)

local sector1 = AimingTab:CreateSector("NgXanh Camlock", "right")

sector1:AddButton("NgXanh Camlock (c)", function()
    getgenv().OldAimPart = "Head"
    getgenv().AimPart = "HumanoidRootPart"
    getgenv().AimlockKey = "c"
    getgenv().AimRadius = 100
    getgenv().ThirdPerson = true 
    getgenv().FirstPerson = true
    getgenv().TeamCheck = false
    getgenv().PredictMovement = true
    getgenv().PredictionVelocity = 7.8
    getgenv().CheckIfJumped = true
    getgenv().Smoothness = true
    getgenv().SmoothnessAmount = 0.5

    local Players, Uis, RService, SGui = game:GetService"Players", game:GetService"UserInputService", game:GetService"RunService", game:GetService"StarterGui";
    local Client, Mouse, Camera, CF, RNew, Vec3, Vec2 = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), workspace.CurrentCamera, CFrame.new, Ray.new, Vector3.new, Vector2.new;
    local Aimlock, MousePressed, CanNotify = true, false, false;
    local AimlockTarget;
    local OldPre;
    
    getgenv().WorldToViewportPoint = function(P)
        return Camera:WorldToViewportPoint(P)
    end
    
    getgenv().WorldToScreenPoint = function(P)
        return Camera.WorldToScreenPoint(Camera, P)
    end
    
    getgenv().GetObscuringObjects = function(T)
        if T and T:FindFirstChild(getgenv().AimPart) and Client and Client.Character:FindFirstChild("Head") then 
            local RayPos = workspace:FindPartOnRay(RNew(
                T[getgenv().AimPart].Position, Client.Character.Head.Position)
            )
            if RayPos then return RayPos:IsDescendantOf(T) end
        end
    end
    
    getgenv().GetNearestTarget = function()
        local players = {}
        local PLAYER_HOLD  = {}
        local DISTANCES = {}
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= Client then
                table.insert(players, v)
            end
        end
        for i, v in pairs(players) do
            if v.Character ~= nil then
                local AIM = v.Character:FindFirstChild("Head")
                if getgenv().TeamCheck == true and v.Team ~= Client.Team then
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                elseif getgenv().TeamCheck == false and v.Team == Client.Team then 
                    local DISTANCE = (v.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
                    local RAY = Ray.new(game.Workspace.CurrentCamera.CFrame.p, (Mouse.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * DISTANCE)
                    local HIT,POS = game.Workspace:FindPartOnRay(RAY, game.Workspace)
                    local DIFF = math.floor((POS - AIM.Position).magnitude)
                    PLAYER_HOLD[v.Name .. i] = {}
                    PLAYER_HOLD[v.Name .. i].dist= DISTANCE
                    PLAYER_HOLD[v.Name .. i].plr = v
                    PLAYER_HOLD[v.Name .. i].diff = DIFF
                    table.insert(DISTANCES, DIFF)
                end
            end
        end
        
        if unpack(DISTANCES) == nil then
            return nil
        end
        
        local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
        if L_DISTANCE > getgenv().AimRadius then
            return nil
        end
        
        for i, v in pairs(PLAYER_HOLD) do
            if v.diff == L_DISTANCE then
                return v.plr
            end
        end
        return nil
    end
    
    Mouse.KeyDown:Connect(function(a)
        if not (Uis:GetFocusedTextBox()) then 
            if a == AimlockKey and AimlockTarget == nil then
                pcall(function()
                    if MousePressed ~= true then MousePressed = true end 
                    local Target;Target = GetNearestTarget()
                    if Target ~= nil then 
                        AimlockTarget = Target
                    end
                end)
            elseif a == AimlockKey and AimlockTarget ~= nil then
                if AimlockTarget ~= nil then AimlockTarget = nil end
                if MousePressed ~= false then 
                    MousePressed = false 
                end
            end
        end
    end)
    
    RService.RenderStepped:Connect(function()
        if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then 
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then 
                CanNotify = true 
            else 
                CanNotify = false 
            end
        end
        if Aimlock == true and MousePressed == true then 
            if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(getgenv().AimPart) then 
                if getgenv().FirstPerson == true then
                    if CanNotify == true then
                        if getgenv().PredictMovement == true then
                            if getgenv().Smoothness == true then
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position + AimlockTarget.Character[getgenv().AimPart].Velocity/PredictionVelocity)
                            end
                        elseif getgenv().PredictMovement == false then 
                            if getgenv().Smoothness == true then
                                local Main = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                            else
                                Camera.CFrame = CF(Camera.CFrame.p, AimlockTarget.Character[getgenv().AimPart].Position)
                            end
                        end
                    end
                end
            end
        end
        if CheckIfJumped == true then
            if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().AimPart = "UpperTorso"
            else
                getgenv().AimPart = getgenv().OldAimPart
            end
        end
    end)
end)

local sector8 = MiscTab:CreateSector("Misc Stuff", "left")

sector8:AddButton("LeGo Ware", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomcoder183/gui/main/script"))()
end)

local sector9 = MiscTab:CreateSector("Azure Modded", "right")

sector9:AddButton("Azure Modded", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
end)

local sector10 = MiscTab:CreateSector("Misc Stuff", "left")
sector10:AddButton("Fly (X)", function()
    local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
    
    localplayer = plr
    
    if workspace:FindFirstChild("Core") then
        workspace.Core:Destroy()
    end
    
    local Core = Instance.new("Part")
    Core.Name = "Core"
    Core.Size = Vector3.new(0.05, 0.05, 0.05)
    
    spawn(function()
        Core.Parent = workspace
        local Weld = Instance.new("Weld", Core)
        Weld.Part0 = Core
        Weld.Part1 = localplayer.Character.LowerTorso
        Weld.C0 = CFrame.new(0, 0, 0)
    end)
    
    workspace:WaitForChild("Core")
    
    local torso = workspace.Core
    flying = true
    local speed=10
    local keys={a=false,d=false,w=false,s=false}
    local e1
    local e2
    local function start()
        local pos = Instance.new("BodyPosition",torso)
        local gyro = Instance.new("BodyGyro",torso)
        pos.Name="EPIXPOS"
        pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
        pos.position = torso.Position
        gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        gyro.cframe = torso.CFrame
        repeat
            wait()
            localplayer.Character.Humanoid.PlatformStand=true
            local new=gyro.cframe - gyro.cframe.p + pos.position
            if not keys.w and not keys.s and not keys.a and not keys.d then
                speed=5
            end
            if keys.w then
                new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+0
            end
            if keys.s then
                new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                speed=speed+0
            end
            if keys.d then
                new = new * CFrame.new(speed,0,0)
                speed=speed+0
            end
            if keys.a then
                new = new * CFrame.new(-speed,0,0)
                speed=speed+0
            end
            if speed>10 then
                speed=5
            end
            pos.position=new.p
            if keys.w then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
            elseif keys.s then
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
            else
                gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            end
        until flying == false
        if gyro then gyro:Destroy() end
        if pos then pos:Destroy() end
        flying=false
        localplayer.Character.Humanoid.PlatformStand=false
        speed=10
    end
    e1=mouse.KeyDown:connect(function(key)
        if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
        if key=="w" then
            keys.w=true
        elseif key=="s" then
            keys.s=true
        elseif key=="a" then
            keys.a=true
        elseif key=="d" then
            keys.d=true
        elseif key=="x" then
            if flying==true then
                flying=false
            else
                flying=true
                start()
            end
        end
    end)
    e2=mouse.KeyUp:connect(function(key)
        if key=="w" then
            keys.w=false
        elseif key=="s" then
            keys.s=false
        elseif key=="a" then
            keys.a=false
        elseif key=="d" then
            keys.d=false
        end
    end)
    start()
end)
