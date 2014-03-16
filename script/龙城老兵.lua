local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

	itemTbl =
		{
			{
				{
					{["name"] = "裁决之杖", ["count"] = 1, ["keyname"] = "裁决之杖"},
					{["name"] = "武魂战盔", ["count"] = 1, ["keyname"] = "武魂战盔"},
					{["name"] = "绿色项链", ["count"] = 1, ["keyname"] = "绿色项链"},
					{["name"] = "骑士手镯", ["count"] = 1, ["keyname"] = "骑士手镯"},
					{["name"] = "力量戒指", ["count"] = 1, ["keyname"] = "力量戒指"},
					{["name"] = "武士之靴", ["count"] = 1, ["keyname"] = "武士之靴"}
				},
				{
					{["name"] = "怒斩", ["count"] = 1, ["keyname"] = "怒之斩"},
					{["name"] = "圣战头盔", ["count"] = 1, ["keyname"] = "圣战头盔"},
					{["name"] = "圣战项链", ["count"] = 1, ["keyname"] = "圣战项链"},
					{["name"] = "圣战手镯", ["count"] = 1, ["keyname"] = "圣战手镯"},
					{["name"] = "圣战戒指", ["count"] = 1, ["keyname"] = "圣战戒指"},
					{["name"] = "圣战靴子", ["count"] = 1, ["keyname"] = "圣战靴子"},
					{["name"] = "天魔神甲", ["count"] = 1, ["keyname"] = "天魔神甲"},
					{["name"] = "圣战宝甲", ["count"] = 1, ["keyname"] = "圣战宝甲"}
				},
				{
					{["name"] = "屠龙", ["count"] = 1, ["keyname"] = "屠龙"},
					{["name"] = "天之圣战头盔", ["count"] = 1, ["keyname"] = "天之圣战头盔"},
					{["name"] = "天之圣战项链", ["count"] = 1, ["keyname"] = "天之圣战项链"},
					{["name"] = "天之圣战手镯", ["count"] = 1, ["keyname"] = "天之圣战手镯"},
					{["name"] = "天之圣战戒指", ["count"] = 1, ["keyname"] = "天之圣战戒指"},
					{["name"] = "天之圣战靴子", ["count"] = 1, ["keyname"] = "天之圣战靴子"}
				}
			},
			{
				{
					{["name"] = "骨玉权杖", ["count"] = 1, ["keyname"] = "骨玉权杖"},
					{["name"] = "法魂头盔", ["count"] = 1, ["keyname"] = "法魂头盔"},
					{["name"] = "唤魔铃铛", ["count"] = 1, ["keyname"] = "唤魔铃铛"},
					{["name"] = "龙之手镯", ["count"] = 1, ["keyname"] = "龙之手镯"},
					{["name"] = "紫碧螺戒指", ["count"] = 1, ["keyname"] = "紫碧螺戒指"},
					{["name"] = "法师之靴", ["count"] = 1, ["keyname"] = "法师之靴"}
				},
				{
					{["name"] = "噬魂法杖", ["count"] = 1, ["keyname"] = "噬魂法杖"},
					{["name"] = "法神头盔", ["count"] = 1, ["keyname"] = "法神头盔"},
					{["name"] = "法神之坠", ["count"] = 1, ["keyname"] = "法神之坠"},
					{["name"] = "法神手镯", ["count"] = 1, ["keyname"] = "法神手镯"},
					{["name"] = "法神魔戒", ["count"] = 1, ["keyname"] = "法神魔戒"},
					{["name"] = "法神魔靴", ["count"] = 1, ["keyname"] = "法神魔靴"},
					{["name"] = "法神披风", ["count"] = 1, ["keyname"] = "法神披风"},
					{["name"] = "霓裳羽衣", ["count"] = 1, ["keyname"] = "霓裳羽衣"}
				},
				{
					{["name"] = "镇天", ["count"] = 1, ["keyname"] = "镇天"},
					{["name"] = "天之法神头盔", ["count"] = 1, ["keyname"] = "天之法神头盔"},
					{["name"] = "天之法神项链", ["count"] = 1, ["keyname"] = "天之法神魔链"},
					{["name"] = "天之法神手镯", ["count"] = 1, ["keyname"] = "天之法神手镯"},
					{["name"] = "天之法神魔戒", ["count"] = 1, ["keyname"] = "天之法神魔戒"},
					{["name"] = "天之法神魔靴", ["count"] = 1, ["keyname"] = "天之法神魔靴"}
				}
			},
			{
				{
					{["name"] = "龙纹剑", ["count"] = 1, ["keyname"] = "龙纹剑"},
					{["name"] = "道魂面具", ["count"] = 1, ["keyname"] = "道魂面具"},
					{["name"] = "灵魂项链", ["count"] = 1, ["keyname"] = "灵魂项链"},
					{["name"] = "三眼手镯", ["count"] = 1, ["keyname"] = "三眼手镯"},
					{["name"] = "泰坦戒指", ["count"] = 1, ["keyname"] = "泰坦戒指"},
					{["name"] = "道士之靴", ["count"] = 1, ["keyname"] = "道士之靴"}
				},
				{
					{["name"] = "逍遥", ["count"] = 1, ["keyname"] = "逍遥"},
					{["name"] = "天尊头盔", ["count"] = 1, ["keyname"] = "天尊头盔"},
					{["name"] = "天尊道链", ["count"] = 1, ["keyname"] = "天尊道链"},
					{["name"] = "天尊手镯", ["count"] = 1, ["keyname"] = "天尊手镯"},
					{["name"] = "天尊戒指", ["count"] = 1, ["keyname"] = "天尊戒指"},
					{["name"] = "天尊道靴", ["count"] = 1, ["keyname"] = "天尊道靴"},
					{["name"] = "天尊道袍", ["count"] = 1, ["keyname"] = "天尊道袍"},
					{["name"] = "天师长袍", ["count"] = 1, ["keyname"] = "天师长袍"}
				},
				{
					{["name"] = "玄天", ["count"] = 1, ["keyname"] = "玄天"},
					{["name"] = "天之天尊头盔", ["count"] = 1, ["keyname"] = "天之天尊头盔"},
					{["name"] = "天之天尊项链", ["count"] = 1, ["keyname"] = "天之天尊道链"},
					{["name"] = "天之天尊手镯", ["count"] = 1, ["keyname"] = "天之天尊手镯"},
					{["name"] = "天之天尊戒指", ["count"] = 1, ["keyname"] = "天之天尊戒指"},
					{["name"] = "天之天尊道靴", ["count"] = 1, ["keyname"] = "天之天尊道靴"}
				}
			}
		}

	itemRewardTbl =
		{
			{
				{["keyname"] = "灵元珠", ["count"] = 1}, {["keyname"] = "封印鉴定符", ["count"] = 1}
			},
			{
				{["keyname"] = "灵元珠", ["count"] = 2}, {["keyname"] = "封印鉴定符", ["count"] = 1}
			}
		}


