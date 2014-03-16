--------------------------------------------------------------------------------
--计划任务的定时回调（玩法逻辑部分）
--------------------------------------------------------------------------------

function on_start(id, map)
end

function on_start_decl(id, map, times)
    times = tonumber(times)
    if times == 0 then
		local map_name = "新手村"
		local map_guid = lualib:Map_GetMapGuid(map_name)
		--local monster_guid = lualib:MonsterKey2ID("M_情魔")
		lualib:SysMsg_SendBoardMsg("0", "[情感危机活动]", "[情感危机活动]已开放！", 15000)
		lualib:GSRunScript("情感危机入场:on_campaign_start", map_guid)
		
        lualib:Map_GenSingleMonster(map_guid, 235, 206, 2, 5, "M_情魔", false)

    else

		lualib:SysMsg_SendBoardMsg("0", "[情感危机活动]", "[情感危机活动]还有"..math.floor(times / 60000).."分钟开启。英雄们请速至情缘小村[235, 206]！", 15000)
    end
end

function on_end_decl(id, map, times)

    times = tonumber(times)
    if times == 0 then
		local monster = "M_情魔"
		--用于副本调用结束后，判断怪物，若怪物存在没死，则在副本结束前杀死怪物
		if lualib:Monster_IsExist(monster) and (not lualib:Monster_IsDie(monster)) then
			lualib:Monster_Kill(monster)
		end
        --lualib:SysMsg_SendTopMsg(1, "[古墓]已关闭！")
        --lualib:SysMsg_SendBroadcastMsg("[古墓]已关闭！", "系统通知")
		lualib:SysMsg_SendBoardMsg("0", "[情感危机活动]", "[情感危机活动]已关闭！", 15000)
    else
        --lualib:SysMsg_SendTopMsg(1, "[古墓]将在"..math.floor(times / 60000).."分钟后关闭！")
        --lualib:SysMsg_SendBroadcastMsg("[古墓]将在"..math.floor(times / 60000).."分钟后关闭！", "系统通知")
		lualib:SysMsg_SendBoardMsg("0", "[情感危机活动]", "[情感危机活动]将在"..math.floor(times / 60000).."分钟后关闭！", 15000)
    end
end

function Goto(id,player,map)
	 local x = 232
	 local y = 217
	 local r = 3
	 local map_key_name = "新手村"
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
	
	 if not lualib:Player_MapMoveXY(player,map_key_name, x, y, r) then
		lualib:SysMsg_SendWarnMsg(player, "")
	 end
end