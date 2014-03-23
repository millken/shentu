local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
require("system/serializer")
require("system/master")

gQuestMap =
{
   {1019, "", "QuestAccomplish1019","", "*01*完成任务: 师徒"},
   {1020, "QuestAccept1020", "","01*任务: 商品寄售", ""}
}
gQuestNum = table.getn(gQuestMap)

local talk_t = {"你不知道怎么玩？那就拜个师吧。", "收徒弟不仅是为了指导他们修炼，更重要的是可以获得勋章奖励。", "拜师收徒可以认识更多的朋友，与他们一起游戏。"}

function on_create(npc)
	lualib:AddTimer(npc, 1, 250000, -1, "on_timer_talk")
end

function on_timer_talk(npc, timer_id)
	
		lualib:SysMsg_SendRoleTalk(npc, talk_t[lualib:GenRandom(1, #talk_t)])

end

function main(npc, player)
    local msg = "    有一种人孜孜好学，苦求不断；有一种人谆谆善诱，好为人师。当他们相遇，将造就一个动人的传说。这就是师与徒！我是师徒的见证人，你想拜师还是收徒？\n"
     msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700017#<@AddRelation *01*「我要拜师」                   >#IMAGE1902700017#<@RemoveRelation *01*「解除师徒关系」>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700031##OFFSET<X:2,Y:0>#<@GainMasterRewarda *01*「领取师徒奖励」               >#OFFSET<X:-1,Y:0>##IMAGE1902700042#<@duihuaa *01*「师徒查询」>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##IMAGE1902700037##OFFSET<X:2,Y:-1>#<@duihuab *01*「声望兑换」                   >#OFFSET<X:1,Y:2>##IMAGE1902700017##OFFSET<X:-2,Y:0>#<@AddRelationa *01*「我要了解拜师」>\n"
     msg = msg.."#OFFSET<X:0,Y:2>##OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	 msg = msg.."                                                #OFFSET<X:0,Y:0>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@likai *01*「离开」>\n"

	for i, v in ipairs(gQuestMap) do
        if v[2] ~= "" then
            if lualib:CanAcceptQuest(player, v[1]) == true then
                msg = msg.."#OFFSET<X:0,Y:-8>##IMAGE1902700016#<@"..v[2].." "..v[4]..">\n \n"
            end
        end

        if v[3] ~= "" then
            if lualib:CanAccomplishQuest(player, v[1]) == true then
                msg = msg.."#OFFSET<X:0,Y:-8>##IMAGE1902700016#<@"..v[3].." "..v[5]..">\n \n"
            end
        end
    end
--    msg = msg.."<@AddRelation *01*我要拜师>\n"
--    msg = msg.."<@RemoveRelation *01*解除师徒关系>\n"
--    msg = msg.."<@GainMasterReward *01*领取师傅奖励>\n"
--    msg = msg.."<@GainApprenticeReward *01*领取徒弟奖励>\n"
--    msg = msg.."<@ShowMaster *01*查看师傅>\n"
--    msg = msg.."<@ShowApprentice *01*查看徒弟>\n"
--    msg = msg.."<@DestroyData *01*清数据>\n"
--	msg = msg.."<@duihuan *01*声望兑换>\n"
    return msg
end


function duihuaa(npc, player)
    local msg = "你可以在我这里查询你的师傅或者徒弟的名字\n"
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."#IMAGE1902700042##OFFSET<X:0,Y:-1>#<@ShowMaster *01*查询我的师傅                        >#OFFSET<X:0,Y:1>##IMAGE1902700042##OFFSET<X:0,Y:-1>#<@ShowApprentice *01*查询我的徒弟>\n"
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n \n \n"
     msg = msg.."                                         #OFFSET<X:0,Y:6>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
    return msg
end

function AddRelationa(npc, player)
    local msg = "#COLORCOLOR_ORANGE#拜师说明:#COLOREND#\n"
     msg = msg.."#COLORCOLOR_RED#⑴：#COLOREND#徒弟的等级必须小于45级才能拜师傅。\n"
     msg = msg.."#COLORCOLOR_RED#⑵：#COLOREND#师傅的等级必须大于等于45级才能收徒弟。\n"
     msg = msg.."#COLORCOLOR_RED#⑶：#COLOREND#达到条件后，由徒弟发起拜师请求，输入要拜的师父昵称。\n"
     msg = msg.."#COLORCOLOR_RED#⑷：#COLOREND#师父在线收到徒弟的请求并回应后，达成师徒关系。\n"
     msg = msg.."#COLORCOLOR_RED#⑸：#COLOREND#一个师父最多同时可以收5个徒弟。\n"
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:-3>##IMAGE1902700017#<@AddRelation *01*「我要拜师」                           >#OFFSET<X:0,Y:3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
    return msg
end

function GainMasterRewarda(npc, player)
    local msg = "#COLORCOLOR_ORANGE#师徒奖励说明:#COLOREND#\n"
     msg = msg.."#COLORCOLOR_RED#⑴：#COLOREND#达成师徒关系后，徒弟在30级之后每升1级，师父都会获得\n"
     msg = msg.."　　相应的声望奖励，直到出师为止！\n"
     msg = msg.."#COLORCOLOR_RED#⑵：#COLOREND#徒弟52级出师，师父可在师徒管理员获得领取恩师礼包机会\n"
     msg = msg.."#COLORCOLOR_RED#⑶：#COLOREND#徒弟可在达到35级、40级、45级时在师徒管理员领取徒弟奖\n"
     msg = msg.."　　励。\n"
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainMasterReward *01*「领取师傅奖励」                   >#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward *01*「领取徒弟奖励」>\n"
	 msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."                                        #OFFSET<X:-3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end

-----兑换
function duihuab(npc, player)
	local shengwang = get_shengwang(player)
       local msg = "　　如果您收有徒弟，那么在你徒弟38级之后每升1级，您作为师父都会获得相应的声望奖励，直到出师为止！您利用声望可以在我这里兑换各种勋章提升您的能力！\n"
        msg = msg.."#OFFSET<X:0,Y:-5>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
        msg = msg.."#OFFSET<X:0,Y:-4>#你当前的声望值为 【"..shengwang.."】，想兑换那种勋章？\n"
        msg = msg.."#OFFSET<X:0,Y:-4>##COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
	msg = msg.."#OFFSET<X:0,Y:-5>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_a *01*兑换「恩师勋章」>    兑换#COLORCOLOR_GOLD#「恩师勋章」#COLOREND#需要800点声望值\n"
	msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_b *01*兑换「王师勋章」>    兑换#COLORCOLOR_GOLD#「王师勋章」#COLOREND#需要2000点声望值\n"
    msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_d *01*兑换「三神勋章」>    兑换#COLORCOLOR_GOLD#「三神勋章」#COLOREND#需要10000点声望值\n"
--	msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@xunzhang_c *01*兑换「其他物品」>    \n"
	msg = msg.."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end

function xunzhang_a(npc,player)
	msg = "兑换“恩师勋章”需要800点声望值，你确定兑换吗？\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_a *01*确定>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*「返回」>\n"
	return msg
end

function queding_a(npc, player)
    local shengwang = get_shengwang(player)
	print(shengwang)
    if shengwang < 800 then
        return "你的声望值不足800，不能兑换！\n \n \n \n \n \n \n                                                  #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再来兑换！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end
        
    local award_item = "恩师勋章"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    
    set_shengwang(player, shengwang - 800)
    
    return award_item.."「兑换」成功！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
end

function xunzhang_b(npc,player)
	msg = "兑换“王师勋章”需要2000点声望值，你确定兑换吗？\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_b *01*确定>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*「返回」>\n"
	return msg
end

function queding_b(npc, player)
    local shengwang = get_shengwang(player)
	
    if shengwang < 2000 then
        return "你的声望值不足2000，不能兑换！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再来兑换！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
        
    local award_item = "王师勋章"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    
    set_shengwang(player, shengwang - 2000)
    
    return award_item.."「兑换」成功！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
end

function xunzhang_d(npc,player)
	msg = "兑换“三神勋章”需要10000点声望值，你确定兑换吗？\n \n \n \n \n"
	msg = msg.."#OFFSET<X:0,Y:-4>##IMAGE1902700033##OFFSET<X:0,Y:-1>#<@queding_d *01*确定>\n \n"
	msg = msg.."                                                  #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuab *01*「返回」>\n"
	return msg
end

function queding_d(npc, player)
    local shengwang = get_shengwang(player)
    if shengwang < 10000 then
        return "你的声望值不足10000，不能兑换！\n \n \n \n \n \n \n                                                  #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>\n"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再来兑换！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end
        
    local award_item = "三神勋章"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    
    set_shengwang(player, shengwang - 10000)
    
    return award_item.."「兑换」成功！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
end

local sw_item_list = {
							{"审判", 0, "审判"},
							{"审判", 10, "审判"},
							{"审判", 10, "审判"},
							{"审判", 10, "审判"},
							{"审判", 10, "审判"},
							{"审判", 10, "审判"},
						}
function xunzhang_c(npc, player)
	local msg = "你想兑换什么？\n\n"
	for i = 1, #sw_item_list do
		msg = msg.."<@queding_c#"..i.." *01*「"..sw_item_list[i][1].."」>"
		msg = msg.."    "
	end
	msg = msg.."\n                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end

function queding_c(npc, player, index)
	local index = tonumber(index)
	local msg = "兑换"..sw_item_list[index][1].."需要"..sw_item_list[index][2].."点声望值，你确定兑换？\n"
	msg = msg.."<@swduihuan#"..index.. " *01*「确定兑换」>"
	msg = msg.."\n                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"
	return msg
end


function swduihuan(npc, player, index)
	local shengwang = get_shengwang(player)
	local index = tonumber(index)
	if shengwang < sw_item_list[index][2] then
		return "你的声望值不足"..sw_item_list[index][2].."点，无法兑换！"
	end
	
	if not lualib:Player_GiveSingleItem(player, sw_item_list[index][3], 0, "师徒奖励："..sw_item_list[index][3], lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
	
	
	if lualib:Player_GetBagFree(player) < 1 then
		return "你的背包不足，请整理后兑换！"
	end
	
	set_shengwang(player, shengwang - sw_item_list[index][2])
	return sw_item_list[index][1].."「兑换」成功！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function AddRelation(npc, player)
    if get_master_name(player) ~= "" then
        return "你已经有师傅了\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end
    
    local LIMIT_LEVEL = 45    
    if lualib:Player_GetIntProp(player, lua_role_level) >= LIMIT_LEVEL then
        return "你已经过了拜师的等级\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end
    
    if lualib:SysMsg_SendInputDlg(player, 1, "请输入师傅名字：", 30, 14, "InputMasterName", "") == false then
        return "忙着呢，你过会儿再来吧\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end
    
    return ""
end

function InputMasterName(id, player, master_name)
    local apprentice = player
    local apprentice_name = lualib:Player_GetStrProp(apprentice, lua_role_user_name)
    local master = lualib:Player_GetGuid(master_name)
    
    if master == "" then
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."不在线。")
        return 
    end
    
    if lualib:Player_GetDistance(apprentice, master) >= 10 then
        lualib:SysMsg_SendTriggerMsg(apprentice, "咦，我没看到"..master_name.."在这里啊。")
        return
    end
        
    local LIMIT_LEVEL = 45    
    if lualib:Player_GetIntProp(master, lua_role_level) < LIMIT_LEVEL then
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."等级不足!")
        return 
    end
    
    lualib:SysMsg_SendMsgDlg(master, 1, "你确定要接受"..apprentice_name.."为你的徒弟？#BUTTON0#确定#BUTTONEND##BUTTON1#取消#BUTTONEND#", 30, "on_master_ack", apprentice_name)
end

function on_master_ack(dlg_id, player, button_id, param)
    local master = player
    local master_name = lualib:Player_GetStrProp(master, lua_role_user_name)
    local apprentice_name = param
    local apprentice = lualib:Player_GetGuid(apprentice_name)
    
    if apprentice == "" then
        lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."不在附近!")
		return
    end
    
    if button_id == 0 then
        if get_master_name(apprentice) ~= "" then
            lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."已经有师傅了!")
            return
        end
    
        if get_apprentice_num(master) >= 5 then
            lualib:SysMsg_SendTriggerMsg(master, "您的徒弟已满!")
            lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."徒弟已满!")
            return
        end
        
        add_apprentice(master, apprentice, apprentice_name)
        set_master_name(apprentice, master_name)
        
        lualib:SysMsg_SendTriggerMsg(master, apprentice_name.."成了你的徒弟")
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."成了你的师傅")
    else
        lualib:SysMsg_SendTriggerMsg(apprentice, master_name.."拒绝了您的拜师请求!")
    end
