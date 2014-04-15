local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
local killer = ""

function on_create(npc)
	killer = lualib:GetTempStr(npc, "killer")
end


--Map_GetRegionPlayersEx
function main(npc, player)
	local max_level = lualib:GetTempInt(killer, "max_lv")
	local add_ext = lualib:GetTempInt(killer, "add_exp")
    local msg = "���вȵ������Ʒô����ô������˼���������ˡ�\n"
    msg = msg.."����������Ի�ÿ����飬������𻹿��Լ���ȼ��#COLORCOLOR_YELLOW#" .. lualib:GetTempInt(killer, "GH") .. "��#COLOREND#\n"
    msg = msg.."���������Ҫ���վ������#COLORCOLOR_RED#2������#COLOREND#\n"
    msg = msg.."����Ʒ�ʣ�������֧��#COLORCOLOR_BROWN#" .. max_level .. "������#COLOREND#��ҿ���þ��顣\n"
    msg = msg.."�����飺������ÿ���ṩ#COLORCOLOR_GOLD#" .. add_ext .. "�㾭��#COLOREND#����Χ������������ҡ�\n\n"
    msg = msg.."#COLORCOLOR_RED#�������𣺽�������������Ի�ö౶�����顣#COLOREND#\n"
    msg = msg.."#COLORCOLOR_YELLOW#Ů���� - ˫������  ����Ů���� - ��������  ʮ��Ů����- �ı�����#COLOREND#\n"
    msg = msg.."Ů���죺��С�������Թ���õ�Ů���죬����Ů������Ҫ���̳��й���\n"
    return msg
end

