local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/marry")

local talk_t = {"�����һ����ʥ���Ҹ������飬�����������֮�ˣ������������������Ŷ��", "�����Ҫ����ָ��һЩ��ң������ȥ��ɽ��ý���ָ��õ�廨��", "�����Ի��ѫ�º���Ƚ��״̬������֮��Խ���ܣ�ѫ�º�״̬��Ч��Խ��Ŷ��"}

function on_create(npc)
	lualib:AddTimer(npc, 1, 300000, -1, "on_timer_talk")
end

function on_timer_talk(npc, timer_id)

		lualib:SysMsg_SendRoleTalk(npc, talk_t[lualib:GenRandom(1, #talk_t)])

end
function main(npc, player)
    local msg = "    ��ӭ�����羰�������ļ��紺����ԵС�壬С����ڳ�����ħ���֣���ʿ����������ô��\n"
    msg = msg.."#OFFSET<X:2,Y:-4>##COLORCOLOR_YELLOW#����������������������������������������������������������#COLOREND#\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700041##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[��Ҫ�����ǵ������]>\n"
    --msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@reward *01*[��ȡ���޽���]>\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700015##OFFSET<X:0,Y:-2>#<@jump *01*[ǰ����ɽ]����Ҫ2���ң�>\n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700030##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[Э�����]>\n"
    msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@noticeMsg *01*[ǿ�����]>\n"
    msg = msg.."                                                      #OFFSET<X:0,Y:-6>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@likai *01*[�뿪]>\n"
    return msg
end

function propose(npc, player)
    -- �ж��Ա������ܸ����е�
    local gender = lualib:Player_GetIntProp(player,  lua_role_gender)
    if gender ~=  lua_gender_male then
        return "������¶���Ů����������ֵ�á�\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- �жϻ��
    if lualib:Player_GetCustomVarStr(player, "��żGUID") ~= "" then
        return "�ػ���Ƿ����ġ�\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- �ж��Ƿ��г��з�
    if not lualib:Player_IsGoldEnough(player, 100000, false) then
        return "�����Ҫһö����ָ��100000��ң�\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    if lualib:Player_GetItemCount(player, "����ָ") < 1 then
       return "����ָ��û׼���þ�����飿\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- �������ϣ�ѯ�ʽ�����
    lualib:ShowForm(player, "����")
    return ""
end

function divorce(npc, player)
    local spouse = lualib:Player_GetCustomVarStr(player, "��ż����")
    if spouse == "" then
        return "�㻹û����ء�\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- �ж϶Է��Ƿ�����
    local spouse_guid = lualib:Player_GetGuid(spouse)
    if spouse_guid == "" or lualib:Map_GetDistance(lualib:Npc_GetPosX(npc), lualib:Npc_GetPosY(npc), lualib:Player_GetPosX(spouse_guid), lualib:Player_GetPosY(spouse_guid)) > 10 then
        return "�ף���û����"..spouse.."�����ﰡ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    local player_name = lualib:Player_GetStrProp(player,  lua_role_user_name)

    if lualib:SysMsg_SendMsgDlg(spouse_guid, 1, "��ȷ��Ҫ��"..player_name.."�����#BUTTON0#ȷ��#BUTTONEND##BUTTON1#ȡ��#BUTTONEND#", 30, "on_divorce_ack", player_name) == false then
        return "æ���أ�������������\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

	return "����Է�������Э�����������ȴ��Է���Ӧ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
end

function force_divorce(npc, player)
    local spouse = lualib:Player_GetCustomVarStr(player, "��ż����")
    if spouse == "" then
        return "�㻹û����ء�\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- ǿ�������Ҫ������
    if not lualib:Player_IsGoldEnough(player, 1000000, false) then
        return "ǿ�������Ҫ1000000��Һ�һ�ź��˿���\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- ��Ҫ����
    if lualib:Player_GetItemCount(player, "���˿�") < 1 then
       return "��û�к��˿���\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    lualib:SysMsg_SendMsgDlg(player, 1, "��ȷ��Ҫ��"..spouse.."�����#BUTTON0#ȷ��#BUTTONEND##BUTTON1#ȡ��#BUTTONEND#", 30, "on_force_divorce_ack", spouse)
end

function on_divorce_ack(dlg_id, player, button_id, spouse)
	local button_id = tonumber(button_id)
	local spouse_guid = lualib:Name2Guid(spouse)
    if button_id ~= 0 then
		lualib:SysMsg_SendTriggerMsg(spouse_guid, "�Է��ܾ���顣")
		lualib:SysMsg_SendTriggerMsg(player, "��ܾ�����飡")
        return "�Է��ܾ���顣"
    end
    lualib:Player_SetCustomVarStr(player, "��ż����", "")
    lualib:Player_SetCustomVarStr(player, "��żGUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, "���"..spouse.."����ˡ�")
    lualib:Player_NotifyCustomParam(player, "��ż����")
    lualib:ScriptFuncToPlayer(spouse, "���", "on_divorce", "")

    return ""
end

function on_force_divorce_ack(dlg_id, player, button_id, spouse)
    if button_id ~= 0 then
        return ""
    end

    -- ǿ�������Ҫ������
    if not lualib:Player_IsGoldEnough(player, 1000000, false) then
        return "��Ľ�Ҳ��㡣\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    -- ��Ҫ����
    if lualib:Player_GetItemCount(player, "���˿�") < 1 then
       return "��û�к��˿���\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end

    --�۳���Ʒ
    if not lualib:Player_SubGold(player, 1000000, false, "�۽�ң����������", spouse) then
		return "�۳����ʧ��"
	end
	
    lualib:Player_DestroyItem(player, "���˿�", 1, "ɾ��Ʒ������õ���", spouse)

    lualib:Player_SetCustomVarStr(player, "��ż����", "")
    lualib:Player_SetCustomVarStr(player, "��żGUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, "���"..spouse.."����ˡ�")
    lualib:Player_NotifyCustomParam(player, "��ż����")
    lualib:ScriptFuncToPlayer(spouse, "���", "on_divorce", "")

    return ""
end

function on_divorce(player)
    local spouse = lualib:Player_GetCustomVarStr(player, "��ż����")
    lualib:Player_SetCustomVarStr(player, "��ż����", "")
    lualib:Player_SetCustomVarStr(player, "��żGUID", "")
    marry_unload(player)

    lualib:SysMsg_SendPromptMsg(player, spouse.."��������ˡ�")
    lualib:Player_NotifyCustomParam(player, "��ż����")
end

function reward(npc, player)
	msg = "#COLORCOLOR_SKYBLUE#ѡ����Ҫ��ȡ�Ľ���#COLOREND#\n"
	msg = msg.."#COLORCOLOR_YELLOW#����������������������������������������������������������#COLOREND#\n \n"
    msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@medal_award *01*[��ȡͬ��ѫ��]>\n"
	msg = msg.."#OFFSET<X:2,Y:2>##IMAGE1902700031##OFFSET<X:0,Y:-2>#<@buff_award *01*[��ȡ��Ƚ��״̬]>\n"
	msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@reward_info *01*[��������]>\n"
	msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017##OFFSET<X:0,Y:-2>#<@intimacy_info *01*[���ܶȽ���]>\n \n \n"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*[����]>"
	return msg
end

function reward_info(npc, player)
	local msg = "#COLORCOLOR_GOLD#����һ��ͬ��ѫ�£���Ҫ��Ӧ�����ܶȲſ��������#COLOREND# "
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�1��999��#COLOREND#    #OFFSET<X:3,Y:0>#ͬ��ѫ��һ����ȫ����0-1��"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�1000��1999��#COLOREND##OFFSET<X:3,Y:0>#ͬ��ѫ�¶�����ȫ����0-2��"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�2000��3999��#COLOREND##OFFSET<X:3,Y:0>#ͬ��ѫ��������ȫ����0-3��"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�4000��6999��#COLOREND##OFFSET<X:3,Y:0>#ͬ��ѫ���ļ���ȫ����0-4����+1,����+1��"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�7000��7999��#COLOREND##OFFSET<X:3,Y:0>#ͬ��ѫ���弶��ȫ����0-5����+1,����+1,��\n                     #COLOREND##OFFSET<X:-4,Y:0>#��+1��"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�8000���ϣ�#COLOREND#   #COLOREND##OFFSET<X:-3,Y:0>#ͬ��ѫ��������ȫ����1-6,����+2,����+2,��\n                     #OFFSET<X:-4,Y:0>#��+2��\n"
			msg = msg.." \n #COLORCOLOR_GOLD#����������Ƚ��״̬�����ܶ�Խ�ߣ���Ƚ��Ч��Խ��#COLOREND#"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�1��999��#COLOREND#    #OFFSET<X:4,Y:0>#��־�������1%"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�1000��1999��#COLOREND# #OFFSET<X:-2,Y:0>#��־�������5%"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�2000��2999��#COLOREND##OFFSET<X:4,Y:0>#��־�������10%"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�3000��4499��#COLOREND##OFFSET<X:4,Y:0>#��־�������15%"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�4500��5999��#COLOREND##OFFSET<X:4,Y:0>#��־�������20%"
			msg = msg.." \n #COLORCOLOR_RED#���ܶ�6000���ϣ�#COLOREND#  #OFFSET<X:4,Y:0>#��־�������30% \n\n"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@reward *01*�����ء�>\n \n"
	return msg
end

function intimacy_info(npc, player)
	local msg = "#COLORCOLOR_GOLD#���ܶȿ���:#COLOREND# "
			msg = msg.." \n ��Ů˫����Ϊ���޺�,���ܶ��Զ�����"
			msg = msg.." \n #COLORCOLOR_GOLD#���ܶ�����:#COLOREND#"
			msg = msg.." \n 1.����˫����ͬһ����ʱ,ÿ10����˫���Զ�����#COLORCOLOR_SKYBLUE#1��#COLOREND#���ܶ�"
			msg = msg.." \n 2.����һ������һ���ɹ�ʹ��#COLORCOLOR_RED#õ�廨#COLOREND#,����õ�廨������������Ӧ�����ܶ�"
			msg = msg.." \n #COLORCOLOR_GOLD#����˵��:#COLOREND#"
			msg = msg.." \n 1.����˫������ɹ�#COLORCOLOR_RED#���#COLOREND#,��˫�������ܶ�ȫ�����"
			msg = msg.." \n 2.���ܶ����#COLORCOLOR_GOLD#����2000#COLOREND#,��ÿ��00:00:00ʱ��#COLORCOLOR_RED#�۳�#COLOREND#һ�����������ܶ�"
		msg = msg.."                                                    #OFFSET<X:0,Y:2>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@reward *01*�����ء�>\n \n"
	return msg
end

function medal_award(npc, player)

	local spouse = lualib:Player_GetCustomVarStr(player, "��żGUID")

	if spouse == "" then
		return "�㻹û�н�飬�޷���ȡ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end

	local free_slot = lualib:BagFree(player, true, false, false)--�жϰ����Ƿ�����ѫ�µĿո�
	if free_slot < 1 then
		return "�����������޷���ȡ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end

	local t_medal = {"ͬ��ѫ��һ��", "ͬ��ѫ�¶���", "ͬ��ѫ������", "ͬ��ѫ���ļ�", "ͬ��ѫ���弶", "ͬ��ѫ������"}--�ж��Ƿ��Ѿ���ȡ��ѫ��
	for _, v in pairs(t_medal) do
		local medal_count = lualib:ItemCountByKey(player, v, true, true, true, 2)
			if medal_count > 0 then
				return "���Ѿ���ȡ����ͬ��ѫ�¡����붪�������ڵġ�ͬ��ѫ�¡�������ȡ��\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
			end
	end


    local intimacy = lualib:Player_GetCustomVarInt(player, "intimacy")--�������ܶ���ȡ��Ӧ��ѫ��
	if intimacy > 0 and intimacy<= 999 then
		lualib:AddSingleItem(player, "ͬ��ѫ��һ��", 1, 1, "���ܶȴﵽ1��999", "")
		return "һ��ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 999 and intimacy <= 1999 then
		lualib:AddSingleItem(player, "ͬ��ѫ�¶���", 1, 1, "���ܶȴﵽ1000��1999", "")
		return "����ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 1999 and intimacy <= 3999 then
		lualib:AddSingleItem(player, "ͬ��ѫ������", 1, 1, "���ܶȴﵽ2000��3999", "")
		return "����ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 3999 and intimacy <= 6999 then
		lualib:AddSingleItem(player, "ͬ��ѫ���ļ�", 1, 1, "���ܶȴﵽ4000��6999", "")
		return "�ļ�ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 6999 and intimacy <= 7999 then
		lualib:AddSingleItem(player, "ͬ��ѫ���弶", 1, 1, "���ܶȴﵽ7000��7999", "")
		return "�弶ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 7999 then
		lualib:AddSingleItem(player, "ͬ��ѫ������", 1, 1, "���ܶȴﵽ8000����", "")
		return "����ͬ��ѫ����ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	else
		return "������ܶ�Ϊ0���޷���ȡ��ͬ��ѫ�¡���\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end

end

function buff_award(npc, player)--�������ܶ���ȡ����ӳ�BUFF	
	local expbuffList = {
"˫������",
"��������",
"�ı�����",
"1.2������",
"1.5������",
"˫������24Сʱ",
"��������24Сʱ",
"1.5������24Сʱ",
}
	
	for i = 1, #expbuffList do
		if lualib:HasBuff(player, expbuffList[i]) == true then
			return "����������������״̬���޷���ȡ��"
		end
	end
	
	local spouse = lualib:Player_GetCustomVarStr(player, "��żGUID")

	if spouse == "" then
		return "�㻹û�н�飬�޷���ȡ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end
	
	local buff_name = "��Ƚ��"
	local buff_check = lualib:HasBuff(player, buff_name)

	if buff_check == true then
		return "���Ѿ�ӵ���ˡ���Ƚ�ᡱ��Ч������ȸ�Ч����ʧ��������ȡ��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end

    local intimacy = lualib:Player_GetCustomVarInt(player, "intimacy")
	if intimacy > 0 and intimacy<= 999 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 1)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 999 and intimacy <= 1999 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 5)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 1999 and intimacy <= 2999 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 10)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 2999 and intimacy <= 4499 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 15)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 4499 and intimacy <= 5999 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 20)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	elseif intimacy > 5999 then
		lualib:AddBuffEx(player, "��Ƚ��", 6000, 30)
		return "��Ƚ��״̬��ȡ�ɹ���\n".."\n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	else
		return "������ܶ�Ϊ0���޷���ȡ��Ƚ���Ч����\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
	end
