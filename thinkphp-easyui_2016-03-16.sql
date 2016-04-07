# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: thinkphp-easyui
# Generation Time: 2016-03-16 03:24:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table think_auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_auth_group`;

CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0，关闭，1正常',
  `rules` text COMMENT '规则id',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_auth_group` WRITE;
/*!40000 ALTER TABLE `think_auth_group` DISABLE KEYS */;

INSERT INTO `think_auth_group` (`id`, `title`, `status`, `rules`, `sort`)
VALUES
	(1,'超级管理员',1,'',1),
	(2,'普通管理员',1,'1,4,5,6,7,2,8,9,10,11,12,13,14,15,16,17,18,74,52,56,57,58,59,75,20,24,19,68,70,69,71,72',2),
	(3,'测试管理员',1,'1,4,5,6,7,9,73,8,2,12,74,52,75,20,76,19,25,77,47,78,68,79,54,83,53,55,84,91,114,85,3',3);

/*!40000 ALTER TABLE `think_auth_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_auth_group_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_auth_group_access`;

CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_auth_group_access` WRITE;
/*!40000 ALTER TABLE `think_auth_group_access` DISABLE KEYS */;

INSERT INTO `think_auth_group_access` (`uid`, `group_id`)
VALUES
	(1,1),
	(2,3),
	(6,2);

/*!40000 ALTER TABLE `think_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_auth_rule`;

CREATE TABLE `think_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '路径',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型：1，url  2，菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0，关闭，1开启',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '条件',
  `sort` int(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `display` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示：0，隐藏，1，显示',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级：0，顶级规则',
  `cls` varchar(50) NOT NULL COMMENT '样式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_auth_rule` WRITE;
/*!40000 ALTER TABLE `think_auth_rule` DISABLE KEYS */;

INSERT INTO `think_auth_rule` (`id`, `name`, `title`, `type`, `status`, `condition`, `sort`, `display`, `rule_id`, `cls`)
VALUES
	(1,'Person','个人中心',1,1,'',1,1,0,'icons-folder-folder'),
	(2,'Core','系统中心',1,1,'',2,1,0,'icons-folder-folder'),
	(3,'Content','内容管理',1,1,'',3,1,0,'icons-folder-folder'),
	(5,'Person/MyProfiles','我的资料',1,1,'',1,1,4,'icons-group-group_gear'),
	(4,'Person/UserOp','用户操作',1,1,'',1,1,1,'icons-group-group_gear'),
	(6,'Person/LoginLog','登录日志',1,1,'',2,1,4,'icons-page-page_white_text'),
	(7,'Person/EditPass','密码修改',1,1,'',3,1,4,'icons-lock-lock_edit'),
	(8,'Core/CoreSet','后台设置',1,1,'',1,1,2,'icons-other-cog_go'),
	(9,'System/Setting','系统配置',1,1,'',1,1,8,'icons-other-cog'),
	(10,'System/editSetting','更新配置',1,1,'',2,1,9,'icons-other-cog_edit'),
	(11,'System/writeSetting','生成配置',1,1,'',3,1,9,'icons-other-cog_go'),
	(12,'Core/Rule','菜单管理',1,1,'',2,1,8,'icons-tag-tag_blue'),
	(13,'Core/addRule','添加菜单',1,1,'',1,1,12,'icons-tag-tag_blue_add'),
	(14,'Core/editRule','编辑菜单',1,1,'',3,1,12,'icons-tag-tag_blue_edit'),
	(15,'Core/delRule','删除菜单',1,1,'',4,1,12,'icons-tag-tag_blue_delete'),
	(16,'Core/imRule','导入菜单',1,1,'',5,1,12,'icons-other-cog'),
	(17,'Core/exRule','导出菜单',1,1,'',6,1,12,'icons-other-cog'),
	(18,'Core/sortRule','菜单排序',1,1,'',7,1,12,'icons-other-cog'),
	(19,'Core/UserSet','用户设置',1,1,'',2,1,2,'icons-other-bullet_wrench'),
	(20,'User/index','用户管理',1,1,'',1,1,19,'icons-user-user'),
	(21,'User/addUser','添加用户',1,1,'',2,1,20,'icons-other-cog'),
	(22,'User/editUser','编辑用户',1,1,'',3,1,20,'icons-other-cog'),
	(23,'User/delUser','删除用户',1,1,'',4,1,20,'icons-other-cog'),
	(24,'User/resetUserPass','重置密码',1,1,'',5,1,20,'icons-other-cog'),
	(25,'Core/Group','角色管理',1,1,'',2,1,19,'icons-user-user_female'),
	(26,'Core/addGroup','添加角色',1,1,'',2,1,25,'icons-other-cog'),
	(27,'Core/editGroup','编辑角色',1,1,'',3,1,25,'icons-other-cog'),
	(28,'Core/delGroup','删除角色',1,1,'',4,1,25,'icons-other-cog'),
	(29,'Core/setGroup','角色权限配置',1,1,'',5,1,25,'icons-other-cog'),
	(30,'Core/sortGroup','角色排序',1,1,'',6,1,25,'icons-other-cog'),
	(62,'Db','数据库管理',1,1,'',5,1,2,'icons-other-database_connect'),
	(70,'Job/editJob','编辑职务',1,1,'',3,1,68,'icons-other-cog'),
	(69,'Job/addJob','添加职务',1,1,'',2,1,68,'icons-other-cog'),
	(47,'Branch/index','部门管理',1,1,'',3,1,19,'icons-user-user_gray'),
	(48,'Branch/addBranch','添加部门',1,1,'',2,1,47,'icons-other-cog'),
	(49,'Branch/editBranch','编辑部门',1,1,'',3,1,47,'icons-other-cog'),
	(50,'Branch/delBranch','删除部门',1,1,'',4,1,47,'icons-other-cog'),
	(51,'Branch/sortBranch','部门排序',1,1,'',5,1,47,'icons-other-cog'),
	(52,'Panel/index','版块管理',1,1,'',3,1,8,'icons-application-application'),
	(53,'Core/LogSet','日志设置',1,1,'',4,1,2,'icons-script-script_link'),
	(54,'Log/LoginLog','登录日志',1,1,'',1,1,53,'icons-script-script_code'),
	(55,'Log/BehaviorLog','行为日志',1,1,'',2,1,53,'icons-script-script_code_red'),
	(56,'Panel/addPanel','添加版块',1,1,'',2,1,52,'icons-application-application_add'),
	(57,'Panel/editPanel','编辑版块',1,1,'',3,1,52,'icons-application-application_edit'),
	(58,'Panel/delPanel','删除版块',1,1,'',4,1,52,'icons-application-application_delete'),
	(59,'Panel/sorPanel','版块排序',1,1,'',5,1,52,'icons-arrow-arrow_merge'),
	(71,'Job/sortJob','职务排序',1,1,'',4,1,68,'icons-other-cog'),
	(60,'Log/delLoginLog','删除登录日志',1,1,'',2,1,54,'icons-other-cog'),
	(68,'Job/index','职务管理',1,1,'',4,1,19,'icons-user-user_edit'),
	(61,'Log/delBehaviorLog','删除行为日志',1,1,'',2,1,55,'icons-other-cog'),
	(63,'Db/backDb','备份数据',1,1,'',2,0,62,'icons-other-cog'),
	(64,'Db/restDb','还原数据',1,1,'',3,0,62,'icons-other-cog'),
	(65,'Db/seoDb','优化数据',1,1,'',4,0,62,'icons-other-cog'),
	(66,'Db/repairDb','修复数据',1,1,'',5,0,62,'icons-other-cog'),
	(67,'Db/index','查看数据表',1,1,'',1,1,62,'icons-other-cog'),
	(72,'Job/delJob','删除职务',1,1,'',5,1,68,'icons-other-cog'),
	(74,'Core/showRule','查看菜单',1,1,'',2,1,12,'icons-tag-tag_blue'),
	(75,'Core/showPanel','查看版块',1,1,'',1,1,52,'icons-other-cog'),
	(76,'Core/showUser','查看用户',1,1,'',1,1,20,'icons-other-cog'),
	(77,'Core/showGroup','查看角色',1,1,'',1,1,25,'icons-other-cog'),
	(78,'Core/showBranch','查看部门',1,1,'',1,1,47,'icons-other-cog'),
	(79,'Core/showJob','查看职务',1,1,'',1,1,68,'icons-other-cog'),
	(83,'Core/showLoginLog','查看登录日志',1,1,'',1,1,54,'icons-other-cog'),
	(84,'Core/showBehaviorLog','查看行为日志',1,1,'',1,1,55,'icons-other-cog'),
	(85,'Category','栏目管理',1,1,'',1,1,3,'icons-application-application_view_list'),
	(114,'Category/index','栏目列表',1,1,'',1,1,85,'icons-other-cog'),
	(115,'Category/add','添加栏目',1,1,'',2,1,85,'icons-other-cog'),
	(116,'Category/edit','编辑栏目',1,1,'',3,1,85,'icons-other-cog'),
	(117,'Category/del','删除栏目',1,1,'',4,1,85,'icons-other-cog');

/*!40000 ALTER TABLE `think_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_behavior_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_behavior_log`;

CREATE TABLE `think_behavior_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户行为日志id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `ip` varchar(250) NOT NULL COMMENT '用户行为ip',
  `date` datetime NOT NULL COMMENT '用户行为时间',
  `area` varchar(250) NOT NULL COMMENT '用户行为网络',
  `country` varchar(250) NOT NULL COMMENT '用户行为地区',
  `user_agent` text NOT NULL COMMENT '用户行为浏览器信息',
  `controller_name` varchar(250) NOT NULL COMMENT '用户行为方法名称',
  `controller_action` varchar(250) NOT NULL COMMENT '用户行为方法路径',
  `json_data` mediumtext NOT NULL COMMENT '用户行为方法参数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_behavior_log` WRITE;
/*!40000 ALTER TABLE `think_behavior_log` DISABLE KEYS */;

