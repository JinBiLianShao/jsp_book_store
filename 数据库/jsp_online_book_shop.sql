-- --------------------------------------------------------
-- 主机:                           47.101.198.61
-- 服务器版本:                        10.3.21-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 jsp_online_book_shop 的数据库结构
CREATE DATABASE IF NOT EXISTS `jsp_online_book_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `jsp_online_book_shop`;

-- 导出  表 jsp_online_book_shop.admin 结构
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.admin 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `username`, `password`) VALUES
	(1, 'admin', 'admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 导出  表 jsp_online_book_shop.admin_copy 结构
DROP TABLE IF EXISTS `admin_copy`;
CREATE TABLE IF NOT EXISTS `admin_copy` (
  `id` int(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.admin_copy 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `admin_copy` DISABLE KEYS */;
INSERT INTO `admin_copy` (`id`, `username`, `password`) VALUES
	(1, 'admin', 'admin');
/*!40000 ALTER TABLE `admin_copy` ENABLE KEYS */;

-- 导出  表 jsp_online_book_shop.book 结构
DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `introduction` varchar(200) DEFAULT NULL COMMENT '简单的介绍书籍',
  `stock` int(10) NOT NULL COMMENT '书本库存',
  `category` varchar(50) NOT NULL,
  `cover` varchar(50) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`category`),
  KEY `name` (`name`),
  KEY `price` (`price`),
  KEY `cover` (`cover`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.book 的数据：~84 rows (大约)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id`, `name`, `author`, `price`, `introduction`, `stock`, `category`, `cover`, `time`) VALUES
	(1, '平凡的世界', '郑皓云', 11, '平凡的世界 平凡的你我', 0, '小说', '/img/product/1.jpg', '2019-04-01'),
	(2, '怦然心动', '文德琳', 13, '不要忘记每一次的心动', 1, '小说', '/img/product/1.jpg', '2012-03-21'),
	(3, '都挺好', '阿耐', 111, '《大江大河》《欢乐颂》作者、高人气畅销书作家阿耐扛鼎力作！', 20, '小说', '/img/product/3.jpg', '2020-04-01'),
	(4, '走着走着，花就开了', '丁立梅', 1111, '《读者》《青年文摘》签约作家丁立梅散文新作，多地中小学列入课外阅读推荐书目，上百篇文章被设计成语文考试现代文阅读材料', 19, '小说', '/img/product/4.jpg', '2020-04-01'),
	(5, '我的京都', '渡边淳一', 40, '渡边淳一和风十足的京都闲居随笔。', 18, '小说', '/img/product/3.jpg', '2020-04-01'),
	(6, '漫步在青春的河畔', '林清玄', 60, '华语散文名家林清玄给少年的一堂生命课，生前为该书亲拟书名+亲定新篇+亲笔书信，人间已无我，见字亦如面，从成名作到新作品，全面展现文学大师的创作历程', 30, '小说', '/img/product/8.jpg', '2020-04-01'),
	(7, '我在等风，也在等你', '白凝', 50, '沈从文、钱钟书、朱生豪、徐志摩、鲁迅……等民国大师的爱情哲学。这是一本洗涤心灵、遇见爱情的书。听爱情“朗诵者”的肺腑之言，邂逅更好的爱情。', 40, '小说', '/img/product/7.jpg', '2020-04-01'),
	(8, '何必等来生', '燕子', 999, '老狼、柏邦妮感动推荐。这世上真正属于你的东西是你的时光，只有你自己可以决定以什么情绪参与。附赠感人至深的《十年》别册。', 999, '小说', '/img/product/16.jpg', '2020-04-01'),
	(9, '我把活着欢喜过了', '梁实秋', 5, '文学泰斗梁实秋的全部生活智慧，三代中国人的心灵读本。生活只有一种英雄主义，那就是认清生活的真相之后依然热爱生活', 55, '小说', '/img/product/19.jpg', '2020-04-01'),
	(10, '秋灯琐忆', '蒋坦', 55, '晚清江南夫妇充满风雅、才情、闲趣的诗意日常。本版咸丰二年初版原文，并精心校注，简洁白话译述，更好阅读。', 7, '小说', '/img/product/17.jpg', '2020-04-01'),
	(11, '牛顿传记', '西安出版社', 11, '牛顿是著名的物理学家、数学家、光学家、经济学家，百科全书式的全才，万有引力和三大运动定律的发现者，反射式望远镜的发明者。', 52, '传记', '/img/product/14.jpg', '2020-04-01'),
	(12, '傅译传记', '傅雷', 25, '家书', 56, '传记', '/img/product/18.jpg', '2020-04-01'),
	(13, '《名人传记》珍藏本', '潦寒', 45, '影响中国的20位经济学家\r\n顾准，吴敬琏，茅于轼，厉以宁，张五常，林毅夫，郎咸平，许小年，胡鞍钢··· 伫立在中国经济学界的殿堂之上', 45, '传记', '/img/product/16.jpg', '2020-04-01'),
	(14, '卡尔罗杰斯传记', '霍华德基尔申鲍姆', 78, '极具影响力的心理学家。当今人本主义心理学主要代表人物，美国心理学会杰出科学贡献奖获得者。 主要著作有：《咨询和心理治疗：新近的概念和实践》', 12, '传记', '/img/product/17.jpg', '2020-04-01'),
	(15, '爱迪生传记', '西安出版社', 15, '伟大的发明家', 44, '传记', '/img/product/15.jpg', '2020-04-01'),
	(16, '胡适传记', '胡适', 16, '胡适是中国现代思想学术***具争议的焦点，赞扬者有之，批判者也不乏其人。他让*纠结，让蒋介石、李敖推崇，他一生拥有三十五个博士头衔，被称为“九项全能”学者，还获得过诺贝尔文学奖提名', 44, '传记', '/img/product/11.jpg', '2020-04-01'),
	(17, '你好旧时光', '唐七', 45, '振华三部曲', 60, '小说', '/img/product/1580272445.jpg', '2020-04-01'),
	(18, '我念你如初', '顾西爵', 42, '白马时光', 73, '青春文学', '/img/product/9.jpg', '2020-04-01'),
	(19, '最好的我们', '唐七', 33, '美好的高中时光', 36, '青春文学', '/img/product/19.jpg', '2020-04-01'),
	(20, '暗恋橘生淮南', '唐七', 32, '这是一个关于暗恋的故事', 96, '青春文学', '/img/product/17.jpg', '2020-04-01'),
	(21, '只为遇见你', '未再', 26, '新锐珠宝设计师vs野性神秘富三代，携手共赴璀璨爱情盛宴。随书附赠精美海报', 79, '青春文学', '/img/product/26.jpg', '2020-04-01'),
	(22, '摄影基础', '李一', 11, '美好的事物', 66, '摄影', '/img/product/28.jpg', '2020-04-01'),
	(23, '大自然的礼物', '依依', 55, '大自然神奇美丽的礼物', 88, '摄影', '/img/product/29.jpg', '2020-04-01'),
	(24, '神奇动物', '比尔', 35, '美丽迷人的动物', 46, '摄影', '/img/product/28.jpg', '2020-04-01'),
	(25, '大奇河', '昆池', 156, '各大美丽景色', 64, '摄影', '/img/product/23.jpg', '2020-04-01'),
	(26, '向日葵', '凡尔高', 19, '美丽的花', 66, '艺术', '/img/product/13.jpg', '2020-04-01'),
	(27, '烟火', '拉拉', 65, '带你领略慢节奏生活', 41, '艺术', '/img/product/8.jpg', '2020-04-01'),
	(28, '泡沫', 'kiko', 13, '人生是一场旅行', 64, '艺术', '/img/product/1.jpg', '2020-04-01'),
	(29, '肖恩的葬礼', '拉萨', 47, '奇妙艺术人生', 77, '艺术', '/img/product/18.jpg', '2020-04-01'),
	(30, '调音师', 'yeah', 65, '反转惊奇', 14, '艺术', '/img/product/16.jpg', '2020-04-01'),
	(31, '印象', '哈利', 16, '朦胧美', 66, '艺术', '/img/product/17.jpg', '2020-04-01'),
	(32, '我不', '大冰', 32, '生活的旅行', 13, '心灵鸡汤', '/img/product/13.jpg', '2020-04-01'),
	(33, '乖！摸摸头', '大冰', 34, '又一部巨作', 6, '心灵鸡汤', '/img/product/14.jpg', '2020-04-01'),
	(34, '阿弥托佛么么哒', '大冰', 32, '大冰又一巨作', 46, '心灵鸡汤', '/img/product/15.jpg', '2020-04-01'),
	(35, '别放弃', '顾伟', 25, '生活不易每个人都要努力', 36, '心灵鸡汤', '/img/product/16.jpg', '2020-04-01'),
	(36, '马克思哲学', '马克思', 33, '绝妙的哲学', 36, '人生哲学', '/img/product/17.jpg', '2020-04-01'),
	(37, '生活哲学', '群一', 33, '不同的人对生活的看法', 66, '人生哲学', '/img/product/5.jpg', '2020-04-01'),
	(41, '上帝笑了99次', '彼得·凯弗', 35, '未读·思想家 | 趣味哲学集大成之书。和哲学家一起攻破99个哲学迷宫。', 46, '人生哲学', '/img/product/1.jpg', '2020-04-01'),
	(42, '入职小技巧', '直人', 36, '对入职的人很有帮助', 99, '职场', '/img/product/7.jpg', '2020-04-01'),
	(43, '你必须掌握的技巧', '五一', 16, '教你职场如何做事', 31, '职场', '/img/product/16.jpg', '2020-04-01'),
	(44, '你不知道的小技巧', '烟雨', 41, '做事事倍功半', 42, '职场', '/img/product/11.jpg', '2020-04-01'),
	(45, '如何说话', '语言大师', 33, '教你如何与别人交流', 65, '人际交往', '/img/product/9.jpg', '2020-04-01'),
	(46, '礼仪大方', '研一', 33, '如何让从容面对交流场面', 33, '人际交往', '/img/product/3.jpg', '2020-04-01'),
	(47, '交往小技巧', '叮当', 17, '交往中的注意细节', 33, '人际交往', '/img/product/7.jpg', '2020-04-01'),
	(48, '书本教材解析', '李国强', 21, '教材完美解读', 63, '教师用书', '/img/product/4.jpg', '2020-04-01'),
	(49, '中小学校园足球教师用书 ', '人民教育出版社', 34, '教你如何踢足球', 46, '教师用书', '/img/product/1.jpg', '2020-04-01'),
	(50, '小学英语活动课程', '北京师范大学', 23, '一本在手就不愁', 69, '教师用书', '/img/product/9.jpg', '2020-04-01'),
	(51, '完全解读', '李伟', 26, '全方位解析', 56, '教师用书', '/img/product/8.jpg', '2020-04-01'),
	(52, '看图说话', '幼儿教育', 22, '教会小孩子意识看图', 65, '中小学教辅', '/img/product/8.jpg', '2020-04-01'),
	(53, '小学生导刊', '青年文社', 33, '拓展知识', 70, '中小学教辅', '/img/product/10.jpg', '2020-04-01'),
	(54, '文学导读', '兰州大学', 55, '增强意识能力', 54, '小说', '/img/product/1580272592.jpg', '2020-04-01'),
	(55, '拼图解法', '算法', 26, '增强动手能力', 66, '中小学教辅', '/img/product/13.jpg', '2020-04-01'),
	(56, '五三模拟', '彭树民', 39, '海量提醒', 77, '大中专教辅', '/img/product/16.jpg', '2020-04-01'),
	(57, '一本', '李志文', 33, '全方位题型', 48, '大中专教辅', '/img/product/24.jpg', '2020-04-01'),
	(58, '书博士', '王强', 36, '高分解读', 59, '大中专教辅', '/img/product/14.jpg', '2020-04-01'),
	(59, '成人自考', '蒋辉', 47, '全方位讲解', 16, '大中专教辅', '/img/product/16.jpg', '2020-04-01'),
	(60, '刑事诉讼法一本通', '妮妮', 46, '一本通', 89, '考研', '/img/product/19.jpg', '2020-04-01'),
	(61, '汉字是画出来的', '启方', 46, '汉语言文学', 47, '考研', '/img/product/24.jpg', '2020-04-01'),
	(62, '经济学原理', '曼昆', 42, '全方位讲解经济', 46, '考研', '/img/product/20.jpg', '2020-04-01'),
	(63, '简单统计学', '树根', 48, '统计学的天堂', 79, '考研', '/img/product/27.jpg', '2020-04-01'),
	(64, ' 人工智能算法', '圣经', 28, '深度讲解', 100, '考研', '/img/product/27.jpg', '2020-04-01'),
	(65, '公务员笔试', '元', 41, '笔试内容', 96, '公务员', '/img/product/21.jpg', '2020-04-01'),
	(66, '公务员面试', '明', 56, '公务员面试技能', 45, '公务员', '/img/product/22.jpg', '2020-04-01'),
	(67, '马克思教育', '一宿', 45, '公务员考试考点', 100, '公务员', '/img/product/18.jpg', '2020-04-01'),
	(68, '简答技巧', '尹娜', 39, '公务员知识必备', 75, '公务员', '/img/product/17.jpg', '2020-04-01'),
	(69, '大主宰', '诺伊', 46, '神秘大陆休闲人', 46, '修仙', '/img/product/23.jpg', '2020-04-01'),
	(70, '南明王', '一小', 37, '神奇大陆', 103, '修仙', '/img/product/16.jpg', '2020-04-01'),
	(71, '惊奇大陆', '灵梦', 68, '梦幻大陆', 566, '修仙', '/img/product/13.jpg', '2020-04-01'),
	(72, '梦幻岛', '定元', 28, '神秘家族', 466, '修仙', '/img/product/17.jpg', '2020-04-01'),
	(73, '甄嬛传', '吉尔', 39, '历史', 466, '历史改编', '/img/product/19.jpg', '2020-04-01'),
	(74, '如懿传', '阿梓', 33, '后宫争夺', 123, '历史改编', '/img/product/16.jpg', '2020-04-01'),
	(75, '大唐传奇', '唐明', 49, '辉煌唐朝', 333, '历史改编', '/img/product/9.jpg', '2020-04-01'),
	(76, '记元宗录', '维安', 23, '书生逆袭', 336, '历史改编', '/img/product/18.jpg', '2020-04-01'),
	(77, '清露', '盖伊', 48, '架空大陆', 995, '架空', '/img/product/15.jpg', '2020-04-01'),
	(78, '唐砖', '七公子', 53, '伪唐朝', 254, '架空', '/img/product/13.jpg', '2020-04-01'),
	(79, '奇异志', '洛奇', 29, '收集奇异事件录', 456, '架空', '/img/product/19.jpg', '2020-04-01'),
	(80, '圣朝天', '瓦拉', 64, '国度朝圣', 645, '架空', '/img/product/14.jpg', '2020-04-01'),
	(81, '青云志', '李易峰', 46, '少年逆袭之路', 425, '玄幻', '/img/product/5.jpg', '2020-04-01'),
	(82, '仙剑奇侠传', '胡歌', 64, '少年救世', 3, '玄幻', '/img/product/24.jpg', '2020-04-01'),
	(83, '白蛇传', '杨紫', 69, '人蛇恋', 645, '玄幻', '/img/product/19.jpg', '2020-04-01'),
	(84, '轩辕剑', '唐嫣', 33, '世代家族争夺宝物', 64, '玄幻', '/img/product/17.jpg', '2020-04-01'),
	(85, '半夜鬼敲门', 'na次', 34, '恐怖事件', 36, '灵异', '/img/product/15.jpg', '2020-04-01'),
	(86, '两个月亮', '豹子女士', 47, '妇人不断复活', 342, '灵异', '/img/product/26.jpg', '2020-04-01'),
	(87, '他来了请闭眼', '霍建华', 36, '解密重重疑惑', 6, '灵异', '/img/product/18.jpg', '2020-04-01');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- 导出  表 jsp_online_book_shop.category 结构
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称，如：小说',
  `grade` int(10) NOT NULL DEFAULT 1 COMMENT '分类等级，若是1，则为最大分类',
  `parent` int(10) NOT NULL DEFAULT 0 COMMENT '上级分类，若为0则表示是根目录',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.category 的数据：~23 rows (大约)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `grade`, `parent`) VALUES
	(1, '文艺', 1, 0),
	(2, '励志', 1, 0),
	(3, '教育', 1, 0),
	(4, '网络文学', 1, 0),
	(5, '小说', 2, 1),
	(6, '传记', 2, 1),
	(7, '青春文学', 2, 1),
	(8, '心灵鸡汤', 2, 2),
	(9, '人生哲学', 2, 2),
	(10, '教师用书', 2, 3),
	(11, '中小学教辅', 2, 3),
	(12, '考研', 2, 3),
	(13, '修仙', 2, 4),
	(14, '玄幻', 2, 4),
	(15, '摄影', 2, 1),
	(16, '艺术', 2, 1),
	(17, '职场', 2, 2),
	(18, '人际交往', 2, 2),
	(19, '大中专教辅', 2, 3),
	(20, '公务员', 2, 3),
	(21, '历史改编', 2, 4),
	(22, '架空', 2, 4),
	(23, '灵异', 2, 4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 导出  表 jsp_online_book_shop.orders 结构
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT 1,
  `total` int(10) NOT NULL,
  `user` varchar(50) NOT NULL DEFAULT '',
  `bookid` int(11) DEFAULT NULL,
  `shou` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.orders 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `name`, `price`, `quantity`, `total`, `user`, `bookid`, `shou`, `address`, `info`, `phone`, `status`) VALUES
	(5, '都挺好', 999, 1, 999, 'admin@qq.com', 3, '张先生', '北京市', '包装好点', '13022500400', 0),
	(6, '平凡的世界', 12, 1, 12, 'abc@qq.com', 1, '张先生', '北京市', '包装好点', '13022500400', 0),
	(7, '怦然心动', 60, 1, 60, 'abc@qq.com', 2, '张先生', '北京市', '包装好点', '13022500400', 0),
	(8, '平凡的世界', 12, 1, 12, 'abc@qq.com', 1, '张先生', '北京市', '包装好点', '13022500400', 0),
	(9, '怦然心动', 60, 1, 60, 'zhenggoutou@qq.com', 2, '张先生', '北京市', '包装好点', '13022500400', 0),
	(10, '都挺好', 999, 1, 999, 'zhenggoutou@qq.com', 3, '张先生', '北京市', '包装好点', '13022500400', 0),
	(12, '怦然心动', 13, 1, 13, 'admin@admin.com', 2, '张先生', '北京市', '包装好点', '13022500400', 0),
	(13, '怦然心动', 13, 2, 26, 'admin@admin.com', 2, '张先生', '北京市', '包装好点', '13022500400', 0),
	(15, '都挺好', 40, 1, 40, 'admin@admin.com', 3, '张先生', '北京市', '包装好点', '13022500400', 0),
	(16, '怦然心动', 13, 1, 13, 'matou@qq.com', 2, '张先生', '北京市', '包装好点', '13022500400', 0),
	(17, '走着走着，花就开了', 1111, 1, 1111, 'matou@qq.com', 4, '张先生', '北京市', '包装好点', '13022500400', 0),
	(18, '我的京都', 40, 1, 40, 'matou@qq.com', 5, '张先生', '北京市', '包装好点', '13022500400', 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- 导出  表 jsp_online_book_shop.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- 正在导出表  jsp_online_book_shop.user 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `nickname`, `password`) VALUES
	(18, '1013431730@qq.com', 'haha1234', '6ZoYxCjLONXyYIU2eJIuAw=='),
	(26, 'admin@qq.com', 'admin', '4QrcOUm6Wau+VuBX8g+IPg=='),
	(27, 'abc@qq.com', '112233', '0JcHFHV3g+bPF7JvuOIpjw=='),
	(28, 'zhenggoutou@qq.com', '201750080616', '6mwpo6KoTBygGGlvXsQQhg=='),
	(29, 'hahah', 'hahha', 'EBpuyfk4iF3wpE8gRY0utA=='),
	(30, 'admin@admin.com', 'admin', '4QrcOUm6Wau+VuBX8g+IPg=='),
	(32, 'matou@qq.com', 'matou', '4QrcOUm6Wau+VuBX8g+IPg==');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
