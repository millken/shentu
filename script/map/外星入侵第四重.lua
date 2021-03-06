--author millken@gmail.com 2014/3/22
--[[杀死所有怪物可进入下一重]]

local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
local map_name = "外星入侵第四重"
local def_table = 
{
	npc_name = "外星入侵传送员3",
    gen_monster = 
    {
        {"外星火焰人", 5},
        {"外星统领", 3},
        {"外星飞龙", 1},
    }
}

function on_map_create(map)
    lualib:Debug( "" .. map_name .. "副本开启！")

    for i = 1, #def_table.gen_monster do
        if not lualib:Map_BatchGenMonster(map, def_table.gen_monster[i][1], def_table.gen_monster[i][2], false) then
            lualib:Warn("" .. map_name .. "副本刷怪没有达到指定的数量！")
        end
    end

    lualib:AddTrigger(map, lua_trigger_enter_map, "on_enter_map")
	lualib:AddTimerEx(map, 7042, 1000, -1, "on_map_timer_check", map)
end

function on_map_timer_check(map)
	if lualib:Map_GetMonsterCount(map, "", true, true) == 0 then
		lualib:SysMsg_SendMapMsg(map, "恭喜完成所有任务")
		lualib:ClearTimer(map)

	end
end

function on_map_destroy(map)
    lualib:ClearTrigger(map)
    lualib:Debug("" .. map_name .. "副本销毁！")
end

function on_enter_map(player)
    lualib:SysMsg_SendTriggerMsg(player, "欢迎来到" .. map_name .. "，这个活动持续时间为1小时！")
end
