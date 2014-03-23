local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/serializer")
require("system/master")

gQuestMap =
{
   {1019, "", "QuestAccomplish1019","", "*01*�������: ʦͽ"},
   {1020, "QuestAccept1020", "","01*����: ��Ʒ����", ""}
}
gQuestNum = table.getn(gQuestMap)

local talk_t = {"�㲻֪����ô�棿�ǾͰݸ�ʦ�ɡ�", "��ͽ�ܲ�����Ϊ��ָ����������������Ҫ���ǿ��Ի��ѫ�½�����", "��ʦ��ͽ������ʶ��������ѣ�������һ����Ϸ��"}

function on_create(npc)
	lualib:AddTimer(npc, 1, 250000, -1, "on_timer_talk")
end

function on_timer_talk(npc, timer_id)
	
		lualib:SysMsg_SendRoleTalk(npc, talk_t[lualib:GenRandom(1, #talk_t)])

end

function main(npc, player)
    local msg = "    ��һ�������κ�ѧ�����󲻶ϣ���һ����׻׻���գ���Ϊ��ʦ�������������������һ�����˵Ĵ�˵�������ʦ��ͽ������ʦͽ�ļ�֤�ˣ������ʦ������ͽ��\n"
     msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017#<@AddRelation *01*����Ҫ��ʦ��                   >#IMAGE1902700017#<@RemoveRelation *01*�����ʦͽ��ϵ��>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700031##OFFSET<X:2,Y:0>#<@GainMasterRewarda *01*����ȡʦͽ������               >#OFFSET<X:-1,Y:0>##IMAGE1902700042#<@duihuaa *01*��ʦͽ��ѯ��>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700037##OFFSET<X:2,Y:-1>#<@duihuab *01*�������һ���                   >#OFFSET<X:1,Y:2>##IMAGE1902700017##OFFSET<X:-2,Y:0>#<@AddRelationa *01*����Ҫ�˽��ʦ��>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
	 msg = msg.."                                                #OFFSET<X:0,Y:0>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@likai *01*���뿪��>\n"

	for i, v in ipairs(gQuestMap) do
        if v[2] ~= "" then
            if lualib:CanAcceptQuest(player, v[1]) == true then
                msg = msg.."#OFFSET<X:0,Y:-8>##IMAGE1902700016#<@"..v[2].." "..v[4]..">\n \n"
            end
        end

        if v[3] ~= "" then
            if lualib:CanAccomplishQuest(player, v[1]) == true then
                msg = msg.."#OFFSET<X:0,Y:-8>##IMAGE1902700016#<@"..v[3].." "..v[5]..">\n \n"
            end
        end
    end
--    msg = msg.."<@AddRelation *01*��Ҫ��ʦ>\n"
--    msg = msg.."<@RemoveRelation *01*���ʦͽ��ϵ>\n"
--    msg = msg.."<@GainMasterReward *01*��ȡʦ������>\n"
--    msg = msg.."<@GainApprenticeReward *01*��ȡͽ�ܽ���>\n"
--    msg = msg.."<@ShowMaster *01*�鿴ʦ��>\n"
--    msg = msg.."<@ShowApprentice *01*�鿴ͽ��>\n"
--    msg = msg.."<@DestroyData *01*������>\n"
--	msg = msg.."<@duihuan *01*�����һ�>\n"
    return msg
end


function duihuaa(npc, player)
    local msg = "��������������ѯ���ʦ������ͽ�ܵ�����\n"
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."#IMAGE1902700042##OFFSET<X:0,Y:-1>#<@ShowMaster *01*��ѯ�ҵ�ʦ��                        >#OFFSET<X:0,Y:1>##IMAGE1902700042##OFFSET<X:0,Y:-1>#<@ShowApprentice *01*��ѯ�ҵ�ͽ��>\n"
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n \n \n"
     msg = msg.."                                         #OFFSET<X:0,Y:6>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
    return msg
end

function AddRelationa(npc, player)
    local msg = "#COLORCOLOR_ORANGE#��ʦ˵��:#COLOREND#\n"
     msg = msg.."#COLORCOLOR_RED#�ţ�#COLOREND#ͽ�ܵĵȼ�����С��45�����ܰ�ʦ����\n"
     msg = msg.."#COLORCOLOR_RED#�ƣ�#COLOREND#ʦ���ĵȼ�������ڵ���45��������ͽ�ܡ�\n"
     msg = msg.."#COLORCOLOR_RED#�ǣ�#COLOREND#�ﵽ��������ͽ�ܷ����ʦ��������Ҫ�ݵ�ʦ���ǳơ�\n"
     msg = msg.."#COLORCOLOR_RED#�ȣ�#COLOREND#ʦ�������յ�ͽ�ܵ����󲢻�Ӧ�󣬴��ʦͽ��ϵ��\n"
     msg = msg.."#COLORCOLOR_RED#�ɣ�#COLOREND#һ��ʦ�����ͬʱ������5��ͽ�ܡ�\n"
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:-3>##IMAGE1902700017#<@AddRelation *01*����Ҫ��ʦ��                           >#OFFSET<X:0,Y:3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
    return msg
end

function GainMasterRewarda(npc, player)
    local msg = "#COLORCOLOR_ORANGE#ʦͽ����˵��:#COLOREND#\n"
     msg = msg.."#COLORCOLOR_RED#�ţ�#COLOREND#���ʦͽ��ϵ��ͽ����30��֮��ÿ��1����ʦ��������\n"
     msg = msg.."������Ӧ������������ֱ����ʦΪֹ��\n"
     msg = msg.."#COLORCOLOR_RED#�ƣ�#COLOREND#ͽ��52����ʦ��ʦ������ʦͽ����Ա�����ȡ��ʦ�������\n"
     msg = msg.."#COLORCOLOR_RED#�ǣ�#COLOREND#ͽ�ܿ��ڴﵽ35����40����45��ʱ��ʦͽ����Ա��ȡͽ�ܽ�\n"
     msg = msg.."��������\n"
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainMasterReward *01*����ȡʦ��������                   >#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward *01*����ȡͽ�ܽ�����>\n"
	 msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."                                        #OFFSET<X:-3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
	return msg
end

-----�һ�
function duihuab(npc, player)
	local shengwang = get_shengwang(player)
       local msg = "�������������ͽ�ܣ���ô����ͽ��38��֮��ÿ��1��������Ϊʦ����������Ӧ������������ֱ����ʦΪֹ������������������������һ�����ѫ����������������\n"
        msg = msg.."#OFFSET<X:0,Y:-5>##COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-4>#�㵱ǰ������ֵΪ ��"..shengwang.."������һ�����ѫ�£�\n"
        msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
	msg = msg.."#OFFSET<X:0,Y:-5>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_a *01*�һ�����ʦѫ�¡�>    �һ�#COLORCOLOR_GOLD#����ʦѫ�¡�#COLOREND#��Ҫ800������ֵ\n"
	msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_b *01*�һ�����ʦѫ�¡�>    �һ�#COLORCOLOR_GOLD#����ʦѫ�¡�#COLOREND#��Ҫ2000������ֵ\n"
    msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_d *01*�һ�������ѫ�¡�>    �һ�#COLORCOLOR_GOLD#������ѫ�¡�#COLOREND#��Ҫ10000������ֵ\n"
--	msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_c *01*�һ���������Ʒ��>    \n"
	msg = msg.."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
	return msg
end

function xunzhang_a(npc,player)
	msg = "�һ�����ʦѫ�¡���Ҫ800������ֵ����ȷ���һ���\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_a *01*ȷ��>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*�����ء�>\n"
	return msg
end

function queding_a(npc, player)
    local shengwang = get_shengwang(player)
	print(shengwang)
    if shengwang < 800 then
        return "�������ֵ����800�����ܶһ���\n \n \n \n \n \n \n                                                  #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ����������������һ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end
        
    local award_item = "��ʦѫ��"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
    
    set_shengwang(player, shengwang - 800)
    
    return award_item.."���һ����ɹ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
end

function xunzhang_b(npc,player)
	msg = "�һ�����ʦѫ�¡���Ҫ2000������ֵ����ȷ���һ���\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_b *01*ȷ��>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*�����ء�>\n"
	return msg
end

function queding_b(npc, player)
    local shengwang = get_shengwang(player)
	
    if shengwang < 2000 then
        return "�������ֵ����2000�����ܶһ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ����������������һ���\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
        
    local award_item = "��ʦѫ��"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
    
    set_shengwang(player, shengwang - 2000)
    
    return award_item.."���һ����ɹ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
end

function xunzhang_d(npc,player)
	msg = "�һ�������ѫ�¡���Ҫ10000������ֵ����ȷ���һ���\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_d *01*ȷ��>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*�����ء�>\n"
	return msg
end

function queding_d(npc, player)
    local shengwang = get_shengwang(player)
    if shengwang < 10000 then
        return "�������ֵ����10000�����ܶһ���\n \n \n \n \n \n \n                                                  #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ����������������һ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end
        
    local award_item = "����ѫ��"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
    
    set_shengwang(player, shengwang - 10000)
    
    return award_item.."���һ����ɹ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
end

local sw_item_list = {
							{"����", 0, "����"},
							{"����", 10, "����"},
							{"����", 10, "����"},
							{"����", 10, "����"},
							{"����", 10, "����"},
							{"����", 10, "����"},
						}
function xunzhang_c(npc, player)
	local msg = "����һ�ʲô��\n\n"
	for i = 1, #sw_item_list do
		msg = msg.."<@queding_c#"..i.." *01*��"..sw_item_list[i][1].."��>"
		msg = msg.."    "
	end
	msg = msg.."\n                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
	return msg
end

function queding_c(npc, player, index)
	local index = tonumber(index)
	local msg = "�һ�"..sw_item_list[index][1].."��Ҫ"..sw_item_list[index][2].."������ֵ����ȷ���һ���\n"
	msg = msg.."<@swduihuan#"..index.. " *01*��ȷ���һ���>"
	msg = msg.."\n                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"
	return msg
end


function swduihuan(npc, player, index)
	local shengwang = get_shengwang(player)
	local index = tonumber(index)
	if shengwang < sw_item_list[index][2] then
		return "�������ֵ����"..sw_item_list[index][2].."�㣬�޷��һ���"
	end
	
	if not lualib:Player_GiveSingleItem(player, sw_item_list[index][3], 0, "ʦͽ������"..sw_item_list[index][3], lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
	
	
	if lualib:Player_GetBagFree(player) < 1 then
		return "��ı������㣬�������һ���"
	end
	
	set_shengwang(player, shengwang - sw_item_list[index][2])
	return sw_item_list[index][1].."���һ����ɹ���\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function AddRelation(npc, player)
    if get_master_name(player) ~= "" then
        return "���Ѿ���ʦ����\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end
    
    local LIMIT_LEVEL = 45    
    if lualib:Player_GetIntProp(player, lua_role_level) >= LIMIT_LEVEL then
        return "���Ѿ����˰�ʦ�ĵȼ�\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end
    
    if lualib:SysMsg_SendInputDlg(player, 1, "������ʦ�����֣�", 30, 14, "InputMasterName", "") == false then
        return "æ���أ�������������\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end
    
    return ""
end

function InputMasterName(id, player, master_name)
    local apprentice = player
    local apprentice_name = lualib:Player_GetStrProp(apprentice, lua_role_user_name)
    local master = lualib:Player_GetGuid(master_name)
    
    if master == "" then
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."�����ߡ�")
        return 
    end
    
    if lualib:Player_GetDistance(apprentice, master) >= 10 then
        lualib:SysMsg_SendTriggerMsg(apprentice, "�ף���û����"..master_name.."�����ﰡ��")
        return
    end
        
    local LIMIT_LEVEL = 45    
    if lualib:Player_GetIntProp(master, lua_role_level) < LIMIT_LEVEL then
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."�ȼ�����!")
        return 
    end
    
    lualib:SysMsg_SendMsgDlg(master, 1, "��ȷ��Ҫ����"..apprentice_name.."Ϊ���ͽ�ܣ�#BUTTON0#ȷ��#BUTTONEND##BUTTON1#ȡ��#BUTTONEND#", 30, "on_master_ack", apprentice_name)
end

function on_master_ack(dlg_id, player, button_id, param)
    local master = player
    local master_name = lualib:Player_GetStrProp(master, lua_role_user_name)
    local apprentice_name = param
    local apprentice = lualib:Player_GetGuid(apprentice_name)
    
    if apprentice == "" then
        lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."���ڸ���!")
		return
    end
    
    if button_id == 0 then
        if get_master_name(apprentice) ~= "" then
            lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."�Ѿ���ʦ����!")
            return
        end
    
        if get_apprentice_num(master) >= 5 then
            lualib:SysMsg_SendTriggerMsg(master, "����ͽ������!")
            lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."ͽ������!")
            return
        end
        
        add_apprentice(master, apprentice, apprentice_name)
        set_master_name(apprentice, master_name)
        
        lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."�������ͽ��")
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."�������ʦ��")
    else
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."�ܾ������İ�ʦ����!")
    end
