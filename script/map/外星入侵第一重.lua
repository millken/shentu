--author millken@gmail.com 2014/3/20
--[[杀死所有怪物可进入第二重]]

local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local def_table = 
{
	npc_name = "外星入侵传送员1",
    gen_monster = 
    {
        {"外星白人", 10},
        {"外星红人", 10},
    }
}

function on_map_create(map)
    lualib:Debug("外星入侵第一重副本开启！")

    for i = 1, #def_table.gen_monster do
        if not lualib:Map_BatchGenMonster(map, def_table.gen_monster[i][1], def_table.gen_monster[i][2], false) then
            lualib:Warn("外星入侵第一重副本刷怪没有达到指定的数量！")
        end
    end

    lualib:AddTrigger(map, lua_trigger_enter_map, "on_enter_map")
	lualib:AddTimerEx(map, 7042, 1000, -1, "on_map_timer_check", "")
end

function on_map_timer_check(map)
	if lualib:Map_GetMonsterCount(map, "", true, true) == 0 then
        if not lualib:Map_GenNpc(map, def_table.npc_name, 63, 56, 0, 4) then
             lualib:Error("外星入侵第一重脚本错误，生成NPC"..def_table.npc_name.."失败！")
            return true
        end

        lualib:Debug("外星入侵第一重脚本，生成NPC"..def_table.npc_name.."！")
	end
end

function on_map_destroy(map)
    lualib:ClearTrigger(map)
	lualib:ClearTimer(map)
    lualib:Debug("外星入侵第一重副本销毁！")
end

function on_enter_map(player)
    lualib:SysMsg_SendTriggerMsg(player, "欢迎来到外星入侵第一重，这个活动持续时间为1小时！")
end
