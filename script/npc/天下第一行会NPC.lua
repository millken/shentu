--[[
天下第一行会NPC
加入行会：达到条件的可以直接入会
我要竞标：以元宝形式竞标，价高者则为天下第一会
管理竞标：只有行会长可以竞标，输入元宝进行竞标
]]--
local Family = 
{
	bid = "天下第一行会:竞标者",
	time = "天下第一行会:竞标时间",
	name = "天下第一行会:名称",
	level = "天下第一行会:等级",
	ingot = "天下第一行会:元宝数",
}
function getBidName() 
	local bid_player = Family:GetBidPlayer()
	if bid_player ~= "" then
		return Family:GetName(bid_player)
	end
	return ""
end
function getBidLevel() 
	local bid_player = Family:GetBidPlayer()
	if bid_player ~= "" then
		return Family:GetLevel(bid_player)
	end
	return 0
end

function getBidIngot() 
	local bid_player = Family:GetBidPlayer()
	if bid_player ~= "" then
		return Family:GetIngot(bid_player)
	end
	return 0
end

function getBidTime() 
	local bid_player = Family:GetBidPlayer()
	if bid_player ~= "" then
		return Family:GetTime(bid_player)
	end
	return ""
end
function Family:SetBidPlayer(player)
	 return lualib:SetDBStr(self.bid, player)
end
function Family:GetBidPlayer()
	 return lualib:GetDBStr(self.bid)
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
	local msg = "天下第一会招兵买马\n"
	msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n \n \n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700015##OFFSET<X:0,Y:-1>#<@JoinFamily *01*【加入行会】>\n "
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@JoinBid *01* 【我要竞标】>\n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700015##OFFSET<X:0,Y:-3>#<@ManageBid *01*【管理竞标】>\n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700034##OFFSET<X:0,Y:-4>#<@RefreshStatus *01* 【刷新状态】>\n"
	return msg
end

function JoinFamily(npc, player)
	return ""
end

function ManageBid(npc, player)
	return ""
end

function RefreshStatus(npc, player)
	return ""
end

function JoinBid( npc, player)
	local msg = "#COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND##COLORCOLOR_SKYBLUE#【 说 明 】#COLOREND##COLORCOLOR_BROWN#━━━━━━━━━━━━#COLOREND#\n"
	msg = msg.." 土城天下第一行会,可以代替掌门招收会员竞标方式:采用元宝竞标，只要你给出的价格高于上一个行会的竞标价格，你的行会就可以中标，直到下一位竞争对手出现.\n"
	msg = msg.." 当前竞标行会:" .. getBidName() .. "\n竞标价格: " .. getBidIngot()  .. "元宝\n竞标时间: " .. getBidTime() .. "\n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700015##OFFSET<X:0,Y:-3>#<@JoinBidStart *01*【竞标开始】>\n"
	msg = msg.." #OFFSET<X:0,Y:-4>##IMAGE1902700034##OFFSET<X:0,Y:-4>#<@main *01* 【返回】>\n"
	return msg
end
function JoinBidStart(npc, player)
        if lualib:Player_IsGuildLeader(player) == false then
            return "对不起，你不是行会掌门！\n "
       end
	local family_name = lualib:GetFamilyName(player)

	local ingot = 1 + getBidIngot()
	if not lualib:Player_IsIngotEnough(player,  ingot, false) then
	    return "元宝不足"
	end
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