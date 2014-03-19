local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
local dgn_map_name = "天降夺宝"

function on_campaign_start(player, dgn)

	lualib:SysMsg_SendTriggerMsg(player, "你收到了\"" .. dgn_map_name .. "活动入场\"邀请！")
	
	local msg = "这里面是天神散宝的地方,里面宝物不计其数\n但是在这里面千万不能乱动,走一步或跑一下\n都会直接死亡,不会掉装备！\n只能用随机飞着拣宝物!所以，人品和运气决定一切啦!!\n"
	msg = msg.."<@enter#"..dgn.." *01*我要参加>\n"
	msg = msg.."<@leave *01*我不参加>"
	lualib:NPCTalk(player, msg)
	end

function enter(player, dgn)
	
	if lualib:HasBuff(player,"摆摊") then
		local msg = "你当前处于摆摊状态，无法传送\n \n"
		lualib:SysWarnMsg(player,"你当前处于摆摊状态，无法传送")
		lualib:NPCTalk(player, msg)
		return msg
	end
	
	if lualib:Player_SetDgnTicket(player, dgn) == false then
		lualib:NPCTalk(player, "进入失败！")
		return "进入失败！"
    end

    if lualib:Player_EnterDgn(player, dgn_map_name, 0, 0, 0) == false then
		lualib:NPCTalk(player, "进入失败！")
		return "进入失败！"
    end

	return ""
end

function leave(player)
	return ""
end

