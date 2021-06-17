local noob = game.ReplicatedStorage.Noob
local giantnoob = game.ReplicatedStorage["Giant Noob"]
local wavenumbers = {"10", "20", "35", "40", "60", "70", "80"}
local number


for wave = 1, script.Waves.Value ,1 do
	number = tonumber(wavenumbers[wave])
	for k = 1, number, 1 do
		wait()
		local x = math.random(-100, 50)
		local y = 8 
		local z = math.random(-100, 50)
				
		local clone = noob:Clone()
		if clone:FindFirstChild("Humanoid") then
			clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
			clone.Parent = game.Workspace
		else
			clone:WaitForChild("Humanoid")
			clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
			clone.Parent = game.Workspace 
		end
	end
	for k = 1, (number / 5), 1 do
		wait()
		local x = math.random(-100, 50)
		local y = 8 
		local z = math.random(-100, 50)

		local clone = giantnoob:Clone()
		if clone:FindFirstChild("Humanoid") then
			clone.Torso.CFrame = CFrame.new(x, y, z)
			clone.Parent = game.Workspace
		else
			clone:WaitForChild("Humanoid")
			clone.Torso.CFrame = CFrame.new(x, y, z)
			clone.Parent = game.Workspace 
		end
	end
	
	for _,v in pairs(game.Players:GetPlayers()) do
		v.PlayerGui.TalkingGUI.Wave.TextLabel.Text = "Wave "..tonumber(wave)
	end
	
	while wait() do
		if game.Workspace:FindFirstChild("Noob") == nil and game.Workspace:FindFirstChild("Giant Noob") == nil then
			wait(3)
			break
		end
	end
	
	if wave == 7 then
		started = false
		break
	end
	
end

local players = game.Players:GetPlayers()
local player = game.Players:FindFirstChild(tostring(players[1]))

local GameId = 6941622054
game:GetService('TeleportService'):Teleport(GameId, player)