end

function RemoveRelation(npc, player)
       local msg = "#COLORCOLOR_RED#�ţ�#COLOREND#������������ڵ�ͽ��Ʒ�в��ã�͵��ˣ�������Խ������\n"
        msg = msg.."����ʦ�š�\n"
        msg = msg.."#COLORCOLOR_RED#�ƣ�#COLOREND#������������ڵ�ʦ��ʦ�²��ѣ����Ͷ���ţ�������ָ�\n"
        msg = msg.."��������֮����ѡ���˳�ʦ��\n"
        msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
        msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@DropApprentice *01*�����ʦ�š�                           >#OFFSET<X:0,Y:1>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@DropMaster *01*���˳�ʦ�š�>\n"
        msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
        msg = msg.."                                            #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    return msg
end

function DropMaster(npc, player)
    local master_name = get_master_name(player)
    
    if master_name == "" then
        return "��û��ʦ��\n \n \n \n \n \n \n".."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end

    msg = "����ʦ����Ҫ����5W���, ��ȷ����ʦ������\n \n \n \n \n \n"
    msg = msg.."#OFFSET<X:0,Y:-5>##IMAGE1902700033##OFFSET<X:0,Y:-2>#<@DropMasterConfirm#"..master_name.." *01*ȷ��>\n"
    msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*������ҳ>\n"

    return msg
