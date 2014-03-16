local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/marry")

local talk_t = {"结婚是一件神圣而幸福的事情，如果你有心仪之人，可以向他（她）求婚哦。", "结婚需要结婚戒指和一些金币，你可以去灵山获得结婚戒指和玫瑰花。", "结婚可以获得勋章和情比金坚状态，夫妻之间越亲密，勋章和状态的效果越好哦。"}

function on_create(npc)
	lualib:AddTimer(npc, 1, 300000, -1, "on_timer_talk")
end

function on_timer_talk(npc, timer_id)

		lualib:SysMsg_SendRoleTalk(npc, talk_t[lualib:GenRandom(1, #talk_t)])

end
function main(npc, player)
    local msg = "    欢迎来到风景优美、四季如春的情缘小村，小村近期常受情魔入侵，勇士你能消灭他么？\n"
    msg = msg.."#OFFSET<X:2,Y:-4>##COLORCOLOR_YELLOW#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━#COLOREND#\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700041##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[我要向心仪的人求婚]>\n"
    --msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@reward *01*[领取夫妻奖励]>\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700015##OFFSET<X:0,Y:-2>#<@jump *01*[前往灵山]（需要2万金币）>\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700030##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[协议离婚]>\n"
    msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[强制离婚]>\n"
    msg = msg.."                                                      #OFFSET<X:0,Y:-6>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@likai *01*[离开]>\n"
    return msg
end

function propose(npc, player)
    -- 判断性别，求婚的总该是男的
    local gender = lualib:Player_GetIntProp(player,  lua_role_gender)
    if gender ~=  lua_gender_male then
        return "求婚这事儿，女孩儿还是矜持点好。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 判断婚否
    if lualib:Player_GetCustomVarStr(player, "配偶GUID") ~= "" then
        return "重婚可是犯法的。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 判断是否有车有房
    if not lualib:Player_IsGoldEnough(player, 100000, false) then
        return "结婚需要一枚结婚戒指和100000金币！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    if lualib:Player_GetItemCount(player, "结婚戒指") < 1 then
       return "结婚戒指都没准备好就想求婚？\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 条件符合，询问结婚对象
    lualib:ShowForm(player, "求婚表单")
    return ""
end

function divorce(npc, player)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶姓名")
    if spouse == "" then
        return "你还没结婚呢。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 判断对方是否在线
    local spouse_guid = lualib:Player_GetGuid(spouse)
    if spouse_guid == "" or lualib:Map_GetDistance(lualib:Npc_GetPosX(npc), lualib:Npc_GetPosY(npc), lualib:Player_GetPosX(spouse_guid), lualib:Player_GetPosY(spouse_guid)) > 10 then
        return "咦，我没看到"..spouse.."在这里啊。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    local player_name = lualib:Player_GetStrProp(player,  lua_role_user_name)

    if lualib:SysMsg_SendMsgDlg(spouse_guid, 1, "你确定要和"..player_name.."离婚吗？#BUTTON0#确定#BUTTONEND##BUTTON1#取消#BUTTONEND#", 30, "on_divorce_ack", player_name) == false then
        return "忙着呢，你过会儿再来吧\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

	return "您向对方发出了协议离婚请求，请等待对方回应！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end

function force_divorce(npc, player)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶姓名")
    if spouse == "" then
        return "你还没结婚呢。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 强制离婚需要手续费
    if not lualib:Player_IsGoldEnough(player, 1000000, false) then
        return "强制离婚需要1000000金币和一张好人卡！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 需要道具
    if lualib:Player_GetItemCount(player, "好人卡") < 1 then
       return "你没有好人卡。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    lualib:SysMsg_SendMsgDlg(player, 1, "你确定要和"..spouse.."离婚吗？#BUTTON0#确定#BUTTONEND##BUTTON1#取消#BUTTONEND#", 30, "on_force_divorce_ack", spouse)
end

function on_divorce_ack(dlg_id, player, button_id, spouse)
	local button_id = tonumber(button_id)
	local spouse_guid = lualib:Name2Guid(spouse)
    if button_id ~= 0 then
		lualib:SysMsg_SendTriggerMsg(spouse_guid, "对方拒绝离婚。")
		lualib:SysMsg_SendTriggerMsg(player, "你拒绝了离婚！")
        return "对方拒绝离婚。"
    end
    lualib:Player_SetCustomVarStr(player, "配偶姓名", "")
    lualib:Player_SetCustomVarStr(player, "配偶GUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, "你和"..spouse.."离婚了。")
    lualib:Player_NotifyCustomParam(player, "配偶姓名")
    lualib:ScriptFuncToPlayer(spouse, "结婚", "on_divorce", "")

    return ""
end

function on_force_divorce_ack(dlg_id, player, button_id, spouse)
    if button_id ~= 0 then
        return ""
    end

    -- 强制离婚需要手续费
    if not lualib:Player_IsGoldEnough(player, 1000000, false) then
        return "你的金币不足。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    -- 需要道具
    if lualib:Player_GetItemCount(player, "好人卡") < 1 then
       return "你没有好人卡。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    --扣除物品
    if not lualib:Player_SubGold(player, 1000000, false, "扣金币：离婚手续费", spouse) then
		return "扣除金币失败"
	end
	
    lualib:Player_DestroyItem(player, "好人卡", 1, "删物品：离婚用道具", spouse)

    lualib:Player_SetCustomVarStr(player, "配偶姓名", "")
    lualib:Player_SetCustomVarStr(player, "配偶GUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, "你和"..spouse.."离婚了。")
    lualib:Player_NotifyCustomParam(player, "配偶姓名")
    lualib:ScriptFuncToPlayer(spouse, "结婚", "on_divorce", "")

    return ""
end

function on_divorce(player)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶姓名")
    lualib:Player_SetCustomVarStr(player, "配偶姓名", "")
    lualib:Player_SetCustomVarStr(player, "配偶GUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, spouse.."和你离婚了。")
    lualib:Player_NotifyCustomParam(player, "配偶姓名")
end

function reward(npc, player)
	msg = "#COLORCOLOR_SKYBLUE#选择你要领取的奖励#COLOREND#\n"
	msg = msg.."#COLORCOLOR_YELLOW#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━#COLOREND#\n \n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@medal_award *01*[领取同心勋章]>\n"
	msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@buff_award *01*[领取情比金坚状态]>\n"
	msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@reward_info *01*[奖励介绍]>\n"
	msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@intimacy_info *01*[亲密度介绍]>\n \n \n"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*[返回]>"
	return msg
end

function reward_info(npc, player)
	local msg = "#COLORCOLOR_GOLD#奖励一：同心勋章（需要相应的亲密度才可以佩带）#COLOREND# "
			msg = msg.." \n #COLORCOLOR_RED#亲密度1～999：#COLOREND#    #OFFSET<X:3,Y:0>#同心勋章一级（全属性0-1）"
			msg = msg.." \n #COLORCOLOR_RED#亲密度1000～1999：#COLOREND##OFFSET<X:3,Y:0>#同心勋章二级（全属性0-2）"
			msg = msg.." \n #COLORCOLOR_RED#亲密度2000～3999：#COLOREND##OFFSET<X:3,Y:0>#同心勋章三级（全属性0-3）"
			msg = msg.." \n #COLORCOLOR_RED#亲密度4000～6999：#COLOREND##OFFSET<X:3,Y:0>#同心勋章四级（全属性0-4命中+1,暴击+1）"
			msg = msg.." \n #COLORCOLOR_RED#亲密度7000～7999：#COLOREND##OFFSET<X:3,Y:0>#同心勋章五级（全属性0-5命中+1,闪避+1,暴\n                     #COLOREND##OFFSET<X:-4,Y:0>#击+1）"
			msg = msg.." \n #COLORCOLOR_RED#亲密度8000以上：#COLOREND#   #COLOREND##OFFSET<X:-3,Y:0>#同心勋章六级（全属性1-6,命中+2,闪避+2,暴\n                     #OFFSET<X:-4,Y:0>#击+2）\n"
			msg = msg.." \n #COLORCOLOR_GOLD#奖励二：情比金坚状态（亲密度越高，情比金坚效果越大）#COLOREND#"
			msg = msg.." \n #COLORCOLOR_RED#亲密度1～999：#COLOREND#    #OFFSET<X:4,Y:0>#打怪经验增加1%"
			msg = msg.." \n #COLORCOLOR_RED#亲密度1000～1999：#COLOREND# #OFFSET<X:-2,Y:0>#打怪经验增加5%"
			msg = msg.." \n #COLORCOLOR_RED#亲密度2000～2999：#COLOREND##OFFSET<X:4,Y:0>#打怪经验增加10%"
			msg = msg.." \n #COLORCOLOR_RED#亲密度3000～4499：#COLOREND##OFFSET<X:4,Y:0>#打怪经验增加15%"
			msg = msg.." \n #COLORCOLOR_RED#亲密度4500～5999：#COLOREND##OFFSET<X:4,Y:0>#打怪经验增加20%"
			msg = msg.." \n #COLORCOLOR_RED#亲密度6000以上：#COLOREND#  #OFFSET<X:4,Y:0>#打怪经验增加30% \n\n"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@reward *01*「返回」>\n \n"
	return msg
end

function intimacy_info(npc, player)
	local msg = "#COLORCOLOR_GOLD#亲密度开启:#COLOREND# "
			msg = msg.." \n 男女双方结为夫妻后,亲密度自动开启"
			msg = msg.." \n #COLORCOLOR_GOLD#亲密度增加:#COLOREND#"
			msg = msg.." \n 1.夫妻双方在同一队伍时,每10分钟双方自动增加#COLORCOLOR_SKYBLUE#1点#COLOREND#亲密度"
			msg = msg.." \n 2.夫妻一方对另一方成功使用#COLORCOLOR_RED#玫瑰花#COLOREND#,根据玫瑰花的种类增加相应的亲密度"
			msg = msg.." \n #COLORCOLOR_GOLD#其他说明:#COLOREND#"
			msg = msg.." \n 1.夫妻双方如果成功#COLORCOLOR_RED#离婚#COLOREND#,则双方的亲密度全部清除"
			msg = msg.." \n 2.亲密度如果#COLORCOLOR_GOLD#高于2000#COLOREND#,则每天00:00:00时将#COLORCOLOR_RED#扣除#COLOREND#一定比例的亲密度"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@reward *01*「返回」>\n \n"
	return msg
end

function medal_award(npc, player)

	local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")

	if spouse == "" then
		return "你还没有结婚，无法领取！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end

	local free_slot = lualib:BagFree(player, true, false, false)--判断包裹是否有领勋章的空格
	if free_slot < 1 then
		return "背包已满，无法领取！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end

	local t_medal = {"同心勋章一级", "同心勋章二级", "同心勋章三级", "同心勋章四级", "同心勋章五级", "同心勋章六级"}--判断是否已经领取过勋章
	for _, v in pairs(t_medal) do
		local medal_count = lualib:ItemCountByKey(player, v, true, true, true, 2)
			if medal_count > 0 then
				return "你已经领取过【同心勋章】，请丢弃你现在的【同心勋章】后再领取！\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
			end
	end


    local intimacy = lualib:Player_GetCustomVarInt(player, "intimacy")--根据亲密度领取对应的勋章
	if intimacy > 0 and intimacy<= 999 then
		lualib:AddSingleItem(player, "同心勋章一级", 1, 1, "亲密度达到1～999", "")
		return "一级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 999 and intimacy <= 1999 then
		lualib:AddSingleItem(player, "同心勋章二级", 1, 1, "亲密度达到1000～1999", "")
		return "二级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 1999 and intimacy <= 3999 then
		lualib:AddSingleItem(player, "同心勋章三级", 1, 1, "亲密度达到2000～3999", "")
		return "三级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 3999 and intimacy <= 6999 then
		lualib:AddSingleItem(player, "同心勋章四级", 1, 1, "亲密度达到4000～6999", "")
		return "四级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 6999 and intimacy <= 7999 then
		lualib:AddSingleItem(player, "同心勋章五级", 1, 1, "亲密度达到7000～7999", "")
		return "五级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 7999 then
		lualib:AddSingleItem(player, "同心勋章六级", 1, 1, "亲密度达到8000以上", "")
		return "六级同心勋章领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	else
		return "你的亲密度为0，无法领取【同心勋章】！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end

end

function buff_award(npc, player)--根据亲密度领取经验加成BUFF	
	local expbuffList = {
"双倍经验",
"三倍经验",
"四倍经验",
"1.2倍经验",
"1.5倍经验",
"双倍经验24小时",
"三倍经验24小时",
"1.5倍经验24小时",
}
	
	for i = 1, #expbuffList do
		if lualib:HasBuff(player, expbuffList[i]) == true then
			return "您身上有其他经验状态，无法领取！"
		end
	end
	
	local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")

	if spouse == "" then
		return "你还没有结婚，无法领取！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
	
	local buff_name = "情比金坚"
	local buff_check = lualib:HasBuff(player, buff_name)

	if buff_check == true then
		return "你已经拥有了“情比金坚”的效果，请等该效果消失后再来领取！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end

    local intimacy = lualib:Player_GetCustomVarInt(player, "intimacy")
	if intimacy > 0 and intimacy<= 999 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 1)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 999 and intimacy <= 1999 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 5)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 1999 and intimacy <= 2999 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 10)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 2999 and intimacy <= 4499 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 15)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 4499 and intimacy <= 5999 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 20)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	elseif intimacy > 5999 then
		lualib:AddBuffEx(player, "情比金坚", 6000, 30)
		return "情比金坚状态领取成功。\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	else
		return "你的亲密度为0，无法领取情比金坚的效果！\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
end

function jump(npc,player)
	local 	msg = "进入#COLORCOLOR_SKYBLUE#灵山#COLOREND#能打到#COLORCOLOR_RED#结婚戒指#COLOREND#和增加亲密度的#COLORCOLOR_RED#玫瑰花#COLOREND#！以及各种只有夫妻才可以使用的#COLORCOLOR_RED#疗伤药#COLOREND#、#COLORCOLOR_RED#传送卷轴#COLOREND#。（传送需要2万金币）\n"
			msg = msg.."#COLORCOLOR_YELLOW#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━#COLOREND#\n \n"
			msg = msg.."#OFFSET<X:0,Y:1>#     #IMAGE<ID:1902700018>##OFFSET<X:0,Y:-2>#<@MapMoveXYB#灵山#55#77#4 *01*【进入灵山】>               #OFFSET<X:0,Y:2>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"

	return msg
end

function mvtx(npc, tierid, param1, param2, param3)

	mapming = param1
	map_x = param2
	map_y = param3

	local canshu = {"灵山"}
	for i = 1, #canshu do
		if mapming == canshu[i] then
			local csmapguid = lualib:Map_GetMapGuid(canshu[i])
			lualib:RunClientScript(csmapguid, "mapeffect", "texiao", "100001671#"..map_x.."#"..map_y.."#0#0")
		end
	end

end

function MapMoveXYA(npc, player, map_key_name, x, y, r)
	local msg=""
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)

	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	return msg
end

function MapMoveXYB(npc, player, map_key_name, x, y, r)
	local msg=""
	gold = 20000
	if not lualib:Player_SubGold(player, gold, false, "扣除金币：传送费", "结婚") then return "你的金币不足，不能传送！\n \n \n \n \n \n \n \n \n                                                    #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>" end
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)
	
	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")

	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	
		local mapname = {"巫山城"}
	
	for i = 1, #mapname do
		if map_key_name == mapname[1] then
			lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "巫山城".."#"..x.."#"..y)
		end
	end
	
	
	return msg
end

function likai(npc, player)
	return ""
end

function noticeMsg(npc, player)
    return "结婚管理员正在桃花丛中主持露天婚礼，坐标是 142：322。\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end