--[[经验计算方式：
	local level = lualib:Level(player)
	local mul = math.floor(level - lvlExp[lvl][2])
	local exp = lvlExp[lvl][1] * mul
]]
--经验系数 分别是 低级 中级 高级 精英

lvlExp =
	{
		{5000,  15},
		{50000, 15},
		{100000, 15}
	}
CMap =
{
    keys =
    {
        "烈焰深渊1",
        "烈焰深渊2",
        "烈焰深渊3",
    },
}
function main(npc,player)
		local renew_color = 
		{
		"#FEFD02",
		"#F80403",
		"#1749CE",
		"#E76A0D",
		"#009603",
		"#A85F3F",
		}

	--lualib:SetStr(player,"_tc_",renew_color[2])
	--lualib:NotifyVar(player,"_tc_")
	local npcName = lualib:KeyName(npc)
	if npcName == "土城传送员" then
		return digong(npc, player)
	end
	
	local tb = {["龙城"]=1, ["巫山城"]=2, ["东临城"]=3}
	local msg = "#COLORCOLOR_GREENG#想当年我也曾手持利剑灭妖荡魔…唉，可惜…客官要去哪里？#COLOREND#\n \n"
	msg = msg .. "#IMAGE1902700015# <@anquan *01*【安全区域】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 传送您到各大城市的安全区域#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# <@digong *01*【危险区域】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 传送您到各大地图探险区域#COLOREND#\n"
	msg = msg .. "#IMAGE1902700015# <@shangdian"..tb[lualib:KeyName(lualib:MapGuid(player))].." *01*【商店传送】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 传送您到各地的交易区域#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# <@shenge *01*【城堡传送】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 传送您到攻城区域#COLOREND#\n"
	msg = msg .. "#IMAGE1902700037# <@equip *01*【装备回收】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 回收装备可获得经验和元宝#COLOREND#\n \n"
	msg = msg .. "#IMAGE1902700015# <@copy_map *01*【修炼阁】> #COLORCOLOR_RED#→→→→#COLOREND##COLORCOLOR_BLUE# 刷怪快速练级#COLOREND# \n"
	msg = msg.."                                         #OFFSET<X:0,Y:0>##IMAGE1902700034##OFFSET<X:0,Y:-1>#<@leave *01*「离开」>\n"
	return msg
end

function equip(npc, player)
    local msg = "你好英雄，龙城的状况还很严峻，我们现在需要大量的装备来武装我们的军队，如果你在旅途有什么多余的装备可以给我，我会给你一定的报酬！\n"
    msg = msg .. "#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
    msg = msg .. "#OFFSET<X:0,Y:5>##IMAGE<ID:1902700017>#<@equipEx#1 *01*「战士军备」>     #IMAGE<ID:1902700017>#<@equipEx#2 *01*「法师军备」>     #IMAGE<ID:1902700017>#<@equipEx#3 *01*「道士军备」>\n"
    msg = msg .."#OFFSET<X:0,Y:5>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
    msg = msg.."　　　　　　　　　　　　　　　　　　      　  #IMAGE<ID:1902700019>#<@main *01* 返回>\n"

    return msg
end

function equipEx(npc, player, job)
	job = tonumber(job)
	local jobTbl =
	{
		"战士",
		"法师",
		"道士"
	}

	local msg = "#COLORCOLOR_RED#装备采集提示：#COLOREND#\n"
    msg = msg.."您有多余的" .. jobTbl[job] .. "装备么，如果您有以下装备，就可以来我这里换取大量经验哦！\n"
    msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg .. "#OFFSET<X:0,Y:8>##IMAGE<ID:1902700017>#<@equipEx2#" .. job .. "#" .. 1 .."#" .. 0 .."#" .. 0 .." *01*「初级" .. jobTbl[job] .. "军备」>#IMAGE<ID:1902700017>#<@equipEx2#" .. job .. "#" .. 2 .."#" .. 0 .."#" .. 0 .." *01*「中级" .. jobTbl[job] .. "军备」>#IMAGE<ID:1902700017>#<@equipEx2#" .. job .. "#" .. 3 .."#" .. 0 .."#" .. 0 .." *01*「高级" .. jobTbl[job] .. "军备」>\n"
    msg = msg.."\n#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
    msg = msg.."　　　　　　　　　　　　　　　　　　      　  #IMAGE<ID:1902700019>#<@equip *01* 返回>\n"
	return msg
