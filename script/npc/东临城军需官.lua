gQuestMap =
{
   {3001, "", "QuestAccomplish3001","", "*01*完成任务: 押镖"}
}
gQuestNum = table.getn(gQuestMap)

local EscorterAward = --交任务用
{
         --镖车颜色    ,                     ,镖车名字  ,广播,     奖励
    color_flag =
    {
        {"#COLORCOLOR_WHITE#", "#COLOREND#", "镖车·普", false, "镖酬(普)"},
        {"#COLORCOLOR_GREENG#", "#COLOREND#", "镖车·极", false, "镖酬(极)"},
        {"#COLORCOLOR_BLUE#", "#COLOREND#", "镖车·珍", false, "镖酬(珍)"},
        {"#COLORCOLOR_PURPLE#", "#COLOREND#", "镖车·绝", true, "镖酬(绝)"},
        {"#COLORCOLOR_GOLD#", "#COLOREND#", "镖车·神", true, "镖酬(神)"},
    },
    cur_color = "escort_color",--当前镖车颜色
}

local AwardList = --镖银兑换表
{
    escort_v = "escort_v",      --保存劫镖玩家镖银数量
    ["奖励"] = {
                    ["神羽"]         = {{"神羽",	        1,	10   },}, 
                    ["战神油"]       = {{"战神油",	        1,	10   },}, 
                    --[[["战斗神丹"]   = {
                                        {"怒攻神丹",	1,	1},
                                        {"怒法神丹",	1,	1},
                                        {"怒道神丹",	1,	1},
                                        {"力盾神丹",	1,	1},
                                        {"法盾神丹",	1,	1},
                                        {"怒血神丹",	1,	1},
                                        {"怒魔神丹",	1,	1},
                                        {"恢复神丹",	1,	1},
                    },]]
                }
}
--------------------------------------------------------------------------------
function EscorterAward:IsEscorterDied(player)
    if lualib:IsEscorterDied(player) then
        self:SetColor(player, 0)
        return true
    end
    return false
end

function EscorterAward:SetColor(player, color)
    lualib:SetInt(player, self.cur_color, color)
end

function EscorterAward:GetColor(player)
    return lualib:GetInt(player, self.cur_color)
end
--------------------------------------------------------------------------------
function main(npc, player)
    local msg = "    东临城面临着最大的怪物入侵危机，我这里急需各种物资，你能帮我从龙城运送一批过来吗？\n \n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."#OFFSET<X:0,Y:5>##IMAGE<ID:1902700033>##OFFSET<X:0,Y:-1>#<@EndEscort *01*「完成押镖」>\n"
    msg = msg.."#OFFSET<X:0,Y:1>##IMAGE<ID:1902700037>##OFFSET<X:0,Y:-1>#<@award *01*「镖银兑换」>\n"
    msg = msg.."#OFFSET<X:0,Y:1>##IMAGE<ID:1902700042>##OFFSET<X:0,Y:-1>#<@query *01*「查询镖银」>\n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE<ID:1902700034>##OFFSET<X:0,Y:-2>#<@likai *01*「离开」>\n"

		for i, v in ipairs(gQuestMap) do
        if v[2] ~= "" then
            if lualib:CanAcceptQuest(player, v[1]) == true then
                msg = msg.."<@"..v[2].." "..v[4]..">\n"
            end
        end

        if v[3] ~= "" then
            if lualib:CanAccomplishQuest(player, v[1]) == true then
                msg = msg.."<@"..v[3].." "..v[5]..">\n"
            end
        end
    end
    return msg
end

function EndEscort(npc, player)
    if EscorterAward:IsEscorterDied(player) then
        return "你没有领取镖车任务，休想蒙混过关！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end

    local cur_color = EscorterAward:GetColor(player)
    return "当前镖车为"..EscorterAward.color_flag[cur_color][1]
                            ..EscorterAward.color_flag[cur_color][3]
                            ..EscorterAward.color_flag[cur_color][2]..
            "你可以获得#COLORCOLOR_RED#"..EscorterAward.color_flag[cur_color][5]..
            "#COLOREND#。\n \n \n \n \n#OFFSET<X:0,Y:0>##IMAGE<ID:1902700033>##OFFSET<X:0,Y:-1>#<@Award#"..cur_color.."#"..EscorterAward.color_flag[cur_color][5]..
            " *01* 「领取」>\n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end