end

function jump(npc,player)
	local 	msg = "����#COLORCOLOR_SKYBLUE#��ɽ#COLOREND#�ܴ�#COLORCOLOR_RED#����ָ#COLOREND#���������ܶȵ�#COLORCOLOR_RED#õ�廨#COLOREND#���Լ�����ֻ�з��޲ſ���ʹ�õ�#COLORCOLOR_RED#����ҩ#COLOREND#��#COLORCOLOR_RED#���;���#COLOREND#����������Ҫ2���ң�\n"
			msg = msg.."#COLORCOLOR_YELLOW#����������������������������������������������������������#COLOREND#\n \n"
			msg = msg.."#OFFSET<X:0,Y:1>#     #IMAGE<ID:1902700018>##OFFSET<X:0,Y:-2>#<@MapMoveXYB#��ɽ#55#77#4 *01*��������ɽ��>               #OFFSET<X:0,Y:2>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"

	return msg
end

function mvtx(npc, tierid, param1, param2, param3)

	mapming = param1
	map_x = param2
	map_y = param3

	local canshu = {"��ɽ"}
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
		return "����ͼʧ��"
    end
	return msg
end

function MapMoveXYB(npc, player, map_key_name, x, y, r)
	local msg=""
	gold = 20000
	if not lualib:Player_SubGold(player, gold, false, "�۳���ң����ͷ�", "���") then return "��Ľ�Ҳ��㣬���ܴ��ͣ�\n \n \n \n \n \n \n \n \n                                                    #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>" end
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)
	
	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")

	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "����ͼʧ��"
    end
	
		local mapname = {"��ɽ��"}
	
	for i = 1, #mapname do
		if map_key_name == mapname[1] then
			lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "��ɽ��".."#"..x.."#"..y)
		end
	end
	
	
	return msg
end

function likai(npc, player)
	return ""
end

function noticeMsg(npc, player)
    return "������Ա�����һ���������¶����������� 142��322��\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:1,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
end