INSERT INTO `think_behavior_log` (`id`, `uid`, `ip`, `date`, `area`, `country`, `user_agent`, `controller_name`, `controller_action`, `json_data`)
VALUES
	(1,1,'127.0.0.1','2016-03-07 14:45:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457332517317&quot;}}'),
	(2,1,'127.0.0.1','2016-03-07 14:45:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(3,1,'127.0.0.1','2016-03-07 14:45:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','Core/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;通用后台&quot;},{&quot;key&quot;:&quot;LOGIN_TIME&quot;,&quot;value&quot;:&quot;86400&quot;}]}}'),
	(4,1,'127.0.0.1','2016-03-07 14:45:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','Core/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;通用后台&quot;},{&quot;key&quot;:&quot;LOGIN_TIME&quot;,&quot;value&quot;:&quot;86400&quot;}]}}'),
	(5,1,'127.0.0.1','2016-03-07 14:45:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457332517318&quot;}}'),
	(6,1,'127.0.0.1','2016-03-07 14:45:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(7,1,'127.0.0.1','2016-03-07 14:45:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457332517319&quot;}}'),
	(8,1,'127.0.0.1','2016-03-07 14:45:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(9,1,'127.0.0.1','2016-03-07 14:45:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(10,1,'127.0.0.1','2016-03-07 14:45:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(11,1,'127.0.0.1','2016-03-07 14:46:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457332517320&quot;}}'),
	(12,1,'127.0.0.1','2016-03-07 14:46:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(13,1,'127.0.0.1','2016-03-07 14:46:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(14,1,'127.0.0.1','2016-03-07 14:46:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(15,1,'127.0.0.1','2016-03-07 14:46:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457332517321&quot;}}'),
	(16,1,'127.0.0.1','2016-03-07 14:46:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(17,1,'127.0.0.1','2016-03-07 14:46:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333169391&quot;}}'),
	(18,1,'127.0.0.1','2016-03-07 14:46:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(19,1,'127.0.0.1','2016-03-07 14:46:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(20,1,'127.0.0.1','2016-03-07 14:46:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(21,1,'127.0.0.1','2016-03-07 14:48:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333169392&quot;}}'),
	(22,1,'127.0.0.1','2016-03-07 14:48:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(23,1,'127.0.0.1','2016-03-07 14:48:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(24,1,'127.0.0.1','2016-03-07 14:48:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 写入配置','Core/writesetting','{&quot;POST&quot;:[]}'),
	(25,1,'127.0.0.1','2016-03-07 14:48:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333169393&quot;}}'),
	(26,1,'127.0.0.1','2016-03-07 14:48:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(27,1,'127.0.0.1','2016-03-07 14:49:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333295316&quot;}}'),
	(28,1,'127.0.0.1','2016-03-07 14:49:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','Core/setting','{&quot;POST&quot;:[]}'),
	(29,1,'127.0.0.1','2016-03-07 14:52:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333531034&quot;}}'),
	(30,1,'127.0.0.1','2016-03-07 14:53:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333624623&quot;}}'),
	(31,1,'127.0.0.1','2016-03-07 14:53:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(32,1,'127.0.0.1','2016-03-07 14:54:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333671121&quot;}}'),
	(33,1,'127.0.0.1','2016-03-07 14:54:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(34,1,'127.0.0.1','2016-03-07 14:54:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457333695113&quot;}}'),
	(35,1,'127.0.0.1','2016-03-07 14:54:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(36,1,'127.0.0.1','2016-03-07 14:56:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editrule.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;73&quot;,&quot;_&quot;:&quot;1457333695115&quot;}}'),
	(37,1,'127.0.0.1','2016-03-07 14:56:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editrule.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;10&quot;,&quot;_&quot;:&quot;1457333695116&quot;}}'),
	(38,1,'127.0.0.1','2016-03-07 14:56:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editpanel.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457333695118&quot;}}'),
	(39,1,'127.0.0.1','2016-03-07 14:57:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editrule.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;10&quot;,&quot;_&quot;:&quot;1457333695116&quot;}}'),
	(40,1,'127.0.0.1','2016-03-07 14:57:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;10&quot;,&quot;_&quot;:&quot;1457333695116&quot;}}'),
	(41,1,'127.0.0.1','2016-03-07 14:58:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;10&quot;,&quot;_&quot;:&quot;1457333695116&quot;}}'),
	(42,1,'127.0.0.1','2016-03-07 14:58:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editrule.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457333891361&quot;}}'),
	(43,1,'127.0.0.1','2016-03-07 14:58:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editrule.html','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457333891361&quot;}}'),
	(44,1,'127.0.0.1','2016-03-07 14:58:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457333891361&quot;}}'),
	(45,1,'127.0.0.1','2016-03-07 14:59:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457333934866&quot;}}'),
	(46,1,'127.0.0.1','2016-03-07 14:59:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457333934867&quot;}}'),
	(47,1,'127.0.0.1','2016-03-07 15:00:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;5&quot;,&quot;_&quot;:&quot;1457334051817&quot;}}'),
	(48,1,'127.0.0.1','2016-03-07 15:01:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;6&quot;,&quot;_&quot;:&quot;1457334066482&quot;}}'),
	(49,1,'127.0.0.1','2016-03-07 15:02:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除菜单','Core/delrule','{&quot;POST&quot;:{&quot;id&quot;:&quot;73&quot;}}'),
	(50,1,'127.0.0.1','2016-03-07 15:02:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066484&quot;}}'),
	(51,1,'127.0.0.1','2016-03-07 15:02:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(52,1,'127.0.0.1','2016-03-07 15:02:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;11&quot;,&quot;_&quot;:&quot;1457334066485&quot;}}'),
	(53,1,'127.0.0.1','2016-03-07 15:03:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;11&quot;,&quot;rule_id&quot;:&quot;9&quot;,&quot;title&quot;:&quot;生成配置&quot;,&quot;name&quot;:&quot;System\\/writeSetting&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-other-cog_go&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(54,1,'127.0.0.1','2016-03-07 15:03:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066490&quot;}}'),
	(55,1,'127.0.0.1','2016-03-07 15:03:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(56,1,'127.0.0.1','2016-03-07 15:03:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066491&quot;}}'),
	(57,1,'127.0.0.1','2016-03-07 15:03:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(58,1,'127.0.0.1','2016-03-07 15:03:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066492&quot;}}'),
	(59,1,'127.0.0.1','2016-03-07 15:03:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(60,1,'127.0.0.1','2016-03-07 15:03:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066493&quot;}}'),
	(61,1,'127.0.0.1','2016-03-07 15:03:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(62,1,'127.0.0.1','2016-03-07 15:03:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066494&quot;}}'),
	(63,1,'127.0.0.1','2016-03-07 15:03:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(64,1,'127.0.0.1','2016-03-07 15:03:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334066495&quot;}}'),
	(65,1,'127.0.0.1','2016-03-07 15:03:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(66,1,'127.0.0.1','2016-03-07 15:04:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/writesetting','{&quot;POST&quot;:[]}'),
	(67,1,'127.0.0.1','2016-03-07 15:04:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/writesetting','{&quot;POST&quot;:[]}'),
	(68,1,'127.0.0.1','2016-03-07 15:04:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editsetting','{&quot;POST&quot;:[]}'),
	(69,1,'127.0.0.1','2016-03-07 15:04:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editsetting','{&quot;POST&quot;:[]}'),
	(70,1,'127.0.0.1','2016-03-07 15:05:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334351806&quot;}}'),
	(71,1,'127.0.0.1','2016-03-07 15:05:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/setting','{&quot;POST&quot;:[]}'),
	(72,1,'127.0.0.1','2016-03-07 15:06:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378950&quot;}}'),
	(73,1,'127.0.0.1','2016-03-07 15:06:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(74,1,'127.0.0.1','2016-03-07 15:07:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378951&quot;}}'),
	(75,1,'127.0.0.1','2016-03-07 15:07:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(76,1,'127.0.0.1','2016-03-07 15:07:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378952&quot;}}'),
	(77,1,'127.0.0.1','2016-03-07 15:07:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(78,1,'127.0.0.1','2016-03-07 15:07:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378953&quot;}}'),
	(79,1,'127.0.0.1','2016-03-07 15:07:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(80,1,'127.0.0.1','2016-03-07 15:07:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378954&quot;}}'),
	(81,1,'127.0.0.1','2016-03-07 15:07:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(82,1,'127.0.0.1','2016-03-07 15:07:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378955&quot;}}'),
	(83,1,'127.0.0.1','2016-03-07 15:07:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(84,1,'127.0.0.1','2016-03-07 15:07:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378956&quot;}}'),
	(85,1,'127.0.0.1','2016-03-07 15:07:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(86,1,'127.0.0.1','2016-03-07 15:07:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:[]}'),
	(87,1,'127.0.0.1','2016-03-07 15:07:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:[]}'),
	(88,1,'127.0.0.1','2016-03-07 15:07:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(89,1,'127.0.0.1','2016-03-07 15:07:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(90,1,'127.0.0.1','2016-03-07 15:07:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457334378957&quot;}}'),
	(91,1,'127.0.0.1','2016-03-07 15:07:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(92,1,'127.0.0.1','2016-03-07 15:08:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;2&quot;,&quot;3&quot;:&quot;3&quot;}}}'),
	(93,1,'127.0.0.1','2016-03-07 15:08:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457334499879&quot;}}'),
	(94,1,'127.0.0.1','2016-03-07 15:08:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;POST&quot;:{&quot;editPanel&quot;:&quot;editPanel&quot;,&quot;id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;安全提示&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;网站上线后建议在index.php中关闭DEBUG调试模式。&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;网站上线后建议在index.php中关闭DEBUG调试模式。&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&quot;}}'),
	(95,1,'127.0.0.1','2016-03-07 15:08:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;2&quot;,&quot;3&quot;:&quot;1&quot;}}}'),
	(96,1,'127.0.0.1','2016-03-07 15:09:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;3&quot;:&quot;2&quot;,&quot;2&quot;:&quot;1&quot;}}}'),
	(97,1,'127.0.0.1','2016-03-07 15:09:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457334557047&quot;}}'),
	(98,1,'127.0.0.1','2016-03-07 15:09:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;POST&quot;:{&quot;editPanel&quot;:&quot;editPanel&quot;,&quot;id&quot;:&quot;3&quot;,&quot;title&quot;:&quot;系统说明&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;通用后台管理 v1.0&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;开发二次开发参考手册：&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; _src=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/doc.thinkphp.cn\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; _src=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/jeasyui.com\\/documentation\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;通用后台管理 v1.0&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;开发二次开发参考手册：&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; _src=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/doc.thinkphp.cn\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; _src=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/jeasyui.com\\/documentation\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&quot;}}'),
	(99,1,'127.0.0.1','2016-03-07 15:22:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457335370715&quot;}}'),
	(100,1,'127.0.0.1','2016-03-07 15:22:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(101,1,'127.0.0.1','2016-03-07 15:23:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/exportexcel','{&quot;GET&quot;:[]}'),
	(102,1,'127.0.0.1','2016-03-07 15:24:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/exportexcel','{&quot;GET&quot;:[]}'),
	(103,1,'127.0.0.1','2016-03-07 15:27:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','Core/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457335390231&quot;}}'),
	(104,1,'127.0.0.1','2016-03-07 15:28:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457335390232&quot;}}'),
	(105,1,'127.0.0.1','2016-03-07 15:28:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457335390234&quot;}}'),
	(106,1,'127.0.0.1','2016-03-07 15:28:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(107,1,'127.0.0.1','2016-03-07 15:28:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457335390235&quot;}}'),
	(108,1,'127.0.0.1','2016-03-07 15:28:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;}}'),
	(109,1,'127.0.0.1','2016-03-07 15:29:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除登录日志','Core/delloginlog','{&quot;POST&quot;:{&quot;id&quot;:&quot;lastMonth&quot;}}'),
	(110,1,'127.0.0.1','2016-03-07 15:31:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457335861973&quot;}}'),
	(111,1,'127.0.0.1','2016-03-07 15:45:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;3&quot;,&quot;rule_id&quot;:&quot;0&quot;,&quot;title&quot;:&quot;内容管理&quot;,&quot;name&quot;:&quot;Content&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-folder-folder&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(112,1,'127.0.0.1','2016-03-07 15:47:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457336844066&quot;}}'),
	(113,1,'127.0.0.1','2016-03-07 15:47:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(114,1,'127.0.0.1','2016-03-07 15:47:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;85&quot;,&quot;_&quot;:&quot;1457336844068&quot;}}'),
	(115,1,'127.0.0.1','2016-03-07 15:48:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;85&quot;,&quot;rule_id&quot;:&quot;3&quot;,&quot;title&quot;:&quot;栏目管理&quot;,&quot;name&quot;:&quot;Category&quot;,&quot;sort&quot;:&quot;1&quot;,&quot;cls&quot;:&quot;icons-application-application_view_list&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(116,1,'127.0.0.1','2016-03-07 15:49:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除菜单','Core/delrule','{&quot;POST&quot;:{&quot;id&quot;:&quot;123&quot;}}'),
	(117,1,'127.0.0.1','2016-03-07 15:49:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除菜单','Core/delrule','{&quot;POST&quot;:{&quot;id&quot;:&quot;119&quot;}}'),
	(118,1,'127.0.0.1','2016-03-07 15:50:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;114&quot;,&quot;_&quot;:&quot;1457336918676&quot;}}'),
	(119,1,'127.0.0.1','2016-03-07 15:50:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;114&quot;,&quot;rule_id&quot;:&quot;85&quot;,&quot;title&quot;:&quot;栏目列表&quot;,&quot;name&quot;:&quot;Category\\/index&quot;,&quot;sort&quot;:&quot;1&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(120,1,'127.0.0.1','2016-03-07 15:50:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;115&quot;,&quot;_&quot;:&quot;1457336918678&quot;}}'),
	(121,1,'127.0.0.1','2016-03-07 15:51:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;115&quot;,&quot;rule_id&quot;:&quot;85&quot;,&quot;title&quot;:&quot;添加栏目&quot;,&quot;name&quot;:&quot;Category\\/add&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(122,1,'127.0.0.1','2016-03-07 15:51:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;116&quot;,&quot;_&quot;:&quot;1457336918680&quot;}}'),
	(123,1,'127.0.0.1','2016-03-07 15:51:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;116&quot;,&quot;rule_id&quot;:&quot;85&quot;,&quot;title&quot;:&quot;编辑栏目&quot;,&quot;name&quot;:&quot;Category\\/edit&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(124,1,'127.0.0.1','2016-03-07 15:51:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;117&quot;,&quot;_&quot;:&quot;1457336918682&quot;}}'),
	(125,1,'127.0.0.1','2016-03-07 15:51:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;117&quot;,&quot;rule_id&quot;:&quot;85&quot;,&quot;title&quot;:&quot;删除栏目&quot;,&quot;name&quot;:&quot;Category\\/del&quot;,&quot;sort&quot;:&quot;4&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(126,1,'127.0.0.1','2016-03-07 15:51:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除菜单','Core/delrule','{&quot;POST&quot;:{&quot;id&quot;:&quot;118&quot;}}'),
	(127,1,'127.0.0.1','2016-03-07 15:52:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除菜单','Core/delrule','{&quot;POST&quot;:{&quot;id&quot;:&quot;91&quot;}}'),
	(128,1,'127.0.0.1','2016-03-07 15:52:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457337128244&quot;}}'),
	(129,1,'127.0.0.1','2016-03-07 15:52:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(130,1,'127.0.0.1','2016-03-07 15:52:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;55&quot;,&quot;_&quot;:&quot;1457337128252&quot;}}'),
	(131,1,'127.0.0.1','2016-03-07 15:57:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457337195834&quot;}}'),
	(132,1,'127.0.0.1','2016-03-07 15:57:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(133,1,'127.0.0.1','2016-03-07 16:12:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457338314031&quot;}}'),
	(134,1,'127.0.0.1','2016-03-07 16:12:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(135,1,'127.0.0.1','2016-03-07 16:16:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457338560645&quot;}}'),
	(136,1,'127.0.0.1','2016-03-07 16:16:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(137,1,'127.0.0.1','2016-03-07 16:18:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457338672307&quot;}}'),
	(138,1,'127.0.0.1','2016-03-07 16:18:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(139,1,'127.0.0.1','2016-03-07 16:18:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457338693305&quot;}}'),
	(140,1,'127.0.0.1','2016-03-07 16:18:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(141,1,'127.0.0.1','2016-03-07 16:35:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457339739353&quot;}}'),
	(142,1,'127.0.0.1','2016-03-07 16:35:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(143,1,'127.0.0.1','2016-03-07 16:42:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457340131525&quot;}}'),
	(144,1,'127.0.0.1','2016-03-07 16:42:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(145,1,'127.0.0.1','2016-03-07 16:42:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457340131528&quot;}}'),
	(146,1,'127.0.0.1','2016-03-07 16:42:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(147,1,'127.0.0.1','2016-03-07 16:42:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Core/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457340131530&quot;}}'),
	(148,1,'127.0.0.1','2016-03-07 16:45:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457340353664&quot;}}'),
	(149,1,'127.0.0.1','2016-03-07 16:45:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(150,1,'127.0.0.1','2016-03-07 17:14:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457341986742&quot;}}'),
	(151,1,'127.0.0.1','2016-03-07 17:14:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(152,1,'127.0.0.1','2016-03-07 17:19:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457342355337&quot;}}'),
	(153,1,'127.0.0.1','2016-03-07 17:19:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(154,1,'127.0.0.1','2016-03-07 17:19:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;83&quot;,&quot;_&quot;:&quot;1457342355340&quot;}}'),
	(155,1,'127.0.0.1','2016-03-07 17:26:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457342793080&quot;}}'),
	(156,1,'127.0.0.1','2016-03-07 17:26:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(157,1,'127.0.0.1','2016-03-07 17:30:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343002510&quot;}}'),
	(158,1,'127.0.0.1','2016-03-07 17:30:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(159,1,'127.0.0.1','2016-03-07 17:30:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343008467&quot;}}'),
	(160,1,'127.0.0.1','2016-03-07 17:30:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(161,1,'127.0.0.1','2016-03-07 17:30:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343048795&quot;}}'),
	(162,1,'127.0.0.1','2016-03-07 17:30:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(163,1,'127.0.0.1','2016-03-07 17:31:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343097086&quot;}}'),
	(164,1,'127.0.0.1','2016-03-07 17:31:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(165,1,'127.0.0.1','2016-03-07 17:31:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457343097091&quot;}}'),
	(166,1,'127.0.0.1','2016-03-07 17:31:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;}}'),
	(167,1,'127.0.0.1','2016-03-07 17:33:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343197224&quot;}}'),
	(168,1,'127.0.0.1','2016-03-07 17:33:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(169,1,'127.0.0.1','2016-03-07 17:36:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343339200&quot;}}'),
	(170,1,'127.0.0.1','2016-03-07 17:36:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343339201&quot;}}'),
	(171,1,'127.0.0.1','2016-03-07 17:36:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343339202&quot;}}'),
	(172,1,'127.0.0.1','2016-03-07 17:40:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343339203&quot;}}'),
	(173,1,'127.0.0.1','2016-03-07 17:40:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(174,1,'127.0.0.1','2016-03-07 17:40:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343339207&quot;}}'),
	(175,1,'127.0.0.1','2016-03-07 17:47:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457343988891&quot;}}'),
	(176,1,'127.0.0.1','2016-03-07 17:47:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(177,1,'127.0.0.1','2016-03-07 17:48:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457344105407&quot;}}'),
	(178,1,'127.0.0.1','2016-03-07 17:48:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;}}'),
	(179,1,'127.0.0.1','2016-03-07 17:54:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457344450275&quot;}}'),
	(180,1,'127.0.0.1','2016-03-07 17:54:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(181,1,'127.0.0.1','2016-03-07 17:55:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457344450278&quot;}}'),
	(182,1,'127.0.0.1','2016-03-07 17:55:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457344450280&quot;}}'),
	(183,1,'127.0.0.1','2016-03-07 17:56:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;POST&quot;:{&quot;addUser&quot;:&quot;addUser&quot;,&quot;name&quot;:&quot;link&quot;,&quot;title&quot;:&quot;link&quot;,&quot;pass&quot;:&quot;123456&quot;,&quot;pass2&quot;:&quot;123456&quot;,&quot;branch_id&quot;:&quot;1&quot;,&quot;job_id&quot;:&quot;3&quot;,&quot;status&quot;:&quot;1&quot;,&quot;visit&quot;:&quot;1&quot;,&quot;data_level&quot;:&quot;0&quot;,&quot;groups&quot;:[{&quot;uid&quot;:&quot;2&quot;}],&quot;phone&quot;:&quot;18016496198&quot;,&quot;qq&quot;:&quot;612012&quot;}}'),
	(184,1,'127.0.0.1','2016-03-07 17:58:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457344450282&quot;}}'),
	(185,1,'127.0.0.1','2016-03-07 17:58:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(186,1,'127.0.0.1','2016-03-07 17:58:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;setGroup&quot;:&quot;setGroup&quot;,&quot;id&quot;:&quot;2&quot;,&quot;setGroupRule&quot;:&quot;1,1,4,4,5,1,4,4,6,1,4,4,7,1,4,2,8,8,9,2,8,9,10,8,9,2,8,9,11,8,9,2,8,8,12,2,8,12,13,8,12,2,8,12,14,8,12,2,8,12,15,8,12,2,8,12,16,8,12,2,8,12,17,8,12,2,8,12,18,8,12,2,8,12,74,8,12,2,8,8,52,2,8,52,56,8,52,2,8,52,57,8,52,2,8,52,58,8,52,2,8,52,59,8,52,2,8,52,75,8,52,2,8,20,24,19,20,2,19,68,70,19,68,2,19,68,69,19,68,2,19,68,71,19,68,2,19,68,72,19,68,2,19,85,114,3,85&quot;}}'),
	(187,6,'127.0.0.1','2016-03-07 17:59:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457344774353&quot;}}'),
	(188,6,'127.0.0.1','2016-03-07 17:59:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(189,6,'127.0.0.1','2016-03-07 18:00:01','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457344774358&quot;}}'),
	(190,1,'127.0.0.1','2016-03-07 18:04:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345028457&quot;}}'),
	(191,1,'127.0.0.1','2016-03-07 18:04:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(192,1,'127.0.0.1','2016-03-07 18:04:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457345028461&quot;}}'),
	(193,1,'127.0.0.1','2016-03-07 18:04:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(194,1,'127.0.0.1','2016-03-07 18:05:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;setGroup&quot;:&quot;setGroup&quot;,&quot;id&quot;:&quot;2&quot;,&quot;setGroupRule&quot;:&quot;1,1,4,4,5,1,4,4,6,1,4,4,7,1,4,2,8,8,9,2,8,9,10,8,9,2,8,9,11,8,9,2,8,8,12,2,8,12,13,8,12,2,8,12,14,8,12,2,8,12,15,8,12,2,8,12,16,8,12,2,8,12,17,8,12,2,8,12,18,8,12,2,8,12,74,8,12,2,8,8,52,2,8,52,56,8,52,2,8,52,57,8,52,2,8,52,58,8,52,2,8,52,59,8,52,2,8,52,75,8,52,2,8,20,24,19,20,2,19,68,70,19,68,2,19,68,69,19,68,2,19,68,71,19,68,2,19,68,72,19,68,2,19&quot;}}'),
	(195,1,'127.0.0.1','2016-03-07 18:11:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345429340&quot;}}'),
	(196,1,'127.0.0.1','2016-03-07 18:11:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(197,1,'127.0.0.1','2016-03-07 18:18:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345917999&quot;}}'),
	(198,1,'127.0.0.1','2016-03-07 18:18:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(199,1,'127.0.0.1','2016-03-07 18:19:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345975331&quot;}}'),
	(200,1,'127.0.0.1','2016-03-07 18:19:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(201,1,'127.0.0.1','2016-03-07 18:20:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;ThinkPHP+EasyUI通用后台框架&quot;}]}}'),
	(202,1,'127.0.0.1','2016-03-07 18:20:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;ThinkPHP+EasyUI通用后台框架&quot;}]}}'),
	(203,1,'127.0.0.1','2016-03-07 18:20:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345975332&quot;}}'),
	(204,1,'127.0.0.1','2016-03-07 18:20:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(205,1,'127.0.0.1','2016-03-07 18:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(206,1,'127.0.0.1','2016-03-07 18:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(207,1,'127.0.0.1','2016-03-07 18:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345975333&quot;}}'),
	(208,1,'127.0.0.1','2016-03-07 18:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(209,1,'127.0.0.1','2016-03-07 18:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457345975334&quot;}}'),
	(210,1,'127.0.0.1','2016-03-07 18:20:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(211,1,'127.0.0.1','2016-03-07 18:20:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346037942&quot;}}'),
	(212,1,'127.0.0.1','2016-03-07 18:20:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(213,1,'127.0.0.1','2016-03-07 18:22:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','Core/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457346124956&quot;}}'),
	(214,1,'127.0.0.1','2016-03-07 18:23:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346149621&quot;}}'),
	(215,1,'127.0.0.1','2016-03-07 18:23:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(216,1,'127.0.0.1','2016-03-07 18:23:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457346149623&quot;}}'),
	(217,1,'127.0.0.1','2016-03-07 18:24:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457346149627&quot;}}'),
	(218,1,'127.0.0.1','2016-03-07 18:24:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;POST&quot;:{&quot;editPanel&quot;:&quot;editPanel&quot;,&quot;id&quot;:&quot;3&quot;,&quot;title&quot;:&quot;系统说明&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;content&quot;:&quot;&lt;p&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;基于ThinkPHP和EasyUI的通用后台管理 v1.0&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;开发二次开发参考手册：&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; _src=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/doc.thinkphp.cn\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; _src=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/jeasyui.com\\/documentation\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;&lt;span style=\\&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;基于ThinkPHP和EasyUI的通用后台管理 v1.0&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-size: 12px;\\&quot;&gt;&lt;strong&gt;&lt;span style=\\&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;\\&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;开发二次开发参考手册：&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; _src=\\&quot;http:\\/\\/doc.thinkphp.cn\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/doc.thinkphp.cn\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&lt;p&gt;&lt;a href=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; _src=\\&quot;http:\\/\\/jeasyui.com\\/documentation\\/\\&quot; style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;\\&quot;&gt;&lt;span style=\\&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;\\&quot;&gt;http:\\/\\/jeasyui.com\\/documentation\\/&lt;\\/span&gt;&lt;\\/a&gt;&lt;\\/p&gt;&quot;}}'),
	(219,1,'127.0.0.1','2016-03-07 18:25:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346284317&quot;}}'),
	(220,1,'127.0.0.1','2016-03-07 18:25:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(221,1,'127.0.0.1','2016-03-07 18:26:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346396583&quot;}}'),
	(222,1,'127.0.0.1','2016-03-07 18:26:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(223,1,'127.0.0.1','2016-03-07 18:28:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除用户','Core/deluser','{&quot;POST&quot;:{&quot;id&quot;:&quot;1&quot;}}'),
	(224,1,'127.0.0.1','2016-03-07 18:33:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346767457&quot;}}'),
	(225,1,'127.0.0.1','2016-03-07 18:33:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(226,1,'127.0.0.1','2016-03-07 18:33:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Core/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457346798393&quot;}}'),
	(227,1,'127.0.0.1','2016-03-07 18:33:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Core/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;7&quot;,&quot;_&quot;:&quot;1457346798394&quot;}}'),
	(228,1,'127.0.0.1','2016-03-07 18:33:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457346798396&quot;}}'),
	(229,1,'127.0.0.1','2016-03-07 18:36:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 导出菜单','Core/exrule','{&quot;POST&quot;:[]}'),
	(230,1,'127.0.0.1','2016-03-07 18:36:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 导出菜单','Core/exrule','{&quot;GET&quot;:{&quot;download&quot;:&quot;2D4025AE3A&quot;}}'),
	(231,1,'127.0.0.1','2016-03-07 18:41:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347308262&quot;}}'),
	(232,1,'127.0.0.1','2016-03-07 18:41:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(233,1,'127.0.0.1','2016-03-07 18:46:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347595182&quot;}}'),
	(234,1,'127.0.0.1','2016-03-07 18:47:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Core/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457347595185&quot;}}'),
	(235,1,'127.0.0.1','2016-03-07 18:47:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347642137&quot;}}'),
	(236,1,'127.0.0.1','2016-03-07 18:47:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(237,1,'127.0.0.1','2016-03-07 18:51:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347849199&quot;}}'),
	(238,1,'127.0.0.1','2016-03-07 18:51:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(239,1,'127.0.0.1','2016-03-07 18:51:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Core/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347849201&quot;}}'),
	(240,1,'127.0.0.1','2016-03-07 18:51:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457347849207&quot;}}'),
	(241,1,'127.0.0.1','2016-03-07 18:51:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(242,1,'127.0.0.1','2016-03-07 18:51:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347849209&quot;}}'),
	(243,1,'127.0.0.1','2016-03-07 18:52:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347849210&quot;}}'),
	(244,1,'127.0.0.1','2016-03-07 18:52:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457347934022&quot;}}'),
	(245,1,'127.0.0.1','2016-03-07 18:52:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(246,1,'127.0.0.1','2016-03-07 20:44:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354641153&quot;}}'),
	(247,1,'127.0.0.1','2016-03-07 20:44:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;3&quot;,&quot;rule_id&quot;:&quot;0&quot;,&quot;title&quot;:&quot;内容管理1&quot;,&quot;name&quot;:&quot;Content&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-folder-folder&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(248,1,'127.0.0.1','2016-03-07 20:44:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354685239&quot;}}'),
	(249,1,'127.0.0.1','2016-03-07 20:44:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;3&quot;,&quot;rule_id&quot;:&quot;0&quot;,&quot;title&quot;:&quot;内容管理&quot;,&quot;name&quot;:&quot;Content&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-folder-folder&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(250,1,'127.0.0.1','2016-03-07 20:48:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Core/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354883468&quot;}}'),
	(251,1,'127.0.0.1','2016-03-07 20:48:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457354883471&quot;}}'),
	(252,1,'127.0.0.1','2016-03-07 20:48:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(253,1,'127.0.0.1','2016-03-07 20:48:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457354883473&quot;}}'),
	(254,1,'127.0.0.1','2016-03-07 20:48:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354883475&quot;}}'),
	(255,1,'127.0.0.1','2016-03-07 20:48:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457354883479&quot;}}'),
	(256,1,'127.0.0.1','2016-03-07 20:48:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354883483&quot;}}'),
	(257,1,'127.0.0.1','2016-03-07 20:49:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354883488&quot;}}'),
	(258,1,'127.0.0.1','2016-03-07 20:49:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457354883492&quot;}}'),
	(259,1,'127.0.0.1','2016-03-07 20:49:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457354979209&quot;}}'),
	(260,1,'127.0.0.1','2016-03-07 20:49:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(261,1,'127.0.0.1','2016-03-07 20:49:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457354979211&quot;}}'),
	(262,1,'127.0.0.1','2016-03-07 20:49:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457354979213&quot;}}'),
	(263,1,'127.0.0.1','2016-03-07 20:50:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457354979217&quot;}}'),
	(264,1,'127.0.0.1','2016-03-07 20:50:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Core/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457354979221&quot;}}'),
	(265,1,'127.0.0.1','2016-03-07 20:51:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457355097379&quot;}}'),
	(266,1,'127.0.0.1','2016-03-07 20:51:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(267,1,'127.0.0.1','2016-03-07 20:51:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Core/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457355097381&quot;}}'),
	(268,1,'127.0.0.1','2016-03-07 20:51:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457355097385&quot;}}'),
	(269,1,'127.0.0.1','2016-03-07 20:52:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Core/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457355097390&quot;}}'),
	(270,1,'127.0.0.1','2016-03-07 20:52:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Core/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457355097392&quot;}}'),
	(271,1,'127.0.0.1','2016-03-07 20:52:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加角色','Core/addgroup','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457355097394&quot;}}'),
	(272,1,'127.0.0.1','2016-03-07 20:52:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Core/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457355097395&quot;}}'),
	(273,1,'127.0.0.1','2016-03-07 20:53:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除行为日志','Core/delbehaviorlog','{&quot;POST&quot;:{&quot;id&quot;:&quot;lastMonth&quot;}}'),
	(274,1,'127.0.0.1','2016-03-08 10:12:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457403109432&quot;}}'),
	(275,1,'127.0.0.1','2016-03-08 10:12:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(276,1,'127.0.0.1','2016-03-08 10:13:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;9&quot;,&quot;_&quot;:&quot;1457403109434&quot;}}'),
	(277,1,'127.0.0.1','2016-03-08 10:13:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457403109437&quot;}}'),
	(278,1,'127.0.0.1','2016-03-08 10:13:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;}}'),
	(279,1,'127.0.0.1','2016-03-08 10:17:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457403381728&quot;}}'),
	(280,1,'127.0.0.1','2016-03-08 10:17:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(281,1,'127.0.0.1','2016-03-08 10:17:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457403381730&quot;}}'),
	(282,1,'127.0.0.1','2016-03-08 10:18:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457403381732&quot;}}'),
	(283,1,'127.0.0.1','2016-03-08 10:18:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Core/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457403381736&quot;}}'),
	(284,1,'127.0.0.1','2016-03-08 10:22:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457403528910&quot;}}'),
	(285,1,'127.0.0.1','2016-03-08 10:22:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(286,1,'127.0.0.1','2016-03-08 10:26:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457403528913&quot;}}'),
	(287,1,'127.0.0.1','2016-03-08 11:16:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457406980330&quot;}}'),
	(288,1,'127.0.0.1','2016-03-08 11:16:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(289,1,'127.0.0.1','2016-03-08 11:16:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Core/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457406980337&quot;}}'),
	(290,1,'127.0.0.1','2016-03-08 11:16:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457406980338&quot;}}'),
	(291,1,'127.0.0.1','2016-03-08 11:17:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Core/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;8&quot;,&quot;_&quot;:&quot;1457406980339&quot;}}'),
	(292,1,'127.0.0.1','2016-03-08 11:17:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Core/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;6&quot;,&quot;_&quot;:&quot;1457406980340&quot;}}'),
	(293,1,'127.0.0.1','2016-03-08 11:17:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Core/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457406980342&quot;}}'),
	(294,1,'127.0.0.1','2016-03-08 11:32:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457407961624&quot;}}'),
	(295,1,'127.0.0.1','2016-03-08 11:32:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(296,1,'127.0.0.1','2016-03-08 13:24:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457412947992&quot;}}'),
	(297,1,'127.0.0.1','2016-03-08 13:24:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(298,1,'127.0.0.1','2016-03-08 13:25:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Core/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457412947998&quot;}}'),
	(299,1,'127.0.0.1','2016-03-08 14:02:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457416953741&quot;}}'),
	(300,1,'127.0.0.1','2016-03-08 14:02:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(301,1,'127.0.0.1','2016-03-08 14:10:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457417411312&quot;}}'),
	(302,1,'127.0.0.1','2016-03-08 14:12:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554206&quot;}}'),
	(303,1,'127.0.0.1','2016-03-08 14:12:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(304,1,'127.0.0.1','2016-03-08 14:12:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:[]}'),
	(305,1,'127.0.0.1','2016-03-08 14:12:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:[]}'),
	(306,1,'127.0.0.1','2016-03-08 14:12:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(307,1,'127.0.0.1','2016-03-08 14:12:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(308,1,'127.0.0.1','2016-03-08 14:12:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554207&quot;}}'),
	(309,1,'127.0.0.1','2016-03-08 14:12:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(310,1,'127.0.0.1','2016-03-08 14:12:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(311,1,'127.0.0.1','2016-03-08 14:12:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(312,1,'127.0.0.1','2016-03-08 14:12:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554208&quot;}}'),
	(313,1,'127.0.0.1','2016-03-08 14:12:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(314,1,'127.0.0.1','2016-03-08 14:12:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554209&quot;}}'),
	(315,1,'127.0.0.1','2016-03-08 14:12:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(316,1,'127.0.0.1','2016-03-08 14:12:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;通用后台框架&quot;}]}}'),
	(317,1,'127.0.0.1','2016-03-08 14:12:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 更新配置','System/editsetting','{&quot;POST&quot;:{&quot;data&quot;:[{&quot;key&quot;:&quot;TITLE&quot;,&quot;value&quot;:&quot;通用后台框架&quot;}]}}'),
	(318,1,'127.0.0.1','2016-03-08 14:12:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554210&quot;}}'),
	(319,1,'127.0.0.1','2016-03-08 14:12:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(320,1,'127.0.0.1','2016-03-08 14:12:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(321,1,'127.0.0.1','2016-03-08 14:12:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 生成配置','System/writesetting','{&quot;POST&quot;:[]}'),
	(322,1,'127.0.0.1','2016-03-08 14:12:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554211&quot;}}'),
	(323,1,'127.0.0.1','2016-03-08 14:12:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(324,1,'127.0.0.1','2016-03-08 14:12:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457417554212&quot;}}'),
	(325,1,'127.0.0.1','2016-03-08 14:12:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(326,1,'127.0.0.1','2016-03-08 14:21:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418081442&quot;}}'),
	(327,1,'127.0.0.1','2016-03-08 14:22:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136802&quot;}}'),
	(328,1,'127.0.0.1','2016-03-08 14:22:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136803&quot;}}'),
	(329,1,'127.0.0.1','2016-03-08 14:23:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136804&quot;}}'),
	(330,1,'127.0.0.1','2016-03-08 14:23:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(331,1,'127.0.0.1','2016-03-08 14:23:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136805&quot;}}'),
	(332,1,'127.0.0.1','2016-03-08 14:23:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(333,1,'127.0.0.1','2016-03-08 14:23:37','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Panel/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;0&quot;,&quot;3&quot;:&quot;2&quot;}}}'),
	(334,1,'127.0.0.1','2016-03-08 14:23:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Panel/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;1&quot;,&quot;3&quot;:&quot;2&quot;}}}'),
	(335,1,'127.0.0.1','2016-03-08 14:23:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136806&quot;}}'),
	(336,1,'127.0.0.1','2016-03-08 14:24:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136810&quot;}}'),
	(337,1,'127.0.0.1','2016-03-08 14:25:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136814&quot;}}'),
	(338,1,'127.0.0.1','2016-03-08 14:25:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(339,1,'127.0.0.1','2016-03-08 14:25:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Panel/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457418136815&quot;}}'),
	(340,1,'127.0.0.1','2016-03-08 14:25:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418136819&quot;}}'),
	(341,1,'127.0.0.1','2016-03-08 14:25:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Panel/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;1&quot;,&quot;3&quot;:&quot;2&quot;}}}'),
	(342,1,'127.0.0.1','2016-03-08 14:25:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457418136824&quot;}}'),
	(343,1,'127.0.0.1','2016-03-08 14:26:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418357220&quot;}}'),
	(344,1,'127.0.0.1','2016-03-08 14:26:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(345,1,'127.0.0.1','2016-03-08 14:26:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','Core/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418357223&quot;}}'),
	(346,1,'127.0.0.1','2016-03-08 14:26:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457418357224&quot;}}'),
	(347,1,'127.0.0.1','2016-03-08 14:26:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457418357225&quot;}}'),
	(348,1,'127.0.0.1','2016-03-08 14:31:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418656313&quot;}}'),
	(349,1,'127.0.0.1','2016-03-08 14:31:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(350,1,'127.0.0.1','2016-03-08 14:31:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418656314&quot;}}'),
	(351,1,'127.0.0.1','2016-03-08 14:32:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457418743757&quot;}}'),
	(352,1,'127.0.0.1','2016-03-08 14:32:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743758&quot;}}'),
	(353,1,'127.0.0.1','2016-03-08 14:32:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(354,1,'127.0.0.1','2016-03-08 14:32:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743759&quot;}}'),
	(355,1,'127.0.0.1','2016-03-08 14:32:53','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743763&quot;}}'),
	(356,1,'127.0.0.1','2016-03-08 14:33:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743764&quot;}}'),
	(357,1,'127.0.0.1','2016-03-08 14:33:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(358,1,'127.0.0.1','2016-03-08 14:33:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743765&quot;}}'),
	(359,1,'127.0.0.1','2016-03-08 14:33:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743769&quot;}}'),
	(360,1,'127.0.0.1','2016-03-08 14:33:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(361,1,'127.0.0.1','2016-03-08 14:33:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743770&quot;}}'),
	(362,1,'127.0.0.1','2016-03-08 14:33:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743774&quot;}}'),
	(363,1,'127.0.0.1','2016-03-08 14:33:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(364,1,'127.0.0.1','2016-03-08 14:33:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743775&quot;}}'),
	(365,1,'127.0.0.1','2016-03-08 14:33:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743779&quot;}}'),
	(366,1,'127.0.0.1','2016-03-08 14:33:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(367,1,'127.0.0.1','2016-03-08 14:33:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743780&quot;}}'),
	(368,1,'127.0.0.1','2016-03-08 14:33:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Panel/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457418743784&quot;}}'),
	(369,1,'127.0.0.1','2016-03-08 14:34:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Panel/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457418743788&quot;}}'),
	(370,1,'127.0.0.1','2016-03-08 14:36:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743792&quot;}}'),
	(371,1,'127.0.0.1','2016-03-08 14:36:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(372,1,'127.0.0.1','2016-03-08 14:36:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743793&quot;}}'),
	(373,1,'127.0.0.1','2016-03-08 14:36:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/addpanel','{&quot;POST&quot;:{&quot;addPanel&quot;:&quot;addPanel&quot;,&quot;title&quot;:&quot;111&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;content&quot;:&quot;&lt;p&gt;3333333333&lt;br\\/&gt;&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;3333333333&lt;br\\/&gt;&lt;\\/p&gt;&quot;}}'),
	(374,1,'127.0.0.1','2016-03-08 14:37:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743797&quot;}}'),
	(375,1,'127.0.0.1','2016-03-08 14:37:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/addpanel','{&quot;POST&quot;:{&quot;addPanel&quot;:&quot;addPanel&quot;,&quot;title&quot;:&quot;222&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;content&quot;:&quot;&lt;p&gt;22222&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;22222&lt;\\/p&gt;&quot;}}'),
	(376,1,'127.0.0.1','2016-03-08 14:37:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457418743801&quot;}}'),
	(377,1,'127.0.0.1','2016-03-08 14:38:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/addpanel','{&quot;POST&quot;:{&quot;addPanel&quot;:&quot;addPanel&quot;,&quot;title&quot;:&quot;2222222&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;content&quot;:&quot;&lt;p&gt;222222222&lt;\\/p&gt;&lt;p&gt;3sdafafasf&lt;br\\/&gt;&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;222222222&lt;\\/p&gt;&lt;p&gt;3sdafafasf&lt;br\\/&gt;&lt;\\/p&gt;&quot;}}'),
	(378,1,'127.0.0.1','2016-03-08 14:39:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419169909&quot;}}'),
	(379,1,'127.0.0.1','2016-03-08 14:39:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(380,1,'127.0.0.1','2016-03-08 14:39:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419169910&quot;}}'),
	(381,1,'127.0.0.1','2016-03-08 14:39:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/addpanel','{&quot;POST&quot;:{&quot;addPanel&quot;:&quot;addPanel&quot;,&quot;title&quot;:&quot;fawfqwfqwfqf&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;content&quot;:&quot;&lt;p&gt;wafafawfaf&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;wafafawfaf&lt;\\/p&gt;&quot;}}'),
	(382,1,'127.0.0.1','2016-03-08 14:40:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419236035&quot;}}'),
	(383,1,'127.0.0.1','2016-03-08 14:40:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(384,1,'127.0.0.1','2016-03-08 14:40:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419236036&quot;}}'),
	(385,1,'127.0.0.1','2016-03-08 14:40:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;POST&quot;:{&quot;addPanel&quot;:&quot;addPanel&quot;,&quot;title&quot;:&quot;asdasdsadsadads&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;content&quot;:&quot;&lt;p&gt;wdadadawdawdawdawdad&lt;\\/p&gt;&quot;,&quot;editorValue&quot;:&quot;&lt;p&gt;wdadadawdawdawdawdad&lt;\\/p&gt;&quot;}}'),
	(386,1,'127.0.0.1','2016-03-08 14:40:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419236040&quot;}}'),
	(387,1,'127.0.0.1','2016-03-08 14:40:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(388,1,'127.0.0.1','2016-03-08 14:41:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419254797&quot;}}'),
	(389,1,'127.0.0.1','2016-03-08 14:41:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(390,1,'127.0.0.1','2016-03-08 14:41:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Panel/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;4&quot;,&quot;_&quot;:&quot;1457419254798&quot;}}'),
	(391,1,'127.0.0.1','2016-03-08 14:41:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419254802&quot;}}'),
	(392,1,'127.0.0.1','2016-03-08 14:41:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(393,1,'127.0.0.1','2016-03-08 14:41:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Panel/sortpanel','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;1&quot;,&quot;3&quot;:&quot;2&quot;,&quot;4&quot;:&quot;3&quot;}}}'),
	(394,1,'127.0.0.1','2016-03-08 14:41:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457419289377&quot;}}'),
	(395,1,'127.0.0.1','2016-03-08 14:41:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(396,1,'127.0.0.1','2016-03-08 15:01:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420461731&quot;}}'),
	(397,1,'127.0.0.1','2016-03-08 15:01:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(398,1,'127.0.0.1','2016-03-08 15:01:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420461733&quot;}}'),
	(399,1,'127.0.0.1','2016-03-08 15:01:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(400,1,'127.0.0.1','2016-03-08 15:01:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加版块','Panel/addpanel','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420461734&quot;}}'),
	(401,1,'127.0.0.1','2016-03-08 15:03:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420599071&quot;}}'),
	(402,1,'127.0.0.1','2016-03-08 15:04:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684584&quot;}}'),
	(403,1,'127.0.0.1','2016-03-08 15:04:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(404,1,'127.0.0.1','2016-03-08 15:04:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Branch/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457420684585&quot;}}'),
	(405,1,'127.0.0.1','2016-03-08 15:04:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Branch/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457420684586&quot;}}'),
	(406,1,'127.0.0.1','2016-03-08 15:05:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;13&quot;}}'),
	(407,1,'127.0.0.1','2016-03-08 15:05:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684587&quot;}}'),
	(408,1,'127.0.0.1','2016-03-08 15:05:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(409,1,'127.0.0.1','2016-03-08 15:05:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;12&quot;}}'),
	(410,1,'127.0.0.1','2016-03-08 15:05:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684588&quot;}}'),
	(411,1,'127.0.0.1','2016-03-08 15:05:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(412,1,'127.0.0.1','2016-03-08 15:05:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;11&quot;}}'),
	(413,1,'127.0.0.1','2016-03-08 15:05:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684589&quot;}}'),
	(414,1,'127.0.0.1','2016-03-08 15:05:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(415,1,'127.0.0.1','2016-03-08 15:05:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;10&quot;}}'),
	(416,1,'127.0.0.1','2016-03-08 15:05:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684590&quot;}}'),
	(417,1,'127.0.0.1','2016-03-08 15:05:21','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(418,1,'127.0.0.1','2016-03-08 15:05:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;9&quot;}}'),
	(419,1,'127.0.0.1','2016-03-08 15:05:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684591&quot;}}'),
	(420,1,'127.0.0.1','2016-03-08 15:05:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(421,1,'127.0.0.1','2016-03-08 15:05:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;8&quot;}}'),
	(422,1,'127.0.0.1','2016-03-08 15:05:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684592&quot;}}'),
	(423,1,'127.0.0.1','2016-03-08 15:05:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(424,1,'127.0.0.1','2016-03-08 15:05:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Branch/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;7&quot;,&quot;_&quot;:&quot;1457420684593&quot;}}'),
	(425,1,'127.0.0.1','2016-03-08 15:05:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/editbranch','{&quot;POST&quot;:{&quot;editBranch&quot;:&quot;editBranch&quot;,&quot;id&quot;:&quot;7&quot;,&quot;branch_id&quot;:&quot;0&quot;,&quot;title&quot;:&quot;上海南所1&quot;,&quot;sort&quot;:&quot;7&quot;}}'),
	(426,1,'127.0.0.1','2016-03-08 15:06:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420684594&quot;}}'),
	(427,1,'127.0.0.1','2016-03-08 15:06:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(428,1,'127.0.0.1','2016-03-08 15:06:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771265&quot;}}'),
	(429,1,'127.0.0.1','2016-03-08 15:06:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(430,1,'127.0.0.1','2016-03-08 15:06:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Branch/addbranch','{&quot;GET&quot;:{&quot;branch_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457420771266&quot;}}'),
	(431,1,'127.0.0.1','2016-03-08 15:06:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加部门','Branch/addbranch','{&quot;POST&quot;:{&quot;addBranch&quot;:&quot;addBranch&quot;,&quot;branch_id&quot;:&quot;0&quot;,&quot;title&quot;:&quot;111&quot;,&quot;sort&quot;:&quot;50&quot;}}'),
	(432,1,'127.0.0.1','2016-03-08 15:06:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771267&quot;}}'),
	(433,1,'127.0.0.1','2016-03-08 15:06:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(434,1,'127.0.0.1','2016-03-08 15:06:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Branch/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;14&quot;,&quot;_&quot;:&quot;1457420771268&quot;}}'),
	(435,1,'127.0.0.1','2016-03-08 15:06:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Branch/editbranch','{&quot;POST&quot;:{&quot;editBranch&quot;:&quot;editBranch&quot;,&quot;id&quot;:&quot;14&quot;,&quot;branch_id&quot;:&quot;1&quot;,&quot;title&quot;:&quot;2222&quot;,&quot;sort&quot;:&quot;50&quot;}}'),
	(436,1,'127.0.0.1','2016-03-08 15:06:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771269&quot;}}'),
	(437,1,'127.0.0.1','2016-03-08 15:06:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(438,1,'127.0.0.1','2016-03-08 15:06:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;14&quot;}}'),
	(439,1,'127.0.0.1','2016-03-08 15:06:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771270&quot;}}'),
	(440,1,'127.0.0.1','2016-03-08 15:06:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(441,1,'127.0.0.1','2016-03-08 15:06:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;7&quot;}}'),
	(442,1,'127.0.0.1','2016-03-08 15:06:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771271&quot;}}'),
	(443,1,'127.0.0.1','2016-03-08 15:06:46','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(444,1,'127.0.0.1','2016-03-08 15:06:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;6&quot;}}'),
	(445,1,'127.0.0.1','2016-03-08 15:06:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771272&quot;}}'),
	(446,1,'127.0.0.1','2016-03-08 15:06:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(447,1,'127.0.0.1','2016-03-08 15:06:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;5&quot;}}'),
	(448,1,'127.0.0.1','2016-03-08 15:06:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771273&quot;}}'),
	(449,1,'127.0.0.1','2016-03-08 15:06:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(450,1,'127.0.0.1','2016-03-08 15:06:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;4&quot;}}'),
	(451,1,'127.0.0.1','2016-03-08 15:06:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771274&quot;}}'),
	(452,1,'127.0.0.1','2016-03-08 15:06:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(453,1,'127.0.0.1','2016-03-08 15:06:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除部门','Branch/delbranch','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;}}'),
	(454,1,'127.0.0.1','2016-03-08 15:06:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771275&quot;}}'),
	(455,1,'127.0.0.1','2016-03-08 15:06:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(456,1,'127.0.0.1','2016-03-08 15:07:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771276&quot;}}'),
	(457,1,'127.0.0.1','2016-03-08 15:07:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(458,1,'127.0.0.1','2016-03-08 15:07:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门排序','Branch/sortbranch','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;1&quot;:&quot;3&quot;,&quot;2&quot;:&quot;2&quot;}}}'),
	(459,1,'127.0.0.1','2016-03-08 15:07:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771277&quot;}}'),
	(460,1,'127.0.0.1','2016-03-08 15:07:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(461,1,'127.0.0.1','2016-03-08 15:07:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门排序','Branch/sortbranch','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;2&quot;:&quot;2&quot;,&quot;1&quot;:&quot;1&quot;}}}'),
	(462,1,'127.0.0.1','2016-03-08 15:07:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457420771278&quot;}}'),
	(463,1,'127.0.0.1','2016-03-08 15:07:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(464,1,'127.0.0.1','2016-03-08 15:13:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421176087&quot;}}'),
	(465,1,'127.0.0.1','2016-03-08 15:13:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208438&quot;}}'),
	(466,1,'127.0.0.1','2016-03-08 15:13:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(467,1,'127.0.0.1','2016-03-08 15:13:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务排序','Job/sortjob','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;1&quot;:&quot;11&quot;,&quot;3&quot;:&quot;2&quot;,&quot;7&quot;:&quot;3&quot;}}}'),
	(468,1,'127.0.0.1','2016-03-08 15:13:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208439&quot;}}'),
	(469,1,'127.0.0.1','2016-03-08 15:13:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(470,1,'127.0.0.1','2016-03-08 15:13:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务排序','Job/sortjob','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;3&quot;:&quot;2&quot;,&quot;7&quot;:&quot;3&quot;,&quot;1&quot;:&quot;1&quot;}}}'),
	(471,1,'127.0.0.1','2016-03-08 15:13:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208440&quot;}}'),
	(472,1,'127.0.0.1','2016-03-08 15:13:44','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(473,1,'127.0.0.1','2016-03-08 15:13:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;7&quot;,&quot;_&quot;:&quot;1457421208441&quot;}}'),
	(474,1,'127.0.0.1','2016-03-08 15:13:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;POST&quot;:{&quot;id&quot;:&quot;7&quot;,&quot;editJob&quot;:&quot;editJob&quot;,&quot;title&quot;:&quot;普通职员1&quot;,&quot;sort&quot;:&quot;3&quot;}}'),
	(475,1,'127.0.0.1','2016-03-08 15:13:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208442&quot;}}'),
	(476,1,'127.0.0.1','2016-03-08 15:13:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(477,1,'127.0.0.1','2016-03-08 15:13:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除职务','Job/deljob','{&quot;POST&quot;:{&quot;id&quot;:&quot;7&quot;}}'),
	(478,1,'127.0.0.1','2016-03-08 15:13:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208443&quot;}}'),
	(479,1,'127.0.0.1','2016-03-08 15:13:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(480,1,'127.0.0.1','2016-03-08 15:13:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457421208444&quot;}}'),
	(481,1,'127.0.0.1','2016-03-08 15:14:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;editJob&quot;:&quot;editJob&quot;,&quot;title&quot;:&quot;普通管理员&quot;,&quot;sort&quot;:&quot;2&quot;}}'),
	(482,1,'127.0.0.1','2016-03-08 15:14:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208445&quot;}}'),
	(483,1,'127.0.0.1','2016-03-08 15:14:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(484,1,'127.0.0.1','2016-03-08 15:14:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457421208446&quot;}}'),
	(485,1,'127.0.0.1','2016-03-08 15:14:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;editJob&quot;:&quot;editJob&quot;,&quot;title&quot;:&quot;普通管理员222&quot;,&quot;sort&quot;:&quot;2&quot;}}'),
	(486,1,'127.0.0.1','2016-03-08 15:14:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208447&quot;}}'),
	(487,1,'127.0.0.1','2016-03-08 15:14:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(488,1,'127.0.0.1','2016-03-08 15:14:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;GET&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;_&quot;:&quot;1457421208448&quot;}}'),
	(489,1,'127.0.0.1','2016-03-08 15:14:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑职务','Job/editjob','{&quot;POST&quot;:{&quot;id&quot;:&quot;3&quot;,&quot;editJob&quot;:&quot;editJob&quot;,&quot;title&quot;:&quot;普通管理员&quot;,&quot;sort&quot;:&quot;2&quot;}}'),
	(490,1,'127.0.0.1','2016-03-08 15:14:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208449&quot;}}'),
	(491,1,'127.0.0.1','2016-03-08 15:14:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(492,1,'127.0.0.1','2016-03-08 15:14:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Job/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208450&quot;}}'),
	(493,1,'127.0.0.1','2016-03-08 15:14:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加职务','Job/addjob','{&quot;POST&quot;:{&quot;addJob&quot;:&quot;addJob&quot;,&quot;title&quot;:&quot;后台编辑&quot;,&quot;sort&quot;:&quot;3&quot;}}'),
	(494,1,'127.0.0.1','2016-03-08 15:14:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421208451&quot;}}'),
	(495,1,'127.0.0.1','2016-03-08 15:14:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(496,1,'127.0.0.1','2016-03-08 15:20:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421590160&quot;}}'),
	(497,1,'127.0.0.1','2016-03-08 15:20:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421590161&quot;}}'),
	(498,1,'127.0.0.1','2016-03-08 15:20:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(499,1,'127.0.0.1','2016-03-08 15:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421633562&quot;}}'),
	(500,1,'127.0.0.1','2016-03-08 15:20:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(501,1,'127.0.0.1','2016-03-08 15:20:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421633563&quot;}}'),
	(502,1,'127.0.0.1','2016-03-08 15:20:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(503,1,'127.0.0.1','2016-03-08 15:21:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421633564&quot;}}'),
	(504,1,'127.0.0.1','2016-03-08 15:21:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(505,1,'127.0.0.1','2016-03-08 15:21:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421633565&quot;}}'),
	(506,1,'127.0.0.1','2016-03-08 15:21:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(507,1,'127.0.0.1','2016-03-08 15:21:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','User/exportexcel','{&quot;GET&quot;:[]}'),
	(508,1,'127.0.0.1','2016-03-08 15:22:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421749683&quot;}}'),
	(509,1,'127.0.0.1','2016-03-08 15:22:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(510,1,'127.0.0.1','2016-03-08 15:22:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','User/exportexcel','{&quot;GET&quot;:[]}'),
	(511,1,'127.0.0.1','2016-03-08 15:22:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','User/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457421749684&quot;}}'),
	(512,1,'127.0.0.1','2016-03-08 15:22:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','Core/edituser','{&quot;POST&quot;:{&quot;editUser&quot;:&quot;editUser&quot;,&quot;uid&quot;:&quot;2&quot;,&quot;name&quot;:&quot;guest&quot;,&quot;title&quot;:&quot;测试账号&quot;,&quot;pass&quot;:&quot;&quot;,&quot;pass2&quot;:&quot;&quot;,&quot;branch_id&quot;:&quot;1&quot;,&quot;job_id&quot;:&quot;8&quot;,&quot;status&quot;:&quot;1&quot;,&quot;visit&quot;:&quot;0&quot;,&quot;data_level&quot;:&quot;0&quot;,&quot;groups&quot;:[{&quot;uid&quot;:&quot;3&quot;}],&quot;qq&quot;:&quot;612012&quot;,&quot;phone&quot;:&quot;18016496198&quot;}}'),
	(513,1,'127.0.0.1','2016-03-08 15:23:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421749685&quot;}}'),
	(514,1,'127.0.0.1','2016-03-08 15:23:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(515,1,'127.0.0.1','2016-03-08 15:23:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','User/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457421749686&quot;}}'),
	(516,1,'127.0.0.1','2016-03-08 15:23:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','User/edituser','{&quot;POST&quot;:{&quot;editUser&quot;:&quot;editUser&quot;,&quot;uid&quot;:&quot;2&quot;,&quot;name&quot;:&quot;guest&quot;,&quot;title&quot;:&quot;测试账号&quot;,&quot;pass&quot;:&quot;&quot;,&quot;pass2&quot;:&quot;&quot;,&quot;branch_id&quot;:&quot;1&quot;,&quot;job_id&quot;:&quot;8&quot;,&quot;status&quot;:&quot;1&quot;,&quot;visit&quot;:&quot;0&quot;,&quot;data_level&quot;:&quot;0&quot;,&quot;groups&quot;:[{&quot;uid&quot;:&quot;3&quot;}],&quot;qq&quot;:&quot;612012&quot;,&quot;phone&quot;:&quot;18016496198&quot;}}'),
	(517,1,'127.0.0.1','2016-03-08 15:23:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421749687&quot;}}'),
	(518,1,'127.0.0.1','2016-03-08 15:23:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(519,1,'127.0.0.1','2016-03-08 15:23:50','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 删除用户','User/deluser','{&quot;POST&quot;:{&quot;id&quot;:&quot;5&quot;}}'),
	(520,1,'127.0.0.1','2016-03-08 15:23:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421749688&quot;}}'),
	(521,1,'127.0.0.1','2016-03-08 15:23:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(522,1,'127.0.0.1','2016-03-08 15:25:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;GET&quot;:{&quot;rule_id&quot;:&quot;0&quot;,&quot;_&quot;:&quot;1457421749690&quot;}}'),
	(523,1,'127.0.0.1','2016-03-08 15:26:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加菜单','Core/addrule','{&quot;POST&quot;:{&quot;addRule&quot;:&quot;addRule&quot;,&quot;rule_id&quot;:&quot;8&quot;,&quot;title&quot;:&quot;数据库管理&quot;,&quot;name&quot;:&quot;Core\\/Db&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;cls&quot;:&quot;icons-other-database_connect&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(524,1,'127.0.0.1','2016-03-08 15:27:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Core/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(525,1,'127.0.0.1','2016-03-08 15:33:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Core/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(526,1,'127.0.0.1','2016-03-08 15:33:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Core/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(527,1,'127.0.0.1','2016-03-08 15:33:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Core/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_group&quot;}}'),
	(528,1,'127.0.0.1','2016-03-08 15:33:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Core/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_group&quot;}}'),
	(529,1,'127.0.0.1','2016-03-08 15:40:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421997371&quot;}}'),
	(530,1,'127.0.0.1','2016-03-08 15:40:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(531,1,'127.0.0.1','2016-03-08 15:40:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','User/exportexcel','{&quot;GET&quot;:[]}'),
	(532,1,'127.0.0.1','2016-03-08 15:40:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 ','User/exportexcel','{&quot;GET&quot;:[]}'),
	(533,1,'127.0.0.1','2016-03-08 15:41:52','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','User/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421997372&quot;}}'),
	(534,1,'127.0.0.1','2016-03-08 15:45:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421997373&quot;}}'),
	(535,1,'127.0.0.1','2016-03-08 15:45:29','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(536,1,'127.0.0.1','2016-03-08 15:45:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457421997375&quot;}}'),
	(537,1,'127.0.0.1','2016-03-08 15:45:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(538,1,'127.0.0.1','2016-03-08 15:51:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457423502300&quot;}}'),
	(539,1,'127.0.0.1','2016-03-08 15:51:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(540,1,'127.0.0.1','2016-03-08 15:51:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑部门','Branch/editbranch','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457423502301&quot;}}'),
	(541,1,'127.0.0.1','2016-03-08 15:53:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457423579744&quot;}}'),
	(542,1,'127.0.0.1','2016-03-08 15:53:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(543,1,'127.0.0.1','2016-03-08 16:00:27','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424025235&quot;}}'),
	(544,1,'127.0.0.1','2016-03-08 16:00:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424052781&quot;}}'),
	(545,1,'127.0.0.1','2016-03-08 16:01:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424052781&quot;}}'),
	(546,1,'127.0.0.1','2016-03-08 16:01:15','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424052781&quot;}}'),
	(547,1,'127.0.0.1','2016-03-08 16:01:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424052782&quot;}}'),
	(548,1,'127.0.0.1','2016-03-08 16:01:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;POST&quot;:[]}'),
	(549,1,'127.0.0.1','2016-03-08 16:01:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(550,1,'127.0.0.1','2016-03-08 16:01:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(551,1,'127.0.0.1','2016-03-08 16:01:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_group&quot;}}'),
	(552,1,'127.0.0.1','2016-03-08 16:01:26','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_group&quot;}}'),
	(553,1,'127.0.0.1','2016-03-08 16:01:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_session&quot;}}'),
	(554,1,'127.0.0.1','2016-03-08 16:01:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_session&quot;}}'),
	(555,1,'127.0.0.1','2016-03-08 16:01:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_behavior_log&quot;}}'),
	(556,1,'127.0.0.1','2016-03-08 16:01:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424052783&quot;}}'),
	(557,1,'127.0.0.1','2016-03-08 16:01:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 数据库管理','Db/index','{&quot;POST&quot;:[]}'),
	(558,1,'127.0.0.1','2016-03-08 16:02:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;8&quot;,&quot;_&quot;:&quot;1457424121203&quot;}}'),
	(559,1,'127.0.0.1','2016-03-08 16:02:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;8&quot;,&quot;rule_id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;系统设置&quot;,&quot;name&quot;:&quot;Core\\/CoreSet&quot;,&quot;sort&quot;:&quot;1&quot;,&quot;cls&quot;:&quot;icons-other-cog_go&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(560,1,'127.0.0.1','2016-03-08 16:02:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424147530&quot;}}'),
	(561,1,'127.0.0.1','2016-03-08 16:02:31','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(562,1,'127.0.0.1','2016-03-08 16:02:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;8&quot;,&quot;_&quot;:&quot;1457424147532&quot;}}'),
	(563,1,'127.0.0.1','2016-03-08 16:02:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;8&quot;,&quot;rule_id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;后台设置&quot;,&quot;name&quot;:&quot;Core\\/CoreSet&quot;,&quot;sort&quot;:&quot;1&quot;,&quot;cls&quot;:&quot;icons-other-cog_go&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(564,1,'127.0.0.1','2016-03-08 16:02:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;62&quot;,&quot;_&quot;:&quot;1457424147534&quot;}}'),
	(565,1,'127.0.0.1','2016-03-08 16:03:04','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;62&quot;,&quot;rule_id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;数据库管理&quot;,&quot;name&quot;:&quot;Db\\/index&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;cls&quot;:&quot;icons-other-database_connect&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(566,1,'127.0.0.1','2016-03-08 16:03:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 备份数据','Db/backdb','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424186593&quot;}}'),
	(567,1,'127.0.0.1','2016-03-08 16:03:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424186595&quot;}}'),
	(568,1,'127.0.0.1','2016-03-08 16:03:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 备份数据','Db/backdb','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424186597&quot;}}'),
	(569,1,'127.0.0.1','2016-03-08 16:03:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 备份数据','Db/backdb','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424186599&quot;}}'),
	(570,1,'127.0.0.1','2016-03-08 16:04:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;67&quot;,&quot;_&quot;:&quot;1457424186602&quot;}}'),
	(571,1,'127.0.0.1','2016-03-08 16:04:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;53&quot;,&quot;_&quot;:&quot;1457424186603&quot;}}'),
	(572,1,'127.0.0.1','2016-03-08 16:04:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;62&quot;,&quot;_&quot;:&quot;1457424186604&quot;}}'),
	(573,1,'127.0.0.1','2016-03-08 16:04:43','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;62&quot;,&quot;rule_id&quot;:&quot;2&quot;,&quot;title&quot;:&quot;数据库管理&quot;,&quot;name&quot;:&quot;Db&quot;,&quot;sort&quot;:&quot;50&quot;,&quot;cls&quot;:&quot;icons-other-database_connect&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(574,1,'127.0.0.1','2016-03-08 16:04:49','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;67&quot;,&quot;_&quot;:&quot;1457424186606&quot;}}'),
	(575,1,'127.0.0.1','2016-03-08 16:05:02','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;67&quot;,&quot;rule_id&quot;:&quot;62&quot;,&quot;title&quot;:&quot;查看数据表&quot;,&quot;name&quot;:&quot;Db\\/index&quot;,&quot;sort&quot;:&quot;1&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;1&quot;}}'),
	(576,1,'127.0.0.1','2016-03-08 16:05:20','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;63&quot;,&quot;_&quot;:&quot;1457424186608&quot;}}'),
	(577,1,'127.0.0.1','2016-03-08 16:05:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;63&quot;,&quot;rule_id&quot;:&quot;62&quot;,&quot;title&quot;:&quot;备份数据&quot;,&quot;name&quot;:&quot;Db\\/backDb&quot;,&quot;sort&quot;:&quot;2&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;0&quot;}}'),
	(578,1,'127.0.0.1','2016-03-08 16:05:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;64&quot;,&quot;_&quot;:&quot;1457424186610&quot;}}'),
	(579,1,'127.0.0.1','2016-03-08 16:05:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;64&quot;,&quot;rule_id&quot;:&quot;62&quot;,&quot;title&quot;:&quot;还原数据&quot;,&quot;name&quot;:&quot;Db\\/restDb&quot;,&quot;sort&quot;:&quot;3&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;0&quot;}}'),
	(580,1,'127.0.0.1','2016-03-08 16:05:51','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;65&quot;,&quot;_&quot;:&quot;1457424186612&quot;}}'),
	(581,1,'127.0.0.1','2016-03-08 16:05:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;65&quot;,&quot;rule_id&quot;:&quot;62&quot;,&quot;title&quot;:&quot;优化数据&quot;,&quot;name&quot;:&quot;Db\\/seoDb&quot;,&quot;sort&quot;:&quot;4&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;0&quot;}}'),
	(582,1,'127.0.0.1','2016-03-08 16:06:00','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;GET&quot;:{&quot;id&quot;:&quot;66&quot;,&quot;_&quot;:&quot;1457424186614&quot;}}'),
	(583,1,'127.0.0.1','2016-03-08 16:06:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑菜单','Core/editrule','{&quot;POST&quot;:{&quot;editRule&quot;:&quot;editRule&quot;,&quot;id&quot;:&quot;66&quot;,&quot;rule_id&quot;:&quot;62&quot;,&quot;title&quot;:&quot;修复数据&quot;,&quot;name&quot;:&quot;Db\\/repairDb&quot;,&quot;sort&quot;:&quot;5&quot;,&quot;cls&quot;:&quot;icons-other-cog&quot;,&quot;display&quot;:&quot;0&quot;}}'),
	(584,1,'127.0.0.1','2016-03-08 16:06:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424366191&quot;}}'),
	(585,1,'127.0.0.1','2016-03-08 16:06:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(586,1,'127.0.0.1','2016-03-08 16:06:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424366192&quot;}}'),
	(587,1,'127.0.0.1','2016-03-08 16:06:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(588,1,'127.0.0.1','2016-03-08 16:06:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424366194&quot;}}'),
	(589,1,'127.0.0.1','2016-03-08 16:06:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(590,1,'127.0.0.1','2016-03-08 16:06:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424366195&quot;}}'),
	(591,1,'127.0.0.1','2016-03-08 16:06:25','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(592,1,'127.0.0.1','2016-03-08 16:06:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424387075&quot;}}'),
	(593,1,'127.0.0.1','2016-03-08 16:06:35','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(594,1,'127.0.0.1','2016-03-08 16:09:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545634&quot;}}'),
	(595,1,'127.0.0.1','2016-03-08 16:09:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(596,1,'127.0.0.1','2016-03-08 16:09:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545636&quot;}}'),
	(597,1,'127.0.0.1','2016-03-08 16:09:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(598,1,'127.0.0.1','2016-03-08 16:09:23','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑版块','Panel/editpanel','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457424545637&quot;}}'),
	(599,1,'127.0.0.1','2016-03-08 16:11:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545647&quot;}}'),
	(600,1,'127.0.0.1','2016-03-08 16:11:57','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(601,1,'127.0.0.1','2016-03-08 16:11:58','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','User/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545648&quot;}}'),
	(602,1,'127.0.0.1','2016-03-08 16:12:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','User/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;1&quot;,&quot;_&quot;:&quot;1457424545649&quot;}}'),
	(603,1,'127.0.0.1','2016-03-08 16:12:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 编辑用户','User/edituser','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457424545650&quot;}}'),
	(604,1,'127.0.0.1','2016-03-08 16:12:30','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;search&quot;:{&quot;name&quot;:&quot;&quot;,&quot;branch_id&quot;:&quot;1&quot;,&quot;group_id&quot;:&quot;0&quot;},&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(605,1,'127.0.0.1','2016-03-08 16:12:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;search&quot;:{&quot;name&quot;:&quot;&quot;,&quot;branch_id&quot;:&quot;2&quot;,&quot;group_id&quot;:&quot;0&quot;},&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(606,1,'127.0.0.1','2016-03-08 16:12:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545651&quot;}}'),
	(607,1,'127.0.0.1','2016-03-08 16:12:38','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(608,1,'127.0.0.1','2016-03-08 16:12:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457424545652&quot;}}'),
	(609,1,'127.0.0.1','2016-03-08 16:12:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(610,1,'127.0.0.1','2016-03-08 16:24:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425460914&quot;}}'),
	(611,1,'127.0.0.1','2016-03-08 16:24:32','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(612,1,'127.0.0.1','2016-03-08 16:24:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425460916&quot;}}'),
	(613,1,'127.0.0.1','2016-03-08 16:24:40','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(614,1,'127.0.0.1','2016-03-08 16:24:41','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425460917&quot;}}'),
	(615,1,'127.0.0.1','2016-03-08 16:24:42','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(616,1,'127.0.0.1','2016-03-08 16:25:09','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 菜单排序','Core/sortrule','{&quot;POST&quot;:{&quot;sort&quot;:{&quot;1&quot;:&quot;1&quot;,&quot;4&quot;:&quot;1&quot;,&quot;5&quot;:&quot;1&quot;,&quot;6&quot;:&quot;2&quot;,&quot;7&quot;:&quot;3&quot;,&quot;2&quot;:&quot;2&quot;,&quot;62&quot;:&quot;5&quot;,&quot;67&quot;:&quot;1&quot;,&quot;63&quot;:&quot;2&quot;,&quot;64&quot;:&quot;3&quot;,&quot;65&quot;:&quot;4&quot;,&quot;66&quot;:&quot;5&quot;,&quot;8&quot;:&quot;1&quot;,&quot;9&quot;:&quot;1&quot;,&quot;10&quot;:&quot;2&quot;,&quot;11&quot;:&quot;3&quot;,&quot;12&quot;:&quot;2&quot;,&quot;13&quot;:&quot;1&quot;,&quot;74&quot;:&quot;2&quot;,&quot;14&quot;:&quot;3&quot;,&quot;15&quot;:&quot;4&quot;,&quot;16&quot;:&quot;5&quot;,&quot;17&quot;:&quot;6&quot;,&quot;18&quot;:&quot;7&quot;,&quot;52&quot;:&quot;3&quot;,&quot;75&quot;:&quot;1&quot;,&quot;56&quot;:&quot;2&quot;,&quot;57&quot;:&quot;3&quot;,&quot;58&quot;:&quot;4&quot;,&quot;59&quot;:&quot;5&quot;,&quot;19&quot;:&quot;2&quot;,&quot;20&quot;:&quot;1&quot;,&quot;76&quot;:&quot;1&quot;,&quot;21&quot;:&quot;2&quot;,&quot;22&quot;:&quot;3&quot;,&quot;23&quot;:&quot;4&quot;,&quot;24&quot;:&quot;5&quot;,&quot;25&quot;:&quot;2&quot;,&quot;77&quot;:&quot;1&quot;,&quot;26&quot;:&quot;2&quot;,&quot;27&quot;:&quot;3&quot;,&quot;28&quot;:&quot;4&quot;,&quot;29&quot;:&quot;5&quot;,&quot;30&quot;:&quot;6&quot;,&quot;47&quot;:&quot;3&quot;,&quot;78&quot;:&quot;1&quot;,&quot;48&quot;:&quot;2&quot;,&quot;49&quot;:&quot;3&quot;,&quot;50&quot;:&quot;4&quot;,&quot;51&quot;:&quot;5&quot;,&quot;68&quot;:&quot;4&quot;,&quot;79&quot;:&quot;1&quot;,&quot;69&quot;:&quot;2&quot;,&quot;70&quot;:&quot;3&quot;,&quot;71&quot;:&quot;4&quot;,&quot;72&quot;:&quot;5&quot;,&quot;53&quot;:&quot;4&quot;,&quot;54&quot;:&quot;1&quot;,&quot;83&quot;:&quot;1&quot;,&quot;60&quot;:&quot;2&quot;,&quot;55&quot;:&quot;2&quot;,&quot;84&quot;:&quot;1&quot;,&quot;61&quot;:&quot;2&quot;,&quot;3&quot;:&quot;3&quot;,&quot;85&quot;:&quot;1&quot;,&quot;114&quot;:&quot;1&quot;,&quot;115&quot;:&quot;2&quot;,&quot;116&quot;:&quot;3&quot;,&quot;117&quot;:&quot;4&quot;}}}'),
	(617,1,'127.0.0.1','2016-03-08 16:25:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425511280&quot;}}'),
	(618,1,'127.0.0.1','2016-03-08 16:25:14','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(619,1,'127.0.0.1','2016-03-08 16:32:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425579300&quot;}}'),
	(620,1,'127.0.0.1','2016-03-08 16:32:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(621,1,'127.0.0.1','2016-03-08 16:32:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425579302&quot;}}'),
	(622,1,'127.0.0.1','2016-03-08 16:32:34','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(623,1,'127.0.0.1','2016-03-08 16:32:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425579303&quot;}}'),
	(624,1,'127.0.0.1','2016-03-08 16:32:36','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(625,1,'127.0.0.1','2016-03-08 16:32:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425579305&quot;}}'),
	(626,1,'127.0.0.1','2016-03-08 16:32:39','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(627,1,'127.0.0.1','2016-03-08 18:54:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457425977893&quot;}}'),
	(628,1,'127.0.0.1','2016-03-08 18:54:24','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(629,1,'127.0.0.1','2016-03-08 18:59:12','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489784&quot;}}'),
	(630,1,'127.0.0.1','2016-03-08 18:59:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(631,1,'127.0.0.1','2016-03-08 19:16:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489786&quot;}}'),
	(632,1,'127.0.0.1','2016-03-08 19:16:55','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(633,1,'127.0.0.1','2016-03-08 19:16:56','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','User/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489787&quot;}}'),
	(634,1,'127.0.0.1','2016-03-08 19:19:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489788&quot;}}'),
	(635,1,'127.0.0.1','2016-03-08 19:19:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(636,1,'127.0.0.1','2016-03-08 19:19:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(637,1,'127.0.0.1','2016-03-08 19:19:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489789&quot;}}'),
	(638,1,'127.0.0.1','2016-03-08 19:19:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(639,1,'127.0.0.1','2016-03-08 19:19:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(640,1,'127.0.0.1','2016-03-08 19:19:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489790&quot;}}'),
	(641,1,'127.0.0.1','2016-03-08 19:19:11','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(642,1,'127.0.0.1','2016-03-08 19:19:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_rule&quot;}}'),
	(643,1,'127.0.0.1','2016-03-08 19:19:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489791&quot;}}'),
	(644,1,'127.0.0.1','2016-03-08 19:19:13','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(645,1,'127.0.0.1','2016-03-08 19:19:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 优化数据','Db/seodb','{&quot;POST&quot;:{&quot;type&quot;:&quot;all&quot;}}'),
	(646,1,'127.0.0.1','2016-03-08 19:19:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457434489792&quot;}}'),
	(647,1,'127.0.0.1','2016-03-08 19:19:22','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(648,1,'127.0.0.1','2016-03-09 10:05:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457489123219&quot;}}'),
	(649,1,'127.0.0.1','2016-03-09 10:05:28','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}'),
	(650,1,'127.0.0.1','2016-03-09 10:05:33','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 修复数据','Db/repairdb','{&quot;POST&quot;:{&quot;type&quot;:&quot;one&quot;,&quot;table&quot;:&quot;think_auth_group&quot;}}'),
	(651,1,'127.0.0.1','2016-03-09 14:51:05','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457506261552&quot;}}'),
	(652,1,'127.0.0.1','2016-03-09 14:51:06','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(653,1,'127.0.0.1','2016-03-09 14:51:07','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457506261554&quot;}}'),
	(654,1,'127.0.0.1','2016-03-09 14:51:08','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 版块管理','Panel/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(655,1,'127.0.0.1','2016-03-09 14:51:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457506261555&quot;}}'),
	(656,1,'127.0.0.1','2016-03-09 14:51:10','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(657,1,'127.0.0.1','2016-03-09 21:11:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;GET&quot;:{&quot;id&quot;:&quot;2&quot;,&quot;_&quot;:&quot;1457528348526&quot;}}'),
	(658,1,'127.0.0.1','2016-03-09 21:11:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 角色权限配置','Core/setgroup','{&quot;POST&quot;:{&quot;id&quot;:&quot;2&quot;}}'),
	(659,1,'127.0.0.1','2016-03-09 21:12:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457528348527&quot;}}'),
	(660,1,'127.0.0.1','2016-03-09 21:12:16','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(661,1,'127.0.0.1','2016-03-09 21:12:17','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457528348528&quot;}}'),
	(662,1,'127.0.0.1','2016-03-09 21:12:18','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(663,1,'127.0.0.1','2016-03-09 21:12:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457528348529&quot;}}'),
	(664,1,'127.0.0.1','2016-03-09 21:12:19','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 用户管理','User/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(665,1,'127.0.0.1','2016-03-09 21:14:03','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 添加用户','User/adduser','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457528348530&quot;}}'),
	(666,1,'127.0.0.1','2016-03-14 11:23:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 系统配置','System/setting','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457925808726&quot;}}'),
	(667,1,'127.0.0.1','2016-03-14 11:23:45','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 系统配置','System/setting','{&quot;POST&quot;:[]}'),
	(668,1,'127.0.0.1','2016-03-14 11:23:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 部门管理','Branch/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457925808728&quot;}}'),
	(669,1,'127.0.0.1','2016-03-14 11:23:47','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 部门管理','Branch/index','{&quot;POST&quot;:[]}'),
	(670,1,'127.0.0.1','2016-03-14 11:23:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 职务管理','Job/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457925808729&quot;}}'),
	(671,1,'127.0.0.1','2016-03-14 11:23:48','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 职务管理','Job/index','{&quot;POST&quot;:{&quot;page&quot;:&quot;1&quot;,&quot;rows&quot;:&quot;20&quot;}}'),
	(672,1,'127.0.0.1','2016-03-14 11:23:59','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0','执行 添加职务','Job/addjob','{&quot;GET&quot;:{&quot;_&quot;:&quot;1457925808730&quot;}}'),
	(673,1,'127.0.0.1','2016-03-16 11:22:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;GET&quot;:{&quot;_&quot;:&quot;1458098569573&quot;}}'),
	(674,1,'127.0.0.1','2016-03-16 11:22:54','对方在服务器本地操作','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36','执行 查看数据表','Db/index','{&quot;POST&quot;:[]}');

