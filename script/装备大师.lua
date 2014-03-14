local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")

function main(npc,player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
    msg = msg.."#OFFSET<X:0,Y:4>##COLORCOLOR_SKYBLUE#老夫乃天藏大陆上最强的装备大师，没有我打造不出来的装备！#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
    msg = msg.."　#COLORCOLOR_LIGHTBROWN#╔━━━━╗　╔━━━━╗　╔━━━━╗　╔━━━━╗#COLOREND#\n"
    msg = msg.."#COLORCOLOR_RED#●#COLOREND##COLORCOLOR_LIGHTBROWN#┃#COLOREND#<@InfoItemRefine1 *01*装备精炼>#OFFSET<X:-2,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND##COLORCOLOR_RED#●#COLOREND##OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND#<@zhuangsj *01*武器升级>#OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND##COLORCOLOR_RED#●#COLOREND##OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND#<@luck *01*项链幸运>#OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND##COLORCOLOR_RED#●#COLOREND##OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND#<@FengYin *01*解除封印>#OFFSET<X:-1,Y:0>##COLORCOLOR_LIGHTBROWN#┃#COLOREND##COLORCOLOR_RED#●#COLOREND#\n"
    msg = msg.."　#COLORCOLOR_LIGHTBROWN#╚━━━━╝　╚━━━━╝　╚━━━━╝　╚━━━━╝#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
    msg = msg.."   #IMAGE1902700017#<@jinglianjiesao *01*[精炼说明]    >#IMAGE1902700017#<@wuqishengjiinfo#1# *01*「升级说明」    >#IMAGE1902700017#<@fengyinjiesao *01*[解封说明]   >\n \n"
	return msg
end

--装备精炼
function InfoItemRefine1(npc,player)
	local msg = "请问有什么能帮你的吗？老夫可以帮你打造出绝世神兵！\n \n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@InfoItemRefine *01*「装备精炼」>      #OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@jinglianzhuanyi *01*「精炼转移」>      #OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@jingliangaibian *01*「精炼改变」>\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"

	msg = msg.."                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"

	return msg
end

--装备精炼介绍
function jinglianjiesao(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_RED#●#COLOREND#　精炼一共分为9个等级，等级越高，精炼成功概率越低，灵\n \n"
	msg = msg.."#OFFSET<X:0,Y:-2>#　　元珠消耗也越大，而且所有精炼失败都是不会掉级的哦\n"
        msg = msg.."#OFFSET<X:0,Y:-2>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
	msg = msg.."　　　　　　　　　　　　　　　　　　　　　#IMAGE<ID:1902700014>#<@jinglianjiesao1 *01*「下一页」>\n"
	return msg
end

function jinglianjiesao1(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_RED#●#COLOREND#　不同部分装备所精炼的属性类型不同，但同时只能精炼一\n \n"
	msg = msg.."#OFFSET<X:0,Y:-2>#　　种属性\n"
        msg = msg.."#OFFSET<X:0,Y:-2>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
	msg = msg.."　　　　　　　　　　　　　　　　　　　　　#IMAGE<ID:1902700014>#<@jinglianjiesao2 *01*「下一页」>\n"
	return msg
end

function jinglianjiesao2(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_RED#●#COLOREND#　玩家携带全套精炼+7、+8、+9的装备会有附加属性！而且\n \n"
	msg = msg.."#OFFSET<X:0,Y:-2>#　　人物属性界面会显示精炼徽章！\n"
        msg = msg.."#OFFSET<X:0,Y:-2>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
	msg = msg.."　　　　　　　　　　　　　　　　　　　　　#IMAGE<ID:1902700014>#<@jinglianjiesao3 *01*「下一页」>\n"
	return msg
end




function zbxiayiye(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:-9>##COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#========================================================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n \n"
     msg = msg.."　　　 #OFFSET<X:0,Y:-5>##COLORCOLOR_BLUE#╔╦╦╦╦╦╦╦╗　　　╔╦╦╦╦╦╦╦╗#COLOREND#\n"
     msg = msg.."　　　 #OFFSET<X:0,Y:-4>##COLORCOLOR_BLUE#╠#COLOREND#<@shuxingduiying *01*装备对应的属性>#OFFSET<X:-2,Y:0>##COLORCOLOR_BLUE#╬╬╬╬╬#COLOREND#<@fujia *01*装备附加的属性>#OFFSET<X:-2,Y:0>##COLORCOLOR_BLUE#╣#COLOREND#\n"
     msg = msg.."　　　 #OFFSET<X:0,Y:-4>##COLORCOLOR_BLUE#╚╩╩╩╩╩╩╩╝　╬　╚╩╩╩╩╩╩╩╝#COLOREND#\n"
     msg = msg.."　　　　　 #OFFSET<X:0,Y:-3>##COLORCOLOR_RED#卍#COLOREND##COLORCOLOR_GOLD#═══════════════#COLOREND##COLORCOLOR_RED#卐#COLOREND#\n \n"

     msg = msg.."　#OFFSET<X:0,Y:-3>##IMAGE<ID:1902700019>#<@jinglianjiesao *01*「上一页」>　#OFFSET<X:1,Y:0>##COLORCOLOR_GOLD#　　　　　　　　　　　#COLOREND#　#IMAGE<ID:1902700019>#<@main *01*「返回首页」>\n\n"

	return msg
end


function jinglianjiesao3(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
     msg = msg.."#COLORCOLOR_RED#装备可精炼的属性#COLOREND#\n"
	msg = msg.."#COLORCOLOR_GOLD#【   武器、戒指　 #OFFSET<X:2,Y:0>#】#COLOREND##COLORCOLOR_RED#→→→#COLOREND##COLORCOLOR_ORANGE#物攻上限、魔攻上限、道术上限#COLOREND#\n"
	msg = msg.."#COLORCOLOR_GOLD#【衣服、头盔、鞋子】#COLOREND##COLORCOLOR_RED#→→→#COLOREND##COLORCOLOR_ORANGE#物防上限、魔防上限#COLOREND#\n"
	msg = msg.."#COLORCOLOR_GOLD#【  项链、手镯　　】#COLOREND##COLORCOLOR_RED#→→→#COLOREND##COLORCOLOR_ORANGE#HP上限、MP上限#COLOREND#\n"
	msg = msg.."#COLORCOLOR_BLUE#以上属性都为百分比，能整体提升自身属性。#COLOREND#    #IMAGE<ID:1902700014>#<@jinglianjiesao4 *01*「下一页」>\n \n"
	return msg
end

function jinglianjiesao4(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-10>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:2>#佩戴全套+7装备属性：\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#物防上限　提升　百分之三　#COLORCOLOR_RED#●#COLOREND#物攻上限　提升　百分之三\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#魔防上限　提升　百分之三　#COLORCOLOR_RED#●#COLOREND#魔攻上限　提升　百分之三\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#*HP*上限　#OFFSET<X:1,Y:0>#提升　百分之三　#COLORCOLOR_RED#●#COLOREND#道术上限　提升　百分之三\n"
        msg = msg.."#OFFSET<X:0,Y:-1>##COLORCOLOR_RED#●#COLOREND#*MP*上限　#OFFSET<X:1,Y:0>#提升　#OFFSET<X:1,Y:0>#百分之三　　　　　　　　#IMAGE<ID:1902700014>#<@jinglianjiesao5 *01*「下一页」>\n"


	return msg
end

function jinglianjiesao5(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-10>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:2>#佩戴全套+8装备属性：\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#物防上限　提升　百分之六　#COLORCOLOR_RED#●#COLOREND#物攻上限　提升　百分之六\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#魔防上限　提升　百分之六　#COLORCOLOR_RED#●#COLOREND#魔攻上限　提升　百分之六\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#*HP*上限　#OFFSET<X:1,Y:0>#提升　百分之六　#COLORCOLOR_RED#●#COLOREND#道术上限　提升　百分之六\n"
        msg = msg.."#OFFSET<X:0,Y:-1>##COLORCOLOR_RED#●#COLOREND#*MP*上限　#OFFSET<X:1,Y:0>#提升　#OFFSET<X:1,Y:0>#百分之六　　　　　　　　#IMAGE<ID:1902700014>#<@jinglianjiesao6 *01*「下一页」>\n"


	return msg
end

function jinglianjiesao6(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#欢迎光临装备精炼系统#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-10>##COLORCOLOR_LIGHTBROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:2>#佩戴全套+9装备属性：\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#物防上限　提升百分之十二　#COLORCOLOR_RED#●#COLOREND#物攻上限　提升百分之十二\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#魔防上限　提升百分之十二　#COLORCOLOR_RED#●#COLOREND#魔攻上限　提升百分之十二\n"
        msg = msg.."#OFFSET<X:0,Y:2>##COLORCOLOR_RED#●#COLOREND#*HP*上限　#OFFSET<X:1,Y:0>#提升百分之十二　#COLORCOLOR_RED#●#COLOREND#道术上限　提升百分之十二\n"
        msg = msg.."#OFFSET<X:0,Y:-1>##COLORCOLOR_RED#●#COLOREND#*MP*上限　#OFFSET<X:1,Y:0>#提升百分之十二　　　　　　　　#IMAGE<ID:1902700019>#<@main *01*返回首页>\n"


	return msg
end




function luck(npc,player)
	local item_guid = lualib:Player_GetItemGuid(player, 9)
	local equip_name = "当前没有携带项链"
	if item_guid ~= "" and item_guid ~= nil then
		equip_name = lualib:Name(item_guid)
	end
	--local luck_curse = lualib:Equip_GetLuckCurse("", item_guid) +1
	local msg = ""
	msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700041##OFFSET<X:0,Y:-1>#当前项链:  #COLORCOLOR_BLUE#"..equip_name.."#COLOREND#\n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."升级幸运+1   #COLORCOLOR_RED#需要2000元宝   成功率 100%#COLOREND#    <@luck_ex *01*「确定升级」>\n"
	msg = msg.."升级幸运+2   #COLORCOLOR_RED#需要3000元宝   成功率  30%#COLOREND#    <@luck_ex *01*「确定升级」>\n"
	msg = msg.."升级幸运+3   #COLORCOLOR_RED#需要5000元宝   成功率  10%#COLOREND#    <@luck_ex *01*「确定升级」>\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"

	msg = msg.."                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end

--抽奖概率,rate为概率，如30%，rate=30
function luck_rate(rate)
	local r1 = lualib:GenRandom(1, 100)
	local r2 = lualib:GenRandom(0, 100 - rate)
	for i=r2,r2 + rate do
		if r1 == i then
			return true
		end
	end
	return false
end

function luck_ex(npc,player)
	local item_guid = lualib:Player_GetItemGuid(player, 9)

	if item_guid == "" then
		return "您没有装备项链!\n \n#IMAGE<ID:1902700019>#<@main *01*「返回」>"
	end

	local luck_point = {}
	luck_point[0] = 2000
	luck_point[1] = 3000
	luck_point[2] = 5000
	local rand = lualib:GenRandom(1, 100)
	local luck_curse = lualib:Equip_GetLuckCurse("", item_guid)

	if luck_curse >= 3 then
		return "您的项链已经幸运到顶级了!\n                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
	end
	

	if not lualib:Player_IsIngotEnough(player, luck_point[luck_curse], false) then
		return "您的元宝不足!\n                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
	end
	

	if not lualib:Player_SubIngot(player, luck_point[luck_curse], false, "扣元宝：提升幸运属性1", player) then
		return "扣除元宝失败!\n \n#IMAGE<ID:1902700019>#<@main *01*「返回」>"
	end

	if luck_curse == 1 and not luck_rate(30) then
		return "运气不好,提升幸运失败!\n \n#IMAGE<ID:1902700019>#<@main *01*「返回」>"
	end

	if luck_curse == 2 and not luck_rate(10) then
		return "运气不好,提升幸运失败!\n \n#IMAGE<ID:1902700019>#<@main *01*「返回」>"
	end


	if lualib:Equip_SetLuckCurse(player, item_guid, luck_curse + 1) == false then
		return "提升幸运失败!请联系管理！\n                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
	end
	
	

    local s = "["..lualib:Name(player).."]".."在装备大师处成功提升了项链的幸运！！！"
	lualib:SysMsg_SendCenterMsg(1, s, "")
    return "您的项链成功加了幸运!"
end

function zhuangsj(npc,player)

	local msg = "选择你要升级武器的方式！\n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
	msg = msg.."#COLORCOLOR_BROWN#升级武器属性选择说明：玩家包裹里提交的首饰中，攻魔道上限属性最高的为升级属性。#COLOREND#\n"
	msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@duanzhao#1 *01*「普通升级」>      #OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@duanzhao#2 *01*「元宝升级」>\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"

	msg = msg.."                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end


function InfoItemRefine(npc, player)
    lualib:ShowForm(player, "精炼表单2")

    return ""
end

function FengYin(npc, player)
   lualib:ShowForm(player, "鉴定表单")

    return ""
end

function jinglianzhuanyi(npc, player)
   lualib:ShowForm(player, "精炼转移表单")

    return ""
end

function jingliangaibian(npc, player)
   lualib:ShowForm(player, "精炼改变表单")

    return ""
end


--介绍

function fengyinjiesao(npc , player)
   local msg = " #COLORCOLOR_RED#㊣#COLOREND##COLORCOLOR_GOLD#=================#COLOREND##COLORCOLOR_RED#装备解封说明#COLOREND##COLORCOLOR_GOLD#================#COLOREND##COLORCOLOR_RED#㊣#COLOREND#\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"

	msg = msg.."#OFFSET<X:0,Y:5>##COLORCOLOR_RED#㈠：#COLOREND##COLORCOLOR_ORANGE#封印解除可以让装备得到意想不到的属性！#COLOREND#\n"
	msg = msg.."#COLORCOLOR_RED#㈡：#COLOREND##COLORCOLOR_ORANGE#封印鉴定时最高可获得3条属性！#COLOREND#\n"
    msg = msg.."#OFFSET<X:0,Y:-2>##COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."　　　　　　　　　　　　　　　　　　　　　　　　#OFFSET<X:0,Y:2>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01* 返回>\n"
	return msg

end


function wuqishengjiinfo(npc,player)
    local msg = "                        武器升级说明\n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."普通升级：需要装备武器，包袱里必须有3块以上的黑铁矿石和相关首饰，1分钟后可领取武器进行试刀，失败武器会破碎！\n \n"
    msg = msg.."元宝升级：需要装备武器，包袱里必须有3块以上的黑铁矿石和相关首饰，1分钟后可领取武器进行试刀，升级100%成功！\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."　　　　　　　　　　　　　　　　　　　　　　　　#OFFSET<X:0,Y:2>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01* 返回>\n"
    return msg
end


--====================武器升级=====================


local iron = {
				["黑铁矿石1"] = 1, 
				["黑铁矿石2"] = 2, 
				["黑铁矿石3"] = 3, 
				["黑铁矿石4"] = 4, 
				["黑铁矿石5"] = 5, 
				["黑铁矿石6"] = 6,
				["黑铁矿石7"] = 7, 
				["黑铁矿石8"] = 8, 
				["黑铁矿石9"] = 9, 
				["黑铁矿石10"] = 10, 
				["黑铁矿石11"] = 11, 
				["黑铁矿石12"] = 12, 
				["黑铁矿石13"] = 13, 
				["黑铁矿石14"] = 14, 
				["黑铁矿石15"] = 15, 
			 }

local duration = 2
local gold = 10000
local Ingot = 5000

function duanzhao(npc, player, types)
	local msg = ""
	local types = tonumber(types)
	
	local s = {
				"普通升级时会将你手中的武器进行升级，需要花费10000金币，并且会使用掉你包袱中所有黑铁矿石和首饰，若升级失败你的武器会破碎！\n\n",
				"元宝升级时会将你手中的武器进行升级，需要花费5000元宝，并且会使用掉你包袱中所有黑铁矿石和首饰，升级100%成功！\n\n",
			}
	msg = msg..s[types]
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"
	msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@weapon_up#"..types.."  *01*「武器升级」>        #OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@back_weapon *01*「取回装备」>\n"
    msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n \n"

	msg = msg.."                                               #OFFSET<X:0,Y:5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end

function weapon_up(npc, player, types)
	local types = tonumber(types)
	if lualib:GetInt(player, "forge_flag") == 1 then
		return "你有一把武器正在升级中!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	local weapon = lualib:Player_GetItemGuid(player, lua_site_weapon)
	if weapon == "" then
		return "你没有装备武器!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	if lualib:GetInt(weapon, "forge_level") == 7 then
		return "你的这把武器已经升级到最高级了!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	if lualib:GetInt(weapon, "try_the_first") == 1 then
		return "你的武器请试刀后再升级！!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	
	local items = lualib:BagItemList(player, true, false, false)
	if #items == 0 then
		return "你包裹中没有道具!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	if types == 1 then
		if not lualib:Player_IsGoldEnough(player, gold ,false) then
			return "你的金币不足"..gold.."!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
		end
	elseif types == 2 then
		if not lualib:Player_IsIngotEnough(player, Ingot ,false) then
			return "你的元宝不足"..Ingot.."!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
		end
	end
	
	
	lualib:SetInt(player, "forge_purity", 0)
	local items_del = {}
	for _, v in pairs(items) do
		local keyname = lualib:KeyName(v)
		local atts = {}
		if lualib:Item_GetType(player, v) == 1 then
			local subtype = lualib:Item_GetSubType(player, v)
			if subtype == 3 or subtype == 8 or subtype == 9 then
				local xml_Tb = lualib:Item_DataRow(keyname)
				atts[1] = xml_Tb["MaxPhyAtk"]
				atts[2] = xml_Tb["MaxMagAtk"]
				atts[3] = xml_Tb["MaxTaoAtk"]
			end
		end
		
		local puri = iron[keyname]
		
		if #atts ~= 0 then
			lualib:SetInt(player, "forge_phyatk", lualib:GetInt(player, "forge_phyatk") + atts[1])
			lualib:SetInt(player, "forge_magatk", lualib:GetInt(player, "forge_magatk") + atts[2])
			lualib:SetInt(player, "forge_taoatk", lualib:GetInt(player, "forge_taoatk") + atts[3])
			items_del[#items_del + 1] = v
		end
		
		if puri ~= nil then
			--lualib:SetInt(player, "forge_purity", lualib:GetInt(player, "forge_purity") + puri)
			lualib:SetInt(player, "forge_purity", lualib:GetInt(player, "forge_purity") + 1)
			items_del[#items_del + 1] = v
		end
	end
	
	local phyatk = lualib:GetInt(player, "forge_phyatk")
	local magatk = lualib:GetInt(player, "forge_magatk")
	local taoatk = lualib:GetInt(player, "forge_taoatk")
	local purity = lualib:GetInt(player, "forge_purity")
	if phyatk == 0 and magatk == 0 and taoatk == 0 or purity < 3 then
		return "你没有首饰或者黑铁矿石不足3块以上!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	
	if types == 1 then
		if not lualib:Player_SubGold(player, gold, false, "扣金币: 装备升级", "装备大师") then
			return "扣除金币失败!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
		end
	else
		if not lualib:Player_SubIngot(player, Ingot, false, "扣元宝: 装备升级", "装备大师") then
			return "扣除金币失败!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
		end
	end
	
	for _, u in pairs(items_del) do
		lualib:Item_Destroy(player, u, "删除道具: 装备升级!", "装备大师")
	end
	
	local forge_level = lualib:GetInt(weapon, "forge_level")
	if types == 2 then
		lualib:SetInt(weapon, "up_type", 2)
	end
	lualib:SetInt(player, "forge_level", forge_level)

	local atklx = 1
	if phyatk < magatk then
		phyatk = magatk
		atklx = 2
	end
	
	if phyatk < taoatk then
		atklx = 3
	end
	
	lualib:SetInt(player, "forge_atklx", atklx)
	
	local now_time = lualib:GetAllTime()
	local end_time = now_time + duration
	lualib:SetInt(player, "forge_time", end_time)
	lualib:SetInt(player, "forge_flag", 1)
	lualib:SetInt(player, "forge_flag_luck", 5)
	
	local weapon_forged = lualib:Item2Json(weapon)
	lualib:SetStr(player, "weapon_forged", weapon_forged)
	lualib:Item_Destroy(player, weapon, "销毁道具: 升级", "装备大师")
	return "这把武器就交给我来升级，请1分钟之后前来领取!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
end


function back_weapon(npc, player)
	if lualib:GetInt(player, "forge_flag") ~= 1 then
		return "没有你的装备!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	if lualib:GetInt(player, "forge_flag_luck") ~= 5 then
		return "没有你的装备!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	if lualib:GetInt(player, "forge_time") > lualib:GetAllTime() then
		return "你的装备还在升级中，请1分钟之后前来领取!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
	
	local weapon_forged = lualib:GetStr(player, "weapon_forged")
	local weapon_new = lualib:Json2Item(player, weapon_forged)
	if weapon_new == "" then
		return "道具给予失败, 背包已满!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
	end
    if lualib:Item_GetType(player,weapon_new) == 1 then
        if lualib:Item_GetSubType(player,weapon_new) == 1 then
            local tabl = lualib:Equip_GetQualProp(player, weapon_new, 1)
            if tabl[1] ~= lualib:GetInt(player, "forge_level") then lualib:SetInt(weapon_new, "forge_level", tabl[1]) end
        end
    end
	
	local atklx = lualib:GetInt(player, "forge_atklx")
	local purity = lualib:GetInt(player, "forge_purity")
	
	lualib:SetInt(player, "forge_phyatk", 0)
	lualib:SetInt(player, "forge_magatk", 0)
	lualib:SetInt(player, "forge_taoatk", 0)
	lualib:SetInt(player, "forge_purity", 0)
	
	local name = lualib:Name(weapon_new)
	lualib:SetInt(weapon_new, "forge_level", lualib:GetInt(player, "forge_level") + 1)
	lualib:SetInt(weapon_new, "try_the_first", 1)

	lualib:SetInt(weapon_new, "forge_atklx", atklx)
	lualib:SetInt(weapon_new, "forge_purity", purity)
	lualib:Item_ChangeName(player, weapon_new, name.."*")
	lualib:SetInt(player, "forge_flag", 0)
	lualib:SetInt(player, "forge_flag_luck", 0)
	lualib:AddTrigger(player, lua_trigger_post_equip, "on_post_equip")
	lualib:AddTrigger(player, lua_trigger_post_un_equip, "on_post_un_equip")
	return "升级成功, 请大侠试刀!\n \n#IMAGE<ID:1902700019>#<@main *01* 返回>\n"
end

function on_post_equip(player, item)
	lualib:AddTimerEx(player, 935, 1000, 1, "on_post_equip_ex", item)
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
	local rate = {60, 60, 60, 60, 60, 60, 30, 10}
	skill_id = tonumber(skill_id)
	if skill_id == 25 and skill_key == "普通物理攻击" then
		local weapon = lualib:Player_GetItemGuid(player, lua_site_weapon)
		if lualib:GetInt(weapon, "try_the_first") == 1 then
			local forge_level = lualib:GetInt(weapon, "forge_level")
			local rand = lualib:GenRandom(1, 100)
            if lualib:GetInt(weapon, "up_type") == 2 then rand = 20 end
			--lualib:SysMsg_SendPromptMsg(player, ""..rand.."   "..rate[forge_level])
			if rand > rate[forge_level] then
				lualib:SysMsg_SendPromptMsg(player, "很遗憾, 你的"..string.sub(lualib:Name(weapon), 1, -2).."升级失败了!")
                lualib:Item_Destroy(player, weapon, "删除道具: 试刀爆装备", player)
			else
				local forge_atklx = lualib:GetInt(weapon, "forge_atklx")
				local forge_purity = lualib:GetInt(weapon, "forge_purity")
				
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
				local new_name = ""
												
				if forge_level == 1 then
					new_name = new_name.."Lv.1"
				else
					new_name = string.gsub(new_name, "Lv.%d", "Lv."..forge_level)
				end
				
                lualib:Item_ChangeName(player, weapon, name)
				lualib:Item_NotifyUpdate(player, weapon)
				
				lualib:SetInt(weapon, "try_the_first", 0)
				lualib:SetInt(weapon, "weapon_luck", 0)
				
				lualib:SysMsg_SendCenterMsg(1, "恭喜玩家【"..lualib:Name(player).."】的["..name.."]在土城装备大师处升级成功!", "")
				--lualib:SysMsg_SendBroadcastMsg("恭喜玩家【"..lualib:Name(player).."】的["..name.."]在土城装备大师处升级成功!", "系统通知")
				--lualib:SysMsg_SendBroadcastMsg("恭喜玩家【"..lualib:Name(player).."】的["..name.."]在土城装备大师处升级成功!", "系统通知")
				--lualib:SysMsg_SendBroadcastMsg("恭喜玩家【"..lualib:Name(player).."】的["..name.."]在土城装备大师处升级成功!", "系统通知")
			end
			lualib:RemoveTrigger(player, lua_trigger_spell, "try_the_first")
		end
	end
	return true
end

function leave(npc, player)
	return ""
end