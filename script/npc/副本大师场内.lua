local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("include/��Ϣ��ʾ")


function on_create(npc)
	lualib:AddTimer(npc, 1, 500, 1, "on_timer")
	lualib:AddTimer(npc, 2, 1000*60*29, 1, "over_msg")
end


function over_msg(npc,timer_id)
		lualib:SysMsg_SendRoleTalk(npc, "��������ʣ�����һ������սʱ�䣬��ץ��ʱ����ս���콱�����������޷�������ս�����")
end

function on_timer(npc, timer_id)
	
	lualib:SetStr(npc,"start_time",lualib:Now())

end


local ranges = {1, 0, 0, 100, 100}
local limit_level = {0,0,0,0,0,0,0,0,48,52,55,58,0}

function main(npc,player)
    local map = lualib:MapGuid(npc)
    local monsters = lualib:Map_GetRegionMonstersEx(map, "", ranges, true, true)
    local msg = ""
          msg = msg .. "ע�⣺����������30���ӣ�30���Ӻ��������û����ս�����ô������ǿ���ͻ����ǰ�ȫ����\n"
          msg = msg .. "��ʼʱ�䣺"..lualib:GetStr(npc,"start_time").."\n"
          msg = msg .. "��ǰʱ�䣺"..lualib:Now().."\n"
          msg = msg .. "����������12�أ�ÿ���������й�������[�콱��������ս��һ��]��ÿ3�ػ����һֻBOSS��\n\n"


--code ��¼�����������սʱ��¼
          if #monsters > 0 then
                msg = msg .. "��ǰ�ؿ�����"..lualib:GetInt(map,"code").."��\n"
                msg = msg .."����û��������ϣ���ӰѾ���\n"
          else
			local next_floor = lualib:GetInt(map,"code") + 1
			if lualib:Level(player) < limit_level[next_floor] then
                msg = msg .. "�ȼ�����������������һ����Ҫ" .. limit_level[next_floor] .. "��\n"
				return msg
			end
             if lualib:GetInt(map,"code") < 1 then
                msg = msg .. "<@start *01*[���ڿ�ʼ��ս]>\n"
             else
                msg = msg .. "��ǰ�ؿ�����"..lualib:GetInt(map,"code").."��\n"
                if lualib:GetInt(map,"code") < 12 then
                   msg = msg .. "<@start *01*[�콱��������ս��һ��]>\n"
                else
                   msg = msg .. "<@start *01*[�콱����������]>\n"
                end
             end
          end

    return msg
end

local awardexp = {
	["�Ž�������"] = {10000,20000,30000,40000,50000,60000,70000,80000,90000,100000,110000,120000},
	["��н���"] = {"", "", "", "", "", "", "", "", "�����������", "�����������", "ħ���������", "����������"},
}




local mon = {
["�Ž�������"] = {
{{"ʬ��1",5},{"��ʬ1",5},{"��ʬ1",5},{"��ڤʬ��",1}},   
{{"����๤1",5},{"ʬū1",5},{"ʬū��ͷ1",5},{"����ʬū1",1}},
{{"��ū1",5},{"�Źֵ���1",5},{"�޶�",5},{"��Ӣ���浶��1",1}},
{{"Ӱ��1",3},{"��ԭ��ʿ1",3},{"��ԭ��ʿ1",3},{"����Ӱ��1",2},{"������ԭ��ʿ1",2}},
{{"��ħū��1",3},{"��ħ����1",3},{"��ħ����1",3},{"��Ӣ��ħ����1",2},{"��Ӣ��ħ����1",2}},    
{{"ʯ����1",5},{"������1",5},{"������1",5},{"��ħ����1",2}},
{{"��ǯз1",5},{"�ؾ�����1",5},{"�ؾ�����1",5},{"��ħ�̴�1",2}},
{{"���׵���Ѫ��1",5},{"���׶�ʿ1",5},{"���׼���1",5},{"���׻���1",1}},
{{"��ħū��1",3},{"��ħ����1",3},{"��ħ����1",3},{"��Ӣ��ħ����1",2},{"��Ӣ��ħ����1",2},{"���׵���Ѫ��1",5},{"���׶�ʿ1",5},{"���׼���1",5},{"���׻���1",1}},
{{"����ͳ��",1},{"���׶�ʿ1",2},{"���׼���1",2}},
{{"ħ��ͳ˧",1},{"��ħū��1",3}},
{{"��Ѫ����",1}},    },
}

function start(npc,player)
    local map = lualib:MapGuid(npc)
    local key = lualib:KeyName(map)
    local monsters = lualib:Map_GetRegionMonstersEx(map, "", ranges, true, true)
    if #monsters > 0 then
       return "����û��������ϣ���ӰѾ���\n"
    end
    if lualib:GetInt(npc,"over") ~= 0 then
       return "�������Ѿ���ɣ��뷵�����ǡ�"
    end
    local code = lualib:GetInt(map,"code")
    if code >= 1 and lualib:GetInt(npc,"over") == 0 then
       lualib:AddExp(player,awardexp[key][code],"��������",player)
	   if awardexp["��н���"][code] ~= "" then
		lualib:AddItem(player, awardexp["��н���"][code],1,false,"��н���", player)
			lualib:SysMsg_SendTriggerMsg(player, "���콱����ͨ��["..key.."]��"..code.."�أ���ã�".. awardexp["��н���"][code])
			lualib:SysMsg_SendCenterMsg(1, "��ϲ [".. lualib:Name(player) .."] �ڹŽ�������á�".. awardexp["��н���"][code].."��","")
		end
       Player_ShowMsg(player, "���콱����ͨ��["..key.."]��"..code.."�أ���þ��飺"..awardexp[key][code], "YELLOW")
    end
    if lualib:GetInt(map,"code") >= 12 then
        lualib:SetInt(npc,"over",1)
	lualib:Player_MapMoveXY(player,"����", 238, 230, 3)
        Player_ShowMsg(player, "������������ϲ���Ѿ��ɹ����һ��["..key.."]", "YELLOW")
       return ""
    end
    --ˢ�����
    local num = code + 1
    for i = 1 , #mon[key][num] do
        lualib:Map_BatchGenCampMonster(map, mon[key][num][i][1], mon[key][num][i][2], false, 2)
    end
    lualib:SetInt(map,"code",lualib:GetInt(map,"code")+1)
    return ""
end