/*!40000 ALTER TABLE `think_behavior_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_branch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_branch`;

CREATE TABLE `think_branch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `title` varchar(250) NOT NULL COMMENT '名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `branch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_branch` WRITE;
/*!40000 ALTER TABLE `think_branch` DISABLE KEYS */;

INSERT INTO `think_branch` (`id`, `title`, `sort`, `branch_id`)
VALUES
	(2,'设备车间',2,0),
	(1,'技术科',1,0);

/*!40000 ALTER TABLE `think_branch` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_config`;

CREATE TABLE `think_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(250) NOT NULL COMMENT '名称',
  `key` varchar(250) NOT NULL COMMENT 'key',
  `value` varchar(250) DEFAULT NULL COMMENT 'value',
  `default` varchar(250) DEFAULT NULL COMMENT '默认值',
  `editor` varchar(250) NOT NULL DEFAULT 'text' COMMENT '类型:编辑类型',
  `config_cate_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '所属分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_config` WRITE;
/*!40000 ALTER TABLE `think_config` DISABLE KEYS */;

INSERT INTO `think_config` (`id`, `name`, `key`, `value`, `default`, `editor`, `config_cate_id`)
VALUES
	(1,'系统名称','TITLE','通用后台框架','动车OA管理系统','text',1),
	(2,'用户过期时间(分钟)','LOGIN_TIME','86400','10080','text',1),
	(3,'开启登录日志','LOGIN_LOG','true','true','text',1),
	(4,'开启行为日志','BEHAVIOR_LOG','true','true','text',1),
	(5,'S缓存有效期(秒)','S_TIME','3600','3600','text',1),
	(6,'到期提示时间(天)','EXPIRE_DATE','90','30','text',1);

