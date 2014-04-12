local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("form/װ�������")

function main(npc, player)
	local msg = "���������ʹ�ú�����ʯ�����������������죬����ʱ����Ĳ��Ͼ��������������ɹ���ʧ�ܣ����ʧ�����������飬��Ҫ�����ɹ����ʵĲ��ϣ�������ʯ�������������ɷ�����������������������\n\n"
	msg = msg .. "<@forge  *01*װ������>\n"
	msg = msg .. "<@get_back  *01*ȡ��װ��>\n"
	msg = msg .. "<@leave  *01*�뿪>\n"
	return msg
end

function forge(npc, player)
	showforge(player)	
	return ""
end

function get_back(npc, player)
	if lualib:GetInt(player, "forge_flag") ~= 1 then
		return "û�����װ��!"
	end
	
	local t = lualib:GetInt(player, "forge_time")
	if t > lualib:GetAllTime() then
		local ts = t - lualib:GetAllTime()
		local minutes, seconds = 0, 0
		local time_str = ""
		if ts > 60 then
			minutes = math.floor(ts / 60)
			time_str = minutes.."��"
		end
		seconds = ts - minutes * 60
		time_str = time_str..seconds.."��"
		return "���װ�����ڶ�����, ��#COLORCOLOR_GREENG#"..time_str.."#COLOREND#��������ȡ!"
	end
	
	local weapon_forged = lualib:GetStr(player, "weapon_forged")
	local weapon_new = lualib:Json2Item(player, weapon_forged)
	if weapon_new == "" then
		return "���߸���ʧ��, ��������!"
	end
	
	local atklx = lualib:GetInt(player, "forge_atklx")
	local purity = lualib:GetInt(player, "forge_purity")
	
	lualib:SetInt(player, "forge_phyatk", 0)
	lualib:SetInt(player, "forge_magatk", 0)
	lualib:SetInt(player, "forge_taoatk", 0)
	lualib:SetInt(player, "forge_purity", 0)
	
	if atklx == 0 or purity == 0 then
		return "���ź�, ����ʧ����, ��ӭ�´ι���!"
	end
	
	local name = lualib:Name(weapon_new)
	lualib:SetInt(weapon_new, "forge_level", lualib:GetInt(player, "forge_level") + 1)
	lualib:SetInt(weapon_new, "try_the_first", 1)

	lualib:SetInt(weapon_new, "forge_atklx", atklx)
	lualib:SetInt(weapon_new, "forge_purity", purity)
	lualib:Item_ChangeName(player, weapon_new, name.."*")
	lualib:SetInt(player, "forge_flag", 0)
	lualib:AddTrigger(player, lua_trigger_post_equip, "on_post_equip")
	lualib:AddTrigger(player, lua_trigger_post_un_equip, "on_post_un_equip")
	return "����ɹ�, ������Ե�!"
end

function on_post_equip(player, item)
	lualib:AddTimerEx(player, 9360, 1000, 1, "on_post_equip_ex", item)
end

function on_post_equip_ex(player, time_id, item)
	if lualib:GetInt(item, "try_the_first") == 1 then
		lualib:AddTrigger(player, lua_trigger_spell, "try_the_first")
	end
end

function on_post_un_equip(player, item)
	if lualib:GetInt(item, "try_the_first") == 1 then
		lualib:RemoveTrigger(player, lua_trigger_spell, "try_the_first")
	end
end

function try_the_first(player, skill_id, skill_key)
	skill_id = tonumber(skill_id)
	if  skill_key == "��ͨ������" then
		local weapon = lualib:Player_GetItemGuid(player, lua_site_weapon)
		if lualib:GetInt(weapon, "try_the_first") == 1 then
			local forge_level = lualib:GetInt(weapon, "forge_level")
			local forge_purity = lualib:GetInt(weapon, "forge_purity")
			local rand = lualib:GenRandom(1, 10000)
			if rand > forge_purity then
				lualib:SysMsg_SendPromptMsg(player, "���ź�, ���"..string.sub(lualib:Name(weapon), 1, -2).."����ʧ��!")
				lualib:Item_Destroy(player, weapon, "ɾ������: �Ե���װ��", player)
			else
				local forge_atklx = lualib:GetInt(weapon, "forge_atklx")
				
				local dura = lualib:Item_GetMaxDurability(player, weapon)
				local dura_ex = forge_purity - dura / 2000
				
				lualib:Item_SetMaxDurability(player, weapon, dura + dura_ex * 100)
				
				local req = true
				local forge_atkatt = {10, 12, 14}
				local atts = {}
				
				for i = 1, 6 do 
					atts[i] = lualib:Equip_GetQualProp(player, weapon, i - 1)
					if atts[i][0] ~= 0 then
						if forge_atkatt[forge_atklx] == atts[i][0] then
							lualib:Equip_SetQualProp(player, weapon, i - 1, atts[i][0], atts[i][1] + 1)
							req = false
						end
					end
				end
				
				if req == true then
					for i = 1, 6 do 
						if atts[i][0] == 0 then
							lualib:Equip_SetQualProp(player, weapon, i - 1, forge_atkatt[forge_atklx], 1)
							break
						end
					end
				end
				
				local name = lualib:Name(weapon)
				name = string.sub(name, 1, -2)
				local new_name = name
				
				if forge_level == 1 then
					new_name = new_name.."Lv.1"
				else
					new_name = string.gsub(new_name, "Lv.%d", "Lv."..forge_level)
				end
				
				lualib:Item_ChangeName(player, weapon, new_name)
				lualib:Item_NotifyUpdate(player, weapon)
				
				lualib:SetInt(weapon, "try_the_first", 0)
				
				lualib:SysMsg_SendCenterMsg(1, "��ϲ��ҡ�"..lualib:Name(player).."����["..name.."]�ɹ�������["..new_name.."]!", "")
			end
			lualib:RemoveTrigger(player, lua_trigger_spell, "try_the_first")
		end
	end
	return true
end

function leave(npc, player)
	return ""
end