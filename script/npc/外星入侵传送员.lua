local map_name = "外星入侵第一重"
local dgn = ""
function on_create(npc)
end

function main(player, npc)
	local msg = ""
	if lualib:GetStr("0", "scheduled_wxrq1_dgn") == "" then
		msg = "活动还没开始，请留意活动时间！"
	else
		msg = "勇士，看来你已经准备好消灭所有外星入侵者了，是否进入" .. map_name .. "？\n"
		msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n \n \n"
		msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700015##OFFSET<X:0,Y:-1>#<@jump *01*【进入" .. map_name .. "】>\n \n \n \n \n"
		msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@leave *01*离开>\n"
	end
	return msg
end

function leave(player,npc)
	return ""
end

function jump(npc, player)
	lualib:Player_SetDgnTicket(player, lualib:GetStr("0", "scheduled_wxrq1_dgn")) 

	if lualib:Player_EnterDgn(player, map_name, 0, 0, 0) == false then
		lualib:SysMsg_SendWarnMsg(player, "您不能进入" .. map_name .. "！！！")
		return "您不能进入"
	end	
end
