--
-- SQL Test Data Initialization Script
--

-- =================================================================
-- 1. 用户数据 (User Data)
-- 从 AUTO_INCREMENT=101 开始添加20个新用户用于测试。
-- =================================================================
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `email`, `type`, `status`, `activation_code`, `header_url`, `create_time`)
VALUES (101, 'zhangsan', '65255a08c4972fe88ef1197a97c8941d', 'abcde', 'zhangsan@example.com', 0, 1, '', 'http://images.nowcoder.com/head/101t.png', DATE_SUB(NOW(), INTERVAL 100 DAY)),
       (102, 'lisi', 'ac5eb7be3404b48b15db8a22af20f479', 'fghij', 'lisi@example.com', 0, 1, '', 'http://images.nowcoder.com/head/102t.png', DATE_SUB(NOW(), INTERVAL 99 DAY)),
       (103, 'wangwu', '4e7aefb4ae05ec8d327fe174f4239d65', 'klmno', 'wangwu@example.com', 0, 1, '', 'http://images.nowcoder.com/head/103t.png', DATE_SUB(NOW(), INTERVAL 98 DAY)),
       (104, 'zhaoliu', 'ad2c2033d855f30b4157f6631edd7fbe', 'pqrst', 'zhaoliu@example.com', 2, 1, '', 'http://images.nowcoder.com/head/104t.png', DATE_SUB(NOW(), INTERVAL 97 DAY)),
       (105, 'sunqi', 'f2b9bab8badf6582951c61059d55bd57', 'uvwxy', 'sunqi@example.com', 0, 1, '', 'http://images.nowcoder.com/head/105t.png', DATE_SUB(NOW(), INTERVAL 96 DAY)),
       (106, 'zhouba', '28251cc5cf2b85d2e8b2563d1b029e5b', 'z0123', 'zhouba@example.com', 0, 1, '', 'http://images.nowcoder.com/head/106t.png', DATE_SUB(NOW(), INTERVAL 95 DAY)),
       (107, 'wujiu', '4ebb8d890f5d3c8c60923e591f75b9b6', '45678', 'wujiu@example.com', 0, 1, '', 'http://images.nowcoder.com/head/107t.png', DATE_SUB(NOW(), INTERVAL 94 DAY)),
       (108, 'zhengshi', 'a6a9792eb7d98a2a32cae35a1403ff77', '9abcd', 'zhengshi@example.com', 0, 1, '', 'http://images.nowcoder.com/head/108t.png', DATE_SUB(NOW(), INTERVAL 93 DAY)),
       (109, 'fengshiyi', '45cdd8af5acc1efaeef352f9c0b6926a', 'efghi', 'fengshiyi@example.com', 0, 1, '', 'http://images.nowcoder.com/head/109t.png', DATE_SUB(NOW(), INTERVAL 92 DAY)),
       (110, 'chenshier', '1bf952c89b6e3961d62c07fcb8679e9f', 'jklmn', 'chenshier@example.com', 0, 1, '', 'http://images.nowcoder.com/head/110t.png', DATE_SUB(NOW(), INTERVAL 91 DAY)),
       (111, 'system', 'b9374bead83cfe5e4c203ef1ed3f7bf0', 'opqrs', 'system@example.com', 1, 1, '', 'http://images.nowcoder.com/head/111t.png', DATE_SUB(NOW(), INTERVAL 200 DAY)),
       (112, 'moderator', '7a79608f218e5808b8f8e2287f228ded', 'tuvwx', 'moderator@example.com', 2, 1, '', 'http://images.nowcoder.com/head/112t.png', DATE_SUB(NOW(), INTERVAL 150 DAY)),
       (113, 'testuser1', '76bc76bd16fee3d20f08a788da57a5b8', 'yz012', 'testuser1@example.com', 0, 0, '', 'http://images.nowcoder.com/head/113t.png', DATE_SUB(NOW(), INTERVAL 80 DAY)),
       (114, 'testuser2', 'b063a214de80e9575e2c7a6c0a023fd6', '34567', 'testuser2@example.com', 0, 1, '', 'http://images.nowcoder.com/head/114t.png', DATE_SUB(NOW(), INTERVAL 70 DAY)),
       (115, 'newbie', '40bb010e336ba7ed507a44d59a968655', '89abc', 'newbie@example.com', 0, 1, '', 'http://images.nowcoder.com/head/115t.png', DATE_SUB(NOW(), INTERVAL 60 DAY)),
       (116, 'pro_gamer', 'bc02a6544707e7d1fa309c9e8e6c2207', 'defgh', 'progamer@example.com', 0, 1, '', 'http://images.nowcoder.com/head/116t.png', DATE_SUB(NOW(), INTERVAL 50 DAY)),
       (117, 'music_lover', '9dd1f4ef3403286849d32958424297c6', 'ijklm', 'musiclover@example.com', 0, 1, '', 'http://images.nowcoder.com/head/117t.png', DATE_SUB(NOW(), INTERVAL 40 DAY)),
       (118, 'travel_fan', '54da77d12e7b61add02b1bc7dffdc5bc', 'nopqr', 'travelfan@example.com', 0, 1, '', 'http://images.nowcoder.com/head/118t.png', DATE_SUB(NOW(), INTERVAL 30 DAY)),
       (119, 'foodie', 'b9061d5f89e1b6e4eab71fa439f1a3ff', 'stuvw', 'foodie@example.com', 0, 1, '', 'http://images.nowcoder.com/head/119t.png', DATE_SUB(NOW(), INTERVAL 20 DAY)),
       (120, 'admin', '4a368b79f33bb801f3c406a8a1ffa93f', 'xyz01', 'admin@example.com', 1, 1, '', 'http://images.nowcoder.com/head/120t.png', DATE_SUB(NOW(), INTERVAL 300 DAY));

