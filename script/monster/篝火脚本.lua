local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local exp = {
-- [怪物] = {烤火等级，经验，范围半径}
	["暗黑白野猪"] = {52,4000, 2},
	["暗黑魔龙猪"] = {52,4000, 2},
	["幽冥白野猪"] = {52,4000, 2},
	["玛雅白野猪"] = {52,4000, 2},
	["圣域大祭祀"] = {57,10000, 2},
	["地下蛮牛统领"] = {57,10000, 2},
	["妖月统领1"] = {62,12000, 2},
	["深海统领1"] = {62,12000, 2},
	["龙域统领1"] = {66,14000, 2},
	["地穴魔蚁统领"] = {68,16000, 2},
	["废墟血骨统领"] = {68,16000, 2},
	["荒蛮魔灵树王"] = {70,18000, 2},
	["荒蛮魔灵龙王"] = {70,18000, 2},
	["生死魔神1"] = {72,15000, 2},
	["生死魔神2"] = {72,20000, 2},
	["地下红牛卫"] = {55,8000, 2},
	["圣域将军"] = {55,8000, 2},
	["妖月邪恶巨人"] = {60,10000, 2},
	["深海魔将"] = {60,10000, 2},
	["龙域青纹天将"] = {65,12000, 2},
}

function on_create(monster)
    lualib:AddTrigger(monster,  lua_trigger_post_die, "on_die")
end


function on_die(actor, killer)
    local map = lualib:MapGuid(actor)
	local x = lualib:X(actor)
	local y = lualib:Y(actor)
	local timer_id = lualib:GenTimerId(map)
	local monster = lualib:KeyName(actor)
	lualib:AddTimerEx(map, timer_id, 1000, 300, "on_timer_check", monster .. "#" .. x .. "#" .. y)
	lualib:RunClientScript(map, "ItemEffect", "texiao", "200001040#"..x.."#"..y.."#0#300000")

    return
end

function on_timer_check(map, timer_id, monster, x, y)
	local pos_x = tonumber(x)
	local pos_y = tonumber(y)
	local max_level = exp[monster][1]
	local add_ext = exp[monster][2]
	local ranges = {0, pos_x, pos_y, 2, 2}
	local player_t = lualib:Map_GetRegionPlayersEx(map, ranges, true)
	--lualib:SysMsg_SendBroadcastMsg( monster .. ":" .. x .. "," .. y .. "level=" .. max_level.. "ext:"..add_ext, "debug")
	for _, v in pairs(player_t) do
	   if lualib:Level(v) < max_level then
			lualib:Player_AddExp(v, add_ext, "篝火", v)
	   end
	end
end
