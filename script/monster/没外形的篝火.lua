local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")


function main(monster, player)
	lualib:SysMsg_SendRoleTalk(monster, "总有一天我也会卖切糕的！")
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#小贩#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━━━━━#COLOREND#\n"
	msg = msg .. "最近城管盯得太严，导致我的功能还没开放！等过段时间风声不紧了，我就会重出江湖的，耐心等我！\n"
	msg = msg .. "#OFFSET<X:0,Y:10>##IMAGE1902700037#<@shishe#"..player.. "#*01* [好的]>\n"
	lualib:NPCTalkDetail(player, msg, 500, 300)
return ""
end

function on_create(monster)

	lualib:AddBuff(monster, "无敌", 0)
	    lualib:SysMsg_SendBroadcastMsg("仆从们，快治疗我！", "血禅师")

end

function on_trigger_post_die(actor, killer)

end

