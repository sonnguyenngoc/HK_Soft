<?php

# login.php
require_once("sharelib_v4.php");

$helper = $fb->getRedirectLoginHelper();
$permissions = ['email','publish_actions','publish_pages']; // optional
$loginUrl = $helper->getLoginUrl('http://test.marketonline.vn/fb/login-callback.php', $permissions);

echo '<a href="' . $loginUrl . '">Log in with Facebook!</a>';

?>