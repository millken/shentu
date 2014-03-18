--作者：millken@gmail.com
--------------------------------------------------------------------------------
--在同一座标站立不动10秒钟可以获得：\
--每10秒获得20000000经验\
--每10秒获得200元宝\
--站得越久获得的越丰富\

--------------------------------------------------------------------------------

function on_start(id, map)
end

function on_start_decl(id, map, times)
    times = tonumber(times)
    if times == 0 then
		local map_name = "富贵书屋"
        local dgn = lualib:Map_CreateDgn(map_name, true, 20)
        if dgn == "" then
            lualib:Error("副本：富贵书屋创建失败！")
            return
        end
        lualib:Debug("副本：富贵书屋创建成功！")
		--local map_guid = lualib:Map_GetMapGuid(map_name)
		lualib:SetStr("0", "scheduled_fgsw_status", dgn)
		lualib:SysMsg_SendBoardMsg("0", "[富贵书屋]", "[富贵书屋]已开放！", 15000)
		lualib:GSRunScript("富贵书屋入场:on_campaign_start", dgn)

    else

		lualib:SysMsg_SendBoardMsg("0", "[富贵书屋]", "[富贵书屋]还有"..math.floor(times / 60000).."分钟开启。\n在同一座标站立不动10秒钟可以获得：\n每10秒获得20000000经验\n每10秒获得200元宝\n站得越久获得的越丰富\n", 15000)
    end
end

function on_end_decl(id, map, times)

    times = tonumber(times)
    if times == 0 then
		lualib:SetStr("0", "scheduled_fgsw_status", "")
		lualib:SysMsg_SendBoardMsg("0", "[富贵书屋]", "[富贵书屋]已关闭！", 15000)
    else
		lualib:SysMsg_SendBoardMsg("0", "[富贵书屋]", "[富贵书屋]将在"..math.floor(times / 60000).."分钟后关闭！", 15000)
    end
end

function Goto(id,player,map)
	 local x = 232
	 local y = 217
	 local r = 3
	 local map_key_name = "富贵书屋"
	local gold = 0
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
	
	lualib:Player_SetDgnTicket(player, lualib:GetStr("0", "scheduled_fgsw_status")) 
    if lualib:Player_EnterDgn(player, "富贵书屋", 0, 0, 0) == false then
		lualib:NPCTalk(player, "进入失败！")
		return "进入失败！"
    end
end