end

function equipEx2(npc, player, job, lvl, est,ek)
	job = tonumber(job)
	lvl = tonumber(lvl)
	est = tonumber(est)
	ek = tonumber(ek)
	local lvlTbl = {1, 1, 1}
	local msg = ""
    local equipen = false
	if lualib:Level(player) < lvlTbl[lvl] then
		msg = msg .. "您的等级不够，需要" .. lvlTbl[lvl] .. "级\n \n"
		msg = msg .. "<@main *01*「返回」>"
		return msg
	end
	if est == 1 then
        equipen = false
        for kk, vv in pairs(itemTbl[job][lvl]) do
            if itemTbl[job][lvl][ek].keyname == vv.name then
                equipen = true
            end
        end
        --if equipen == false then return "装备回收失败！\n \n<@equip *01*返回>" end
        if lualib:ItemCountByKey(player, itemTbl[job][lvl][ek].keyname, true, false, false, 2) < itemTbl[job][lvl][ek].count then
        return "您没有的"..itemTbl[job][lvl][ek].keyname.."装备，回收失败！\n \n<@equip *01*返回>" end
        if not lualib:DelItem(player, itemTbl[job][lvl][ek].keyname, itemTbl[job][lvl][ek].count, 2, "龙城老兵军装任务回收装备", "龙城老兵") then return "您没有"..itemTbl[job][lvl][ek].keyname.."装备，回收失败！\n \n<@equip *01*返回>" end
        if not lualib:Player_AddExp(player, lvlExp[lvl][1], "加经验：龙城老兵军装任务回收装备", "龙城老兵") then
            return "加经验失败！\n \n<@equip *01*返回>"
        end
        local lvlIngot1 = {5, 100, 500}
        local ingot1 = tonumber(lvlIngot1[lvl])
        if not lualib:Player_AddIngot(player, ingot1, false, "加元宝：龙城老兵军装任务回收套装", player) then
            return "加元宝失败！\n \n<@equip *01*返回>"
        end
	end

	local lvlNameTbl = {"初级", "中级", "高级"}
	local jobTbl =
	{
		"战士",
		"法师",
		"道士"
	}

	msg = msg .. "#COLORCOLOR_RED#选择你要回收的物品：#COLOREND#\n \n"
	for k, v in pairs(itemTbl[job][lvl]) do
		msg = msg .. "#IMAGE<ID:1902700017>#<@equipEx2#" .. job .. "#" .. lvl .."#" .. 1 .."#" .. k .." *01*【"..v.name.."】>  "
		if (k % 3) == 0 then
			msg = msg .. "\n"
		end
	end
	msg = msg .. "\n"

	local level = lualib:Level(player)
	local mul = math.floor(level - lvlExp[lvl][2])
	local exp = lvlExp[lvl][1]
    local lvlIngot = {5, 100, 500}
    local ingot = tonumber(lvlIngot[lvl])
	msg = msg .. "#COLORCOLOR_RED#回收一件物品可以获得：#COLOREND#【".."经验：" .. exp .." 元宝：" .. ingot .. "】\n"

	msg = msg .. "                                                #IMAGE<ID:1902700019>#<@equip *01*「返回」>\n"
	return msg
end

function OK(npc, player, job, lvl)
	job = tonumber(job)
	lvl = tonumber(lvl)

	local keynameTbl = {}
    local countTbl   = {}
    local bindTbl    = {}
    local operaTbl   = {}
	for k, v in pairs(itemTbl[job][lvl]) do
		keynameTbl[k] = v.keyname
		countTbl[k]   = v.count
		bindTbl[k]    = 0
		operaTbl[k]   = 1
	end

	if not lualib:Player_ItemRequest(player, keynameTbl, countTbl, bindTbl, operaTbl, "事务操作：龙城老兵军装任务回收套装", "龙城老兵") then
        return "套装部件不足，无法回收！\n \n<@main *01*返回>"
    end

	local level = lualib:Level(player)
	local mul = math.floor(level - lvlExp[lvl][2])
	local exp = lvlExp[lvl][1]
	if not lualib:Player_AddExp(player, exp, "加经验：龙城老兵军装任务回收套装", "龙城老兵") then
        return "加经验失败！\n \n<@equip *01*返回>"
    end

--加元宝,开始
	local lvlIngot = {5, 100, 500}
	local ingot = tonumber(lvlIngot[lvl])
        if not lualib:Player_AddIngot(player, ingot, false, "加元宝：龙城老兵军装任务回收套装", player) then
            return "加元宝失败！\n \n<@equip *01*返回>"
        end
--结束

	local rewardKeynameTbl = {}
    local rewardCountTbl   = {}
    local rewardBindTbl    = {}
    local rewardOperaTbl   = {}
	for k, v in pairs(itemRewardTbl[lvl]) do
		rewardKeynameTbl[k] = v.keyname
		rewardCountTbl[k]   = v.count
		rewardBindTbl[k]    = 0
		rewardOperaTbl[k]   = 0
	end

	if not lualib:Player_ItemRequest(player, rewardKeynameTbl, rewardCountTbl, rewardBindTbl, rewardOperaTbl, "事务操作：龙城老兵军装任务回收套装奖励", "龙城老兵") then
        return "错误，给奖励失败\n \n<@main *01*返回>"
    end

	local msg = ""

	msg = msg .. "奖励发放成功\n \n"
	msg = msg .. "<@main  *01*返回>\n"
	msg = msg .. "<@Leave *01*离开>"

	return msg
