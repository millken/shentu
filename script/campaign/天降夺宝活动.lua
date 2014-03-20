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
		local map_name = "天降夺宝"
        local dgn = lualib:Map_CreateDgn(map_name, true, 10 * 60)
        if dgn == "" then
            lualib:Error("副本：天降夺宝创建失败！")
            return
        end
        lualib:Debug("副本：天降夺宝创建成功！")
		lualib:SetStr("0", "scheduled_tjdb_dgn", dgn)
		lualib:SetInt("0", "scheduled_tjdb_id", 1)
		gen_items()
		lualib:AddTimerEx(map, 7041, 180000, 3, "gen_items", "")
		lualib:SysMsg_SendBoardMsg("0", "[天降夺宝]", "[天降夺宝]已开放！", 15000)
		lualib:GSRunScript("天降夺宝入场:on_campaign_start", dgn)

    else

		lualib:SysMsg_SendBoardMsg("0", "[天降夺宝]", "[天降夺宝]还有"..math.floor(times / 60000).."分钟开启。\n这里面是天神散宝的地方,里面宝物不计其数\n但是在这里面千万不能乱动,走一步或跑一下\n都会直接死亡,不会掉装备！\n只能用随机飞着拣宝物!所以，人品和运气决定一切啦!!\n", 15000)
    end
end

function gen_items()
	local items = {
		{
			{"5元宝", 50},
			{"10元宝", 20},
			{"100元宝", 5},
		},
		{
			{"10元宝", 50},
			{"开光印", 5},
			{"灵元珠", 5},
		},
		{
			{"10元宝", 50},
			{"圣战戒指", 1},
			{"圣战项链", 1},
			{"圣战头", 1},
			{"圣战手镯", 1},
			{"圣战腰带", 1},
			{"圣战靴子", 1},
			{"天尊戒指", 1},
			{"天尊手镯", 1},
			{"天尊项链", 1},
			{"天尊头盔", 1},
			{"天尊道靴", 1},
			{"天尊腰带", 1},
			{"法神魔戒", 1},
			{"法神手镯", 1},
			{"法神之坠", 1},
			{"法神头盔", 1},
			{"法神魔靴", 1},
			{"法神腰带", 1},
		},
	}
	local map_name = "天降夺宝"
	local map_guid = lualib:Map_GetMapGuid(map_name)
	--for i = 1, #items do
		local i = lualib:GetInt("0", "scheduled_tjdb_id")
		for j = 1, #items[i] do
			for k = 1, tonumber(items[i][j][2]) do
				local tPos = lualib:MapRndPos("首饰店")--这里不能取副本的名字
				lualib:Map_GenItem(lualib:GetStr("0", "scheduled_tjdb_dgn"), tPos["x"], tPos["y"], items[i][j][1], 1, true, 3)
			end
		end
		lualib:SetInt("0", "scheduled_tjdb_id", i + 1)
	--end

end

function on_end_decl(id, map, times)

    times = tonumber(times)
    if times == 0 then
		lualib:SetStr("0", "scheduled_tjdb_dgn", "")
		lualib:SetInt("0", "scheduled_tjdb_id", 0)
		lualib:SysMsg_SendBoardMsg("0", "[天降夺宝]", "[天降夺宝]已关闭！", 15000)
    else
		lualib:SysMsg_SendBoardMsg("0", "[天降夺宝]", "[天降夺宝]将在"..math.floor(times / 60000).."分钟后关闭！", 15000)
    end
end

function Goto(id,player,map)
	 local x = 232
	 local y = 217
	 local r = 3
	 local map_key_name = "天降夺宝"
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
	
	lualib:Player_SetDgnTicket(player, lualib:GetStr("0", "scheduled_tjdb_dgn")) 
    if lualib:Player_EnterDgn(player, map_key_name, 0, 0, 0) == false then
		lualib:SysMsg_SendWarnMsg(player, "您没有门票吧")
		return false
    end
end