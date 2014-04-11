local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

-- 地图黑名单keyname（黑名单内的地图不能被传送）
local map_hei =
{
	"将军冢密室", 
	"天荒古阵", 
	"第三重天秘洞", 
	"天下第一战场", 
	"漂流岛", 
	"初级试炼场", 
	"中级试炼场", 
	"高级试炼场", 
	"克星挑战场1", 
	"克星挑战场2", 
	"克星挑战场3", 
	"引灵寺", 
	"亡灵禁地", 
	"玉完天幻境", 
	"封魔阵", 
	"古墓", 
	"夺宝大厅", 
	"地下城", 
	"武斗场", 
	"灵韵阁", 
	"封魔台", 
	"镇魔殿",
	"烈焰深渊1", 
	"烈焰深渊2",
	"烈焰深渊3",
	"千幻阵",
	"休息室",
	"擂台",
	"秘海封印",
	"超级试炼场",
	"海角秘境",
	"精英竞技场-群雄逐鹿",
	"精英竞技场-16进8",
	"精英竞技场-8进4",
	"精英竞技场-4进2",
	"精英竞技场-季军赛",
	"精英竞技场-冠亚军赛",
	"精英竞技场-休息间",
	"精英竞技场-组队赛",
	"挑战场1",
	"挑战场2",
	"挑战场3",
	"富商的藏金屋",
	"任务临时副本",
	"废弃矿洞4",
	"废弃矿洞5",
	"废弃矿洞6",
	"将军冢3",
	"将军冢boss",
	"妖山暗穴5",
	"妖山暗穴6",
	"妖山暗穴7",
	"妖山暗穴8",
	"妖山暗穴boss",
	"邪庙6-1",
	"邪庙6-2",
	"邪庙6-3",
	"邪庙6-4",
	"邪庙6-5",
	"邪庙6-6",
	"邪庙6-7",
	"邪庙6-8",
	"邪庙6-9",
	"邪庙6-10",
	"邪庙6-11",
	"邪庙6-12",
	"邪庙6-13",
	"邪庙6-14",
	"邪庙6-15",
	"邪庙6-16",
	"邪庙7-1",
	"邪庙7-2",
	"邪庙7-3",
	"邪庙boss",
	"天荒阵6",
	"天荒阵7-1",
	"天荒阵7-2",
	"天荒阵7-3",
	"天荒阵7-4",
	"天荒阵7-5",
	"天荒阵7-6",
	"天荒阵7-7",
	"天荒阵7-8",
	"天荒阵7-9",
	"天荒阵boss",
	"绝路城3",
	"绝路城boss",
	"天魔石窟3",
	"天魔石窟4",
	"天魔石窟boss",
	"海底2",
	"海底3",
	"海底3野外",
	"海底4",
	"海底4野外",
	"海底5",
	"海底1船舱1",
	"海底1船舱2",
	"海底1船舱3",
	"海底1船舱4",
	"海底1船舱5",
	"海底1船舱6",
	"海底1船舱7",
	"海底2船舱1",
	"海底2船舱2",
	"海底2船舱3",
	"海底2船舱4",
	"海底2船舱5",
	"海底2船舱6",
	"海底3船舱1",
	"海底4船舱1",
	"海底4船舱2",
	"镇魔禁地10",
	"镇魔禁地11",
	"镇魔禁地12",
	"镇魔大殿",
	"镇魔秘道1",
	"镇魔秘道2",
	"神歌城皇宫",
	"神歌城",
	"神歌城密道",
	"尸王大殿",
	"锁魔宫",
	"灵山",
	"修炼场",
	"藏经楼",
	"异兽栏",
	"珍宝洞",
	"百草堂",
	"木人巷",
	"木人巷2",
	"木人巷3",
	"灵元秘境1",
	"灵元秘境2",
	"灵元秘境3",
	"赤炎部落入口",
	"赤炎部落1",
	"赤炎部落2",
	"赤炎部落3",
	"赤炎禁地",

}