end

--ͽ���뿪ʦ����Ҫ����5W��ҡ�
function DropMasterConfirm(npc, player, master_name)
    local is_bind = false
    local gold = 50000
    if not lualib:Player_IsGoldEnough(player, gold, is_bind) then 
        return "���Ľ�Ҳ���"..gold.."��\n \n \n \n \n \n \n                                           #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>" 
    end

    if not lualib:Player_SubGold(player, gold, is_bind, "�۽�ң���ʦ����", master_name) then 
        return "�۳����ʧ�ܣ�\n \n \n \n \n \n \n                                           #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>" 
    end

    local apprentice = player
    local apprentice_name = lualib:Player_GetStrProp(apprentice, lua_role_user_name)

    set_master_name(apprentice, "")
    lualib:SysMsg_SendCenterMsg(1, apprentice_name.." ��ʦ����, ���� "..master_name.." �����Ż���!", "")
    
    lualib:ScriptFuncToPlayer(master_name, "ʦͽ", "on_apprentice_drop_master", apprentice.."#"..apprentice_name)
    
    return ""
end

function on_apprentice_drop_master(player, apprentice, apprentice_name)
    remove_apprentice(player, apprentice)
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--ʦ������
function GainMasterReward(npc, player)
    local master_reward_count = get_master_reward_count(player)
    if master_reward_count <= 0 then
    local msg = "û���κν���������ȡ\n \n \n \n \n \n"
    msg = msg.."                                           #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>" 
        return msg
    end
    
    msg = "������"..master_reward_count.."�ν���������ȡ\n"
    msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainMasterRewardOne *01*����ȡ��>\n" 
    msg = msg.."                                           #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>" 

    return msg