function Award(npc, player, color, item_key)
    local cur_color = tonumber(color)
    if not lualib:RemoveEscorter(player) then
        return "镖车"..EscorterAward.color_flag[cur_color][1]
                     ..EscorterAward.color_flag[cur_color][3]
                     ..EscorterAward.color_flag[cur_color][2].."离得太远！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@EndEscort *01*「返回」>"
    end

    if not lualib:AddItem(player, item_key, 1, true, "给物品：提交镖车任务", "东临城军需官") then
        return "给奖励"..item_key.."失败！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@EndEscort *01*「返回」>"
    end

    if EscorterAward.color_flag[cur_color][4] then
        lualib:SysMsg_SendCenterMsg(1, "恭喜玩家"..lualib:Name(player).."押送"
                     ..EscorterAward.color_flag[cur_color][3].."成功！", "")
    end
	--lualib:DropQuest(player, 7000)
	
	if lualib:HasQuest(player, 9001) == true then
		lualib:SetInt(player, "9001_q", 1)
	end	
	
    return "领取奖励成功！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end

function award(npc, player)
    local escort_v = lualib:GetInt(player, AwardList.escort_v)
    local msg = "当前镖银为："..escort_v.."   请选择你要兑换的道具：\n#COLORCOLOR_RED#小提示：镖银兑换物品的时候，除兑换所得物品外，每兑换1点镖银还可额外获得300金币！\n"
	msg = msg.."#COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    for k, v in pairs(AwardList["奖励"]) do
        msg = msg.."#OFFSET<X:0,Y:1>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@exchange#"..k.." *01*「"..k.."」>\n"
    end
    
    msg = msg.."#OFFSET<X:0,Y:-8>##COLORCOLOR_BROWN#▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂#COLOREND#\n"
    msg = msg.."                                            #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    return msg
end

function exchange(npc, player, key)
    if AwardList["奖励"][key] == nil then return "你兑换的道具"..key.."不存在！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>" end
    
    local msg = ""
    for _, v in pairs(AwardList["奖励"][key]) do
        msg = msg.."兑换#COLORCOLOR_PURPLE#"..v[2].."个"..v[1].."#COLOREND#需要#COLORCOLOR_RED#"..v[3].."点镖银#COLOREND#\n \n \n \n \n"
		msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@exchangeEx#"..v[2].."#"..v[1].."#"..v[3].." *01*「兑换」>\n \n"
	end
    
    msg = msg.."                                            #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@award *01*「返回」>"
    return msg
end

function exchangeEx(npc, player, item_count, item_key, item_consume)
    
    local escort_v = lualib:GetInt(player, AwardList.escort_v)
    if escort_v < tonumber(item_consume) then
        return "你的镖银不足！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-4>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@award *01*「返回」>"
    end
    
    lualib:SetInt(player, AwardList.escort_v, escort_v - tonumber(item_consume))
    
    local key = {}
    key[1] = item_key
    local count = {}
    count[1] = tonumber(item_count)
    local bind = {}
    bind[1] = 0
    local opr = {}
    opr[1] = 0
    
    if not lualib:Player_ItemRequest(player, key, count, bind, opr, "给物品：镖银兑换东西", "东临城军需官") then
        return "物品兑换失败！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-4>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@award *01*「返回」>"
    end
    
    lualib:Player_AddGold(player, tonumber(item_consume) * 300, false, "给金币：镖银兑换东西", "东临城军需官")
    
    return "物品兑换成功！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-4>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@award *01*「返回」>"
end

function query(npc, player)
    local escort_v = lualib:GetInt(player, AwardList.escort_v)
    return "你当前镖银数量为："..escort_v.."！\n \n \n \n \n \n \n                                            #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end
----3001交
function QuestAccomplish3001(npc, player)
    msg = "勇士，你对人类的贡献将载入史册，东临城正需要大量的军需物资，赶快再运些来吧！\n \n"
    msg = msg.."<@Accomplish3001 *01* 我会的！>\n"
    return msg
end

function Accomplish3001(npc, player)
    if lualib:AccomplishQuest(player, 3001, 0) == true then
        msg = "请记住，一切为了人类！你的功绩我会记下，这是你这次押镖的奖励！\n \n"
		msg = msg.."<@leave *01*多谢>\n"
		return msg
    else
        msg = "哪里出错了？\n \n"
		msg = msg.."<@leave *01*继续努力>\n"
		return msg
    end
end

function likai(npc,player)
	return ""
end