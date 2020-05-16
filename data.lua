local _, AQSELF = ...

local merge = AQSELF.merge
local initSV = AQSELF.initSV


-- 棍子上的胡萝卜
AQSELF.carrot = 11122

-- 缓存胡萝卜换下的饰品
-- AQSELF.carrotBackup = 0

-- 常见的主动饰品id和buff持续时间数据
local buffTime = {}	
buffTime[19339] = 20                    -- 思维加速宝石
buffTime[19948] = 20                    -- 赞达拉饰品1
buffTime[19949] = 20                    -- 赞达拉饰品2
buffTime[19950] = 20                    -- 赞达拉饰品3
buffTime[18820] = 15                    -- 短暂能量护符
buffTime[19341] = 15                    -- 生命宝石
buffTime[11819] = 10                    -- 复苏之风
buffTime[20130] = 60                    -- 钻石水瓶
buffTime[19991] = 20                    -- 魔暴龙眼

buffTime[23040] = 20                    -- 偏斜雕文
buffTime[23041] = 20                    -- 屠龙者的纹章
buffTime[23046] = 20                    -- 萨菲隆的精华
buffTime[23047] = 30                    -- 亡者之眼

buffTime[21579] = 30                    -- 克苏恩的触须
buffTime[23042] = 20                    -- 洛欧塞布之影
buffTime[22954] = 15                    -- 蜘蛛之吻
buffTime[23001] = 20                    -- 衰落之眼
buffTime[23027] = 0                   	-- 宽恕的热情
buffTime[23558] = 20                    -- 穴居虫之壳
buffTime[23570] = 20                    -- 沙虫之毒

buffTime[21625] = 30                    -- 甲虫胸针
buffTime[21647] = 20                    -- 沙漠掠夺者塑像
buffTime[19336] = 10                    -- 奥术能量宝石
buffTime[19337] = 0                   	-- 黑龙之书
buffTime[19340] = 20                    -- 变形符文
buffTime[19342] = 20                    -- 毒性图腾
buffTime[19343] = 20                    -- 盲目光芒卷轴
buffTime[19344] = 20                    -- 自然之盟水晶
buffTime[19345] = 20                    -- 庇护者

buffTime[21670] = 30                    -- 虫群卫士徽章
buffTime[21685] = 60                    -- 石化甲虫
buffTime[21891] = 0                     	-- 坠落星辰碎片
buffTime[21473] = 30                    -- 莫阿姆之眼
buffTime[21488] = 30                    -- 虫刺塑像
buffTime[20636] = 15                    -- 休眠水晶
buffTime[19930] = 30                    -- 玛尔里之眼

buffTime[19947] = 15                    -- 纳特·帕格的卷尺
buffTime[21180] = 20                    -- 大地之击
buffTime[21181] = 0                     -- 大地之握
buffTime[19951] = 0                     -- 格里雷克的力量护符
buffTime[19952] = 15                    -- 格里雷克的勇气护符
buffTime[19953] = 0                     -- 雷纳塔基的野兽护符
buffTime[19954] = 0                     -- 雷纳塔基的狡诈护符
buffTime[19955] = 15                    -- 乌苏雷的自然护符
buffTime[19956] = 20                    -- 乌苏雷的灵魂护符
buffTime[19957] = 20                    -- 哈扎拉尔的毁灭护符
buffTime[19958] = 15                    -- 哈扎拉尔的治疗护符
buffTime[19959] = 20                    -- 哈扎拉尔的魔法护符

buffTime[20071] = 15                    -- 阿拉索护符
buffTime[20072] = 15                    -- 污染者护符
buffTime[22268] = 15                    -- 龙人能量徽章
buffTime[21326] = 0                     -- 木喉防御者

buffTime[22678] = 20                    -- 优越护符
buffTime[11832] = 10                    -- 博学坠饰
buffTime[19024] = 20                    -- 竞技场大师饰物	
buffTime[19990] = 20                    -- 祝福珠串	
buffTime[20503] = 24                    -- 被迷惑的水之魂		
buffTime[19992] = 10                    -- 魔暴龙牙		
buffTime[20512] = 25                    -- 神圣宝珠		
buffTime[20036] = 60                    -- 火焰宝石		
		
			
	
-- 工程
buffTime[18984] = 0			-- 冬泉谷传送器
buffTime[18986] = 0			-- 加基森传送器
buffTime[10577] = 3			-- 地精迫击炮
buffTime[13382] = 10                    -- 便携火炮
buffTime[16022] = 60                    -- 奥金机械幼龙
buffTime[10725] = 60			-- 侏儒作战小鸡
buffTime[10645] = 0                    	-- 侏儒死亡射线
buffTime[18634] = 5                     -- 超低温寒冰偏斜器
buffTime[18638] = 5                     -- 高辐射烈焰反射器
buffTime[18639] = 5                     -- 快速暗影反射器

-- 任务/掉落
buffTime[19141] = 0			-- 丝瓜
buffTime[17744] = 0			-- 诺克赛恩之心
buffTime[1404] = 3                      -- 潮汐咒符			
buffTime[2820] = 10                     -- 灵巧秒表
buffTime[14022] = 0                     -- 巴罗夫管家铃BL
buffTime[14023] = 0                     -- 巴罗夫管家铃LM

-- 主动饰品集合
AQSELF.usable = {}
AQSELF.pveSet = {}

for k,v in pairs(buffTime) do
	table.insert(AQSELF.pveSet, k)
end

AQSELF.buffTime = buffTime

-- 能主动使用的衣服

local chestBuffTime = {}
chestBuffTime[14152] = 0				-- 大法师之袍

-- 可使用的胸甲集合
AQSELF.usableChests = {}

for k,v in pairs(chestBuffTime) do
	table.insert(AQSELF.usableChests, k)
end

AQSELF.buffTime = merge(AQSELF.buffTime, chestBuffTime)

-- 角色身上和背包中所有饰品
AQSELF.trinkets = {}
AQSELF.chests = {}

-- 联盟、部落各个职业的徽记
AQSELF.pvpSet = {
	18854,18856,18857,18858,18859,18862,18863,18864,
	18834,18845,18846,18849,18850,18851,18852,18853
}

AQSELF.usable = merge(AQSELF.pveSet, AQSELF.pvpSet)

-- 徽记的buff时间都是0
for k,v in pairs(AQSELF.pvpSet) do
	AQSELF.buffTime[v] = 0
end

-- 记录当前角色的徽记
AQSELF.pvp = {}

-- 配置结束 --