function main(player, item)
	local player_name = lualib:Name(player)
	local Family_team = lualib:GetFamilyMembers(player, true)

	local msg = "#OFFSET<X:80,Y:-0>##COLORCOLOR_BROWN#[行会召集令]#COLOREND#\n"
	msg = msg .. "#OFFSET<X:-20,Y:-20>##IMAGE<ID:1989905000>#\n"
	msg = msg .."#OFFSET<X:70,Y:-25>##COLORCOLOR_RED#→→小蜜\n \n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:-10>##COLORCOLOR_YELLOW#嗨~亲爱的[#COLORCOLOR_GREENG#"..player_name.."#COLOREND##COLORCOLOR_YELLOW#],请你听我说：\n#COLOREND#"
	msg = msg .."#OFFSET<X:5,Y:0>##COLORCOLOR_BROWN#━━━━━━━━━━━━━━━━#COLOREND#\n"
	msg = msg .. "#IMAGE<ID:1902700033>##COLORCOLOR_BROWN#点击#IMAGE<ID:1902700015>#可将行会成员拉到自己身旁#COLOREND#\n#OFFSET<X:0,Y:5>#"  
	--msg = msg .. "#IMAGE<ID:1902700033>##COLORCOLOR_BROWN#每拉一个人需要消耗两万金币#COLOREND#\n#OFFSET<X:0,Y:5>#"  
    msg = msg .. "#OFFSET<X:88,Y:0>##IMAGE<ID:1900010084>#"
	msg = msg .. "#OFFSET<X:-47,Y:-5>#<@chuansong_confirm".."#"..item.."  *01* 全部传>\n \n"
	for k, v in pairs(Family_team) do
		local Family_name = lualib:Name(v)
		local map_name = lualib:Name(lualib:MapGuid(v))
		msg = msg .. "#IMAGE<ID:1902700015>#".."#OFFSET<X:-22,Y:-1>#<@chuansong".."#"..Family_name.."#"..v.."#"..item.."#"..map_name.. " *01* 传>".."→#COLORCOLOR_GREENG#["..Family_name.."]#COLOREND# 在["..map_name.."]\n"
	end
	
	lualib:NPCTalkDetail(player, msg, 265, 550)
	return true
end

function chuansong(player, Family_name, v, item, map_name)
	local playername = lualib:Name(player)
	local map_keyname = lualib:KeyName(lualib:MapGuid(v))
	local mapself_keyname = lualib:KeyName(lualib:MapGuid(player))
	local mapself_name = lualib:Name(lualib:MapGuid(player))
	local itemname	= lualib:Name(item)
	local itemkeyname = lualib:KeyName(item)

	local gold = 20000
	local map = lualib:MapGuid(player)
	local x = tonumber(lualib:X(player))
	local y = tonumber(lualib:Y(player))

	
	
	if playername == Family_name then
		lualib:SysTriggerMsg(player, "不能传送到自己身边！")
		return ""
	end
	
	if lualib:Player_IsGoldEnough(player, gold, false) == false then
		lualib:SysTriggerMsg(player, "金币不足，不能召集！")
		return ""
	end
	
	lualib:Player_SubGold(player, gold, false, "行会召集非绑消耗", player)
	
	for i = 1, #map_hei do
		if mapself_keyname == map_hei[i] then
			lualib:SysTriggerMsg(player, "你所在的["..mapself_name.."]地图被禁止召集！")
			return ""
		end
	end
	
	lualib:RunClientScript(map, "mapeffect", "texiao", "100001261#"..x.."#"..y.."#0#0")
	
	lualib:SysMsg_SendMsgDlg(v, 201404112224, "→→ #COLORCOLOR_RED#" .. playername .. "#COLOREND# 大喊到：#COLORCOLOR_YELLOW#一支穿云箭，千军万马来相见。#COLOREND#\n10秒后失效。\n \n#BUTTON1#我要去#BUTTONEND#                       #BUTTON0#我不去#BUTTONEND#", 10, "MoveConfirm", playername)
	
	return ""
end

