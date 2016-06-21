<?php
require_once('sharelib.php'); 
    
    
    



// create array with topics to be posted on Facebook
$sql = 'SELECT type.name as type_name, com.cache_spacename, com.shop_name as company_name, trade.id, trade.facebook_pubstatus_fanpage, trade.title, trade.content, trade.picture, trade.picture1, trade.picture2, trade.picture3, trade.picture4'    
    .' FROM pb_trades trade'
    .' LEFT JOIN pb_companies as com ON com.id = trade.company_id'
    .' LEFT JOIN pb_tradetypes as type ON type.id = trade.type_id'
    .' WHERE facebook_pubstatus_fanpage=0'
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
    $res["facebook_pubstatus_fanpage"] = $res_s["facebook_pubstatus_fanpage"];
    $res['url'] = "http://marketonline.vn/thuong-mai/".$res_s['id']."/".stringToURI($res_s['title']);    
    $res["title"]= str_replace('[:vi-vn]', '', $res_s["title"]);
    $res["content"]= substr(strip_tags(str_replace('[:vi-vn]', '', $res_s["content"])),0,9000);
    
    $message = str_replace("{chuyen_muc}","Gian hàng Online",$message);
    $message = str_replace("{ten_chu_the}",$res_s["company_name"],$message);
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






$result = '';
// AUTOMATIC POST EACH TOPIC TO FACEBOOK
foreach($share_topics as $share_topic) {
 
  if($share_topic['facebook_pubstatus_fanpage'] == 0) {
  //if(true) {  
    // define POST parameters
    $params = array(
      "access_token" => $fb_access_token, // configure appropriately
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
    
      
      //for fan page
	$fb_data = json_decode($admin["fb_data"], true);
	foreach($fb_data["data"] as $fb_fanpage) {
	  try {
		$params["access_token"] = $fb_fanpage["access_token"];
		$fb->api('/'.$fb_fanpage["id"].'/feed', 'POST', $params);
		
		$logs["link"] = $params["link"];
		$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$fb_fanpage["id"];
		$logs["type"] = "admin_fanpage";
		$logs["title"] = $params['name']." (fanpage: ".$fb_fanpage["name"].")";
		$logs["created"] = date("Y-m-d H:i:s");
		$logs["message"] = $params['message'];
		$logs["kind"] = "trade";
		$sharelog->save($logs);
		
		
		$result .= ' SUCCESSFUL... (Posted to ['.$fb_fanpage["name"].'] Fanpage) : ' . $share_topic['title'] . ' - ' . $share_topic['url'] . $line_break;
	  } catch(Exception $e) {
		$logs["link"] = $params["link"];
		$logs["fb_page"] = "https://www.facebook.com/pages/fanpage/".$fb_fanpage["id"];
		$logs["type"] = "admin_fanpage";
		$logs["title"] = $params['name']." (fanpage: ".$fb_fanpage["name"].")";
		$logs["created"] = date("Y-m-d H:i:s");
		$logs["error_message"] = $e->getMessage();
		$logs["message"] = $params['message'];
		$logs["kind"] = "trade";
		$sharelog->save($logs);
	    
	    $result .= ' FAILED... (' . $e->getMessage() . ') : ' . $share_topic['title'] . ' - ' . $share_topic['url'] . $line_break;
	  }
	}
      
      // mark topic as posted (ensure that it will be posted only once)
      $sql = 'UPDATE pb_trades SET facebook_pubstatus_fanpage = 1 WHERE id = ' . $share_topic['id'];
      if($conn->query($sql) === false) {
        trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
      }
      //$result .= ' SUCCESSFUL... (Posted to [ME] Wall) : ' . $share_topic['title'] . ' - ' . $share_topic['url'] . $line_break;
 
    
 
    sleep(3);
  }
  
}

if($result) $result .= date("Y-m-d H:i:s") . $line_break;

if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_trade_fanpage.log', $result . str_repeat('=', 80) . PHP_EOL, FILE_APPEND);

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