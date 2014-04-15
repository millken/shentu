local lua_path = lualib:IO_GetLuaPath()
local package_path = package.path
package.path = string.format("%s;%s?.lua;%s?", package_path, lua_path, lua_path)
require("system/logic_def_lua")
local killer = ""

function on_create(npc)
	killer = lualib:GetTempStr(npc, "killer")
end


--Map_GetRegionPlayersEx
function main(npc, player)
	local max_level = lualib:GetTempInt(killer, "max_lv")
	local add_ext = lualib:GetTempInt(killer, "add_exp")
    local msg = "我有踩到你的物品么？那么不好意思，他归我了。\n"
    msg = msg.."靠近篝火可以获得烤火经验，这堆篝火还可以继续燃烧#COLORCOLOR_YELLOW#" .. lualib:GetTempInt(killer, "GH") .. "秒#COLOREND#\n"
    msg = msg.."烤火规则：需要玩家站在篝火#COLORCOLOR_RED#2步以内#COLOREND#\n"
    msg = msg.."篝火品质：该篝火支持#COLORCOLOR_BROWN#" .. max_level .. "级以下#COLOREND#玩家烤火得经验。\n"
    msg = msg.."篝火经验：该篝火每秒提供#COLORCOLOR_GOLD#" .. add_ext .. "点经验#COLOREND#给周围符合条件的玩家。\n\n"
    msg = msg.."#COLORCOLOR_RED#酒力烤火：借助酒力烤火可以获得多倍烤火经验。#COLOREND#\n"
    msg = msg.."#COLORCOLOR_YELLOW#女儿红 - 双倍烤火  五年女儿红 - 三倍烤火  十年女儿红- 四倍烤火#COLOREND#\n"
    msg = msg.."女儿红：在小贩处可以购买得到女儿红，陈年女儿红需要在商城中购买。\n"
    return msg
end

