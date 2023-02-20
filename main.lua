--[[

NonHub - The best script for developing scripts and having fun.

Copyright 2023 lukas2011111

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

]]

--// Services \\--

local MarketPlaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

--// NonHub \\--

local NonHub = {
	Functions = {};
	DefaultFunctions = {};
	DefaultElements = {};
	Values = {};
	Data = {FeatherIcons = {}};
	Ui = {ScreenGui = {}, Other = {}};
}

--// Http \\--

pcall(function()
	NonHub.Data["FeatherIcons"] = HttpService:JSONDecode(game:HttpGetAsync("https://raw.githubusercontent.com/evoincorp/lucideblox/master/src/modules/util/icons.json")).icons
end)

--// Other \\--

function NonHub:IsRunning()
	if NonHub.Ui.ScreenGui["screengui_0000"] then
		return true
	else
		return false
	end
end

--// Default Functions \\--

function NonHub.DefaultFunctions.Setup()
	NonHub.DefaultFunctions.Initialize()

	if NonHub.Values.Enabled == false then return NonHub.DefaultFunctions.Print("Script is disabled.") end

	print(NonHub)
end

function NonHub.DefaultFunctions.Initialize()
	NonHub.Values["Version"] = "1.0"
	NonHub.Values["Enabled"] = true

	NonHub.Data["Player"] = {Name = ""}

	local folder_0000 = Instance.new("Folder", ReplicatedStorage)
	folder_0000.Name = "__nonhub"..math.random(10,100000)..math.random(10,100000)..math.random(10,100000)
	NonHub.DefaultElements["folder_0000"] = {Name = "__nonhub", Parent = ReplicatedStorage}
	NonHub.DefaultFunctions.Print(folder_0000.Name.." was created by default")

	local folder_0001 = Instance.new("Folder", folder_0000)
	folder_0001.Name = "default"
	NonHub.DefaultElements["folder_0001"] = {Name = "default", Parent = folder_0000}
	NonHub.DefaultFunctions.Print(folder_0001.Name.." was created by default")

	local folder_0002 = Instance.new("Folder", folder_0000)
	folder_0002.Name = "icons"
	NonHub.DefaultElements["folder_0002"] = {Name = "icons", Parent = folder_0000}
	NonHub.DefaultFunctions.Print(folder_0002.Name.." was created by default")

	local screengui_0000 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	screengui_0000.Name = "__nonhub"
	NonHub.Ui.ScreenGui["screengui_0000"] = {Name = "__nonhub"}
	NonHub.DefaultFunctions.Print(screengui_0000.." was created by default")

	NonHub.DefaultFunctions.Print("Successfully initialized.")
end

function NonHub.DefaultFunctions.GetIcon(name)
	if NonHub.Data.FeatherIcons[name] ~= nil then
		return NonHub.Data.FeatherIcons[name]
	else
		return nil
	end
end

function NonHub.DefaultFunctions.Print(text)
	warn("NonHub | "..text)
end

--// Functions \\--

function NonHub.Functions.Load()
	local PlaceName = MarketPlaceService:GetProductInfo(game.PlaceId).Name
end

function NonHub.Functions.SendNotification(title, description, time)
	NonHub.DefaultFunctions.Print("SendNotification is currently disabled.")
end

--

NonHub.DefaultFunctions.Setup()

return NonHub