end

function RemoveRelation(npc, player)
       local msg = "#COLORCOLOR_RED#⑴：#COLOREND#如果您觉得现在的徒弟品行不好，偷懒耍滑，可以将他逐出\n"
        msg = msg.."　　师门。\n"
        msg = msg.."#COLORCOLOR_RED#⑵：#COLOREND#如果您觉得现在的师傅师德不佳，想改投他门，或者想恢复\n"
        msg = msg.."　　自由之身，请选择退出师门\n"
        msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
        msg = msg.."#IMAGE1902700037##OFFSET<X:0,Y:-1>#<@DropApprentice *01*「逐出师门」                           >#OFFSET<X:0,Y:1>##IMAGE1902700037##OFFSET<X:0,Y:-1>#<@DropMaster *01*「退出师门」>\n"
        msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
        msg = msg.."                                            #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    return msg
end

function DropMaster(npc, player)
    local master_name = get_master_name(player)
    
    if master_name == "" then
        return "你没有师傅\n \n \n \n \n \n \n".."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end

    msg = "叛离师门需要缴纳5W金币, 你确定欺师灭祖吗？\n \n \n \n \n \n"
    msg = msg.."#OFFSET<X:0,Y:-5>##IMAGE1902700033##OFFSET<X:0,Y:-2>#<@DropMasterConfirm#"..master_name.." *01*确认>\n"
    msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*返回首页>\n"

    return msg