end

function mvtx(npc, tierid, param1, param2, param3)

	mapming = param1
	map_x = param2
	map_y = param3

	local canshu = {"巫山城", "东临城", "新手村", "龙城武器店", "龙城首饰店", "龙城书店", "龙城", "神歌城", "废弃矿洞2", "妖山暗穴1", "天荒阵1", "邪庙1", "天魔石窟1"}
	for i = 1, #canshu do
		if mapming == canshu[i] then
			local csmapguid = lualib:Map_GetMapGuid(canshu[i])
			lualib:RunClientScript(csmapguid, "mapeffect", "texiao", "100001671#"..map_x.."#"..map_y.."#0#0")
		end
	end
end
function anquan(npc,player)
	msg = "我可以将你免费传送到附近的城市\n \n"
	msg = msg.."<@MapMoveXYA#龙城#236#232#3 *01*土城>         <@MapMoveXYA#巫山城#237#303#3 *01*比齐城>         <@MapMoveXYA#东临城#330#300#3 *01*东临城>         <@MapMoveXYA#巫山城#237#303#3 *01*比齐城>\n \n"
    msg = msg.."　　　　　　　　　　　　　　　　　　      　  #IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	return msg
end


function shangdian1(npc,player)
	msg = "#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城武器店#18#30#3 *01*武器店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购武器的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城服装店#14#27#3 *01*服装店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购铠甲的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城首饰店#14#30#3 *01*首饰店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购首饰的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城#247#231#3 *01*杂货店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售收购各种卷类物品#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城#266#234#3 *01*药  店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各类红蓝药品#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城书店#15#26#3 *01*书  店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各职业技能书#COLOREND#\n"
	msg = msg.."#IMAGE1902700015# #OFFSET<X:0,Y:-1>##COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#龙城#237#268#3 *01*仓  库> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#存放各类物品的地方#COLOREND#\n \n                                                    #OFFSET<X:0,Y:-4>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>\n"
	return msg
end

function shangdian2(npc,player)
	msg = "#IMAGE1902700015# #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#武器店#18#30#3 *01*武器店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购武器的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#服装店#14#27#3 *01*服装店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购铠甲的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#首饰店#14#30#3 *01*首饰店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购首饰的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#巫山城#243#355#3 *01*杂货店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售收购各种卷类物品#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#药店#17#24#3 *01*药  店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各类红蓝药品#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#书店#15#26#3 *01*书  店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各职业技能书#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#巫山城#289#341#3 *01*仓  库> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#存放各类物品的地方#COLOREND#\n \n"
	msg = msg.."                                                    #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	return msg
end

function shangdian3(npc,player)
	msg = "#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#333#283#3 *01*铁匠铺> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购武器的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#301#307#3 *01*裁缝铺> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购铠甲的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#344#354#3 *01*首饰铺> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购首饰的地方#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#324#320#3 *01*杂货铺> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售收购各种卷类物品#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#320#260#3 *01*药材铺> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各类红蓝药品#COLOREND#\n"
	--msg = msg.."#IMAGE1902700015# #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#15#26#3 *01*书  店> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#出售和收购各职业技能书#COLOREND#\n"
	msg = msg.."#IMAGE1902700015##OFFSET<X:0,Y:-2># #COLORCOLOR_GOLD#【#COLOREND# <@MapMoveXYA#东临城#360#302#3 *01*仓  库> #COLORCOLOR_GOLD#】#COLOREND##COLORCOLOR_RED#  →→→→#COLOREND#  #COLORCOLOR_BLUE#存放各类物品的地方\n \n"
	msg = msg.."                                              #COLOREND##OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>\n"	
	return msg
end

function digong(npc,player)
	local msg = [[#COLORCOLOR_GOLD#传送到危险地区需要缴纳一定的金币，你要去哪里冒险？#COLOREND#

#IMAGE1902700015#<@MapMoveXY#1 *01*僵尸洞穴>#COLORCOLOR_RED#[初级]#COLOREND# #IMAGE1900340293#              #IMAGE1902700015#<@MapMoveXY#7 *01*赤炎禁地>#COLORCOLOR_RED#[法宝]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340293#
#IMAGE1902700015#<@MapMoveXY#2 *01*蜈蚣洞穴>#COLORCOLOR_RED#[初级]#COLOREND# #IMAGE1900340293#              #IMAGE1902700015#<@MapMoveXY#8 *01*人鱼孤礁>#COLORCOLOR_RED#[翅膀]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340294#
#IMAGE1902700015#<@MapMoveXY#3 *01*野猪洞穴>#COLORCOLOR_RED#[中级]#COLOREND# #IMAGE1900340293#              #IMAGE1902700015#<@MapMoveXY#9 *01*幽暗魔陵>#COLORCOLOR_RED#[衣服]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340293#
#IMAGE1902700015#<@MapMoveXY#4 *01*祖玛寺庙>#COLORCOLOR_RED#[中级]#COLOREND# #IMAGE1900340293##IMAGE1900340294#           #IMAGE1902700015#<@MapMoveXY#10 *01*迷之光屿>#COLORCOLOR_RED#[勋章]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340294#
#IMAGE1902700015#<@MapMoveXY#5 *01*赤月峡谷>#COLORCOLOR_RED#[高级]#COLOREND# #IMAGE1900340293##IMAGE1900340293#           #IMAGE1902700015#<@MapMoveXY#11 *01*镇魔大殿>#COLORCOLOR_RED#[副本]#COLOREND# #IMAGE1900340293##IMAGE1900340293#
#IMAGE1902700015#<@MapMoveXY#6 *01*海角秘境>#COLORCOLOR_RED#[高级]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340294#        #IMAGE1902700015#<@MapMoveXY#12 *01*烈焰深渊>#COLORCOLOR_RED#[副本]#COLOREND# #IMAGE1900340293##IMAGE1900340293##IMAGE1900340293#
#IMAGE1902700018#  #COLORCOLOR_GOLD#【#COLOREND#<@MapMoveXYA#龙城#490#320#3 *01*魔宠区域>#COLORCOLOR_GOLD#】 #COLOREND##COLORCOLOR_RED#→→→#COLOREND#  #COLORCOLOR_BLUE#适合30-35级探险→法师召唤宝宝区域#COLOREND#
]]
	return msg
