<?php
require_once('sharelib.php'); 
    
uses('member','trade');

$companydb = new Companies();
$memberdb = new Members();
$tradedb = new Trades();



// create array with topics to be posted on Facebook
$sql = 'SELECT com.fb_post_fanpage, com.shop_name as shop_name, com.facebook as fanpage, m.fb_access_token, m.fb_data, type.name as type_name, com.cache_spacename, com.name as company_name, trade.id, trade.facebook_pubstatus_user_fanpage, trade.title, trade.content, trade.picture, trade.picture1, trade.picture2, trade.picture3, trade.picture4'    
    .' FROM pb_trades trade'
    .' LEFT JOIN pb_companies as com ON com.id = trade.company_id'
    .' LEFT JOIN pb_tradetypes as type ON type.id = trade.type_id'
    .' LEFT JOIN pb_members as m ON m.id = trade.member_id'
    .' WHERE facebook_pubstatus_user_fanpage="" AND m.fb_access_token != "" AND m.id != 1'
    .' LIMIT 1';

$rs = $conn->query($sql);
if($rs === false) {
  $user_error = 'Wrong SQL: ' . $sql . '<br>' . 'Error: ' . $conn->errno . ' ' . $conn->error;
  trigger_error($user_error, E_USER_ERROR);
}
$rs->data_seek(0);
$share_topics = array();
while($res_s = $rs->fetch_assoc()) {
    //prepair content
    $res["id"] = $res_s["id"];
    $res["fb_access_token"] = $res_s["fb_access_token"];
    $res["fb_post_fanpage"] = $res_s["fb_post_fanpage"];
    $res["shop_name"] = $res_s["shop_name"];
    $res["facebook_pubstatus_user_fanpage"] = $res_s["facebook_pubstatus_user_fanpage"];
    $res['url'] = "http://marketonline.vn/thuong-mai/".$res_s['id']."/".stringToURI($res_s['title']);    
    $res["title"]= str_replace('[:vi-vn]', '', $res_s["title"]);
    $res["content"]= substr(strip_tags(str_replace('[:vi-vn]', '', $res_s["content"])),0,9000);
    $res["fanpage"] = $res_s["fanpage"];
    $res["fanpage_id"] = $companydb->findFacebookId($res["fanpage"]);
    
    $message = str_replace("{chuyen_muc}","Gian hàng Online",$message);
    $message = str_replace("{ten_chu_the}",$res_s["shop_name"],$message);
    $message = str_replace("{ten_loai}",$res_s["type_name"],$message);
    $message = str_replace("{ten_bai_viet}",$res["title"],$message);
    $message = str_replace("{link_bai_viet}",$res['url'],$message);
    $res["post_title"] = $message;//mb_convert_encoding($res_s["company_name"],"ASCII", "UTF8");
    
    
    
    if(isset($res_s['default_pic']))
    {
        $pic_col = 'picture'.$res_s['default_pic'];
    }
    else
    {
        $pic_col = 'picture';
    }
    
    if ($res_s[$pic_col]) $res['image'] = "http://marketonline.vn/attachment/".$res_s[$pic_col];
    
    
    $share_topics[] = $res;
}

$rs->free();


//var_dump($share_topics);



$result = '';
// AUTOMATIC POST EACH TOPIC TO FACEBOOK
foreach($share_topics as $share_topic) {
 
  $params = array(
    "access_token" => $share_topic["fb_access_token"], // configure appropriately
    //"message" => $share_topic['post_title'],
    "message" => "",
    "link" => $share_topic['url']."#welcome",
    "name" => $share_topic['title'],
    "caption" => "http://marketonline.vn", // configure appropriately
    "description" => $share_topic['content']
  );

  if($share_topic['image']) {
    $params["picture"] = $share_topic['image'];
  }
  
  //get fanpages
  $account = $memberdb->getFacebookAccounts($share_topic["fb_access_token"]);
  $fanpages = $account["data"];
  
  $fanpage_posted = $share_topic["facebook_pubstatus_user_fanpage"]? explode(",",$share_topic["facebook_pubstatus_user_fanpage"]) : array();
  $configs = explode(",", $share_topic['fb_post_fanpage']);
  foreach($fanpages as $fanpage) {
    if(!in_array($fanpage["id"], $fanpage_posted) && in_array($fanpage["id"], $configs)) {
      try {
        $params["access_token"] = $fanpage["access_token"];
        $ret = $fb->api('/'.$fanpage["id"].'/feed', 'POST', $params);
	
	//$fanpage_posted[] = $fanpage["id"];
	$logs["link"] = $params["link"];
	$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$fanpage["id"];
	$logs["type"] = "user_fanpage";
	$logs["title"] = $params['name'];
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["message"] = $params['message'];
	$logs["kind"] = "trade";
	$sharelog->save($logs);
        
        $result .= ' SUCCESSFUL... (Posted to ['.$share_topic["shop_name"].'] ['.$fanpage["name"].'] Fanpage) : ' . $share_topic['url'] . $line_break;
      } catch(Exception $e) {
	$logs["link"] = $params["link"];
	$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$fanpage["id"];
	$logs["type"] = "user_fanpage";
	$logs["title"] = $params['name'];
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["error_message"] = $e->getMessage();
	$logs["message"] = $params['message'];
	$logs["kind"] = "trade";
	$sharelog->save($logs);
        
        $result .= ' FAILED... (Cannot post to ['.$share_topic["shop_name"].'] ['.$fanpage["name"].'] Fanpage; ' . $e->getMessage() . ') : ' . $share_topic['url'] . $line_break;
      }
      
      sleep(3);
    }
    $fanpage_posted[] = $fanpage["id"];
  }
  
  if(!count($fanpages)) $fanpage_posted[] = "false";
  
  $tradedb->saveField("facebook_pubstatus_user_fanpage", implode(",",$fanpage_posted), intval($share_topic["id"]));
  
}

if($result) $result .= date("Y-m-d H:i:s") . $line_break;

if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_trade_user_fanpage.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);

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