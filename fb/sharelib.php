<?php

require_once('Encoding.php');

$config = array();
$config['appId'] = $admin["fb_app_id"];
$config['secret'] = $admin["fb_secret"];
$fb_access_token = $admin["fb_access_token"];
$config['fileUpload'] = false; // optional
$fb = new Facebook($config);

$admin["fb_user"] = json_decode($admin["fb_user_id"],true);
//echo $admin["fb_user"]["link"];
//echo date("Y-m-d H:i:s");
?>