end

local digong_move = {
						{"废弃矿洞2", 7, 23, 0, "#COLORCOLOR_GOLD#免费传送到僵尸洞穴，适合25-35级探险→怪物产出技能书#COLOREND#"},
						{"妖山暗穴1", 32, 174, 0, "#COLORCOLOR_GOLD#免费传送到蜈蚣洞穴，适合30-40级探险→怪物产出沃玛装备#COLOREND#"},
						{"天荒阵1", 93, 96, 3000, "#COLORCOLOR_GOLD#传送到石墓需要缴纳3千金币，适合35-45级探险→怪物产出沃玛祖玛装备#COLOREND#"},
						{"邪庙1", 86, 194, 5000, "#COLORCOLOR_GOLD#传送到祖玛寺庙需要缴纳5千金币，适合40-50级探险→怪物产出祖玛、赤月装备#COLOREND#"},
						{"天魔石窟1", 27, 185, 10000, "#COLORCOLOR_GOLD#传送到赤月峡谷需要缴纳1万金币，适合45-55级探险→怪物产出天之赤月装备#COLOREND#"},
						{"海底入口", 36, 71, 100000, "#COLORCOLOR_GOLD#人类在海底深处发现了一艘古代的沉船，有无数失落于海底的宝藏！如果你想去探险我可以为你带路，据说可里面可掉落顶级装备，包括传说级别的勋章、衣服、武器。\n \n传送到秘境沉船需要缴纳10万金币#COLOREND#"},
						{"赤炎部落1", 43, 445, 100000, "#COLORCOLOR_GOLD#此地图精英怪以及BOSS可以掉落所有职业高级技能书以及各职业终级装备传送费用100000金币，二层三层地图不能飞随机哦！\n \n传送需要缴纳10万金币#COLOREND#"},
						{"人鱼孤礁", 103, 21, 20000, "此地图可以掉落各职业的翅膀，在一个未名的海域，有着美丽动人的人鱼，她们在神秘的海角守护着神的羽翼，进入此地将有意外的收获。\n \n传送到人鱼海角需要缴纳2万金币#COLOREND#"},
						{"幽暗魔陵", 103, 23, 20000, "幽暗魔陵可以打出各职业的顶级服装，一直以来被邪恶的势力所笼罩，前往的英雄若能征服它们的，将能得到它们的铠甲。\n \n传送到幽暗魔陵需要缴纳2万金币#COLOREND#"},
						{"百草堂", 19, 31, 30000, "迷之光屿里驻扎着凶猛的恶魔，它们因残暴而令世人恐惧，杀死它们有机会获得各种勋章，也能掉落其它道具，但若是遇到教主千万要小心。\n \n传送到迷之光屿需要缴纳3万金币#COLOREND#"},
					}

function MapMoveXY(npc, player, map_index)
	local map_index = tonumber(map_index)
	local msg = ""
	if map_index == 11 then
		msg = "　　神战期间，死灵神更开辟了恶魔大陆入侵天藏大陆的位面通道。为了封印这些位面通道，天藏大陆在付出巨大代价后，建立了镇魔殿。如今，恶魔再次入侵大陆的迹象越来越明显，镇魔使者首次开启了镇魔殿。各位勇士进入挑战不仅可以获得大量的战斗经验，更有丰厚的珍稀装备奖励！\n"
		msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
		msg = msg.."#COLORCOLOR_RED#进入条件：#COLOREND#参与的玩家必须等级大于等于40，并且需要组队，由\n"
		msg = msg.."　　　　　队长申请进入镇魔殿(建议5人以上组队)\n"
		msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
		if lualib:Player_HasDgnTicket(player, "镇魔殿") then
			msg = msg .. "您已经挑战过镇魔殿，不能继续挑战 \n"
		else
			msg = msg.."#IMAGE<ID:1902700018>#<@jump_leader11 *01*「确定前往镇魔殿」>                 #OFFSET<X:0,Y:4>##IMAGE<ID:1902700019>#<@main *01*「返回」>\n"
		end
	elseif map_index == 12 then
		msg = "  无数的勇士在烈焰深渊展开与恶魔的激战，虽然惨烈，但是，意外的收获让更多的勇士投入其中\n \n"
	    msg = msg.."进入条件：参与的玩家必须等级大于等于42，队长需交纳100元宝，由队长申请进入烈焰深渊，队伍的人数不能超过5个！\n \n"
	    msg = msg.."#COLORCOLOR_RED#挑战烈焰深渊有机会获得极品坐骑，独角兽，梦魇兽，吼天兽，雪域天狼，裂天魔狮，神兽，霸下玄龟！#COLOREND#\n \n"
		msg = msg.."<@jumpex12 *01*前往烈焰深渊>                 #OFFSET<X:0,Y:4>##IMAGE<ID:1902700019>#<@main *01*「返回」>\n"
	else
		msg = msg..digong_move[map_index][5].."\n\n\n"
		msg = msg.."#COLORCOLOR_RED#■#COLOREND#<@MapMoveXYEx#"..digong_move[map_index][1].."#"..digong_move[map_index][2].."#"..digong_move[map_index][3].."#5#"..digong_move[map_index][4].." *01*进入挑战> \n"

		msg = msg.."　　　　　　　　　　　　　　　　　　      　  #IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	return msg
