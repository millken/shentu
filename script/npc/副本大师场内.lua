local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("include/消息提示")


function on_create(npc)
	lualib:AddTimer(npc, 1, 500, 1, "on_timer")
	lualib:AddTimer(npc, 2, 1000*60*29, 1, "over_msg")
end


function over_msg(npc,timer_id)
		lualib:SysMsg_SendRoleTalk(npc, "本副本还剩余最后一分钟挑战时间，请抓紧时间挑战并领奖，否则您将无法获得最终奖励。")
end

function on_timer(npc, timer_id)
	
	lualib:SetStr(npc,"start_time",lualib:Now())

end


local ranges = {1, 0, 0, 100, 100}
local limit_level = {0,0,0,0,0,0,0,0,48,52,55,58,0}

function main(npc,player)
    local map = lualib:MapGuid(npc)
    local monsters = lualib:Map_GetRegionMonstersEx(map, "", ranges, true, true)
    local msg = ""
          msg = msg .. "注意：副本共生存30分钟，30分钟后如果副本没有挑战完毕那么您将被强制送回龙城安全区。\n"
          msg = msg .. "开始时间："..lualib:GetStr(npc,"start_time").."\n"
          msg = msg .. "当前时间："..lualib:Now().."\n"
          msg = msg .. "本副本共计12关，每关清理所有怪物后可以[领奖并继续挑战下一关]，每3关会出现一只BOSS。\n\n"


--code 记录关数，点击挑战时记录
          if #monsters > 0 then
                msg = msg .. "当前关卡：第"..lualib:GetInt(map,"code").."关\n"
                msg = msg .."怪物没有清理完毕，请加把劲！\n"
          else
			local next_floor = lualib:GetInt(map,"code") + 1
			if lualib:Level(player) < limit_level[next_floor] then
                msg = msg .. "等级条件不够，进入下一关需要" .. limit_level[next_floor] .. "级\n"
				return msg
			end
             if lualib:GetInt(map,"code") < 1 then
                msg = msg .. "<@start *01*[现在开始挑战]>\n"
             else
                msg = msg .. "当前关卡：第"..lualib:GetInt(map,"code").."关\n"
                if lualib:GetInt(map,"code") < 12 then
                   msg = msg .. "<@start *01*[领奖并继续挑战下一关]>\n"
                else
                   msg = msg .. "<@start *01*[领奖并返回龙城]>\n"
                end
             end
          end

    return msg
end

local awardexp = {
	["古剑神庙副本"] = {10000,20000,30000,40000,50000,60000,70000,80000,90000,100000,110000,120000},
	["礼盒奖励"] = {"", "", "", "", "", "", "", "", "初级镇塔礼盒", "地狱镇塔礼盒", "魔界镇塔礼盒", "天界镇塔礼盒"},
}




local mon = {
["古剑神庙副本"] = {
{{"尸卫1",5},{"爬尸1",5},{"腐尸1",5},{"幽冥尸王",1}},   
{{"鬼面监工1",5},{"尸奴1",5},{"尸奴工头1",5},{"超级尸奴1",1}},
{{"刀奴1",5},{"古怪刀客1",5},{"巨蛾",5},{"精英鬼面刀手1",1}},
{{"影刺1",3},{"天原死士1",3},{"天原勇士1",3},{"超级影刺1",2},{"超级天原死士1",2}},
{{"天魔奴仆1",3},{"天魔妖蟒1",3},{"天魔守卫1",3},{"精英天魔妖蟒1",2},{"精英天魔守卫1",2}},    
{{"石甲鱼1",5},{"铁棘鱼1",5},{"铁螯怪1",5},{"海魔护卫1",2}},
{{"巨钳蟹1",5},{"秘境海妖1",5},{"秘境歌妖1",5},{"海魔侍从1",2}},
{{"赤炎地狱血虫1",5},{"赤炎斗士1",5},{"赤炎祭祀1",5},{"赤炎护卫1",1}},
{{"天魔奴仆1",3},{"天魔妖蟒1",3},{"天魔守卫1",3},{"精英天魔妖蟒1",2},{"精英天魔守卫1",2},{"赤炎地狱血虫1",5},{"赤炎斗士1",5},{"赤炎祭祀1",5},{"赤炎护卫1",1}},
{{"地狱统领",1},{"赤炎斗士1",2},{"赤炎祭祀1",2}},
{{"魔界统帅",1},{"天魔奴仆1",3}},
{{"嗜血神龙",1}},    },
}

function start(npc,player)
    local map = lualib:MapGuid(npc)
    local key = lualib:KeyName(map)
    local monsters = lualib:Map_GetRegionMonstersEx(map, "", ranges, true, true)
    if #monsters > 0 then
       return "怪物没有清理完毕，请加把劲！\n"
    end
    if lualib:GetInt(npc,"over") ~= 0 then
       return "本副本已经完成，请返回龙城。"
    end
    local code = lualib:GetInt(map,"code")
    if code >= 1 and lualib:GetInt(npc,"over") == 0 then
       lualib:AddExp(player,awardexp[key][code],"副本奖励",player)
	   if awardexp["礼盒奖励"][code] ~= "" then
		lualib:AddItem(player, awardexp["礼盒奖励"][code],1,false,"礼盒奖励", player)
			lualib:SysMsg_SendTriggerMsg(player, "【领奖】：通关["..key.."]第"..code.."关，获得：".. awardexp["礼盒奖励"][code])
			lualib:SysMsg_SendCenterMsg(1, "恭喜 [".. lualib:Name(player) .."] 在古剑神塔获得【".. awardexp["礼盒奖励"][code].."】","")
		end
       Player_ShowMsg(player, "【领奖】：通关["..key.."]第"..code.."关，获得经验："..awardexp[key][code], "YELLOW")
    end
    if lualib:GetInt(map,"code") >= 12 then
        lualib:SetInt(npc,"over",1)
	lualib:Player_MapMoveXY(player,"龙城", 238, 230, 3)
        Player_ShowMsg(player, "【副本】：恭喜你已经成功完成一次["..key.."]", "YELLOW")
       return ""
    end
    --刷怪语句
    local num = code + 1
    for i = 1 , #mon[key][num] do
        lualib:Map_BatchGenCampMonster(map, mon[key][num][i][1], mon[key][num][i][2], false, 2)
    end
    lualib:SetInt(map,"code",lualib:GetInt(map,"code")+1)
    return ""
end