-- =================================================================
-- 2. 帖子数据 (Discuss Post Data)
-- 生成40篇帖子，包含不同用户、类型和状态。
-- `user_id` 在 `discuss_post` 表中是 varchar 类型，这里存入 user.id 的数字字符串。
-- =================================================================
INSERT INTO `discuss_post` (`id`, `user_id`, `title`, `content`, `type`, `status`, `create_time`, `comment_count`, `score`)
VALUES (1, '101', '新人报到！', '大家好，我是刚来的张三，请多关照！', 0, 0, DATE_SUB(NOW(), INTERVAL 80 DAY), 0, RAND() * 100),
       (2, '102', '【置顶】论坛规章制度', '请各位坛友遵守本论坛规章制度，共同维护一个和谐的交流环境。详情请见正文...', 1, 0, DATE_SUB(NOW(), INTERVAL 79 DAY), 0, RAND() * 100),
       (3, '103', '关于Spring Boot项目启动失败的问题求助', '我的Spring Boot项目启动时报了一个错：`java.lang.NoClassDefFoundError`，检查了依赖都是好的，求大神指点！', 0, 0, DATE_SUB(NOW(), INTERVAL 78 DAY), 0, RAND() * 100),
       (4, '104', '【精华】MySQL性能优化终极指南', '本文将从索引、查询优化、服务器配置等多个方面深入探讨MySQL性能优化的技巧与实践。', 0, 1, DATE_SUB(NOW(), INTERVAL 75 DAY), 0, RAND() * 100),
       (5, '105', '今天天气真好啊', '外面阳光明媚，适合出去走走。', 0, 0, DATE_SUB(NOW(), INTERVAL 74 DAY), 0, RAND() * 100),
       (6, '116', '游戏区交流帖', '有没有一起玩《赛博朋克2077》的？交流一下心得体会。', 0, 0, DATE_SUB(NOW(), INTERVAL 73 DAY), 0, RAND() * 100),
       (7, '119', '深夜食堂：新加坡美食探店分享', '最近去了一家超棒的海南鸡饭，地址在...', 0, 0, DATE_SUB(NOW(), INTERVAL 72 DAY), 0, RAND() * 100),
       (8, '110', '求一份Vue3的学习路线', '本人前端小白，想系统学习一下Vue3，求大佬们给一份靠谱的学习路线或资源。', 0, 0, DATE_SUB(NOW(), INTERVAL 71 DAY), 0, RAND() * 100),
       (9, '108', '这个BUG谁能帮我看看？', '（内容已被拉黑）', 0, 2, DATE_SUB(NOW(), INTERVAL 70 DAY), 0, RAND() * 100),
       (10, '117', '分享一首最近单曲循环的歌', '最近一直在听Taylor Swift的《Lover》，旋律太美了。', 0, 0, DATE_SUB(NOW(), INTERVAL 69 DAY), 0, RAND() * 100),
       (11, '101', 'Java中的多线程怎么学最高效？', '感觉多线程这块知识点又多又杂，有什么好的书籍或者视频推荐吗？', 0, 0, DATE_SUB(NOW(), INTERVAL 65 DAY), 0, RAND() * 100),
       (12, '102', '【精华】Docker入门到实践', '这是一篇面向初学者的Docker教程，从安装到部署一个web应用，手把手教学。', 0, 1, DATE_SUB(NOW(), INTERVAL 64 DAY), 0, RAND() * 100),
       (13, '118', '计划下个月去云南旅游，求攻略！', '准备去大理和丽江，大概一周时间，求去过的朋友分享一下行程和注意事项。', 0, 0, DATE_SUB(NOW(), INTERVAL 60 DAY), 0, RAND() * 100),
       (14, '115', '弱弱地问一下，i++ 和 ++i 有什么区别？', '面试被问到了，当时没答上来，好尴尬。', 0, 0, DATE_SUB(NOW(), INTERVAL 58 DAY), 0, RAND() * 100),
       (15, '104', '【版主操作】关于近期违规用户的处理公告', '根据论坛规定，已对用户 “xxx” 进行封禁处理，希望大家引以为戒。', 0, 0, DATE_SUB(NOW(), INTERVAL 55 DAY), 0, RAND() * 100),
       (16, '119', '自制麻辣小龙虾，味道绝了！', '附上独家菜谱，想学的朋友看过来。', 0, 0, DATE_SUB(NOW(), INTERVAL 50 DAY), 0, RAND() * 100),
       (17, '103', '已解决：关于Spring Boot项目启动失败的问题', '感谢各位大佬的帮助，问题解决了，是scope搞错了，我把解决过程贴出来，希望能帮到后来人。', 0, 0, DATE_SUB(NOW(), INTERVAL 48 DAY), 0, RAND() * 100),
       (18, '116', '下个版本的《原神》前瞻分析', '根据目前放出的消息，我来预测一下新角色和新地图...', 0, 0, DATE_SUB(NOW(), INTERVAL 45 DAY), 0, RAND() * 100),
       (19, '101', '吐槽一下今天上班的经历', '真的是太无语了...', 0, 0, DATE_SUB(NOW(), INTERVAL 40 DAY), 0, RAND() * 100),
       (20, '111', '【系统公告】服务器将于今晚2点进行维护', '预计维护时间为2小时，期间论坛将无法访问，请大家提前做好准备。', 1, 0, DATE_SUB(NOW(), INTERVAL 38 DAY), 0, RAND() * 100),
       (21, '106', '学习Python需要哪些前置知识？', '我是零基础，可以直接学Python吗？还是需要先学C语言之类的？', 0, 0, DATE_SUB(NOW(), INTERVAL 35 DAY), 0, RAND() * 100),
       (22, '107', '大家平时都用什么IDE写代码？', '我个人用VS Code最多，感觉插件生态太强大了。', 0, 0, DATE_SUB(NOW(), INTERVAL 33 DAY), 0, RAND() * 100),
       (23, '114', '一个关于人生选择的思考', '三十岁了，是该留在大城市继续奋斗，还是回老家安稳度日？', 0, 0, DATE_SUB(NOW(), INTERVAL 30 DAY), 0, RAND() * 100),
       (24, '118', '晒一下旅行拍的照片', '', 0, 0, DATE_SUB(NOW(), INTERVAL 28 DAY), 0, RAND() * 100),
       (25, '120', '【管理员】欢迎新版主上任', '欢迎用户 @zhaoliu (id: 104) 成为本版版主，希望大家多多支持！', 0, 0, DATE_SUB(NOW(), INTERVAL 25 DAY), 0, RAND() * 100),
       (26, '101', '有没有好的算法刷题网站推荐？', '除了LeetCode还有别的吗？', 0, 0, DATE_SUB(NOW(), INTERVAL 22 DAY), 0, RAND() * 100),
       (27, '105', '今天捡到一只小猫', '很可爱，但是不知道怎么办，有没有好心人想收养？', 0, 0, DATE_SUB(NOW(), INTERVAL 20 DAY), 0, RAND() * 100),
       (28, '119', '新加坡哪里有好吃的辣椒螃蟹？', '求推荐！要地道的那种！', 0, 0, DATE_SUB(NOW(), INTERVAL 18 DAY), 0, RAND() * 100),
       (29, '102', '【精华】Redis五种基本数据类型详解', 'String, Hash, List, Set, ZSet，一篇文章带你搞懂！', 0, 1, DATE_SUB(NOW(), INTERVAL 15 DAY), 0, RAND() * 100),
       (30, '116', 'Steam夏季促销开始了！', '兄弟们，准备好剁手了吗？晒晒你们的购物车！', 0, 0, DATE_SUB(NOW(), INTERVAL 12 DAY), 0, RAND() * 100),
       (31, '103', '如何优雅地处理Java中的空指针异常？', '除了到处写 if (obj != null)，还有什么更好的方法吗？比如Optional类？', 0, 0, DATE_SUB(NOW(), INTERVAL 10 DAY), 0, RAND() * 100),
       (32, '117', '推荐一部最近看的电影《沙丘2》', '视觉效果和配乐都太震撼了，没看过的赶紧去看！', 0, 0, DATE_SUB(NOW(), INTERVAL 8 DAY), 0, RAND() * 100),
       (33, '109', '公司要用React，我只会Vue，要怎么快速上手？', '求经验分享，两个框架差异大吗？', 0, 0, DATE_SUB(NOW(), INTERVAL 7 DAY), 0, RAND() * 100),
       (34, '114', '找工作好难啊', '海投了几百份简历，一个面试通知都没有，心态崩了。', 0, 0, DATE_SUB(NOW(), INTERVAL 5 DAY), 0, RAND() * 100),
       (35, '101', '大家来聊聊自己的第一份工作', '我的第一份工作是...', 0, 0, DATE_SUB(NOW(), INTERVAL 4 DAY), 0, RAND() * 100),
       (36, '115', '如何将一个项目部署到云服务器上？', '买了个阿里云服务器，但是不知道怎么把我的Java项目跑起来，求教程。', 0, 0, DATE_SUB(NOW(), INTERVAL 3 DAY), 0, RAND() * 100),
       (37, '118', '计划国庆去日本，签证好办吗？', '最近有没有办过的朋友，分享一下经验。', 0, 0, DATE_SUB(NOW(), INTERVAL 2 DAY), 0, RAND() * 100),
       (38, '119', '周末去哪儿玩？', '求推荐新加坡周末好去处。', 0, 0, DATE_SUB(NOW(), INTERVAL 1 DAY), 0, RAND() * 100),
       (39, '108', 'test post to be deleted', 'This is a test.', 0, 0, NOW(), 0, 0),
       (40, '104', '【置顶】技术区发帖规范', '为了方便大家交流，请在技术区发帖时遵循以下规范...', 1, 0, NOW(), 0, 50);