end

function MapMoveXYA(npc, player, map_key_name, x, y, r)
	local msg=""
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)

	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")
	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	local mapname = {"巫山城", "东临城", "新手村", "龙城武器店", "龙城首饰店", "龙城书店", "龙城"}
	
	for i = 1, #mapname do
		if map_key_name == mapname[1] then
			lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "巫山城".."#"..x.."#"..y)
		elseif map_key_name == mapname[2] then
			lualib:AddTimerEx(npc, 125, 300, 1, "mvtx", "东临城".."#"..x.."#"..y)
		elseif map_key_name == mapname[3] then
			lualib:AddTimerEx(npc, 126, 300, 1, "mvtx", "新手村".."#"..x.."#"..y)
		elseif map_key_name == mapname[4] then
			lualib:AddTimerEx(npc, 127, 300, 1, "mvtx", "龙城武器店".."#"..x.."#"..y)
		elseif map_key_name == mapname[5] then
			lualib:AddTimerEx(npc, 128, 300, 1, "mvtx", "龙城首饰店".."#"..x.."#"..y)
		elseif map_key_name == mapname[6] then
			lualib:AddTimerEx(npc, 129, 300, 1, "mvtx", "龙城书店".."#"..x.."#"..y)
		elseif map_key_name == mapname[7] then
			lualib:AddTimerEx(npc, 129, 300, 1, "mvtx", "龙城".."#"..x.."#"..y)	
		end
	end
	return msg
end

function MapMoveXYEx(npc, player, map_key_name, x, y, r, gold)
	local msg=""
	local gold = tonumber(gold)
	if not lualib:Player_SubGold(player, gold, false, "扣除元宝：传送费", "龙城老兵") then return "你的金币少于"..gold.."，不能传送！" end
	local x = tonumber(x)
	local y = tonumber(y)
	local r = tonumber(r)

	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")
	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	local mapname = {"废弃矿洞2", "妖山暗穴1", "天荒阵1", "邪庙1", "天魔石窟1", "百草堂", "人鱼海角", "海角秘境", "赤炎部落1"}
	
	for i = 1, #mapname do
		if map_key_name == mapname[1] then
			lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "废弃矿洞2".."#"..x.."#"..y)
		elseif map_key_name == mapname[2] then
			lualib:AddTimerEx(npc, 125, 300, 1, "mvtx", "妖山暗穴1".."#"..x.."#"..y)
		elseif map_key_name == mapname[3] then
			lualib:AddTimerEx(npc, 126, 300, 1, "mvtx", "天荒阵1".."#"..x.."#"..y)
		elseif map_key_name == mapname[4] then
			lualib:AddTimerEx(npc, 127, 300, 1, "mvtx", "邪庙1".."#"..x.."#"..y)
		elseif map_key_name == mapname[5] then
			lualib:AddTimerEx(npc, 128, 300, 1, "mvtx", "天魔石窟1".."#"..x.."#"..y)
		elseif map_key_name == mapname[6] then
			lualib:AddTimerEx(npc, 129, 300, 1, "mvtx", "百草堂".."#"..x.."#"..y)
		elseif map_key_name == mapname[7] then
			lualib:AddTimerEx(npc, 130, 300, 1, "mvtx", "人鱼海角".."#"..x.."#"..y)
		elseif map_key_name == mapname[8] then
			lualib:AddTimerEx(npc, 131, 300, 1, "mvtx", "海角秘境".."#"..x.."#"..y)
		elseif map_key_name == mapname[9] then
			lualib:AddTimerEx(npc, 132, 300, 1, "mvtx", "赤炎部落1".."#"..x.."#"..y)
		end
	end
	return msg
end

