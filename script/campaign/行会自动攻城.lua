--------------------------------------------------------------------------------
--计划任务的定时回调（玩法逻辑部分）
--------------------------------------------------------------------------------
--活动开始 主动执行的函数
function on_start(id, map)
	local warTime = lualib:GetAllTime()
	local familys = lualib:GetAllFamilys()
	local strFamily = ""
	for _, v in pairs(familys) do
		strFamily = strFamily .. v .. "&"
	lualib:SysPromptMsg(player, "神歌城行会攻城战开始")
	end
	strFamily = string.sub(strFamily, 1, -2)
	lualib:StartCastleWarEx("神歌城", strFamily, warTime, 7200)
	lualib:SysMsg_SendBroadcastMsg("神歌城行会攻城战开始", "")
	lualib:AddTimerEx(map,201404131702,7203 * 1000, 1,"hanghui_jiangli", "")
end

function hanghui_jiangli(map)
	local family = lualib:GetCastleOwnFamily("神歌城")
	local player = lualib:GetFamilyLeader(family)
	if player ~= "" then 
		lualib:Player_AddIngot(player, 30000, false, "加元宝：行会攻城", player)
	end
end

--开始宣告
function on_start_decl(id, map, times)
    times = tonumber(times)
	lualib:SysMsg_SendTopMsg(1, "行会攻城战还有"..math.floor(times / 60000).."分钟，所有行会可参与，占领方将获3W元宝！")
end

function on_end_decl(id, map, times)
    times = tonumber(times)

end
