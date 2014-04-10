--[[
天下第一行会NPC
加入行会：达到条件的可以直接入会
我要竞标：以元宝形式竞标，价高者则为天下第一会
管理竞标：只有行会长可以竞标，输入元宝进行竞标
]]--
local npc_name = "天下第一行会NPC"
local Family = 
{
	bid = "天下第一行会:竞标者",
	time = "天下第一行会:竞标时间",
	name = "天下第一行会:名称",
	level = "天下第一行会:等级",
	ingot = "天下第一行会:元宝数",
}
function getBidName() 
	return lualib:GetDBStr(Family.name)
end
function getBidLevel() 
	return  lualib:GetDBNum(Family.level)
end

function getBidIngot() 
	return lualib:GetDBNum(Family.ingot)
end

function getBidTime() 
	return lualib:GetDBStr(Family.time)
end

function Family:SetName(player, str)
    return lualib:SetStr(player, self.name, str)
end

function Family:GetName(player)
    return lualib:GetStr(player, self.name)
end

function Family:SetLevel(player, level)
    return lualib:SetInt(player, self.level, level)
end
function Family:GetLevel(player)
    return lualib:GetInt(player, self.level)
end

function Family:SetTime(player)
	local a = lualib:GetAllTime()
	local timeStr = lualib:Time2Str("%Y-%m-%d %H:%M", a)
    return lualib:SetStr(player, self.time, timeStr)
end
function Family:GetTime(player)
    return lualib:GetStr(player, self.time)
end

function Family:SetIngot(player, num)
    return lualib:SetInt(player, self.ingot, num)
end
function Family:GetIngot(player)
    return lualib:GetInt(player, self.ingot)
end

function main(npc, player)
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#天下第一会招兵买马#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━#COLOREND#\n"
	msg = msg .. "【当前行会】：#COLORCOLOR_BLUE#" .. getBidName() .. "#COLOREND#\n"
	msg = msg .. "【当前价格】：#COLORCOLOR_BLUE#" .. getBidIngot() .. "元宝#COLOREND#\n"
	msg = msg .. "【入会等级】：#COLORCOLOR_BLUE#" .. getBidLevel() .. "#COLOREND#\n"
	msg = msg .. "【竞标时间】：#COLORCOLOR_BLUE#" .. getBidTime() .. "#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."#OFFSET<X:0,Y:-4>#　#COLORCOLOR_GRAY#╔──────╗　╔──────╗　╔──────╗#COLOREND#\n"
	msg = msg.."　#COLORCOLOR_GRAY#│#COLOREND#<@JoinFamily *01*「加入行会」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│　│#COLOREND#<@JoinBid *01*「我要竞标」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│　│#COLOREND#<@ManageBid *01*「管理竞标」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│#COLOREND#\n"
	msg = msg.."　#COLORCOLOR_GRAY#╚──────╝　╚──────╝　╚──────╝#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-10>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."                                #OFFSET<X:0,Y:0>##IMAGE1902700034##OFFSET<X:0,Y:-1>#<@leave *01*「离开」>\n"

	return msg
end
function leave(npc, player)
	return ""
end
function JoinFamily(npc, player)
	local bidname = getBidName() 
	if bidname == "" then
		return "当前没有竞标行会！"
	end
	if not lualib:HasFamily(bidname) then 
		return "行会已不存在：" .. bidname .. ""
	end
	if lualib:GetFamilyName(player)  ~= "" then
		return "[失败]:您已经有行会了。无法申请! 请先退出你当前的行会！"
	end
	if lualib:Level(player) < getBidLevel() then
	    return "入会等级不够！"
	end
	if lualib:AddFamilyMember(player, bidname, "", "") then
		return "恭喜你已经成功加入到【" .. bidname .. "】"
	end
	return "加入行会失败"
end

function ManageBid(npc, player)
        if lualib:Player_IsGuildLeader(player) == false then
            return "对不起，你不是行会掌门！\n "
       end
       if lualib:SysMsg_SendInputDlg(player, 201404102245, "请输入加入行会的等级,当前设置为" .. Family:GetLevel(player) .. ": ", 30, 12, "ManageBidConfirm", npc) == false then
        return "忙着呢，你过会儿再来吧\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:0,Y:1>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    return ""
