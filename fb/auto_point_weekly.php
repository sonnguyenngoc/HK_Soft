<?php
require_once('sharelib.php');
uses("setting","point");

$companydb = new Companies();
$memberdb = new Members();
$tradedb = new Trades();
$setting = new Settings();
$pointdb = new Points();

$joins = array();

$result = "";


$countfb =  $pointdb->resetWeeklyPointNew();
if($countfb) $result .= "Reset new week: Number of updated members: " . $countfb . $line_break;


//CONNECT FACEBOOK AUTO POINT
$conditions = array();
$joins = array();
$conditions[] = "fb_access_token != ''";
$rows = $memberdb->findAll("Member.id,Member.fb_access_token", $joins, $conditions);
$countfb=0;
foreach($rows as $member) {
    if($return["id"] || true) {        
        if($pointdb->update("connect_facebook",intval($member["id"]))) {
            $countfb++;
        }
    }
}
if($countfb) $result .= "Num of connect_facebook updated: " . $countfb . $line_break;


//CHECKOUT AUTO POINT
$conditions = array();
$joins = array();
$conditions[] = "checkout = 1";
$rows = $memberdb->findAll("Member.id", $joins, $conditions);
//var_dump($rows);
$countfb=0;
foreach($rows as $member) {    
    if($pointdb->update("checkout",intval($member["id"]))) {
        $countfb++;
    }
}
if($countfb) $result .= "Num of checkout updated: " . $countfb . $line_break;








//UPDATE GOOD SHOP MONTHLY & GOOD SHOP AUTO POINT
//UPDATE GOOD SHOP MONTHLY
//current good shop
if(true) { //weekly conditions
        $companydb->dbstuff->Execute("UPDATE {$companydb->table_prefix}members SET good_shop_moderator=0 WHERE good_shop_moderator=1");
        
        $not_in_week_condition = "(YEARWEEK(good_shop_date) != YEARWEEK(CURRENT_DATE) OR good_shop_date IS NULL)";
        
        //remove old good shop
        $off_sql = "UPDATE {$companydb->table_prefix}members SET good_shop_status=0 WHERE {$not_in_week_condition}";
        $companydb->dbstuff->Execute($off_sql);
        
        //new good shop
        $top_num = $setting->getValue('point_good_shop_top');
        $joins = array();
        $joins[] = "LEFT JOIN {$companydb->table_prefix}members m ON m.id=Company.member_id";
        $conditions = array();
        $conditions[] = "Company.vote_result > 0";        
        $rows = $companydb->findAll("m.id,Company.vote_result", $joins, $conditions, "vote_result DESC",0,$top_num);
        $on = array();
        foreach($rows as $member) {
            $on[] = $member["id"];
        }
        $on_sql = "UPDATE {$companydb->table_prefix}members SET good_shop_status=1,good_shop_date='".date('Y-m-d H:i:s')."' WHERE id IN (".implode(",",$on).") AND {$not_in_week_condition}";
        $companydb->dbstuff->Execute($on_sql);
}




//GOOD SHOP AUTO POINT
$conditions = array();
$joins = array();
$conditions[] = "good_shop_status = 1";
$rows = $memberdb->findAll("Member.id", $joins, $conditions);
$countfb=0;
foreach($rows as $member) {    
    if($pointdb->update("good_shop",intval($member["id"]))) {
        $countfb++;
    }
}
if($countfb) $result .= "Num of good Shop updated: " . $countfb . $line_break;



$pointdb->updateAllWeeklyPoint();


//write log
if($result) $result .= date("Y-m-d H:i:s") . $line_break;


if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_point_weekly.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);
 
  echo $result;
 
} else {
  $html = '<html><head>';
  $html .= '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">';
  $html .= '</head>';
  $html .= '<body>';
  $html .= $result;
  $html .= '</body>';
  $html .= '</html>';
  
  echo $html;
}

?>