function chuansong_confirm(player, item)
	local Family_team = lualib:GetFamilyMembers(player, true)
	local playername = lualib:Name(player)
	local mapself_keyname = lualib:KeyName(lualib:MapGuid(player))
	local mapself_name = lualib:Name(lualib:MapGuid(player))
	local itemname	= lualib:Name(item)
	local itemkeyname = lualib:KeyName(item)
	
	local gold = 20000
	local num = #Family_team - 1
	local gold_all = tonumber(num) * gold
	local map = lualib:MapGuid(player)
	local x = tonumber(lualib:X(player)) + 1
	local y = tonumber(lualib:Y(player)) - 1


	
	
	if playername == Family_name then
		lualib:SysTriggerMsg(player, "不能传送到自己身边！")
		return ""
	end
	
	for i = 1, #map_hei do
		if mapself_keyname == map_hei[i] then
			lualib:SysTriggerMsg(player, "你所在的["..mapself_name.."]地图被禁止召集！")
			return ""
		end
	end
	--[[
	if lualib:Player_IsGoldEnough(player, gold_all, false) == false then
		lualib:SysTriggerMsg(player, "金币不足["..gold_all.."]!不能全部召集！你可以尝试单人召集。")
		return ""
	end
	
	if lualib:Player_SubGold(player, gold_all, false, "行会召集非绑消耗", player) == false then
		lualib:SysTriggerMsg(player, "扣除金币失败")
		return ""
	end
	]]--
	lualib:RunClientScript(map, "mapeffect", "texiao", "100001261#"..x.."#"..y.."#0#0")
	for k, v in pairs(Family_team) do
		lualib:SysMsg_SendMsgDlg(v, 201404112224, "→→ #COLORCOLOR_RED#" .. playername .. "#COLOREND# 大喊到：#COLORCOLOR_YELLOW#一支穿云箭，千军万马来相见。#COLOREND#\n10秒后失效。\n \n#BUTTON1#我要去#BUTTONEND#                       #BUTTON0#我不去#BUTTONEND#", 10, "MoveConfirm", playername)
	end
	return ""
end

function MoveConfirm(dlgid, player, btn_id, target_player) 
	if btn_id == 0 then
		lualib:Player_JumpToRole(player, target_player)
	end
end

function chuansong_all(player, item)
	local Family_team = lualib:GetFamilyMembers(player, true)
	local playername = lualib:Name(player)
	local mapself_keyname = lualib:KeyName(lualib:MapGuid(player))
	local mapself_name = lualib:Name(lualib:MapGuid(player))
	local itemname	= lualib:Name(item)
	local itemkeyname = lualib:KeyName(item)
	
	local gold = 20000
	local num = #Family_team - 1
	local gold_all = tonumber(num) * gold
	local map = lualib:MapGuid(player)
	local x = tonumber(lualib:X(player)) + 1
	local y = tonumber(lualib:Y(player)) - 1


	
	
	if playername == Family_name then
		lualib:SysTriggerMsg(player, "不能传送到自己身边！")
		return ""
	end
	
	for i = 1, #map_hei do
		if mapself_keyname == map_hei[i] then
			lualib:SysTriggerMsg(player, "你所在的["..mapself_name.."]地图被禁止召集！")
			return ""
		end
	end
	
	if lualib:Player_IsGoldEnough(player, gold_all, false) == false then
		lualib:SysTriggerMsg(player, "金币不足["..gold_all.."]!不能全部召集！你可以尝试单人召集。")
		return ""
	end
	
	if lualib:Player_SubGold(player, gold_all, false, "行会召集非绑消耗", player) == false then
		lualib:SysTriggerMsg(player, "扣除金币失败")
		return ""
	end
	


	
	lualib:RunClientScript(map, "mapeffect", "texiao", "100001261#"..x.."#"..y.."#0#0")
	
	for k, v in pairs(Family_team) do
		lualib:Player_JumpToRole(v, playername)
	end
	return ""
end

function on_create(item)
	lualib:AddTimerEx(item, 1, 500, 1, "tip", "")
	
end

function tip(item)
	local item_name = lualib:Name(item)
	local item_map_guid = lualib:MapGuid(item)
	local item_map_name = lualib:Name(item_map_guid)
	local item_map_x = lualib:X(item)
	local item_map_y = lualib:Y(item)
	local item_role = lualib:ItemRole(item)
	local player_name = lualib:Name(item_role)
	
	if item_map_x < 20000 then
		if player_name == "" then
			local s = "【"..item_name.."】掉落在"..item_map_name.."["..item_map_x..":"..item_map_y.."]！"
			lualib:SysMsg_SendCenterMsg(1, s, "")
			 lualib:SysMsg_SendBroadcastColor(s, "", 1, 12)
		else
            local s = "【"..item_name.."】掉落在"..item_map_name.."的["..item_map_x..":"..item_map_y.."]！！！"
			local s1 = "#IMAGE1900300001#["..player_name.."]人品爆发了，在"..item_map_name.."["..item_map_x..":"..item_map_y.."]打出了一个".."【"..item_name.."】！！！"
			lualib:SysMsg_SendCenterMsg(1, s, "")
			 lualib:SysMsg_SendBroadcastColor(s1, "", 1, 12)
		end
	else	
		return
	end
end
