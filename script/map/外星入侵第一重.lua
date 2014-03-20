--author millken@gmail.com 2014/3/20
--[[杀死所有怪物可进入第二重]]

local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local def_table = 
{
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
        if not lualib:Map_GenNpc(map, self.npc_name, x, y, 6, dir) then
             lualib:Error("深渊奴仆脚本错误，生成NPC"..self.npc_name.."失败！")
            return true
        end

        lualib:Debug("深渊奴仆脚本，生成NPC"..self.npc_name.."！")
	end
end

function on_map_destroy(map)
    lualib:ClearTrigger(map)
	lualib:ClearTimer(map)
    lualib:Debug("外星入侵第一重副本销毁！")
end

function on_enter_map(player)
    lualib:SysMsg_SendTriggerMsg(player, "欢迎来到外星入侵第一重，这个活动持续时间为2小时！")
	local player_name = lualib:Name(player)
	local msg = "#OFFSET<X:80,Y:-0>##COLORCOLOR_BROWN#[温馨小贴士]#COLOREND#\n"
	msg = msg .. "#OFFSET<X:-20,Y:-20>##IMAGE<ID:1989905002>#\n"
	msg = msg .."#OFFSET<X:70,Y:-25>##COLORCOLOR_RED#→→爱瑶\n \n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:-10>##COLORCOLOR_YELLOW#嗨~亲爱的[#COLORCOLOR_GREENG#"..player_name.."#COLOREND##COLORCOLOR_YELLOW#],请你听我说：\n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:0>##COLORCOLOR_BROWN#━━━━━━━━━━━━━━━━#COLOREND#\n"
	msg = msg .."#OFFSET<X:5,Y:0>##COLORCOLOR_BROWN#1.烈焰深渊共3层，每层都有不同的玩法，最终BOSS在第三层\n \n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:0>##COLORCOLOR_BROWN#2.这里会产出高级技能的残页和一些好装备\n \n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:0>##COLORCOLOR_BROWN#3.打败最终BOSS后，可获得魔王的宝藏，可随机开出宝物^_^#COLOREND#"
	lualib:NPCTalkDetail(player, msg, 265, 310)
end
