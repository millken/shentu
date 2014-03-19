--调试脚本，在道具模板店，生成一个测试道具，并调用test脚本，编辑脚本后，GM发送@rs，然后双击该道具查看结果。
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)

function main(player, item)
		local map_name = "天降夺宝"
        local dgn = lualib:Map_CreateDgn(map_name, true, 23)
        if dgn == "" then
            lualib:Error("副本：天降夺宝创建失败！")
            return false
        end
        lualib:Debug("副本：天降夺宝创建成功！")
		--local map_guid = lualib:Map_GetMapGuid(map_name)

		lualib:SysMsg_SendBoardMsg("0", "[天降夺宝]", "[天降夺宝]已开放！", 15000)
		lualib:GSRunScript("天降夺宝入场:on_campaign_start", dgn)

	return true
end
