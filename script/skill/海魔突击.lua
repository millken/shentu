local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?",  package_path,  lua_path,  lua_path)
require("system/logic_def_lua")



function post_apply(actor,  skillid)
		local maxcishu = 5
		lualib:AddTimerEx(actor,  1,  1000, maxcishu,  "zhixing",  actor.."#"..skillid)
		lualib:AddTimerEx(actor,  2,  1,  350,  "bofangtexiao",  actor.."#"..skillid)
	end
function bofangtexiao(a1, a2, actor, skillid)
		local map =lualib:MapGuid(actor)
		local x = lualib:X(actor)
		local y = lualib:Y(actor)
		local texiao_table = {100002130,  100002131,  100002132,  100002133,  100002134,  100002135,  100002136,  100002137,  100002138,  100002139,  100002140,  100002141}
		local x2 = {x-12,  x-11,  x-10, x-9, x-8, x-7, x-6, x-5, x-4, x-3, x-2, x-1, x+1, x+2, x+3, x+4, x+5, x+6, x+7, x+8, x+9, x+10, x+11, x+12}  
		local y2 = {y-12,  y-11,  y-10, y-9, y-8, y-7, y-6, y-5, y-4, y-3, y-2, y-1, y+1, y+2, y+3, y+4, y+5, y+6, y+7, y+8, y+9, y+10, y+11, y+12}
		local x3 = lualib:GenRandom(1,  table.getn(x2))
		local y3 = lualib:GenRandom(1,  table.getn(y2))
		local texiao_table1 = lualib:GenRandom(1,  table.getn(texiao_table))
		lualib:RunClientScript(map,  "ItemEffect",  "texiao",  texiao_table[texiao_table1].."#"..x2[x3].."#"..y2[y3].."#0#99999000")
	end
function zhixing(a1, a2, actor, skillid)
	skillid = tonumber(skillid)
	local map1 =lualib:MapGuid(actor)
	local x = lualib:X(actor)
	local y = lualib:Y(actor)
	local skill_id = skillid
	local player_table = lualib:Map_GetRegionPlayers(map1,  x,  y,  12,  true)
	
	if skill_id == 33008 then
		for i = 1,  #player_table do
			local wufangshangxian = 1000
			local wufangxiaxian = 800
			local wufang = lualib:GenRandom(wufangxiaxian, wufangshangxian)
			local buff = lualib:AddBuff2(player_table[i], actor, "脚本减血", "海魔突击", 0, -wufang )
		end
	end
end