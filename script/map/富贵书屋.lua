local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function on_map_create(map)
	lualib:AddTimerEx(map,7040, 1000,-1,"on_time","")
end


function map_player(map, id)
	local playerList = lualib:Map_GetMapPlayers(map, false)
	if #playerList <= 0 then
		lualib:Map_DestroyDgn(map)
	else
		for i= 1, #playerList do
			lualib:AddItem(playerList[i], "ÁéÔªÖé", 1, false, "", "")
		end
	end
end



function on_map_destroy(map, map_key)
	local npc = lualib:GetStr(map, "npc_guid")
	local mapInt = lualib:GetInt(npc, map_count[map_key][2])

	if map_count[map_key] ~= nil then
		if mapInt > 0 then
			lualib:SetInt(npc, map_count[map_key][2], mapInt - 1)
		end
	end
	lualib:DisableTimer(map, 1)
    return
end