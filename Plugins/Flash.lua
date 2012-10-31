--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewPlugin("Flash")
if not mod then return end

--------------------------------------------------------------------------------
-- Locals
--

-- Frames
local flasher = nil
local shaker = nil

-- Shake properties
local shaking = nil
local SHAKE_DURATION = 0.8
local SHAKE_X = 10
local SHAKE_Y = 10

-- color module
local colors = nil

-------------------------------------------------------------------------------
-- Initialization
--

function mod:OnPluginEnable()
	colors = BigWigs:GetPlugin("Colors")
	self:RegisterMessage("BigWigs_FlashShake")
end

-------------------------------------------------------------------------------
-- Shaking
--

local originalPoints = nil
local function startShake()
	if not shaking then
		-- store old worldframe positions, we need them all, people have frame modifiers for it etc.
		if not originalPoints then
			originalPoints = {}
			for i = 1, WorldFrame:GetNumPoints() do
				originalPoints[i] = {WorldFrame:GetPoint(i)}
			end
		end
		shaking = SHAKE_DURATION -- don't think we want to make this a setting.
		shaker:Show()
	end
end

local function shakeOnUpdate(frame, elapsed)
	shaking = shaking - elapsed
	local x, y = 0, 0 -- Resets to original position if we're supposed to stop.
	if shaking <= 0 then -- stop shaking
		shaking = nil
		shaker:Hide()
	else
		x = math.random(-SHAKE_X,SHAKE_X)
		y = math.random(-SHAKE_Y,SHAKE_Y)
	end
	WorldFrame:ClearAllPoints()
	for i, v in next, originalPoints do
		WorldFrame:SetPoint(v[1], v[2], v[3], v[4] + x, v[5] + y)
	end
end

-------------------------------------------------------------------------------
-- Event Handlers
--

function mod:BigWigs_FlashShake(event, module, key)
	if BigWigs.db.profile.flash then
		local r, g, b = colors:GetColor("flashshake", module, key)
		if not flasher then --frame creation
			local flashFrame = CreateFrame("Frame", nil, UIParent)
			flashFrame:SetFrameStrata("BACKGROUND")
			flashFrame:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background"})
			flashFrame:SetAllPoints(UIParent)
			flashFrame:SetBackdropColor(r, g, b, 0.55)
			flashFrame:SetAlpha(0)
			flashFrame:Hide()

			flasher = flashFrame:CreateAnimationGroup()
			flasher:SetScript("OnLoop", function(frame)
				frame.count = frame.count + 1
				if frame.count > 3 then
					frame:Stop()
					flashFrame:Hide()
				end
			end)
			flasher:SetScript("OnPlay", function(frame)
				frame.count = 0
				flashFrame:SetBackdropColor(r, g, b, 0.55)
				flashFrame:Show()
			end)
			flasher:SetLooping("BOUNCE")

			local fade = flasher:CreateAnimation("Alpha")
			fade:SetDuration(0.2)
			fade:SetChange(1)
		end
		flasher:Play()
	end
	if not WorldFrame:IsProtected() and BigWigs.db.profile.shake then
		if not shaker then
			shaker = CreateFrame("Frame", "BWShaker", UIParent)
			shaker:Hide()
			shaker:SetScript("OnUpdate", shakeOnUpdate)
		end
		startShake()
	end
end

