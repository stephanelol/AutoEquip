local _, AQSELF = ...

-- 复制table的数据，而不是引用
AQSELF.clone =  function(org)
    local function copy(org, res)
        for k,v in pairs(org) do
            if type(v) ~= "table" then
                res[k] = v;
            else
                res[k] = {};
                copy(v, res[k])
            end
        end
    end
 
    local res = {}
    copy(org, res)
    return res
end

-- 合并两个数组
AQSELF.merge = function(...)
    local tabs = {...}
    if not tabs then
        return {}
    end
    local origin = tabs[1]
    for i = 2,#tabs do
        if origin then
            if tabs[i] then
                for k,v in pairs(tabs[i]) do
                    table.insert(origin,v)
                end
            end
        else
            origin = tabs[i]
        end
    end
    return origin
end

-- 去掉重复的值
AQSELF.diff =  function( t1, t2 )
    local new = {}

    for i,v in ipairs(t1) do
        if not tContains(t2, v) then
            table.insert(new, v)
        end
    end

    return new
end

-- 调试函数
AQSELF.debug = function( t )
    if not AQSELF.enableDebug then
        return
    end

    if type(t) == "table" then
        for k,v in pairs(t) do
            print("@DEBUG: ",k.." =>"..tostring(v))
        end
    else
        print("@DEBUG: ",t)
    end
end

AQSELF.initSV = function( v, init )
    if v == nil then

        if type(init) == "table" then
            local t = AQSELF.clone(init)
            return t
        end

        v = init
    end
    return v
end

AQSELF.GetItemLink = function( id )
    local _, link = GetItemInfo(id)
    return link
end

AQSELF.GetItemTpye = function( id )
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(id)
    return itemEquipLoc
end

AQSELF.GetItemTexture = function( id )
    local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(id)
    return itemTexture
end