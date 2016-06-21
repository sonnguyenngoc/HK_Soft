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

//CONNECT FACEBOOK AUTO POINT
$conditions = array();
$joins = array();
//$joins[] = "LEFT JOIN (SELECT member_id, MAX(created) AS max_date FROM {$memberdb->table_prefix}pointlogs pointlogs WHERE pointlogs.action_name='connect_facebook' GROUP BY member_id) logs ON logs.member_id=Member.id";
//$conditions[] = "((MONTH(FROM_UNIXTIME(logs.max_date)) = MONTH(NOW()) AND YEAR(FROM_UNIXTIME(logs.max_date)) = YEAR(NOW())) OR logs.max_date IS NULL)";
$conditions[] = "fb_access_token != ''";
$rows = $memberdb->findAll("Member.id,Member.fb_access_token", $joins, $conditions);
$countfb=0;
foreach($rows as $member) {
    //$return =  file_get_contents("https://graph.facebook.com/me?access_token=".$member["fb_access_token"]);
    //$return = json_decode($return,true);
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
//$joins[] = "LEFT JOIN (SELECT member_id, MAX(created) AS max_date FROM {$memberdb->table_prefix}pointlogs pointlogs WHERE pointlogs.action_name='checkout' GROUP BY member_id) logs ON logs.member_id=Member.id";
//$conditions[] = "((MONTH(FROM_UNIXTIME(logs.max_date)) = MONTH(NOW()) AND YEAR(FROM_UNIXTIME(logs.max_date)) = YEAR(NOW())) OR logs.max_date IS NULL)";
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
$recent_date = $memberdb->field("max(good_shop_date) as max_date",array("good_shop_status = 1","good_shop_moderator = 0"));
$recent_date = strtotime($recent_date);

if($recent_date < ($memberdb->timestamp-30*86400) || true) {
        $companydb->dbstuff->Execute("UPDATE {$companydb->table_prefix}members SET good_shop_moderator=0 WHERE good_shop_moderator=1");
        
        
        $joins = array();
        $joins[] = "LEFT JOIN {$memberdb->table_prefix}companies c ON Member.id=c.member_id";
        $conditions = array();
        $conditions[] = "Member.good_shop_status = 1";
        //$conditions[] = "Member.good_shop_moderator = 0";
        //$conditions[] = $recent_date." < ".($memberdb->timestamp-30*86400);
        
        $rows = $memberdb->findAll("Member.id", $joins, $conditions, "c.vote_result DESC");
        $off = array();
        foreach($rows as $member) {
            $off[] = $member["id"];
        }
        //var_dump($off);
        $off_sql = "UPDATE {$companydb->table_prefix}members SET good_shop_status=0,good_shop_date='".date('Y-m-d H:i:s')."' WHERE id IN (".implode(",",$off).")";
        $companydb->dbstuff->Execute($off_sql);
        
        //new good shop
        $top_num = $setting->getValue('point_good_shop_top');
        $joins = array();
        $joins[] = "LEFT JOIN {$companydb->table_prefix}members m ON m.id=Company.member_id";
        $conditions = array();
        //$conditions[] = "m.good_shop_moderator = 0";
        $conditions[] = "Company.vote_result > 0";
        
        $rows = $companydb->findAll("m.id,Company.vote_result", $joins, $conditions, "vote_result DESC",0,$top_num);
        $on = array();
        foreach($rows as $member) {
            $on[] = $member["id"];
        }
        //var_dump($on);
        $on_sql = "UPDATE {$companydb->table_prefix}members SET good_shop_status=1,good_shop_date='".date('Y-m-d H:i:s')."' WHERE id IN (".implode(",",$on).")";
        $companydb->dbstuff->Execute($on_sql);
}




//GOOD SHOP AUTO POINT
$conditions = array();
$joins = array();
//$joins[] = "LEFT JOIN (SELECT member_id, MAX(created) AS max_date FROM {$memberdb->table_prefix}pointlogs pointlogs WHERE pointlogs.action_name='good_shop' GROUP BY member_id) logs ON logs.member_id=Member.id";
//$conditions[] = "((MONTH(FROM_UNIXTIME(logs.max_date)) = MONTH(NOW()) AND YEAR(FROM_UNIXTIME(logs.max_date)) = YEAR(NOW())) OR logs.max_date IS NULL)";
$conditions[] = "good_shop_status = 1";
$rows = $memberdb->findAll("Member.id", $joins, $conditions);
$countfb=0;
foreach($rows as $member) {    
    if($pointdb->update("good_shop",intval($member["id"]))) {
        $countfb++;
    }
}
if($countfb) $result .= "Num of good Shop updated: " . $countfb . $line_break;









//write log
if($result) $result .= date("Y-m-d H:i:s") . $line_break;


if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_point.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);
 
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