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
		lualib:AddBuff(player, "ͬ������ҩ", 5)
		lualib:AddBuff(spouse, "ͬ������ҩ", 5)
		if min_intimacy >= 19999 then
			lualib:AddBuff(player, "ͬ������ҩ19999", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ19999", 60)
		elseif min_intimacy >= 9999 then
			lualib:AddBuff(player, "ͬ������ҩ9999", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ9999", 60)
		elseif min_intimacy >= 5202 then
			lualib:AddBuff(player, "ͬ������ҩ5202", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ5202", 60)
		elseif min_intimacy >= 1314 then
			lualib:AddBuff(player, "ͬ������ҩ1314", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ1314", 60)
		elseif min_intimacy >= 520  then
			lualib:AddBuff(player, "ͬ������ҩ520", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ520", 60)
			--lualib:SysMsg_SendWarnMsg(player, "��С���ܶ�" .. min_intimacy)
		elseif min_intimacy >= 188  then
			lualib:AddBuff(player, "ͬ������ҩ188", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ188", 60)
		else
			lualib:AddBuff(player, "ͬ������ҩ0", 60)
			lualib:AddBuff(spouse, "ͬ������ҩ0", 60)
		end
 
		return true
	else
		lualib:SysMsg_SendWarnMsg(player, "a�����ż��������Զ���޷�ʹ��ͬ������ҩ��")
		return false
	end


end


