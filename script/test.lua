--调试脚本，在道具模板店，生成一个测试道具，并调用test脚本，编辑脚本后，GM发送@rs，然后双击该道具查看结果。
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)

function main(player, item)
		local map_name = "新手村"
		local map_guid = lualib:Map_GetMapGuid(map_name)
		local ranges = {0, 235, 206, 6, 6}
		--local ranges = {1, 0, 0, 200, 200} 这两种表达所表示的区域相同
		local monsters = lualib:Map_GetRegionMonstersEx(map_guid, "", ranges, true, true)

		lualib:SysWarnMsg(player, "不存在，抓捕失败！")

		if #monsters > 0 then 
			for i = 1 , #monsters do
			lualib:Monster_Remove(monsters[i])
			end
		end

	return true
end
