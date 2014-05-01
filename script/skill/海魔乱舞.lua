local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")



function post_apply(actor, skillid)
		local maxcishu = 3
		zhixing("","",actor,skillid)
		lualib:AddTimerEx(actor, 1, 1000, maxcishu, "zhixing", actor.."#"..skillid)
	end

function zhixing(a1,a2,actor,skillid)
	skillid = tonumber(skillid)
	local map =lualib:MapGuid(actor)
	local x = lualib:X(actor)
	local y = lualib:Y(actor)
	local skill_id = skillid
	local player_table = lualib:Map_GetRegionPlayers(map, x, y, 6, true)

	if skill_id == 33010 then
		for i = 1, #player_table do
			local buff1 = lualib:AddBuff(player_table[i], "脚本麻痹", 5)
			local wufangshangxian = 600
			local wufangxiaxian = 400
			local wufang = lualib:GenRandom(wufangxiaxian, wufangshangxian)
			local buff = lualib:AddBuff2(player_table[i], actor, "脚本减血", "海魔乱舞", 0, -wufang )
		end
	end
end