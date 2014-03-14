local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/marry")


function main(player, item)

	local require_distance = 7
    local spouse = lualib:GetStr(player, "��żGUID")
	local distance = lualib:Distance(player, spouse)

	if spouse == "" then
		lualib:SysMsg_SendWarnMsg(player, "��û�н�飬�޷�ʹ��ͬ������ҩ��")
		return false
	end

	local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
	local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
	local min_intimacy = math.min(intimacy, spouse_intimacy)

	if distance <= require_distance then
		lualib:AddBuff(player, "ͬ������ҩ", 2)
		lualib:AddBuff(spouse, "ͬ������ҩ", 2)
		if min_intimacy >= 131420 then
		elseif min_intimacy >= 9999 then
		elseif min_intimacy >= 1314 then
		elseif min_intimacy >= 520  then
		elseif min_intimacy >= 188  then
		end
 
		return true
	else
		lualib:SysMsg_SendWarnMsg(player, "�����ż��������Զ���޷�ʹ��ͬ������ҩ��")
		return false
	end


end


