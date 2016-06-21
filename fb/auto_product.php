<?php
require_once('sharelib.php'); 

// create array with topics to be posted on Facebook
$sql = 'SELECT com.cache_spacename, com.shop_name as company_name, product.id, product.service, product.facebook_pubstatus, product.name, product.content, product.picture, product.picture1, product.picture2, product.picture3, product.picture4'    
    .' FROM pb_products product'
    .' LEFT JOIN pb_companies as com ON com.id = product.company_id'
    .' WHERE facebook_pubstatus=0'
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
    $res["facebook_pubstatus"] = $res_s["facebook_pubstatus"];
    $res["title"]= str_replace('[:vi-vn]', '', $res_s["name"]);
    $res['url'] = "http://marketonline.vn/san-pham/".$res_s['id']."/".stringToURI($res['title']);
    $res["content"]= substr(strip_tags(str_replace('[:vi-vn]', '', $res_s["content"])),0,9000);
    
    $message = str_replace("{chuyen_muc}","Gian hàng Online",$message);
    $message = str_replace("{ten_chu_the}",$res_s["company_name"],$message);
    if($res_s["service"] == 1) {
	$ten_loai = "Dịch vụ";
    } else {
	$ten_loai = "Sản phẩm";
    }
    $message = str_replace("{ten_loai}",$ten_loai,$message);
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
 
  if($share_topic['facebook_pubstatus'] == 0) {
	//if(true) {  
    // define POST parameters
    $params = array(
      "access_token" => $fb_access_token, // configure appropriately
      "message" => $share_topic['post_title'],
      "link" => $share_topic['url'],
      "name" => $share_topic['title'],
      "caption" => "http://marketonline.vn", // configure appropriately
      "description" => $share_topic['content']
    );	
	
 
    if($share_topic['image']) {
      $params["picture"] = $share_topic['image'];
    }
 
    // check if topic successfully posted to Facebook
    try {
		$ret = $fb->api('/me/feed', 'POST', $params); 	// configure appropriately	
		
		$logs["link"] = $params["link"];
		$logs["fb_page"] = $admin["fb_user"]["link"];
		$logs["type"] = "admin_wall";
		$logs["title"] = $params['name'];
		$logs["created"] = date("Y-m-d H:i:s");
		$logs["message"] = $params['message'];
		$logs["kind"] = "product";
		
		$sharelog->save($logs);
		
		// mark topic as posted (ensure that it will be posted only once)
		$sql = 'UPDATE pb_products SET facebook_pubstatus = 1 WHERE id = ' . $share_topic['id'];
		if($conn->query($sql) === false) {
		  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
		}
		
		$result .= ' SUCCESSFUL... (Posted to [ME] Wall) : ' . $share_topic['title'] . ' - ' . $share_topic['url'] . $line_break;
		
    } catch(Exception $e) {
	
		$logs["link"] = $params["link"];
		$logs["fb_page"] = $admin["fb_user"]["link"];
		$logs["type"] = "admin_wall";
		$logs["title"] = $params['name'];
		$logs["created"] = date("Y-m-d H:i:s");
		$logs["error_message"] = $e->getMessage();
		$logs["message"] = $params['message'];
		$logs["kind"] = "product";
		$sharelog->save($logs);
		
		// mark topic as posted (ensure that it will be posted only once)
		$sql = 'UPDATE pb_products SET facebook_pubstatus = -1 WHERE id = ' . $share_topic['id'];
		if($conn->query($sql) === false) {
		  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
		}
		
		$result .= ' FAILED... (' . $e->getMessage() . ') : ' . $share_topic['title'] . ' - ' . $share_topic['url'] . $line_break;
	}
	
	sleep(90);
  } 
}

if($result) $result .= date("Y-m-d H:i:s") . $line_break;

if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_product.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);
 
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