function jump_leader11(npc, player)
	if not lualib:Player_IsTeamLeader(player) then return "你不是队长！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>" end
	local members = lualib:Player_GetTeamList(player)
	if members == nil then return "队伍成员为空！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>" end

	local team_guid = lualib:Player_GetTeamGuid(player)
	if team_guid == "" then return "获取队伍信息出错！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>" end

	local require_distance = 20
	for _, v in pairs(members) do
		local distance = lualib:Distance(v, npc)
		if distance > require_distance then
			if player == v then
				return "您的距离过远！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			else
				return "队友【"..lualib:Player_GetStrProp(v, lua_role_user_name).."】的距离过远！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			end
		end
	end

	local require_level = 40
	for _, v in pairs(members) do
		local level = lualib:Player_GetIntProp(v,  lua_role_level)
		if level < require_level then
			if player == v then
				return "您的等级过低，请40级再来！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			else
				return "队友【"..lualib:Player_GetStrProp(v, lua_role_user_name).."】的等级过低！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			end
		end
	end

	for _, v in pairs(members) do
		if lualib:Player_HasDgnTicket(v, "镇魔殿") then
			return "队友【"..lualib:Player_GetStrProp(v, lua_role_user_name).."】已经进入过其它队伍的副本！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
		end
	end
	
	for _, v in pairs(members) do
		if not lualib:VerifyCampCount(v, 1) then
			if v == player then 
				return "您今天已经进入过镇魔殿了！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			else
				return "队友【"..lualib:Player_GetStrProp(v, lua_role_user_name).."】今天已经进入过镇魔殿了\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
			end
		end
	end

    local require_gold = 0
    if not lualib:Player_IsGoldEnough(player, require_gold, false) then
        return "您的金币不足"..require_gold.."！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end

    if not lualib:Player_SubGold(player, require_gold, false, "扣金币：镇魔殿传送费", "镇魔殿传送人") then
        return "扣除金币失败！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end

	local dgn = lualib:Map_CreateDgn("镇魔殿", false, 1800)
    if dgn == "" then
        lualib:Error("副本：镇魔殿创建失败！")
        return
    end
    lualib:Debug("副本：镇魔殿创建成功！")

	for _, v in pairs(members) do
		lualib:Map_SetCustomVarStr(dgn, "team_guid", team_guid)
		lualib:Player_SetCustomVarInt(v, "zmdfb_enter_days", lualib:GetAllDays(0))
		lualib:Player_SetCustomVarInt(v, "zmdfb_var_award", 0)
		if lualib:Player_SetDgnTicket(v, dgn) == false then return "您不被许可进入地图！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>" end
		lualib:JoinCamp(v, 1, 0)
		if lualib:Player_EnterDgn(v, "镇魔殿", 52, 65, 15) == false then return "进入地图失败！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"end
	end
    return ""
end

function jumpex12(npc, player)
	if not lualib:Player_IsTeamLeader(player) then
        return "你不是队长！\n \n<@main *01*「返回」>"
    end

	local members = lualib:Player_GetTeamList(player)
	if members == nil or #members == 0 then
        return "队伍成员为空！\n \n<@main *01*「返回」>"
    end
	if #members >= 6 then
        return "您的队伍人数超限制！\n \n<@main *01*「返回」>"
    end

	local require_distance = 20
	for _, v in pairs(members) do
		local distance = lualib:Distance(v, npc)
		if distance > require_distance then
			if player == v then
				return "您的距离过远！\n \n<@main *01*「返回」>"
			else
				return "队友【"..lualib:Name(v).."】的距离过远！\n \n<@main *01*「返回」>"
			end
		end
	end

	local require_level = 42
	for _, v in pairs(members) do
		if lualib:Level(v) < require_level then
			if player == v then
				return "您的等级过低，请42级再来！\n \n<@main *01*「返回」>"
			else
				return "队友【"..lualib:Name(v).."】的等级过低！\n \n<@main *01*「返回」>"
			end
		end
	end

    local require_Ingot = 100
    if not lualib:Player_IsIngotEnough(player, require_Ingot, false) then
        return "您的元宝不足"..require_gold.."！\n \n<@main *01*「返回」>"
    end

    if not lualib:Player_SubIngot(player, require_Ingot, false, "扣元宝：烈焰深渊传送费", "烈焰深渊传送人") then
        return "扣除元宝失败！\n \n<@main *01*「返回」>"
    end

    local dgns = {}
    local now = lualib:GetAllTime()
    local times = lualib:Str2Time(string.format("%s %s", lualib:Time2Str("%Y-%m-%d", now), "23:59:59")) - now

    for k, v in pairs(CMap.keys) do
    	local dgn = lualib:Map_CreateDgn(v, true, times)
        if dgn == "" then
            lualib:Error("副本："..v.."创建失败！")
            return "副本："..v.."创建失败！\n \n<@main *01*「返回」>"
        end
        lualib:Debug("副本："..v.."创建成功！")
        table.insert(dgns, k, dgn)
    end

    if #dgns == 0 then
        return "系统错误！\n \n<@main *01*「返回」>"
    end

	for _, v in pairs(members) do
        for _, _v in pairs(dgns) do
		    if lualib:Player_SetDgnTicket(v, _v) == false then
                return "您不被许可进入地图！\n \n<@main *01*「返回」>"
            end
        end
        lualib:JoinCamp(v, 11, 0)
		if lualib:Player_EnterDgn(v, "烈焰深渊1", 127, 27, 15) == false then
            return "进入地图失败！\n \n<@main *01*「返回」>"
        end
    end
    return ""
end

