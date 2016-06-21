<?php

if(file_exists('../configs/config.inc.php')) {
    require_once('../configs/config.inc.php');    
    require_once("../libraries/common.inc.php");
    require_once("../share.inc.php");
    require_once('../libraries/core/models/company.php');
    require_once('../libraries/core/models/trade.php');
    require_once('../libraries/core/models/fbsharelog.php');
} else {
    require_once('/home/marketon/domains/marketonline.vn/public_html/configs/config.inc.php');
    require_once("/home/marketon/domains/marketonline.vn/public_html/libraries/common.inc.php");
    require_once("/home/marketon/domains/marketonline.vn/public_html/share.inc.php");
    require_once('/home/marketon/domains/marketonline.vn/public_html/libraries/core/models/company.php');
    require_once('/home/marketon/domains/marketonline.vn/public_html/libraries/core/models/trade.php');
    require_once('/home/marketon/domains/marketonline.vn/public_html/libraries/core/models/fbsharelog.php');
}

require_once('Encoding.php'); 
use \ForceUTF8\Encoding;  // It's namespaced now.

$sharelog = new Fbsharelogs();

// determine script invocation (CLI or Web Server)
if(php_sapi_name() == 'cli') {
  $line_break = PHP_EOL;
} else {
  $line_break = '<br>';
}



// connect to database
//$conn = new mysqli("localhost", "marketon_user", "aA456321@", "marketon_main"); // configure appropriately
$conn = new mysqli($dbhost, $dbuser, $dbpasswd, $dbname); // configure appropriately
// check connection
if ($conn->connect_error) {
  trigger_error('Database connection failed: '  . $conn->connect_error, E_USER_ERROR);
}
mysqli_set_charset( $conn, 'utf8' );



//get message template
$sql = 'SELECT *'    
    .' FROM pb_announcements'
    .' WHERE id=21'
    .' LIMIT 1';
$mm = $conn->query($sql);
if($mm === false) {
  $user_error = 'Wrong SQL: ' . $sql . '<br>' . 'Error: ' . $conn->errno . ' ' . $conn->error;
  trigger_error($user_error, E_USER_ERROR);
}
$mm->data_seek(0);
$template = $mm->fetch_assoc();
$message = Encoding::toUTF8($template["message"]);
$message = strip_tags(str_replace("<br />","\n",$message));


//GET FACEBOOK APP ACCESS
//get message template
$sql = 'SELECT *'    
    .' FROM pb_members'
    .' WHERE id=1'
    .' LIMIT 1';
$mm = $conn->query($sql);
if($mm === false) {
  $user_error = 'Wrong SQL: ' . $sql . '<br>' . 'Error: ' . $conn->errno . ' ' . $conn->error;
  trigger_error($user_error, E_USER_ERROR);
}
$mm->data_seek(0);
$admin = $mm->fetch_assoc();
$admin["fb_user"] = json_decode($admin["fb_user_id"],true);


$config = array();
$config['appId'] = $admin["fb_app_id"];
$config['secret'] = $admin["fb_secret"];
$fb_access_token = $admin["fb_access_token"];
$config['fileUpload'] = false; // optional


// Connect to facebook sdk
require_once("sdk_v4/autoload.php"); // set the right path
//$fb = new Facebook($config);
$fb = new Facebook\Facebook([
  'app_id' => '1226574870702526',
  'app_secret' => '676ea4e2bf3a6e10ab32f2eb2b0021ea',
  'default_graph_version' => 'v2.2',
]);

?>