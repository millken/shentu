local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function on_campaign_start(player, dgn)
	--lualib:Debug("情感危机入场回调！")
	
	local level = lualib:Player_GetIntProp(player,  lua_role_level)
	if level < 25 or level > 200 then return end
	
	lualib:SysMsg_SendTriggerMsg(player, "你收到了\"情感危机活动入场\"邀请！")
	
	local msg = "人类因为存在着猜疑、嫉妒、争执、怨恨等因素，致使情魔危害日益扩大，大有入侵情缘小村之势。为使人类重归美好，更幸福快乐生活，情缘村村长邀请各勇士参与屠魔：\n \n"
	msg = msg.."<@enter *01*参与解求危机>\n"
	msg = msg.."<@leave *01*我很忙>"
	lualib:NPCTalk(player, msg)
	end


function enter(player)
	--lualib:Player_MapMove(player,"新手村")
	local map_key_name = "新手村"
	local x = 232
	local y = 217
	local r = 3
	lualib:Player_MapMoveXY(player,map_key_name, x, y, r)
	return ""
end

function leave(player)
	return ""
end
