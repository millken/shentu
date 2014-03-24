--作者：millken@gmail.com
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
local map_name = "外星入侵第一重"
function on_start(id, map)
end

function on_start_decl(id, map, times)
    times = tonumber(times)
    if times == 0 then
        local dgn = lualib:Map_CreateDgn(map_name, true, 60 * 60)
        if dgn == "" then
            lualib:Error("副本：" .. map_name .. "创建失败！")
            return
        end
        lualib:Debug("副本：" .. map_name .. "创建成功！")
		lualib:SetStr("0", "scheduled_wxrq1_dgn", dgn)

		dgn = lualib:Map_CreateDgn("外星入侵第二重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq2_dgn", dgn)
		dgn = lualib:Map_CreateDgn("外星入侵第三重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq3_dgn", dgn)
		dgn = lualib:Map_CreateDgn("外星入侵第四重", true, 60 * 60)
		lualib:SetStr("0", "scheduled_wxrq4_dgn", dgn)

		lualib:SysMsg_SendBoardMsg("0", "[" .. map_name .. "]", "[" .. map_name .. "]已开放！请通过土城的npc【外星入侵传送员】进入！", 15000)

    else

		lualib:SysMsg_SendBoardMsg("0", "[" .. map_name .. "]", "[" .. map_name .. "]还有"..math.floor(times / 60000).."分钟开启。\n", 15000)
    end
end


function on_end_decl(id, map, times)

    times = tonumber(times)
    if times == 0 then
		lualib:SetStr("0", "scheduled_wxrq1_dgn", "")
		lualib:SetStr("0", "scheduled_wxrq2_dgn", "")
		lualib:SetStr("0", "scheduled_wxrq3_dgn", "")
		lualib:SetStr("0", "scheduled_wxrq4_dgn", "")
		lualib:SysMsg_SendBoardMsg("0", "[" .. map_name .. "]", "[" .. map_name .. "]已关闭！", 15000)
    else
		lualib:SysMsg_SendBoardMsg("0", "[" .. map_name .. "]", "[" .. map_name .. "]将在"..math.floor(times / 60000).."分钟后关闭！", 15000)
    end
end

function Goto(id,player,map)
	 local x = 232
	 local y = 240
	 local r = 3
	local gold = 1500
	local msg = ""
	
	if lualib:HasBuff(player,"摆摊") then
		lualib:SysWarnMsg(player,"你当前处于摆摊状态，无法传送")
		return false
	end
	
	if not lualib:Player_IsGoldEnough(player, gold, false) then
		msg = msg.."当前传送需要1500金币"
		lualib:NPCTalk(player, msg)
		return true
    end
	
	if not lualib:Player_SubGold(player, gold, false, "传送", player) then
		msg = msg.."扣除金币失败"
		lualib:NPCTalk(player, msg)
		return true
    end
	
	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")
	lualib:RunClientScript(map, "mapeffect", "texiao", "100001670#"..x.."#"..y.."#0#0")
	
	lualib:Player_MapMoveXY(player,"龙城", x, y, r)
	return false

end