﻿------------------------------
--     Are you local?     --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Attumen the Huntsman"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local L2 = AceLibrary("AceLocale-2.2"):new("BigWigsCommonWords")
local horse = AceLibrary("Babble-Boss-2.2")["Midnight"]
local started

----------------------------
--      Localization     --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Attumen",

	phase = "Phase",
	phase_desc = "Warn when entering a new Phase",

	curse = "Cursed Tanks",
	curse_desc = "Warn when a warrior or druid is cursed by Intangible Presence",

	curse_trigger = "^([^%s]+) ([^%s]+) afflicted by Intangible Presence",
	curse_message = "Tank Cursed - %s",

	phase1_message = "Phase 1 - %s",
	phase2_trigger = "%s calls for her master!",
	phase2_message = "Phase 2 - %s & Attumen",
	phase3_trigger = "Come Midnight, let's disperse this petty rabble!",
	phase3_message = "Phase 3 - %s",
} end)

L:RegisterTranslations("deDE", function() return {
	phase = "Phase",
	phase_desc = "Warnt wenn eine neue Phase beginnt",

	curse = "Verfluchter Tank",
	curse_desc = "Warnt wenn ein Tank verflucht ist",

	curse_trigger = "^([^%s]+) ([^%s]+) von K\195\182rperlose Pr\195\164senz betroffen.",
	curse_message = "Tank verflucht - %s",

	phase1_message = "Phase 1 - %s",
	phase2_trigger = "%s ruft nach ihrem Meister!",
	phase2_message = "Phase 2 - %s & Attumen",
	phase3_trigger = "Komm Mittnacht, lass' uns dieses Gesindel auseinander treiben!",
	phase3_message = "Phase 3 - %s",
} end)


L:RegisterTranslations("frFR", function() return {
	phase = "Phase",
	phase_desc = "Pr\195\169viens quand la rencontre entre dans une nouvelle phase.",

	curse = "Tanks maudits",
	curse_desc = "Pr\195\169viens quand un guerrier ou un druide subit la Pr\195\169sence immat\195\169rielle.",

	curse_trigger = "^([^%s]+) ([^%s]+) les effets .* Pr\195\169sence immat\195\169rielle",
	curse_message = "Tank maudit - %s",

	phase1_message = "Phase 1 - %s",
	phase2_trigger = "%s appelle son ma\195\174tre\194\160!",
	phase2_message = "Phase 2 - %s & Attumen",
	phase3_trigger = "Viens, Minuit, allons disperser cette insignifiante racaille\194\160!",
	phase3_message = "Phase 3 - %s",
} end)


L:RegisterTranslations("koKR", function() return {
	phase = "단계",
	phase_desc = "새로운 단계 진입시 알림",

	curse = "저주 걸린 전사",
	curse_desc = "전사가 무형의 저주에 걸렸을 때 경고",

	curse_trigger = "^([^|;%s]*)(.*)무형의 존재에 걸렸습니다%.$",
	curse_message = "저주 걸린 전사 - %s",

	phase1_message = "1 단계 - %s",
	phase2_trigger = "%s|1이;가; 주인을 부릅니다!",
	phase2_message = "2 단계 - %s & 어튜멘",
	phase3_trigger = "이랴! 이 오합지졸을 데리고 실컷 놀아보자!",
	phase3_message = "3 단계 - %s",
} end)

----------------------------------
--    Module Declaration   --
----------------------------------

local mod = BigWigs:NewModule(boss)
mod.zonename = AceLibrary("Babble-Zone-2.2")["Karazhan"]
mod.enabletrigger = horse
mod.toggleoptions = {"phase", "curse", "bosskill"}
mod.revision = tonumber(("$Revision$"):sub(12, -3))

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	started = nil

	self:RegisterEvent("BigWigs_RecvSync")
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CurseEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CurseEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CurseEvent")

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

------------------------------
--     Event Handlers    --
------------------------------

function mod:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.phase and msg == L["phase3_trigger"] then
		self:Message(L["phase3_message"]:format(boss), "Important")
	end
end

function mod:CHAT_MSG_MONSTER_EMOTE(msg)
	if self.db.profile.phase and msg == L["phase2_trigger"] then
		self:Message(L["phase2_message"]:format(horse), "Urgent")
	end
end

function mod:BigWigs_RecvSync( sync, rest, nick )
	if self:ValidateEngageSync(sync, rest) and not started then
		started = true
		if self:IsEventRegistered("PLAYER_REGEN_DISABLED") then
			self:UnregisterEvent("PLAYER_REGEN_DISABLED")
		end
		if self.db.profile.phase then
			self:Message(L["phase1_message"]:format(horse), "Attention")
		end
	end
end

function mod:CurseEvent(msg)
	local cplayer, ctype = select(3, msg:find(L["curse_trigger"]))
	if cplayer and ctype and self.db.profile.curse then
		local id = nil
		if cplayer == L2["you"] and ctype == L2["are"] then
			cplayer = UnitName("player")
			id = "player"
		else
			for i = 1, GetNumRaidMembers() do
				if UnitName("raid"..i) == cplayer then
					id = "raid"..i
					break
				end
			end
		end
		if not id then return end
		if UnitPowerType(id) == 1 then
			self:Message(L["curse_message"]:format(cplayer), "Attention")
		end
	end
end

