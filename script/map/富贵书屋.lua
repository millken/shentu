local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function on_map_create(map)
	lualib:AddTrigger(map, lua_trigger_enter_map, "on_enter_map")
end

function on_enter_map(player)
	lualib:SetTempInt(player, "m_x", 0)
	lualib:SetTempInt(player, "m_y", 0)
	lualib:RunClientScript(player, "ItemEffect", "texiao", "100002840#32#42#0#99999000")
	lualib:RunClientScript(player, "ItemEffect", "texiao", "100002840#28#42#0#99999000")
	lualib:RunClientScript(player, "ItemEffect", "texiao", "100002840#32#48#0#99999000")
	lualib:RunClientScript(player, "ItemEffect", "texiao", "100002840#28#48#0#99999000")
	lualib:RunClientScript(player, "ItemEffect", "texiao", "100002840#30#45#0#99999000")
	lualib:RunClientScript(player, "ItemEffect", "texiao", "200001017#30#45#0#99999000")
	lualib:AddTimerEx(player, 7040, 10000, 60, "on_time_check", "")
	
end


function on_time_check(player)
	if lualib:GetInt("0", "scheduled_fgsw_status") == 0 then return end
	local m_guid = lualib:MapGuid(player)--玩家所在地图GUID
	local map_name = "富贵书屋"
	local map_guid = lualib:Map_GetMapGuid(map_name)
	local m_x = lualib:X(player)--玩家所在X坐标
	local m_y = lualib:Y(player)--玩家所在Y坐标
	local p_Name = lualib:Name(player)--玩家名称
	local o_m_x = lualib:GetTempInt(player, "m_x")
	local o_m_y = lualib:GetTempInt(player, "m_y")
	if m_guid == map_guid and o_m_x == m_x and o_m_y == m_y then
		lualib:AddExp(player, 20000000, "获得20000000经验", "富贵书屋活动")
		lualib:AddIngot(player, 200, "获得200元宝", "富贵书屋活动")

	else
		lualib:SetTempInt(player, "m_x", m_x)
		lualib:SetTempInt(player, "m_y", m_y)
	end

end