/*!40000 ALTER TABLE `think_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_config_cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_config_cate`;

CREATE TABLE `think_config_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置分类ID',
  `title` varchar(250) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_config_cate` WRITE;
/*!40000 ALTER TABLE `think_config_cate` DISABLE KEYS */;

INSERT INTO `think_config_cate` (`id`, `title`)
VALUES
	(1,'后台设置'),
	(2,'核心参数');

/*!40000 ALTER TABLE `think_config_cate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_job
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_job`;

CREATE TABLE `think_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '职务id',
  `title` varchar(100) NOT NULL COMMENT '职务名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '50' COMMENT '职务排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_job` WRITE;
/*!40000 ALTER TABLE `think_job` DISABLE KEYS */;

INSERT INTO `think_job` (`id`, `title`, `sort`)
VALUES
	(1,'超级管理员',1),
	(3,'普通管理员',2),
	(8,'后台编辑',3);

/*!40000 ALTER TABLE `think_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_login_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_login_log`;

CREATE TABLE `think_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户登陆日志id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `ip` varchar(250) NOT NULL COMMENT '用户登陆ip',
  `date` datetime NOT NULL COMMENT '用户登陆时间',
  `area` varchar(250) NOT NULL COMMENT '用户登陆网络',
  `country` varchar(250) NOT NULL COMMENT '用户登录地区',
  `user_agent` text NOT NULL COMMENT '用户浏览器信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_login_log` WRITE;
/*!40000 ALTER TABLE `think_login_log` DISABLE KEYS */;

