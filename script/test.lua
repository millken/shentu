--调试脚本，在道具模板店，生成一个测试道具，并调用test脚本，编辑脚本后，GM发送@rs，然后双击该道具查看结果。
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)

function main(player, item)
		local map_name = "富贵书屋"
	local dgn_id = lualib:Map_CreateDgn("富贵书屋", false, 1200)
	lualib:Player_SetDgnTicket(player, dgn_id) 
        lualib:Debug("副本：富贵书屋创建成功！")
		--local map_guid = lualib:Map_GetMapGuid(map_name)
		lualib:SetStr("0", "scheduled_fgsw_status", dgn)
		lualib:SysMsg_SendBoardMsg("0", "[富贵书屋]", "[富贵书屋]已开放！", 15000)
		lualib:GSRunScript("富贵书屋入场:on_campaign_start", dgn_id)

	return true
end
