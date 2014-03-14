local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/marry")


local yanhua_table = {["烟花"] = 1,
					  ["玫瑰花"] = 2,
					  ["9朵玫瑰花"] = 3,
					  ["99朵玫瑰花"] = 4,
					  ["999朵玫瑰花"] = 5,
						}

function main(player, item)
	local item_K = lualib:KeyName(item)--道具索引名
	local p_name = lualib:KeyName(player)--玩家名称
	local p_map = lualib:Name(lualib:MapGuid(player))--玩家所在地图名称
	for k, v in pairs(yanhua_table) do
		if item_K == k then
			if v ==1 then
				yanhua(player, item, item_K, p_name, p_map)
			elseif  v ==2 then
				meiguihua(player, item, item_K, p_name, p_map)
			elseif v ==3 then
				meiguihua9(player, item, item_K, p_name, p_map)
			elseif v ==4 then
				meiguihua99(player, item, item_K, p_name, p_map)
			elseif v ==5 then
				meiguihua999(player, item, item_K, p_name, p_map)
			end
			return true
		end
	end
	print("XX")
	return true
end

---烟花
function yanhua(player, item, item_K, p_name, p_map)
	local s = "玩家【"..p_name.."】在"..p_map.."使用了"..item_K.."!"
	lualib:RunClientScript(player, "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
	lualib:SysMsg_SendTopMsg(1, s)
	lualib:AddTimerEx(player, 5, 5000, 12, "yanhuajingyan", item)
	lualib:DelItem(player, item_K, 1, 2, "烟花", "烟花")
end

function yanhuajingyan(player, id, item)
	local m_guid = lualib:MapGuid(player)--玩家所在地图GUID
	local m_x = lualib:X(player)--玩家所在X坐标
	local m_y = lualib:Y(player)--玩家所在Y坐标
	local p_Name = lualib:Name(player)--玩家名称
	local p_player =  lualib:Map_GetRegionPlayers(m_guid, m_x, m_y, 5, false)

	if toName == p_Name then
		lualib:SysMsg_SendTriggerMsg(player, "不能对自己使用!")
		return false
	end

	if p_player ~= nil and table.getn(p_player) > 0 then
		for i = 1,table.getn(p_player) do
			lualib:Player_AddExp(p_player[i], 3000, "烟花", p_Name)
		end
	end

	return true
end


--玫瑰花
function meiguihua(player, item, item_K, p_name, p_map)
	lualib:SysMsg_SendInputDlg(player, 3, "请输入所要赠送的玩家昵称", 45, 14, "meiguihuazhixing", item.."#"..item_K)
end

function meiguihuazhixing(id, player, toName, param)
	local p_Name = lualib:Name(player)
	local params = lualib:StrSplit(param, "#")--分割参数为一个table
	local item = params[1]
	local item_K = params[2]
	local target_Guid = lualib:Name2Guid(toName)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")


	if toName == p_Name then
		lualib:SysMsg_SendTriggerMsg(player, "不能对自己使用!")
		return false
	end

	if target_Guid == "" then
		lualib:SysMsg_SendTriggerMsg(player, "目标玩家不在线或不存在，无法赠送!")
		return false
	else
		lualib:RunClientScript(player, "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
		lualib:RunClientScript(target_Guid, "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
	end
	lualib:DelItem(player, item_K, 1, 2, "玫瑰花", "玫瑰花")
	local s = "玩家【"..p_Name.."】向"..toName.."赠送了"..item_K.."!"
	lualib:SysMsg_SendCenterMsg(1, s, "")

	if spouse ~= "" then
		local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
		local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
			if target_Guid == spouse then --如果双方为配偶，则增加1点亲密度
				add_intimacy(player, 1)
				lualib:SysMsg_SendTriggerMsg(player, "你与你的配偶获得了1点亲密度【当前亲密度为："..intimacy.."】")
				add_intimacy(spouse, 1)
				lualib:SysMsg_SendTriggerMsg(spouse, "你与你的配偶获得了1点亲密度【当前亲密度为："..spouse_intimacy.."】")
			end
	end



	return true
end

--9朵玫瑰花
function meiguihua9(player, item, item_K, p_name, p_map)
	lualib:SysMsg_SendInputDlg(player, 4, "请输入所要赠送的玩家昵称", 45, 14, "meigui9zhixing", item.."#"..item_K)
end

function meigui9zhixing(id, player, toName, param)
	local p_Name = lualib:Name(player)
	local params = lualib:StrSplit(param, "#")
	local item = params[1]
	local item_K = params[2]
	local target_Guid = lualib:Name2Guid(toName)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")

	if toName == p_Name then
		lualib:SysMsg_SendTriggerMsg(player, "不能对自己使用!")
		return false
	end

	if target_Guid == "" then
		lualib:SysMsg_SendTriggerMsg(player, "目标玩家不在线或不存在，无法赠送!")
		return false
	else
		lualib:RunClientScript("0", "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
	end
	lualib:DelItem(player, item_K, 1, 2, "9玫瑰花", "9玫瑰花")
	local s = "玩家【"..p_Name.."】向"..toName.."赠送了"..item_K.."!"
	lualib:SysMsg_SendCenterMsg(1, s, "")

	if spouse ~= "" then
		local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
		local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
			if target_Guid == spouse then --如果双方为配偶，则增加1点亲密度
				add_intimacy(player, 9)
				lualib:SysMsg_SendTriggerMsg(player, "你与你的配偶获得了9点亲密度【当前亲密度为："..intimacy.."】")
				add_intimacy(spouse, 9)
				lualib:SysMsg_SendTriggerMsg(spouse, "你与你的配偶获得了9点亲密度【当前亲密度为："..spouse_intimacy.."】")
			end
	end

	return true
end


--99朵玫瑰花
function meiguihua99(player, item, item_K, p_name, p_map)
	lualib:SysMsg_SendInputDlg(player, 5, "请输入所要赠送的玩家昵称", 45, 14, "meigui99zhixing", item.."#"..item_K)
end

function meigui99zhixing(id, player, toName, param)
	local p_Name = lualib:Name(player)
	local params = lualib:StrSplit(param, "#")
	local item = params[1]
	local item_K = params[2]
	local target_Guid = lualib:Name2Guid(toName)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")

	if toName == p_Name then
		lualib:SysMsg_SendTriggerMsg(player, "不能对自己使用!")
		return false
	end

	if target_Guid == "" then
		lualib:SysMsg_SendTriggerMsg(player, "目标玩家不在线或不存在，无法赠送!")
		return false
	else
		lualib:RunClientScript("0", "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
	end
	lualib:DelItem(player, item_K, 1, 2, "99玫瑰花", "99玫瑰花")
	local s = "玩家【"..p_Name.."】向"..toName.."赠送了"..item_K.."!"
	lualib:SysMsg_SendCenterMsg(1, s, "")

	if spouse ~= "" then
		local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
		local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
			if target_Guid == spouse then --如果双方为配偶，则增加1点亲密度
				add_intimacy(player, 99)
				lualib:SysMsg_SendTriggerMsg(player, "你与你的配偶获得了99点亲密度【当前亲密度为："..intimacy.."】")
				add_intimacy(spouse, 99)
				lualib:SysMsg_SendTriggerMsg(spouse, "你与你的配偶获得了99点亲密度【当前亲密度为："..spouse_intimacy.."】")
			end
	end

	return true
end

--999朵玫瑰花
function meiguihua999(player, item, item_K, p_name, p_map)
	lualib:SysMsg_SendInputDlg(player, 6, "请输入所要赠送的玩家昵称", 45, 14, "meigui999zhixing", item.."#"..item_K)
end

function meigui999zhixing(id, player, toName, param)
	local p_Name = lualib:Name(player)
	local params = lualib:StrSplit(param, "#")
	local item = params[1]
	local item_K = params[2]
	local target_Guid = lualib:Name2Guid(toName)
    local spouse = lualib:Player_GetCustomVarStr(player, "配偶GUID")

	if toName == p_Name then
		lualib:SysMsg_SendTriggerMsg(player, "不能对自己使用!")
		return false
	end

	if target_Guid == "" then
		lualib:SysMsg_SendTriggerMsg(player, "目标玩家不在线或不存在，无法赠送!")
		return false
	else
		lualib:RunClientScript("0", "ItemEffect","yanhua", ""..yanhua_table[item_K].."")
	end
	lualib:DelItem(player, item_K, 1, 2, "999玫瑰花", "999玫瑰花")
	local s = "玩家【"..p_Name.."】向"..toName.."赠送了"..item_K.."!"
	lualib:SysMsg_SendCenterMsg(1, s, "")

	if spouse ~= "" then
		local intimacy=lualib:Player_GetCustomVarInt(player, "intimacy")
		local spouse_intimacy=lualib:Player_GetCustomVarInt(spouse, "intimacy")
			if target_Guid == spouse then --如果双方为配偶，则增加1点亲密度
				add_intimacy(player, 999)
				lualib:SysMsg_SendTriggerMsg(player, "你与你的配偶获得了999点亲密度【当前亲密度为："..intimacy.."】")
				add_intimacy(spouse, 999)
				lualib:SysMsg_SendTriggerMsg(spouse, "你与你的配偶获得了999点亲密度【当前亲密度为："..spouse_intimacy.."】")
			end
	end

	return true
end