end

function GainMasterRewardOne(npc, player)
    local master_reward_count = get_master_reward_count(player)
    if master_reward_count <= 0 then
        return
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ���������������ȡ��\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
        
    local award_item = "��ʦ���"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
    end
    
    set_master_reward_count(player, master_reward_count - 1)
    
    return award_item.."����ȡ���ɹ���\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*�����ء�>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--ͽ�ܽ���
function GainApprenticeReward(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
--  local msg = "<@GainApprenticeReward25 *01*����ȡ25��������>\n" 

    local msg = "������Ѿ���ʦ������ﵽ#COLORCOLOR_RED#��35������40���� ��45����#COLOREND#��ʱ���������������ȡ���ֽ���Ŷ\n"
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."#IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward35 *01*����ȡ35��������>\n#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward40 *01*����ȡ40��������>\n#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward45 *01*����ȡ45��������>\n" 
     msg = msg.."#COLORCOLOR_BROWN#��������������������������������������������������������#COLOREND#\n"
     msg = msg.."������                                         #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>\n"

    return msg
end

function GainApprenticeReward25(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --δ��ʦ �ȼ����� �����
    if last_master_name == "" and  master_name == "" then
        return "�㻹δ��ʦ��ȼ����㣬������ȡ\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
    end
    
    if level < 25 then
        return "Ŀǰ���ĵȼ�δ����25��\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
    end
    
    if apprentice_reward >= 25 then
        return "���Ѿ����25��������\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
    end
    
    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ���������������ȡ��\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
    end
        
    local award_item = "25��ͽ�����"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
    end
    
    set_apprentice_reward(player, 25)
    
    return award_item.."����ȡ���ɹ���\n \n \n \n \n \n#IMAGE1902700019#<@main *01*�����ء�>"
end

function GainApprenticeReward35(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --δ��ʦ �ȼ����� �����
    if master_name == "" and last_master_name == "" then
        return "��û�аݹ�ʦ���޷���ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    if level < 35 then
        return "Ŀǰ���ĵȼ�δ����35��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*��������ҳ��>"
    end
    
    if apprentice_reward >= 35 then
        return "���Ѿ����35��������\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ���������������ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
        
    local award_item = "��ʦ���"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    set_apprentice_reward(player, 35)
    
    return award_item.."����ȡ���ɹ���\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
end

function GainApprenticeReward40(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --δ��ʦ �ȼ����� �����
    if master_name == "" and last_master_name == "" then
        return "��û�аݹ�ʦ���޷���ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    if level < 40 then
        return "Ŀǰ���ĵȼ�δ����40��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    if apprentice_reward >= 40 then
        return "���Ѿ����40��������\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ���������������ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
        
    local award_item = "��ʦ���"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    set_apprentice_reward(player, 40)
    
    return award_item.."����ȡ���ɹ���\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
end

function GainApprenticeReward45(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --δ��ʦ �ȼ����� �����
    if master_name == "" and last_master_name == "" then
        return "��û�аݹ�ʦ���޷���ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    if level < 45 then
        return "Ŀǰ���ĵȼ�δ����45��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    if apprentice_reward >= 45 then
        return "���Ѿ����45��������\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "�Բ�����ı����Ѿ����ˣ���������������ȡ��\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
        
    local award_item = "��ʦ���"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "ʦͽ������"..award_item, lualib:Npc_GetKeyName(npc)) then
        return "����ȡ��ʧ�ܣ�\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
    end
    
    set_apprentice_reward(player, 45)
    
    return award_item.."����ȡ���ɹ���\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*�����ء�>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function DropApprentice(npc, player)
    if get_apprentice_num(player) <= 0 then
        return "��û��ͽ��\n \n \n \n \n \n \n".."                                            #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end

    local app_t = get_apprentices(player)
    msg = "ͽ���б�\n"
    
    for k, v in pairs(app_t) do
        msg = msg.."#OFFSET<X:0,Y:1>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@DropApprenticeOne#"..k.."#"..v.." *01*"..v..">\n"
		msg = msg.."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"
    end

    return msg
end

--ʦ������ͽ����Ҫ����10W���
function DropApprenticeOne(npc, player, apprentice, apprentice_name)
    msg = "����10W���, ȷ���� "..apprentice_name.." ���ʦ��?\n \n \n \n \n \n"
    msg = msg.."#OFFSET<X:0,Y:1>##IMAGE1902700033##OFFSET<X:0,Y:-2>#<@DropApprenticeOneConfirm#"..apprentice.."#"..apprentice_name.." *01*ȷ��>\n"
    msg = msg.."                                              #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>"

    return msg
end

function DropApprenticeOneConfirm(npc, player, apprentice, apprentice_name)
    local is_bind = false
    local gold = 100000
    if not lualib:Player_IsGoldEnough(player, gold, is_bind) then 
        return "���Ľ�Ҳ���"..gold.."��\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-4>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>" 
    end

    if not lualib:Player_SubGold(player, gold, is_bind, "�۽�ң����ʦ��", apprentice_name) then 
        return "�۳����ʧ�ܣ�\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-4>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*��������ҳ��>" 
    end
    
    local master = player
    local master_name = lualib:Player_GetStrProp(master, lua_role_user_name)

    lualib:SysMsg_SendCenterMsg(1, apprentice_name.." �� "..master_name.."���ʦ��!", "")
    remove_apprentice(master, apprentice)
    lualib:ScriptFuncToPlayer(apprentice_name, "ʦͽ", "on_master_drop_apprentice", master.."#"..master_name)

    return ""
end

function on_master_drop_apprentice(player, master, master_name)
    local cur_master_name = get_master_name(player)
    if cur_master_name == master_name then
        set_master_name(player, "")
    end
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function ShowMaster(npc, player)
    local master_name = get_master_name(player)
    if master_name == "" then
        return "��û��ʦ��".."\n \n \n \n \n \n                                         #OFFSET<X:0,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuaa *01*�����ء�>"
    end
    
    return master_name
end

function ShowApprentice(npc, player)
    if get_apprentice_num(player) <= 0 then
        return "��û��ͽ��".."\n \n \n \n \n \n                                         #OFFSET<X:0,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuaa *01*�����ء�>"
    end

    local app_t = get_apprentices(player)
    msg = "ͽ���б�\n"
    
    for k, v in pairs(app_t) do
        msg = msg.."<@ShowApprenticeOne *01*"..v..">\n"
    end

    return msg
end

function ShowApprenticeOne(npc, player)
    return ""
end

function DestroyData(npc, player)
    set_master_name(player, "")
    lualib:Player_SetCustomVarStr(player, "apprentices", "")
    set_last_master_name(player, "")
    
    set_shengwang(player, 0)
    set_chushi(player, 0)
    set_master_reward_count(player, 0)
    set_apprentice_reward(player, 0)
        
    return "ʦͽ��������ɹ�"
end

--------1019��

function QuestAccomplish1019(npc, player)
    msg = "�������45�����£�����ѡ���ʦ��������Ѿ��ﵽ45��������ѡ����ͽ����һ��ʦ�������԰����Լ�������˽�������硣����ͽ���������Լ���ô���������ֵ������ֵ������������һ�ѫ�£�����Ҫ��ʦ��������ͽ�أ�\n \n"
    msg = msg.."#IMAGE1902700017# <@Accomplish1019 *01* ��ʦ��ͽ������Ⱥô����ҿ���һ��>\n"
    return msg
end


function Accomplish1019(npc, player)
    if lualib:AccomplishQuest(player, 1019, 0) == true then
        msg = "���ˣ���λ�˲�������˿���һ�ҽ����У���˵����ί�����н��ף�ȥ�����ɣ�\n \n"
		msg = msg.."#IMAGE1902700017# <@Accept1020 *01* ȥ�Ҽ�������>\n"
		return msg
    else
        msg = "����ʧ��\n \n"
		msg = msg.."<@Lever *01*��֪����>\n"
		return msg
    end
end

-------1020��
function QuestAccept1020(npc,player)
    msg = "���ˣ���λ�˲�������˿���һ�ҽ����У���˵����ί�����н��ף�ȥ�����ɣ�\n \n"
	msg = msg.."#IMAGE1902700017# <@Accept1020 *01* �����ȥ>\n"
	return msg
end

function Accept1020(npc, player)
    if lualib:AcceptQuest(player, 1020) == true then
        return "��#COLORCOLOR_GREENG# #NPCLINK<STR:��������,NPCID:1022>##COLOREND#�Ի��˽����ϵͳ��"
    else
        return "�����ȡʧ��"
    end
end

function likai(npc, player)
	return""
end