INSERT INTO `think_login_log` (`id`, `uid`, `ip`, `date`, `area`, `country`, `user_agent`)
VALUES
	(1,1,'127.0.0.1','2016-03-07 14:13:49','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(2,1,'127.0.0.1','2016-03-07 14:17:57','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(3,1,'127.0.0.1','2016-03-07 14:54:54','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(4,1,'127.0.0.1','2016-03-07 16:29:51','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(5,1,'127.0.0.1','2016-03-07 16:35:39','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(6,1,'127.0.0.1','2016-03-07 17:46:28','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:44.0) Gecko/20100101 Firefox/44.0'),
	(7,6,'127.0.0.1','2016-03-07 17:59:34','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(8,1,'127.0.0.1','2016-03-07 18:03:48','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(9,6,'127.0.0.1','2016-03-07 18:05:16','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(10,1,'127.0.0.1','2016-03-07 18:05:49','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(11,1,'127.0.0.1','2016-03-07 20:29:37','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(12,1,'127.0.0.1','2016-03-08 10:11:49','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(13,1,'127.0.0.1','2016-03-08 14:39:29','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(14,1,'127.0.0.1','2016-03-09 10:05:23','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(15,1,'127.0.0.1','2016-03-09 20:59:08','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36'),
	(16,1,'127.0.0.1','2016-03-14 11:23:28','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0) Gecko/20100101 Firefox/45.0'),
	(17,1,'127.0.0.1','2016-03-16 11:22:47','对方在服务器本地登录','本机地址','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36');

/*!40000 ALTER TABLE `think_login_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_panel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_panel`;

CREATE TABLE `think_panel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '版块id',
  `title` varchar(250) NOT NULL COMMENT '标题',
  `content` mediumtext COMMENT '内容',
  `sort` int(3) NOT NULL DEFAULT '50' COMMENT '排序id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_panel` WRITE;
/*!40000 ALTER TABLE `think_panel` DISABLE KEYS */;

INSERT INTO `think_panel` (`id`, `title`, `content`, `sort`)
VALUES
	(2,'安全提示','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;网站上线后建议在index.php中关闭DEBUG调试模式。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',1),
	(3,'系统说明','&lt;p&gt;&lt;span style=&quot;font-size: 12px; font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;基于ThinkPHP和EasyUI的通用后台管理 v1.0&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-size: 12px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;本系统采用（ThinkPHP 3.2.3 + jQuery EasyUI 1.4.4）框架&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-size: 12px;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;;&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;开发二次开发参考手册：&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://doc.thinkphp.cn/&quot; _src=&quot;http://doc.thinkphp.cn/&quot; style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;http://doc.thinkphp.cn/&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;a href=&quot;http://jeasyui.com/documentation/&quot; _src=&quot;http://jeasyui.com/documentation/&quot; style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; text-decoration: underline; font-size: 12px;&quot;&gt;&lt;span style=&quot;font-family: 微软雅黑, &amp;#39;Microsoft YaHei&amp;#39;; font-size: 12px;&quot;&gt;http://jeasyui.com/documentation/&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;',2),
	(4,'asdasdsadsadads','&lt;p&gt;wdadadawdawdawdawdad&lt;/p&gt;',3);

/*!40000 ALTER TABLE `think_panel` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_session`;

CREATE TABLE `think_session` (
  `session_id` varchar(255) NOT NULL,
  `session_expire` int(11) NOT NULL,
  `session_data` blob,
  UNIQUE KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `think_session` WRITE;
/*!40000 ALTER TABLE `think_session` DISABLE KEYS */;

INSERT INTO `think_session` (`session_id`, `session_expire`, `session_data`)
VALUES
	('5b0fe7cc1939987e87c8b6d598dba5ce',1458100104,X'7569647C733A313A2231223B6C6F67696E5F74696D657C693A313435383039383537393B757365727C613A313A7B733A343A22696E666F223B613A31323A7B733A333A22756964223B733A313A2231223B733A343A226E616D65223B733A353A2261646D696E223B733A343A2270617373223B733A33323A226531306164633339343962613539616262653536653035376632306638383365223B733A353A227469746C65223B733A31353A22E8B685E7BAA7E7AEA1E79086E59198223B733A363A226A6F625F6964223B733A313A2231223B733A353A2270686F6E65223B733A31313A223138313739363132323735223B733A323A227171223B733A363A22363132303132223B733A353A227669736974223B733A313A2231223B733A363A22737461747573223B733A313A2231223B733A31303A22646174615F6C6576656C223B733A313A2231223B733A393A226272616E63685F6964223B733A313A2231223B733A31313A226372656174655F64617465223B733A31393A22323031342D31322D30312030303A30303A3030223B7D7D');

/*!40000 ALTER TABLE `think_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_unit`;

CREATE TABLE `think_unit` (
  `un_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单位id',
  `unitname` varchar(20) NOT NULL COMMENT '单位名称',
  PRIMARY KEY (`un_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单位名称表';

LOCK TABLES `think_unit` WRITE;
/*!40000 ALTER TABLE `think_unit` DISABLE KEYS */;

INSERT INTO `think_unit` (`un_id`, `unitname`)
VALUES
	(1,'上海动车段'),
	(2,'上海动车段杭州地区'),
	(4,'上海动车段上海地区'),
	(5,'上海动车段南京地区'),
	(6,'上海动车段合肥地区');

/*!40000 ALTER TABLE `think_unit` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_user`;

CREATE TABLE `think_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '登录名',
  `pass` varchar(32) NOT NULL COMMENT '登录密码',
  `title` varchar(20) NOT NULL DEFAULT '0' COMMENT '昵称',
  `job_id` tinyint(1) unsigned NOT NULL DEFAULT '6' COMMENT '职务id',
  `phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '电话',
  `qq` varchar(15) NOT NULL DEFAULT '0' COMMENT 'QQ',
  `visit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '回访权限：0，禁用，1，回访',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态：0，禁用，1，正常',
  `data_level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '数据管理：0，普通，1，管理',
  `branch_id` int(10) unsigned NOT NULL COMMENT '部门id',
  `create_date` datetime NOT NULL COMMENT '创建用户时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UNIQUE` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_user` WRITE;
/*!40000 ALTER TABLE `think_user` DISABLE KEYS */;

INSERT INTO `think_user` (`uid`, `name`, `pass`, `title`, `job_id`, `phone`, `qq`, `visit`, `status`, `data_level`, `branch_id`, `create_date`)
VALUES
	(1,'admin','e10adc3949ba59abbe56e057f20f883e','超级管理员',1,'18179612275','612012',1,1,1,1,'2014-12-01 00:00:00'),
	(2,'guest','e10adc3949ba59abbe56e057f20f883e','测试账号',8,'18016496198','612012',0,1,0,1,'2015-02-14 10:33:19'),
	(6,'link','e10adc3949ba59abbe56e057f20f883e','link',3,'18016496198','612012',1,1,0,1,'0000-00-00 00:00:00');

/*!40000 ALTER TABLE `think_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table think_user_hosp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `think_user_hosp`;

CREATE TABLE `think_user_hosp` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `hosp_id` int(10) unsigned NOT NULL COMMENT '医院id',
  UNIQUE KEY `UNIQUE` (`uid`,`hosp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `think_user_hosp` WRITE;
/*!40000 ALTER TABLE `think_user_hosp` DISABLE KEYS */;

INSERT INTO `think_user_hosp` (`uid`, `hosp_id`)
VALUES
	(2,1),
	(2,2),
	(3,1),
	(3,2);

/*!40000 ALTER TABLE `think_user_hosp` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
