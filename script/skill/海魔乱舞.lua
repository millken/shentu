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
			local wufangshangxian = lualib:PhyDef(player_table[i], true)
			local wufangxiaxian = lualib:PhyDef(player_table[i], false)
			local wufang = lualib:GenRandom(wufangxiaxian, wufangshangxian)
			local job = lualib:Job(player_table[i])
			if job == 1 or job == 3 then
				local CostHp = 100 - wufang
				local buff = lualib:AddBuff2(player_table[i], actor, "脚本减血", "海魔乱舞", 0, -CostHp )
			elseif job == 2 then
				local buffmtable = {"减免盾1级", "减免盾2级", "减免盾3级", "减免盾4级",}
				local buffxiaoguo = {0.85, 0.7, 0.55, 0.4,}
				local buffxiaoguo1 = 0
				for i1 = 1,#buffmtable do
					if lualib:HasBuff(player_table[i], buffmtable[i1]) == true then
						buffxiaoguo1 = buffxiaoguo[i1]
					end
				end
				
				if buffxiaoguo1 > 0 then
						local CostHp = (100 - wufang)* buffxiaoguo1
						local buff = lualib:AddBuff2(player_table[i], actor, "脚本减血", "海魔乱舞", 0, -CostHp )

				else
						local CostHp = 100 - wufang
						local buff = lualib:AddBuff2(player_table[i], actor, "脚本减血", "海魔乱舞", 0, -CostHp )
				end
			end
		end
	end
end