end

function ManageBidConfirm(id, player, level, npc)
	level = tonumber(level)
	Family:SetLevel(player, level)
	if lualib:GetFamilyName(player) == getBidName() then
		lualib:SetDBNum(Family.level, level)
	end
	lualib:NPCTalkEx(npc, player, "设置等级成功")
end
function RefreshStatus(npc, player)
	return ""
end

function JoinBid( npc, player)
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#【 说 明 】#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND#\n"
	msg = msg.." 土城天下第一行会,可以代替掌门招收会员竞标方式:采用元宝竞标，只要你给出的价格高于上一个行会的竞标价格，你的行会就可以中标，直到下一位竞争对手出现.\n\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.." <@JoinBidStart *01*【竞标开始】>                              #OFFSET<X:0,Y:-1>#<@main *01* 【返回】>\n"
	return msg
end
function JoinBidStart(npc, player)
        if lualib:Player_IsGuildLeader(player) == false then
            return "对不起，你不是行会掌门！\n "
       end

	local ingot = 1 + getBidIngot()
	if not lualib:Player_IsIngotEnough(player,  ingot, false) then
	    return "元宝不足"
	end
    if lualib:SysMsg_SendInputDlg(player, 201404101946, "请输入竞标的元宝数量: ", 30, 12, "JoinBidConfirm", npc) == false then
        return "忙着呢，你过会儿再来吧\n \n \n \n \n \n \n \n \n                                                #OFFSET<X:0,Y:1>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    return ""
end

function JoinBidConfirm(id, player, ingot, npc)
	ingot = tonumber(ingot)
	if not lualib:Player_IsIngotEnough(player,  ingot, false) then
		lualib:NPCTalkEx(npc, player, "扣除元宝失败，当前元宝不足")
	    return 
	end
	local family_name = lualib:GetFamilyName(player)
	if lualib:Player_SubIngot(player, ingot, false, "竞标天下第一行会", npc_name) then
		 Family:SetName(player, family_name)
		 --Family:SetLevel(player, 0)
		 Family:SetTime(player)
		 Family:SetIngot(player, ingot)
		 lualib:SetDBStr(Family.name, family_name)
		 lualib:SetDBNum(Family.ingot, ingot)
		 lualib:SetDBNum(Family.level, Family:GetLevel(player))
		 lualib:SetDBStr(Family.time, Family:GetTime(player))
		 lualib:NPCTalkEx(npc, player, "竞标成功")
		 return 
	end
	lualib:NPCTalkEx(npc, player, "竞标失败")
	return 
end

--[[
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#古墓夺宝#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND#\n"
	msg = msg.."　　来自于异位面的强者，在神战期间遭遇了天藏大陆残酷的阻击，无数人先后葬身于此。他们带来了灾难，同时也留下了各种奇妙的所在。在龙城附近开启的一所古墓，在盗墓者间有这么一个传言，据说里面藏有巨量的宝藏！\n"
        msg = msg.."#OFFSET<X:0,Y:-6>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."#OFFSET<X:0,Y:-4>#　#COLORCOLOR_GRAY#╔──────╗　╔──────╗　╔──────╗#COLOREND#\n"
	msg = msg.."　#COLORCOLOR_GRAY#│#COLOREND#<@jump *01*「进入挑战」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│　│#COLOREND#<@info *01*「活动介绍」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│　│#COLOREND#<@leave *01*「我不敢去」>#OFFSET<X:-2,Y:0>##COLORCOLOR_GRAY#│#COLOREND#\n"
	msg = msg.."　#COLORCOLOR_GRAY#╚──────╝　╚──────╝　╚──────╝#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-10>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."                                #OFFSET<X:0,Y:0>##IMAGE1902700034##OFFSET<X:0,Y:-1>#<@leave *01*「离开」>\n"

	return msg
]]--