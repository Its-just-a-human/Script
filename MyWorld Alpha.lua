local Library = loadstring(game:Httpget("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()
local Window = Library.CreateLib("MyWorld","RJTheme1")
local Tab = Windows:NewTab("Fling Things and People")
local Section = Tab:newSection("By Qwerty007983")
Section:NewButton("Мощный бросок","сила 100", function()
	local bodyvel_Name = "FlingVelocity"
    local userinputs = game:GetService("UserInputService")
    local workspace = game:GetService("Workspace")
    local runservice = game:GetService("RunService")
    local debris = game:GetService("Debris")
    local strength = 100 -- Сила Откида (Не выше 350 или античит будет мешать)
    workspace.ChildAdded:Connect(function(model)
      if model.Name == "GrabParts" then
        local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
 
        if part_to_impulse then
            print("Part found!")
 
            local inputObj
            local velocityObj = Instance.new("BodyVelocity", part_to_impulse)

            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not model.Parent then
                    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                        print("Launched!")
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
                        debris:AddItem(velocityObj, 1)
                    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                        velocityObj:Destroy()
                        print("Cancel Launch!")
                    else
                        velocityObj:Destroy()
                        print("No two keys pressed!")
                    end
                end
            end)
        end
    end)
Section:NewButton("Мощный бросок","сила 350", function()
	local bodyvel_Name = "FlingVelocity"
    local userinputs = game:GetService("UserInputService")
    local workspace = game:GetService("Workspace")
    local runservice = game:GetService("RunService")
    local debris = game:GetService("Debris")
    local strength = 350 -- Сила Откида (Не выше 350 или античит будет мешать)
    workspace.ChildAdded:Connect(function(model)
      if model.Name == "GrabParts" then
        local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
 
        if part_to_impulse then
            print("Part found!")
 
            local inputObj
            local velocityObj = Instance.new("BodyVelocity", part_to_impulse)

            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not model.Parent then
                    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                        print("Launched!")
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
                        debris:AddItem(velocityObj, 1)
                    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                        velocityObj:Destroy()
                        print("Cancel Launch!")
                    else
                        velocityObj:Destroy()
                        print("No two keys pressed!")
                    end
                end
            end)
        end
    end)
Section:NewButton("Мощный бросок","сила 1000", function()
	local bodyvel_Name = "FlingVelocity"
    local userinputs = game:GetService("UserInputService")
    local workspace = game:GetService("Workspace")
    local runservice = game:GetService("RunService")
    local debris = game:GetService("Debris")
    local strength = 1000 -- Сила Откида (Не выше 350 или античит будет мешать)
    workspace.ChildAdded:Connect(function(model)
      if model.Name == "GrabParts" then
        local part_to_impulse = model["GrabPart"]["WeldConstraint"].Part1
 
        if part_to_impulse then
            print("Part found!")
 
            local inputObj
            local velocityObj = Instance.new("BodyVelocity", part_to_impulse)

            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not model.Parent then
                    if userinputs:GetLastInputType() == Enum.UserInputType.MouseButton2 then
                        print("Launched!")
                        velocityObj.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        velocityObj.Velocity = workspace.CurrentCamera.CFrame.lookVector * strength
                        debris:AddItem(velocityObj, 1)
                    elseif userinputs:GetLastInputType() == Enum.UserInputType.MouseButton1 then
                        velocityObj:Destroy()
                        print("Cancel Launch!")
                    else
                        velocityObj:Destroy()
                        print("No two keys pressed!")
                    end
                end
            end)
        end
    end)
Section:NewButton("Бросок в рай","кидает на высокие координаты", function() 
	local heavenGrabCor
    Window:Toggle("Heaven grab", true, function(Value)
      if Value then
        heavenGrabCor = coroutine.create(function()
            while true do
                pcall(function()
                    local child = workspace:FindFirstChild("GrabParts")
                    if child and child.Name == "GrabParts" then
                        local grabPart = child:FindFirstChild("GrabPart")
                        local grabbedPart = grabPart:FindFirstChild("WeldConstraint").Part1
                        local targetChar = grabbedPart.Parent
                        local target = targetChar.Torso
                        if targetChar then
                            local velocity = target:FindFirstChild("heavenG") or Instance.new("BodyVelocity")
                            velocity.Name = "heavenG"
                            velocity.Parent = target
                            velocity.Velocity = Vector3.new(0, 9999999, 0)
                            velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                            Debris:AddItem(velocity, 100)
                        end
                    end
                end)
                wait()
            end
        end)
        coroutine.resume(heavenGrabCor)
    else
        if heavenGrabCor then
            coroutine.close(heavenGrabCor)
            heavenGrabCor = nil
            for _, v in ipairs(Players:GetPlayers()) do
                local a = v.Torso
                if a then
                    for _, i in pairs(a:GetChildren()) do
                        if i.Name == "heavenG" and i:IsA("BodyVelocuty") then i:Destroy() end
                    end
                end
            end
        end
    end)
