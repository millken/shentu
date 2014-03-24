--调试脚本，在道具模板店，生成一个测试道具，并调用test脚本，编辑脚本后，GM发送@rs，然后双击该道具查看结果。
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)

function main(player, item)
		local map_name = "外星入侵第一重"
        local dgn = lualib:Map_CreateDgn(map_name, true, 60 * 60)
        if dgn == "" then
            lualib:Error("副本：" .. map_name .. "创建失败！")
            return false
        end
        lualib:Debug("副本：" .. map_name .. "创建成功！")
		lualib:SetStr("0", "scheduled_wxrq1_dgn", dgn)

		dgn = lualib:Map_CreateDgn("外星入侵第二重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq2_dgn", dgn)
		dgn = lualib:Map_CreateDgn("外星入侵第三重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq3_dgn", dgn)
		dgn = lualib:Map_CreateDgn("外星入侵第四重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq4_dgn", dgn)

		lualib:SysMsg_SendBoardMsg("0", map_name,map_name, 15000)
		lualib:Player_SetDgnTicket(player, lualib:GetStr("0", "scheduled_wxrq1_dgn"))
		if lualib:Player_EnterDgn(player, map_name, 0, 0, 0) == false then
			lualib:SysMsg_SendWarnMsg(player, "您没有门票吧")
			return false
		end

	return true
end
