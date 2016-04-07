<?php
/**
 * 后台自定义函数
 * @author Link <612012@qq.com>
 */

	/**
	 * 时间累加计算方法
	 * data $date Y-m-d
	 * int $period 周期（月份）
	 */
	function data_add($date, $period = 0){
		$arr = explode('-',$date);
		$arr[0] = $arr[0] + floor(($arr[1] + $period)/12);
		$arr[1] = ($arr[1] + $period)%12;
		return implode('-', $arr);
	}
	
	/**
	 * 获取年月方法
	 * data $date Y-m-d
	 */
	function date_ym($date){
		$date_arr = explode('-',$date);
		$date_arr[2] = '00';
		return  implode('-', $date_arr);
	}