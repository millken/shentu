--author: millken@gmail.com 2014/3/19
--��һ������һ�¶���ֱ������,�����װ����ֻ�������ʯͷ���ż���!���ԣ���Ʒ����������һ����!
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local X = 0
local Y = 0

function on_map_create(map)
	lualib:AddTrigger(map, lua_trigger_enter_map, "on_enter_map")
	lualib:AddTrigger(map, lua_trigger_leave_map , "on_leave_map")

end

function on_enter_map(player)
	X = lualib:X(player)
	Y = lualib:Y(player)
	lualib:AddTrigger(player, lua_trigger_move, "on_move")
end

function on_leave_map(player)
	local map = lualib:MapGuid(player)
	lualib:Map_DestroyDgn(map)
	lualib:ClearTrigger(player)
	return true
end

function on_move(player, x_ex, y_ex)
	local map = lualib:MapGuid(player)
	local name = lualib:KeyName(map)
	if name == "�콵�ᱦ" then lualib:Kill(player) end
	return true
end
