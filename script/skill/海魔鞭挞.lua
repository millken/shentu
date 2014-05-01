local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

local x_table = {}
local y_table = {}
local mubiao_table = {}

function post_apply(actor,  skillid)
	local mubiaoguid = lualib:Monster_GetAttackTarget(actor)
	local skill_id = skillid
	local x1 = lualib:X(mubiaoguid)
	local y1 = lualib:Y(mubiaoguid)
	x_table ={x1-5,x1-5,x1-4,x1-4,x1-4,x1-4, x1-3, x1-3, x1-3, x1-3, x1-3, x1-2,x1-2,x1-2,x1-2,x1-2,x1-1,x1-1,x1-1,x1-1,x1-1,x1,x1,  x1,  x1+1}
	y_table ={y1+3,y1+4,y1+2,y1+3,y1-4,y1+5, y1+1, y1+2, y1+3, y1+4, y1+5, y1,  y1+1,y1+2,y1+3,y1+4,y1-1,y1  ,y1+1,y1+2,y1+3,y1,y1+1,y1+2,y1+1}
	local maxcishu = 3
	zhixing("","",actor,skillid)
	lualib:AddTimerEx(actor, 1, 500, maxcishu, "zhixing", actor.."#"..skillid)
end

function zhixing(a1, a2,actor,skillid)
	local map = lualib:MapGuid(actor)
	skillid = tonumber(skillid)
	if skillid == 33009 then
		for a = 1, table.getn(x_table) do
			x2 = x_table[a]
			y2 = y_table[a]
			mubiao_table = lualib:Map_GetRegionPlayers(map, x2, y2, 0, true)	
			for i = 1, #mubiao_table do
				local buff1 = lualib:AddBuff(mubiao_table[i], "脚本定身", 3)
				local wufangshangxian = lualib:PhyDef(mubiao_table[i], true)
				local wufangxiaxian = lualib:PhyDef(mubiao_table[i], false)
				local wufang = lualib:GenRandom(wufangxiaxian, wufangshangxian)
				local job = lualib:Job(mubiao_table[i])
				if job == 1 or job == 3 then
					local CostHp = 100 - wufang
					local buff = lualib:AddBuff2(mubiao_table[i], actor, "脚本减血", "海魔鞭挞", 0, -CostHp )
				elseif job == 2 then
					local buffmtable = {"减免盾1级", "减免盾2级", "减免盾3级", "减免盾4级",}
					local buffxiaoguo = {0.85, 0.7, 0.55, 0.4,}
					local buffxiaoguo1 = 0
					for i1 = 1,#buffmtable do
						if lualib:HasBuff(mubiao_table[i], buffmtable[i1]) == true then
							buffxiaoguo1 = buffxiaoguo[i1]
						end
					end
					if buffxiaoguo1 > 0 then
						local CostHp = (100 - wufang)* buffxiaoguo1
						local buff = lualib:AddBuff2(mubiao_table[i], actor, "脚本减血", "海魔鞭挞", 0, -CostHp )
					else
						local CostHp = 100 - wufang
						local buff = lualib:AddBuff2(mubiao_table[i], actor, "脚本减血", "海魔鞭挞", 0, -CostHp )
					end
				end
			end
		end
	end
end
