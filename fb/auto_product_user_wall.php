<?php
require_once('sharelib.php'); 
    
$companydb = new Companies();

//var_dump($fb->api('/100000235631026/permissions', 'GET', array("access_token" => $fb_access_token)));

// create array with topics to be posted on Facebook
$sql = 'SELECT com.fb_post_wall, com.shop_name as shop_name, com.facebook as fanpage, m.fb_access_token, m.fb_user_id, m.fb_data, com.cache_spacename, com.name as company_name, product.id, product.service, product.facebook_pubstatus_user_wall, product.name, product.content, product.picture, product.picture1, product.picture2, product.picture3, product.picture4'    
    .' FROM pb_products product'
    .' LEFT JOIN pb_companies as com ON com.id = product.company_id'
    .' LEFT JOIN pb_members as m ON m.id = product.member_id'
    .' WHERE facebook_pubstatus_user_wall=0 AND m.fb_access_token != "" AND m.id != 1'
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
    $res["fb_user"] = json_decode($res_s["fb_user_id"],true);
    $res["fb_access_token"] = $res_s["fb_access_token"];
    $res["fb_post_wall"] = $res_s["fb_post_wall"];
    $res["facebook_pubstatus_user_wall"] = $res_s["facebook_pubstatus_user_wall"];
    $res["title"]= str_replace('[:vi-vn]', '', $res_s["name"]);
    $res['url'] = "http://marketonline.vn/san-pham/".$res_s['id']."/".stringToURI($res['title']);
    $res["content"]= substr(strip_tags(str_replace('[:vi-vn]', '', $res_s["content"])),0,9000);
    $res["fanpage"] = $res_s["fanpage"];
    $res["fanpage_id"] = $companydb->findFacebookId($res["fanpage"]);
    
    
    $message = str_replace("{chuyen_muc}","Gian hàng Online",$message);
    $message = str_replace("{ten_chu_the}",$res_s["shop_name"],$message);
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


//var_dump($share_topics);



$result = '';
// AUTOMATIC POST EACH TOPIC TO FACEBOOK
foreach($share_topics as $share_topic) {
 
  if($share_topic['facebook_pubstatus_user_wall'] == 0) {
    // define POST parameters
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
    
    if($share_topic["fb_post_wall"]) {
      // check if topic successfully posted to Facebook
      try {
	$params["access_token"] = $share_topic["fb_access_token"];
	$ret = $fb->api('/me/feed', 'POST', $params);
	
	$sql = 'UPDATE pb_products SET facebook_pubstatus_user_wall = 1 WHERE id = ' . $share_topic['id'];
	if($conn->query($sql) === false) {
	  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
	}
	
	$logs["link"] = $params["link"];
	$logs["fb_page"] = $share_topic["fb_user"]["link"];
	$logs["type"] = "user_wall";
	$logs["title"] = $params['name'];
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["message"] = $params['message'];
	$logs["kind"] = "product";
	$sharelog->save($logs);
	
	$result .= ' SUCCESSFUL... (Posted to ['.$share_topic["shop_name"].'] Wall) : ' . $share_topic['url'] . $line_break;
      } catch(Exception $e) {
	$sql = 'UPDATE pb_products SET facebook_pubstatus_user_wall = -1 WHERE id = ' . $share_topic['id'];
	if($conn->query($sql) === false) {
	  trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
	}
	
	$logs["link"] = $params["link"];
	$logs["fb_page"] = $share_topic["fb_user"]["link"];
	$logs["type"] = "user_wall";
	$logs["title"] = $params['name'];
	$logs["created"] = date("Y-m-d H:i:s");
	$logs["error_message"] = $e->getMessage();
	$logs["message"] = $params['message'];
	$logs["kind"] = "product";
	$sharelog->save($logs);
	
	$result .= ' FAILED... (' . $e->getMessage() . ') : ' . $share_topic['url'] . $line_break;
      }
      
      sleep(3);
    } else {
      $sql = 'UPDATE pb_products SET facebook_pubstatus_user_wall = -1 WHERE id = ' . $share_topic['id'];
      if($conn->query($sql) === false) {
	trigger_error('Wrong SQL: ' . $sql . ' Error: ' . $conn->error, E_USER_ERROR);
      }
    }
  }
 
}

if($result) $result .= date("Y-m-d H:i:s") . $line_break;

if(php_sapi_name() == 'cli') {
  // keep log
  if($result) file_put_contents('/home/marketon/domains/marketonline.vn/public_html/fb/auto_product_user_wall.log', $result . str_repeat('-', 80) . PHP_EOL, FILE_APPEND);
 
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