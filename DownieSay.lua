local userid_to_entindex = client.userid_to_entindex
local get_player_name = entity.get_player_name
local get_local_player = entity.get_local_player
local is_enemy = entity.is_enemy
local console_cmd = client.exec
local ui_get = ui.get
local trashtalk = ui.new_checkbox("MISC", "Settings", "Downie Say Made by neroh")

local baimtable = {
	"What's Up Bro ? Oh you dead XDDDD",
	"I'll put my dick down your throat",
	"Gamesence is a Cs Go software for modify da game. It is made by a man call wish and he can gernerate 100 invite.",
	"im not bhave cheat skeet but want really to have it?",
	"You Noob Bro , Its you ?",
	"I kill you with Ease Xd",
	"I bet you are Still IDIOT in 2020",
	"I use skeet btv Not otk",
	"Dis kil say is maked (not pazte) by neroh#1165",
	"What was that Xd",
	"Fuck You . = Dead",
	"IDIOT",
	"Im famous HxH U want me youtube Cahmnel?",
	"Hi idiot you asrasedrjsdfjsdf IIIIAAAA",
	"You fucking horen son You dead",
	"Dude... Xd",
	"Fuck!AA..",
	"You are noobest",
	"DEMOLISHED DESTROYED HUMILIATED HOLZED OWNED",
	"Yo... Why dead ?",
	"How it feel you die ? . Xd",
	"OH FCUK!!! THAT WAS COOL IDIOT",
	"Ha It suck to dead by me Xd",
	"You miss my Anti-aimbot angle how Xd",
	"Guess what . What . DEAD",
	"Hello ? Why you idiot ? Oh you no school and",
	"You are noob like not Me . I am winner",
	'˜" ° • .˜ "° • You mother FAT • °" ˜. • ° "˜',
	"3asy XDDDDDDDDDD",
	"You are",
	"Xd DEAD onse again To me HXHLEGEND LOL",
	"im kill again",
	"Rofl Noob .",
	"ESC -> Help and Options -> How to Play",
	"For pregnant girls, I recommend skeet with vitamins",
	"Вам нравится член",
	"Wreckedededed by superior configuereerereerrr xDD",
	"Imagine having the noobest dead lol",
	"Are you scared? Yeah!",
	"Go !ff (EXCLAMATION MARK FORFIET) - Xd",  

}
local hstable = baimtable

local deathtable = {
	"You say you're a bad guy...",
    "Heard you sell invitations, stick to the injections",
    "Missed shot due to my lethal mortality",
    "Fuck you asshole until the caramels come out your ass",
    "The priest knows you walk dug up?",
    "I sincerely encourage you to have an abortion, no matter how old you are...",
    "As I fuck you in the chest, your arms clap",
    "When I take my cock out, all pregnant women get abortions",
    "You little fagot",
    "God give you short hands to make your ass itch",
    "I'd fuck you, but my dick is mine",
    "How many dicks did you break last night?",
    "Kill me, my keyboard disconnected",
    "The mouse left my desk, go ahead and kill me",
    "I was going to fall into your stupid pussy",
    "Put my heavy balls in your pussy",
    "He will put his penis in the crypt where I keep you",
    "Ask me if my knee still hurts after a night with your mother",
    "If I put my penis on your shoulder, you'll say you carried the tree to the home",
    "Oho, I was configuring the negev",
    "You don't want a dick in your mouth, but you keep taking it",
    "You are shitting with railway stones",
    "You know I'm a moneylender, tear to shreds and then disappear",
    "I put my dick in my mouth to give you weight",
    "You better see how I spit in your soup",
    "You give me a blowjob until I hit your arms with your heels",
    "You suck me off if you kill me again!",
    "Ohooooo, you killed me! Suck my bird until I cum!",
    "Your mother hates you too, slave...",
    "Don't worry about your dead face",
    "You have an average for slaves"
}


local function get_table_length(data)
  if type(data) ~= 'table' then
    return 0
  end
  local count = 0
  for _ in pairs(data) do
    count = count + 1
  end
  return count
end

local num_quotes_baim = get_table_length(baimtable)
local num_quotes_hs = get_table_length(hstable)
local num_quotes_death = get_table_length(deathtable)

local function on_player_death(e)
	if not ui_get(trashtalk) then
		return
	end
	local victim_userid, attacker_userid = e.userid, e.attacker
	if victim_userid == nil or attacker_userid == nil then
		return
	end

	local victim_entindex   = userid_to_entindex(victim_userid)
	local attacker_entindex = userid_to_entindex(attacker_userid)
	if attacker_entindex == get_local_player() and is_enemy(victim_entindex) then
		if e.headshot then
			    local commandhs = 'say ' .. hstable[math.random(num_quotes_hs)]
                console_cmd(commandhs)
		else
			    local commandbaim = 'say ' .. baimtable[math.random(num_quotes_baim)]
                console_cmd(commandbaim)
		end
	end
	if victim_entindex == get_local_player() and attacker_entindex ~= get_local_player() then
          local commandbaim = 'say ' .. deathtable[math.random(num_quotes_death)]
          console_cmd(commandbaim)
	elseif victim_entindex == get_local_player() and attacker_entindex == get_local_player() then
			console_cmd("say I did it on purpose xD")
	end
end

client.set_event_callback("player_death", on_player_death)