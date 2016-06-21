<?php
require_once('sharelib.php');
uses("setting","point");

$companydb = new Companies();
$memberdb = new Members();
$tradedb = new Trades();
$setting = new Settings();
$pointdb = new Points();

////update and lock
//$cc = $pointdb->lockMonthlyPoint();
//$result = "Updated all members monthly points: " . $cc . $line_break;

////reset
//$count = $pointdb->resetMonthlyPoint();
//if($count) $result .= "Number of updated members: " . $count . $line_break;

$count =  $pointdb->resetMonthlyPointNew();
if($count) $result .= "Number of updated members: " . $count . $line_break;


//write log
if($result) $result .= date("Y-m-d H:i:s") . $line_break;


if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_point_monthly_reset.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);
 
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