end

--徒弟离开师父需要缴纳5W金币。
function DropMasterConfirm(npc, player, master_name)
    local is_bind = false
    local gold = 50000
    if not lualib:Player_IsGoldEnough(player, gold, is_bind) then 
        return "您的金币不足"..gold.."！\n \n \n \n \n \n \n                                           #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>" 
    end

    if not lualib:Player_SubGold(player, gold, is_bind, "扣金币：欺师灭祖", master_name) then 
        return "扣除金币失败！\n \n \n \n \n \n \n                                           #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>" 
    end

    local apprentice = player
    local apprentice_name = lualib:Player_GetStrProp(apprentice, lua_role_user_name)

    set_master_name(apprentice, "")
    lualib:SysMsg_SendCenterMsg(1, apprentice_name.." 欺师灭祖, 脱离 "..master_name.." 自立门户啦!", "")
    
    lualib:ScriptFuncToPlayer(master_name, "师徒", "on_apprentice_drop_master", apprentice.."#"..apprentice_name)
    
    return ""
end

function on_apprentice_drop_master(player, apprentice, apprentice_name)
    remove_apprentice(player, apprentice)
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--师傅奖励
function GainMasterReward(npc, player)
    local master_reward_count = get_master_reward_count(player)
    if master_reward_count <= 0 then
    local msg = "没有任何奖励可以领取\n \n \n \n \n \n"
    msg = msg.."                                           #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>" 
        return msg
    end
    
    msg = "您还有"..master_reward_count.."次奖励可以领取\n"
    msg = msg.."#OFFSET<X:0,Y:0>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainMasterRewardOne *01*「领取」>\n" 
    msg = msg.."                                           #OFFSET<X:0,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>" 

    return msg
