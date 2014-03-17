local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function on_campaign_start(player, camp_id)
	--lualib:Debug("富贵书屋入场回调！")
    if not lualib:VerifyCampLevel(player, camp_id)
		return "您不符合活动所需等级\n"
    end
	lualib:SysMsg_SendTriggerMsg(player, "你收到了\"富贵书屋活动入场\"邀请！")
	
	local msg = "在同一座标站立不动10秒钟可以获得：\n每10秒获得20000000经验\n每10秒获得200元宝\n站得越久获得的越丰富 \n"
	msg = msg.."<@enter *01*我要参加>\n"
	msg = msg.."<@leave *01*我不参加>"
	lualib:NPCTalk(player, msg)
	end


function enter(player)
	lualib:Player_MapMove(player, "富贵书屋")
	return ""
end

function leave(player)
	return ""
end
