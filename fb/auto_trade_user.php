<?php
require_once('sharelib.php'); 
    
    
$companydb = new Companies();


// create array with topics to be posted on Facebook
$sql = 'SELECT com.shop_name as shop_name, com.facebook as fanpage, m.fb_access_token, m.fb_data, type.name as type_name, com.cache_spacename, com.name as company_name, trade.id, trade.facebook_pubstatus_user, trade.title, trade.content, trade.picture, trade.picture1, trade.picture2, trade.picture3, trade.picture4'    
    .' FROM pb_trades trade'
    .' LEFT JOIN pb_companies as com ON com.id = trade.company_id'
    .' LEFT JOIN pb_tradetypes as type ON type.id = trade.type_id'
    .' LEFT JOIN pb_members as m ON m.id = trade.member_id'
    .' WHERE facebook_pubstatus_user=0 AND com.facebook != "" AND m.id != 1 AND m.fb_access_token = ""'
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
    $res["shop_name"] = $res_s["shop_name"];
    $res["facebook_pubstatus_user"] = $res_s["facebook_pubstatus_user"];
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
 
  if($share_topic['facebook_pubstatus_user'] == 0) {
  //if(true) {  
    // define POST parameters
    $params = array(
      "access_token" => $share_topic["fb_access_token"], // configure appropriately
      "message" => $share_topic['post_title'],
      "link" => $share_topic['url']."#welcome",
      "name" => $share_topic['title'],
      "caption" => "http://marketonline.vn", // configure appropriately
      "description" => $share_topic['content']
    );
 
    if(isset($share_topic['image'])) {
      $params["picture"] = $share_topic['image'];
    }
 
    // check if topic successfully posted to Facebook
    try {
      
      
      //for fanpage of member under admin info
      if($share_topic["fanpage_id"]) {
	//$params["access_token"] = $fb_access_token;
	$params["access_token"] = "CAAEIS7GNlZAEBAIprbcFnNaivZCN0qus6bSkx0Kik1uVFY6oxZAyaZBGDAZAImUh0kd5shw8ZCowh1ARvYXW9fnLa73Pl5XMIJYeKiZC3nKsZABbk10ZC3bxk0HDIeObsQ1LUZC3KDASRLA5ZCbT3JEHOjqz6kQuZAh5P8CIWpfIBxWG64k3Xy2dtvbFxDXEdM774i0ZD";
	$ret = $fb->api('/'.$share_topic["fanpage_id"].'/feed', 'POST', $params);	
	
	$sql = 'UPDATE pb_trades SET facebook_pubstatus_user = 1 WHERE id = ' . $share_topic['id'];
	if($conn->query($sql) === false) {
	  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
	}
	
	$logs["link"] = $params["link"];
	$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$share_topic["fanpage_id"];
	$logs["type"] = "admin_user_fanpage";
	$logs["title"] = $params['name'];
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["message"] = $params['message'];
	$logs["kind"] = "trade";
	$sharelog->save($logs);
	
	$result .= ' SUCCESSFUL... (Posted to ['.$share_topic["shop_name"].'] Fanpage) : ' . $share_topic['fanpage'] . ' - ' . $share_topic['url'] . $line_break;
      }
      else
      {
	$sql = 'UPDATE pb_trades SET facebook_pubstatus_user = -2 WHERE id = ' . $share_topic['id'];
	if($conn->query($sql) === false) {
	  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
	}
	
	$logs["link"] = $params["link"];
	$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$share_topic["fanpage_id"];
	$logs["type"] = "admin_user_fanpage";
	$logs["title"] = $params['name'];	
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["error_message"] = "Invalid fanpage id: ". $share_topic['fanpage'];
	$logs["message"] = $params['message'];
	$logs["kind"] = "trade";
	$sharelog->save($logs);
	
	$result .= ' FAILED... (Invalid fanpage id) : ' . $share_topic['fanpage'] . ' - ' . $share_topic['url'] . $line_break;
      }      
 
    } catch(Exception $e) {      
      // mark topic as posted (ensure that it will be posted only once)
      $sql = 'UPDATE pb_trades SET facebook_pubstatus_user = -1 WHERE id = ' . $share_topic['id'];
      if($conn->query($sql) === false) {
        trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
      }
      
      $logs["link"] = $params["link"];
      $logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$share_topic["fanpage_id"];
      $logs["type"] = "admin_user_fanpage";
      $logs["title"] = $params['name'];	
      $logs["created"] = date("Y-m-d H:i:s");
      $logs["error_message"] = $e->getMessage();
      $logs["message"] = $params['message'];
      $logs["kind"] = "trade";
      $sharelog->save($logs);
      
      $result .= ' FAILED... (' . $e->getMessage() . ') : ' . $share_topic['fanpage'] . ' - ' . $share_topic['url'] . $line_break;
    }
 
    sleep(3);
  }
  
}

if($result) $result .= date("Y-m-d H:i:s") . $line_break;

if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_trade_user.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);

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