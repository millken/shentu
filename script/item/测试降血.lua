--���Խ�Ѫ��ʹ��ͼ���й���Ѫ��Ϊ1
local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function main(player, item)
		local mapguid = lualib:MapGuid(player)
		local ranges = {1, 0, 0, 200, 200}
		local monsters = lualib:Map_GetRegionMonstersEx(mapguid, "", ranges, true, true)
		for i = 1, #monsters do 
			lualib:SetHp(monsters[i], 1, false)
		end
		lualib:SysMsg_SendWarnMsg(player, "���Խ�Ѫ��ʹ������ڵ�ͼ����Ѫ��Ϊ1")
		return false

end


