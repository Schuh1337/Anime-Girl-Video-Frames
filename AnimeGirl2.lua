local Keybind = Enum.KeyCode.KeypadSeven
local Active = true
if not isfolder("AnimeGirl2") then
    makefolder("AnimeGirl2")
    if not isfile("AnimeGirl2/AnimeGirl2.webm") then
        data = game:HttpGet("https://luaxx.com/Resources/PovSchuh2.webm")
        writefile("AnimeGirl2/AnimeGirl2.webm", data)
    end
end
local screenPart = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenPart.Enabled = true
local fram = Instance.new("Frame", screenPart)
fram.Size = UDim2.new(.1, 0, .2, 0)
fram.BackgroundTransparency = 1
fram.Visible = true
local videoFrame = Instance.new("VideoFrame")
videoFrame.Parent = fram
videoFrame.Size = UDim2.new(1, 0, 1, 0)
videoFrame.BackgroundTransparency = 1
videoFrame.Looped = true
videoFrame.Video = getsynasset("AnimeGirl2/AnimeGirl2.webm")
fram.Active = true
fram.Selectable = true
fram.Draggable = true
while not videoFrame.IsLoaded do
    task.wait()
end
videoFrame:Play()
game.UserInputService.InputBegan:Connect(function(Key, Verified)
    if (not Verified) then
        if (Key.KeyCode == Keybind) then
            if Active == true then
                screenPart.Enabled = false
                videoFrame:Pause()
                Active = false
            else
                Active = true
                if Active then
                    videoFrame:Play()
                    screenPart.Enabled = true
                end
            end
        end
    end
end)