function shenge(npc,player)
	msg = "#COLORCOLOR_GOLD#传送到城堡需要缴纳10000金币，请选择前往神歌城的准确地点！#COLOREND#\n \n \n"
	msg = msg.."#COLORCOLOR_BLUE#╔----------------╦----------------╦----------------╗#COLOREND#\n"
	msg = msg.."#COLORCOLOR_BLUE#┆#COLORCOLOR_RED#■#COLOREND#<@MapMovecb#神歌城#275#275#10 *01*神歌城大门>#COLORCOLOR_RED#■ #COLOREND# #OFFSET<X:-3,Y:0>##COLORCOLOR_BLUE#┆#COLORCOLOR_RED#■#COLOREND#<@MapMovecb#神歌城#258#106#10 *01*神歌城左侧>#COLORCOLOR_RED#■ #COLOREND# #OFFSET<X:-2,Y:0>##COLORCOLOR_BLUE#┆#COLORCOLOR_RED#■#COLOREND#<@MapMovecb#神歌城#415#281#10 *01*神歌城右侧>#COLORCOLOR_RED#■ #COLOREND##OFFSET<X:-2,Y:0>##COLORCOLOR_BLUE# ┆\n"
	msg = msg.."#COLORCOLOR_BLUE#╚----------------╩----------------╩----------------╝#COLOREND#\n \n"
    msg = msg.."　　　　　　　　　　　　　　　　　　      　  #IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	return msg
end


function MapMoveXYB(npc, player, map_key_name, x, y, r)
	local msg=""
	gold = 2000
	if not lualib:Player_SubGold(player, gold, false, "扣除金币：传送费", "龙城老兵") then return "你的金币不足，不能传送！" end
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)

	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")
	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	local mapname = {"巫山城", "东临城", "新手村", "龙城武器店", "龙城首饰店", "龙城书店", "龙城"}
	
	for i = 1, #mapname do
		if map_key_name == mapname[1] then
			lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "巫山城".."#"..x.."#"..y)
		elseif map_key_name == mapname[2] then
			lualib:AddTimerEx(npc, 125, 300, 1, "mvtx", "东临城".."#"..x.."#"..y)
		elseif map_key_name == mapname[3] then
			lualib:AddTimerEx(npc, 126, 300, 1, "mvtx", "新手村".."#"..x.."#"..y)
		elseif map_key_name == mapname[4] then
			lualib:AddTimerEx(npc, 127, 300, 1, "mvtx", "龙城武器店".."#"..x.."#"..y)
		elseif map_key_name == mapname[5] then
			lualib:AddTimerEx(npc, 128, 300, 1, "mvtx", "龙城首饰店".."#"..x.."#"..y)
		elseif map_key_name == mapname[6] then
			lualib:AddTimerEx(npc, 129, 300, 1, "mvtx", "龙城书店".."#"..x.."#"..y)
		elseif map_key_name == mapname[7] then
			lualib:AddTimerEx(npc, 129, 300, 1, "mvtx", "龙城".."#"..x.."#"..y)	
		end
	end
	return msg
end

function MapMovecb(npc, player, map_key_name, x, y, r)
	local msg=""
	gold = 10000
	if not lualib:Player_SubGold(player, gold, false, "扣除金币：传送费", "龙城老兵") then return "你的金币不足，不能传送！" end
	x = tonumber(x)
	y = tonumber(y)
	r = tonumber(r)

	local mapguid = lualib:MapGuid(player)
	local player_x = lualib:X(player)
	local player_y = lualib:Y(player)
	
	lualib:RunClientScript(mapguid, "mapeffect", "texiao", "100001670#"..player_x.."#"..player_y.."#0#0")
	local ret = lualib:Player_MapMoveXY(player,map_key_name, x, y, r)

	if ret ~= true then
		return "跳地图失败"
    end
	lualib:AddTimerEx(npc, 124, 300, 1, "mvtx", "神歌城".."#"..x.."#"..y)
	return msg
end


function Leave(npc,player)
	return ""
end


function copy_map(npc, player)
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#修炼阁#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BLUE#提示⑴:  #COLOREND#进入等级:大于等于30级！\n"
    msg = msg.."#COLORCOLOR_BLUE#提示⑵:  #COLOREND#进入花费:5000金币！\n"
    msg = msg.."#COLORCOLOR_BLUE#提示⑶:  #COLOREND#进入刷怪:使用双倍经验卷轴消灭经验树可获得20万经验！\n"
    msg = msg.."#OFFSET<X:0,Y:4>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."　　　　　#IMAGE1902700015#<@enter_xiulian *01*「进入挑战」>　　　　　#IMAGE1902700019#<@main *01*「返回首页」>"
	
    return msg
end

function enter_xiulian(npc, player)
	local reqLevel = 30
    local sub_gold = 5000
	
	if lualib:Level(player) < reqLevel then
		return "你的等级不足"..reqLevel.."，无法进入修炼阁！\n\n                                                   #OFFSET<X:0,Y:-10>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
	
	if not lualib:Player_SubGold(player, sub_gold, false, "", "") then
		return "你的金币不足"..sub_gold.."，无法进入修炼阁！\n\n                                                   #OFFSET<X:0,Y:-10>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
	
	local dgn = lualib:Map_CreateDgn("修炼阁", true, 1800)
    if dgn == "" then 
		return "创建副本失败！" 
	end
	
	if not lualib:Map_GenNpc(dgn, "刷怪人", 31, 45, 0, 3) then
		return "添加刷怪人失败！\n\n                                                   #OFFSET<X:0,Y:-10>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
	
	if not lualib:Player_SetDgnTicket(player, dgn) then
		return "进入副本失败！\n\n                                                   #OFFSET<X:0,Y:-10>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	end
	
	if not lualib:Player_EnterDgn(player, "修炼阁", 0, 0, 0) then
		return "进入副本失败！\n\n                                                   #OFFSET<X:0,Y:-10>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
	else
		lualib:SysMsg_SendTriggerMsg(player, "副本持续半小时，请您注意时间！")
	end
	
    return ""
ends