-- =================================================================
-- 3. 评论数据 (Comment Data)
-- 为帖子生成评论和回复。
-- `entity_type` = 1 代表评论对象是帖子 (discuss_post)
-- `target_id` = 0 代表是直接评论帖子
-- `target_id` > 0 代表回复某个用户 (值为被回复用户的ID)
-- `status` = 0 代表评论正常
-- =================================================================
INSERT INTO `comment` (`user_id`, `entity_type`, `entity_id`, `target_id`, `content`, `status`, `create_time`)
VALUES (102, 1, 3, 0, '楼主贴一下完整的报错信息看看？', 0, DATE_SUB(NOW(), INTERVAL 77 DAY)),
       (104, 1, 3, 0, '是不是Maven的scope设置成provided了？', 0, DATE_SUB(NOW(), INTERVAL 77 DAY)),
       (101, 1, 3, 102, '完整的日志太长了，关键就是那一句。', 0, DATE_SUB(NOW(), INTERVAL 76 DAY)),
       (101, 1, 3, 104, '我检查了，pom.xml里依赖都是默认的compile scope。', 0, DATE_SUB(NOW(), INTERVAL 76 DAY)),
       (112, 1, 3, 101, '建议你 `mvn clean install` 之后再试试，有时候是缓存问题。', 0, DATE_SUB(NOW(), INTERVAL 75 DAY)),
       (103, 1, 3, 112, '试过了，还是不行。', 0, DATE_SUB(NOW(), INTERVAL 75 DAY)),
       (110, 1, 3, 0, '可能是依赖冲突，你用 `mvn dependency:tree` 看看有没有版本不一致的jar包。', 0, DATE_SUB(NOW(), INTERVAL 74 DAY)),
       (103, 1, 3, 110, '好主意，我查查看！', 0, DATE_SUB(NOW(), INTERVAL 74 DAY)),
       (101, 1, 4, 0, '感谢分享，太干货了！', 0, DATE_SUB(NOW(), INTERVAL 74 DAY)),
       (102, 1, 4, 0, '收藏了！慢慢看。', 0, DATE_SUB(NOW(), INTERVAL 74 DAY)),
       (115, 1, 4, 0, '写得真好，虽然我现在还看不太懂，先马后看。', 0, DATE_SUB(NOW(), INTERVAL 73 DAY)),
       (104, 1, 4, 101, '不客气，能帮到大家就好。', 0, DATE_SUB(NOW(), INTERVAL 73 DAY)),
       (110, 1, 4, 0, '大佬牛逼！索引那块讲得特别清楚！', 0, DATE_SUB(NOW(), INTERVAL 72 DAY)),
       (101, 1, 7, 0, '求具体地址！看着就饿了。', 0, DATE_SUB(NOW(), INTERVAL 71 DAY)),
       (118, 1, 7, 0, '这家我也去过，确实不错！', 0, DATE_SUB(NOW(), INTERVAL 71 DAY)),
       (119, 1, 7, 101, '地址在Maxwell Food Centre，摊位号是#01-10。', 0, DATE_SUB(NOW(), INTERVAL 70 DAY)),
       (101, 1, 7, 119, '多谢！这个周末就去！', 0, DATE_SUB(NOW(), INTERVAL 70 DAY)),
       (109, 1, 8, 0, '同求，现在网上资料太杂了。', 0, DATE_SUB(NOW(), INTERVAL 70 DAY)),
       (112, 1, 8, 0, '先看官方文档，然后找个实战项目跟着做，比如B站上就有很多。', 0, DATE_SUB(NOW(), INTERVAL 69 DAY)),
       (110, 1, 8, 112, '官方文档+1，永远是第一手资料。', 0, DATE_SUB(NOW(), INTERVAL 68 DAY)),
       (101, 1, 14, 0, '简单来说，a = i++ 是先赋值再自增， a = ++i 是先自增再赋值。', 0, DATE_SUB(NOW(), INTERVAL 57 DAY)),
       (102, 1, 14, 101, '楼上正解！', 0, DATE_SUB(NOW(), INTERVAL 57 DAY)),
       (115, 1, 14, 101, '原来如此，谢谢大佬！', 0, DATE_SUB(NOW(), INTERVAL 56 DAY)),
       (101, 1, 30, 0, '我的钱包要空了！', 0, DATE_SUB(NOW(), INTERVAL 11 DAY)),
       (102, 1, 30, 0, '买了《艾尔登法环》和《博德之门3》，下半年就靠它们了。', 0, DATE_SUB(NOW(), INTERVAL 11 DAY)),
       (116, 1, 30, 102, '都是好游戏！法环开荒的时候小心点哈哈。', 0, DATE_SUB(NOW(), INTERVAL 10 DAY)),
       (105, 1, 30, 0, '购物车已经满了，就等发工资了。', 0, DATE_SUB(NOW(), INTERVAL 10 DAY)),
       (101, 1, 34, 0, '别灰心，现在大环境不好，坚持就是胜利。', 0, DATE_SUB(NOW(), INTERVAL 4 DAY)),
       (103, 1, 34, 0, '我也是，面了好多家都没下文，太难了。', 0, DATE_SUB(NOW(), INTERVAL 4 DAY)),
       (112, 1, 34, 0, '楼主可以找人帮你优化一下简历，或者刷刷面试题，会有帮助的。', 0, DATE_SUB(NOW(), INTERVAL 3 DAY)),
       (114, 1, 34, 112, '谢谢你的建议！', 0, DATE_SUB(NOW(), INTERVAL 3 DAY)),
       (105, 1, 1, 0, '欢迎欢迎！', 0, DATE_SUB(NOW(), INTERVAL 79 DAY)),
       (106, 1, 1, 0, '新人你好！', 0, DATE_SUB(NOW(), INTERVAL 79 DAY)),
       (107, 1, 2, 0, '收到，一定遵守！', 0, DATE_SUB(NOW(), INTERVAL 78 DAY)),
       (108, 1, 2, 0, '支持版主！', 0, DATE_SUB(NOW(), INTERVAL 78 DAY)),
       (109, 1, 5, 0, '确实，心情都变好了。', 0, DATE_SUB(NOW(), INTERVAL 73 DAY)),
       (110, 1, 6, 0, '我我我！加个好友一起！', 0, DATE_SUB(NOW(), INTERVAL 72 DAY)),
       (111, 1, 10, 0, '好听！', 0, DATE_SUB(NOW(), INTERVAL 68 DAY)),
       (113, 1, 11, 0, '可以看看《Java并发编程实战》这本书，经典。', 0, DATE_SUB(NOW(), INTERVAL 64 DAY)),
       (114, 1, 12, 0, '太棒了，正需要这个！', 0, DATE_SUB(NOW(), INTERVAL 63 DAY)),
       (115, 1, 13, 0, '去大理一定要环洱海！', 0, DATE_SUB(NOW(), INTERVAL 59 DAY)),
       (116, 1, 15, 0, '支持！论坛环境需要大家共同维护。', 0, DATE_SUB(NOW(), INTERVAL 54 DAY)),
       (117, 1, 16, 0, '看着就有食欲！', 0, DATE_SUB(NOW(), INTERVAL 49 DAY)),
       (118, 1, 17, 0, '恭喜解决！感谢分享！', 0, DATE_SUB(NOW(), INTERVAL 47 DAY)),
       (119, 1, 18, 0, '分析得头头是道，坐等上线。', 0, DATE_SUB(NOW(), INTERVAL 44 DAY)),
       (120, 1, 19, 0, '摸摸头，打工人都不容易。', 0, DATE_SUB(NOW(), INTERVAL 39 DAY)),
       (101, 1, 20, 0, '收到！', 0, DATE_SUB(NOW(), INTERVAL 37 DAY)),
       (102, 1, 21, 0, '可以直接学，Python对新手很友好。', 0, DATE_SUB(NOW(), INTERVAL 34 DAY)),
       (103, 1, 22, 0, '主力IntelliJ IDEA，写前端用VS Code。', 0, DATE_SUB(NOW(), INTERVAL 32 DAY)),
       (104, 1, 23, 0, '这是一个哲学问题了...', 0, DATE_SUB(NOW(), INTERVAL 29 DAY)),
       (105, 1, 24, 0, '拍得真好看！', 0, DATE_SUB(NOW(), INTERVAL 27 DAY)),
       (106, 1, 25, 0, '恭喜新版主！', 0, DATE_SUB(NOW(), INTERVAL 24 DAY)),
       (107, 1, 26, 0, '牛客网就很好啊，还可以在线编程。', 0, DATE_SUB(NOW(), INTERVAL 21 DAY)),
       (108, 1, 27, 0, '好可爱的小猫，楼主先带去宠物医院检查一下吧。', 0, DATE_SUB(NOW(), INTERVAL 19 DAY)),
       (109, 1, 28, 0, '东海岸的珍宝海鲜楼（Jumbo Seafood）很出名。', 0, DATE_SUB(NOW(), INTERVAL 17 DAY)),
       (110, 1, 29, 0, '好文！', 0, DATE_SUB(NOW(), INTERVAL 14 DAY)),
       (111, 1, 31, 0, 'Optional +1，代码会优雅很多。', 0, DATE_SUB(NOW(), INTERVAL 9 DAY)),
       (112, 1, 32, 0, '同意，史诗级的科幻片！', 0, DATE_SUB(NOW(), INTERVAL 7 DAY)),
       (113, 1, 33, 0, '核心思想差不多，都是数据驱动视图，看看文档很快就能上手。', 0, DATE_SUB(NOW(), INTERVAL 6 DAY)),
       (114, 1, 35, 0, '我的第一份工作是程序员，天天加班...', 0, DATE_SUB(NOW(), INTERVAL 3 DAY)),
       (115, 1, 36, 0, '用Docker打包成镜像，然后用docker-compose一键部署，很方便。', 0, DATE_SUB(NOW(), INTERVAL 2 DAY)),
       (116, 1, 37, 0, '现在挺好办的，资料准备齐就行。', 0, DATE_SUB(NOW(), INTERVAL 1 DAY)),
       (117, 1, 38, 0, '圣淘沙、滨海湾花园都不错。', 0, NOW());

-- =================================================================
-- 4. 更新帖子的评论数量 (Update Comment Counts)
-- 在插入所有评论后，运行此命令来更新 `discuss_post` 表中的 `comment_count` 字段。
-- =================================================================
UPDATE discuss_post p
SET p.comment_count = (SELECT COUNT(c.id)
                       FROM comment c
                       WHERE c.entity_id = p.id
                         AND c.entity_type = 1);

-- =================================================================
-- 5. 消息数据 (Message Data)
-- 生成用户间的私信。
-- =================================================================
INSERT INTO `message` (`from_id`, `to_id`, `conversation_id`, `content`, `status`, `create_time`)
VALUES (101, 102, '101_102', '在吗？有个问题想请教你。', 0, DATE_SUB(NOW(), INTERVAL 2 DAY)),
       (102, 101, '101_102', '在，你说吧。', 0, DATE_SUB(NOW(), INTERVAL 1 DAY)),
       (111, 101, '111_101', '【系统通知】您的帖子已被加精。', 1, DATE_SUB(NOW(), INTERVAL 5 DAY));