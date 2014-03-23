--author: millken@gmail.com 2014/3/19
--��һ������һ�¶���ֱ������,�����װ����ֻ�������ʯͷ���ż���!���ԣ���Ʒ����������һ����!
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local X = 0
local Y = 0
local map_name = "�콵�ᱦ"
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
			{"5Ԫ��", 50},
			{"10Ԫ��", 20},
			{"100Ԫ��", 5},
		},
		{
			{"10Ԫ��", 50},
			{"����ӡ", 5},
			{"��Ԫ��", 5},
		},
		{
			{"10Ԫ��", 50},
			{"ʥս��ָ", 1},
			{"ʥս����", 1},
			{"ʥսͷ", 1},
			{"ʥս����", 1},
			{"ʥս����", 1},
			{"ʥսѥ��", 1},
			{"�����ָ", 1},
			{"��������", 1},
			{"��������", 1},
			{"����ͷ��", 1},
			{"�����ѥ", 1},
			{"��������", 1},
			{"����ħ��", 1},
			{"��������", 1},
			{"����֮׹", 1},
			{"����ͷ��", 1},
			{"����ħѥ", 1},
			{"��������", 1},
		},
	}

	--for i = 1, #items do
		local i = lualib:GetInt("0", "scheduled_tjdb_id")
		for j = 1, #items[i] do
			for k = 1, tonumber(items[i][j][2]) do
				local tPos = lualib:MapRndPos("���ε�")--���ﲻ��ȡ����������
				lualib:Map_GenItem(map, tPos["x"], tPos["y"], items[i][j][1], 1, true, lualib:GenRandom(10, 120))
			end
		end
		lualib:SetInt("0", "scheduled_tjdb_id", i + 1)
	--end

end

function on_map_destroy(map)
    lualib:ClearTrigger(map)
	lualib:ClearTimer(map)
    lualib:Debug("" .. map_name .. "�������٣�")
end