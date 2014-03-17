local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/marry")


function main(player, item)

	local require_distance = 7
    local spouse = lualib:GetStr(player, "配偶GUID")
	local distance = lualib:Distance(player, spouse)

	if spouse == "" then
		lualib:SysMsg_SendWarnMsg(player, "你没有结婚，无法使用同心疗伤药！")
		return false
	end

	local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
	local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
	local min_intimacy = math.min(intimacy, spouse_intimacy)

	if distance <= require_distance then
		lualib:AddBuff(player, "同心疗伤药", 5)
		lualib:AddBuff(spouse, "同心疗伤药", 5)
		if min_intimacy >= 19999 then
			lualib:AddBuff(player, "同心疗伤药19999", 60)
			lualib:AddBuff(spouse, "同心疗伤药19999", 60)
		elseif min_intimacy >= 9999 then
			lualib:AddBuff(player, "同心疗伤药9999", 60)
			lualib:AddBuff(spouse, "同心疗伤药9999", 60)
		elseif min_intimacy >= 5202 then
			lualib:AddBuff(player, "同心疗伤药5202", 60)
			lualib:AddBuff(spouse, "同心疗伤药5202", 60)
		elseif min_intimacy >= 1314 then
			lualib:AddBuff(player, "同心疗伤药1314", 60)
			lualib:AddBuff(spouse, "同心疗伤药1314", 60)
		elseif min_intimacy >= 520  then
			lualib:AddBuff(player, "同心疗伤药520", 60)
			lualib:AddBuff(spouse, "同心疗伤药520", 60)
			--lualib:SysMsg_SendWarnMsg(player, "最小亲密度" .. min_intimacy)
		elseif min_intimacy >= 188  then
			lualib:AddBuff(player, "同心疗伤药188", 60)
			lualib:AddBuff(spouse, "同心疗伤药188", 60)
		else
			lualib:AddBuff(player, "同心疗伤药0", 60)
			lualib:AddBuff(spouse, "同心疗伤药0", 60)
		end
 
		return true
	else
		lualib:SysMsg_SendWarnMsg(player, "a你的配偶离你距离过远，无法使用同心疗伤药！")
		return false
	end


end


