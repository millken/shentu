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
				local wufangshangxian = 800
				local wufangxiaxian = 600
				local wufang = lualib:GenRandom(wufangxiaxian, wufangshangxian)
				local buff = lualib:AddBuff2(mubiao_table[i], actor, "脚本减血", "海魔鞭挞", 0, -wufang )
			end
		end
	end
end
