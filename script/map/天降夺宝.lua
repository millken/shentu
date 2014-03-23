--author: millken@gmail.com 2014/3/19
--走一步或跑一下都会直接死亡,不会掉装备！只能用随机石头飞着拣宝物!所以，人品和运气决定一切啦!
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local X = 0
local Y = 0
local map_name = "天降夺宝"
function on_map_create(map)
	lualib:SetInt("0", "scheduled_tjdb_id", 1)
	gen_items(map)
	lualib:AddTrigger(map, lua_trigger_enter_map, "on_enter_map")
	lualib:AddTrigger(map, lua_trigger_leave_map , "on_leave_map")
	lualib:AddTimerEx(map, 7041, 240000, 3, "gen_items", map)


end

function on_enter_map(player)
	X = lualib:X(player)
	Y = lualib:Y(player)
	lualib:AddTrigger(player, lua_trigger_move, "on_move")
end

function on_leave_map(player)
	lualib:ClearTrigger(player)
	return true
end

function on_move(player, x_ex, y_ex)
	local map = lualib:MapGuid(player)
	local name = lualib:KeyName(map)
	if name == map_name then lualib:Kill(player) end
	return true
end


function gen_items(map)
	local items = {
		{
			{"5元宝", 50},
			{"10元宝", 20},
			{"100元宝", 5},
		},
		{
			{"10元宝", 50},
			{"开光印", 5},
			{"灵元珠", 5},
		},
		{
			{"10元宝", 50},
			{"圣战戒指", 1},
			{"圣战项链", 1},
			{"圣战头", 1},
			{"圣战手镯", 1},
			{"圣战腰带", 1},
			{"圣战靴子", 1},
			{"天尊戒指", 1},
			{"天尊手镯", 1},
			{"天尊项链", 1},
			{"天尊头盔", 1},
			{"天尊道靴", 1},
			{"天尊腰带", 1},
			{"法神魔戒", 1},
			{"法神手镯", 1},
			{"法神之坠", 1},
			{"法神头盔", 1},
			{"法神魔靴", 1},
			{"法神腰带", 1},
		},
	}

	--for i = 1, #items do
		local i = lualib:GetInt("0", "scheduled_tjdb_id")
		for j = 1, #items[i] do
			for k = 1, tonumber(items[i][j][2]) do
				local tPos = lualib:MapRndPos("首饰店")--这里不能取副本的名字
				lualib:Map_GenItem(map, tPos["x"], tPos["y"], items[i][j][1], 1, true, lualib:GenRandom(10, 120))
			end
		end
		lualib:SetInt("0", "scheduled_tjdb_id", i + 1)
	--end

end

function on_map_destroy(map)
    lualib:ClearTrigger(map)
	lualib:ClearTimer(map)
    lualib:Debug("" .. map_name .. "副本销毁！")
end