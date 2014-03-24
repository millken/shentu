local talk_t = {"勇士，你已经消灭了所有外星入侵人，还有更艰巨的任务等着你。"}
local map_name = "外星入侵第二重"
local dgn = ""
function on_create(npc)
	lualib:AddTimer(npc, 1, 270000, -1, "on_timer_talk")

end

function on_timer_talk(npc, timer_id)

		lualib:SysMsg_SendRoleTalk(npc, talk_t[lualib:GenRandom(1, #talk_t)])

end

function main(player, npc)
	local msg = "你已经消灭第一重上的所有外星人，是否进入第二重？\n"
	msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n \n \n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700015##OFFSET<X:0,Y:-1>#<@jump *01*【进入" .. map_name .. "】>\n \n \n \n \n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@leave *01*离开>\n"
	return msg
end

function leave(player,npc)
	return ""
end

function jump(npc, player)
	lualib:Player_SetDgnTicket(player, lualib:GetStr("0", "scheduled_wxrq2_dgn")) 
	if lualib:Player_EnterDgn(player, map_name, 0, 0, 0) == false then
		lualib:SysMsg_SendWarnMsg(player, "您不能进入" .. map_name .. "！！！")
		return "您不能进入"
	end	
end