end

function GainMasterRewardOne(npc, player)
    local master_reward_count = get_master_reward_count(player)
    if master_reward_count <= 0 then
        return
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再领取！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
        
    local award_item = "恩师礼包"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
    end
    
    set_master_reward_count(player, master_reward_count - 1)
    
    return award_item.."「领取」成功！\n \n \n \n \n \n \n                                                      #OFFSET<X:0,Y:-3>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回」>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
--徒弟奖励
function GainApprenticeReward(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
--  local msg = "<@GainApprenticeReward25 *01*「领取25级奖励」>\n" 

    local msg = "如果你已经拜师，在你达到#COLORCOLOR_RED#「35级」「40级」 「45级」#COLOREND#的时候可以来我这里领取各种奖励哦\n"
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."#IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward35 *01*「领取35级奖励」>\n#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward40 *01*「领取40级奖励」>\n#OFFSET<X:0,Y:1>##IMAGE1902700031##OFFSET<X:0,Y:-1>#<@GainApprenticeReward45 *01*「领取45级奖励」>\n" 
     msg = msg.."#COLORCOLOR_BROWN#────────────────────────────#COLOREND#\n"
     msg = msg.."　　　                                         #OFFSET<X:0,Y:-5>##IMAGE<ID:1902700019>##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>\n"

    return msg
end

function GainApprenticeReward25(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --未出师 等级不够 领过了
    if last_master_name == "" and  master_name == "" then
        return "你还未拜师或等级不足，不能领取\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end
    
    if level < 25 then
        return "目前您的等级未超过25级\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end
    
    if apprentice_reward >= 25 then
        return "您已经领过25级奖励了\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end
    
    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再领取！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end
        
    local award_item = "25级徒弟礼包"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
    end
    
    set_apprentice_reward(player, 25)
    
    return award_item.."「领取」成功！\n \n \n \n \n \n#IMAGE1902700019#<@main *01*「返回」>"
end

function GainApprenticeReward35(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --未拜师 等级不够 领过了
    if master_name == "" and last_master_name == "" then
        return "你没有拜过师！无法领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    if level < 35 then
        return "目前您的等级未超过35级\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回首页」>"
    end
    
    if apprentice_reward >= 35 then
        return "您已经领过35级奖励了\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
        
    local award_item = "出师礼包"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    set_apprentice_reward(player, 35)
    
    return award_item.."「领取」成功！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
end

function GainApprenticeReward40(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --未拜师 等级不够 领过了
    if master_name == "" and last_master_name == "" then
        return "你没有拜过师！无法领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    if level < 40 then
        return "目前您的等级未超过40级\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    if apprentice_reward >= 40 then
        return "您已经领过40级奖励了\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
        
    local award_item = "出师礼包"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    set_apprentice_reward(player, 40)
    
    return award_item.."「领取」成功！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
end

function GainApprenticeReward45(npc, player)
    local apprentice = player
    local master_name = get_master_name(apprentice)
    local last_master_name = get_last_master_name(apprentice)
    local apprentice_reward = get_apprentice_reward(apprentice)
    local level = lualib:Player_GetIntProp(player, lua_role_level)
    
    --未拜师 等级不够 领过了
    if master_name == "" and last_master_name == "" then
        return "你没有拜过师！无法领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    if level < 45 then
        return "目前您的等级未超过45级\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    if apprentice_reward >= 45 then
        return "您已经领过45级奖励了\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end

    if lualib:Player_GetBagFree(player) < 1 then
        return "对不起，你的背包已经满了，请清理背包后再领取！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
        
    local award_item = "出师礼包"
    if not lualib:Player_GiveSingleItem(player, award_item, 0, "师徒奖励："..award_item, lualib:Npc_GetKeyName(npc)) then
        return "「领取」失败！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
    end
    
    set_apprentice_reward(player, 45)
    
    return award_item.."「领取」成功！\n \n \n \n \n \n \n                                               #OFFSET<X:3,Y:0>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@GainApprenticeReward *01*「返回」>"
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function DropApprentice(npc, player)
    if get_apprentice_num(player) <= 0 then
        return "您没有徒弟\n \n \n \n \n \n \n".."                                            #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end

    local app_t = get_apprentices(player)
    msg = "徒弟列表\n"
    
    for k, v in pairs(app_t) do
        msg = msg.."#OFFSET<X:0,Y:1>##IMAGE1902700034##OFFSET<X:0,Y:-2>#<@DropApprenticeOne#"..k.."#"..v.." *01*"..v..">\n"
		msg = msg.."                                            #OFFSET<X:0,Y:1>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"
    end

    return msg
end

--师父开除徒弟需要缴纳10W金币
function DropApprenticeOne(npc, player, apprentice, apprentice_name)
    msg = "缴纳10W金币, 确定将 "..apprentice_name.." 逐出师门?\n \n \n \n \n \n"
    msg = msg.."#OFFSET<X:0,Y:1>##IMAGE1902700033##OFFSET<X:0,Y:-2>#<@DropApprenticeOneConfirm#"..apprentice.."#"..apprentice_name.." *01*确认>\n"
    msg = msg.."                                              #OFFSET<X:0,Y:-5>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>"

    return msg
end

function DropApprenticeOneConfirm(npc, player, apprentice, apprentice_name)
    local is_bind = false
    local gold = 100000
    if not lualib:Player_IsGoldEnough(player, gold, is_bind) then 
        return "您的金币不足"..gold.."！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-4>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>" 
    end

    if not lualib:Player_SubGold(player, gold, is_bind, "扣金币：逐出师门", apprentice_name) then 
        return "扣除金币失败！\n \n \n \n \n \n \n                                              #OFFSET<X:0,Y:-4>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@main *01*「返回首页」>" 
    end
    
    local master = player
    local master_name = lualib:Player_GetStrProp(master, lua_role_user_name)

    lualib:SysMsg_SendCenterMsg(1, apprentice_name.." 被 "..master_name.."逐出师门!", "")
    remove_apprentice(master, apprentice)
    lualib:ScriptFuncToPlayer(apprentice_name, "师徒", "on_master_drop_apprentice", master.."#"..master_name)

    return ""
end

function on_master_drop_apprentice(player, master, master_name)
    local cur_master_name = get_master_name(player)
    if cur_master_name == master_name then
        set_master_name(player, "")
    end
end

------------------------------------------------------------------------------
------------------------------------------------------------------------------
function ShowMaster(npc, player)
    local master_name = get_master_name(player)
    if master_name == "" then
        return "您没有师傅".."\n \n \n \n \n \n                                         #OFFSET<X:0,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuaa *01*「返回」>"
    end
    
    return master_name
end

function ShowApprentice(npc, player)
    if get_apprentice_num(player) <= 0 then
        return "您没有徒弟".."\n \n \n \n \n \n                                         #OFFSET<X:0,Y:7>##IMAGE1902700019##OFFSET<X:0,Y:-2>#<@duihuaa *01*「返回」>"
    end

    local app_t = get_apprentices(player)
    msg = "徒弟列表\n"
    
    for k, v in pairs(app_t) do
        msg = msg.."<@ShowApprenticeOne *01*"..v..">\n"
    end

    return msg
end

function ShowApprenticeOne(npc, player)
    return ""
end

function DestroyData(npc, player)
    set_master_name(player, "")
    lualib:Player_SetCustomVarStr(player, "apprentices", "")
    set_last_master_name(player, "")
    
    set_shengwang(player, 0)
    set_chushi(player, 0)
    set_master_reward_count(player, 0)
    set_apprentice_reward(player, 0)
        
    return "师徒数据清理成功"
end

--------1019交

function QuestAccomplish1019(npc, player)
    msg = "如果你在45级以下，可以选择拜师，如果你已经达到45级，可以选择收徒。找一个师傅，可以帮助自己更多的了解这个世界。而收徒，可以让自己获得大量的声望值，声望值可以在我这里兑换勋章！你是要拜师，还是收徒呢？\n \n"
    msg = msg.."#IMAGE1902700017# <@Accomplish1019 *01* 拜师收徒还有这等好处，我考虑一下>\n"
    return msg
end


function Accomplish1019(npc, player)
    if lualib:AccomplishQuest(player, 1019, 0) == true then
        msg = "对了，有位了不起的商人开了一家交易行，据说可以委托所有交易，去看看吧！\n \n"
		msg = msg.."#IMAGE1902700017# <@Accept1020 *01* 去找寄售商人>\n"
		return msg
    else
        msg = "任务失败\n \n"
		msg = msg.."<@Lever *01*我知道了>\n"
		return msg
    end
end

-------1020接
function QuestAccept1020(npc,player)
    msg = "对了，有位了不起的商人开了一家交易行，据说可以委托所有交易，去看看吧！\n \n"
	msg = msg.."#IMAGE1902700017# <@Accept1020 *01* 我这就去>\n"
	return msg
end

function Accept1020(npc, player)
    if lualib:AcceptQuest(player, 1020) == true then
        return "与#COLORCOLOR_GREENG# #NPCLINK<STR:寄售商人,NPCID:1022>##COLOREND#对话了解寄售系统。"
    else
        return "任务接取失败"
    end
end

function likai(npc, player)
	return""
end