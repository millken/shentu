--调试脚本，在道具模板店，生成一个测试道具，并调用test脚本，编辑脚本后，GM发送@rs，然后双击该道具查看结果。
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)

function main(player_guid, item_guid)
		local map_name = "新手村"
		local map_guid = lualib:Map_GetMapGuid(map_name)
		--local monster_guid = lualib:MonsterKey2ID("M_情魔")
		lualib:SysMsg_SendBoardMsg("0", "[情感危机活动]", "[情感危机活动]已开放！", 15000)
		lualib:GSRunScript("情感危机入场:on_campaign_start", map_guid)
		
        lualib:Map_GenSingleMonster(map_guid, 235, 206, 2, 5, "M_情魔", false)
	return true
end
