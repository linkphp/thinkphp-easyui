<?php
/**
 * 配置项数组合并
 * @author Link <612012@qq.com>
 */
$common_config = include("common.config.php");
$system_config = include("system.config.php");
$db_config = include("db.config.php");
$config = array_merge($common_config,$system_config,$db_config);
return $config;