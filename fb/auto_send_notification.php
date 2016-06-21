<?php
    require_once('sharelib.php'); 

    $params = array(
        "access_token" => "CAAEIS7GNlZAEBAOfGFFXs5uDl1mBKco9qb8Stz20L4VTxVMzOWuZA7vZCdmVfZCFW9Kq44A8OQKXIUTdbm8wDzbAfmsCG3NrWXQHyPA4VHDPlF25vA9bf9XkJdkjAORn5OuOe6By3cRkQPCsKOZCZBa4GWA5J25IZAeTZBpH1kw4XdNQoNgUy7Vn74znAarLWDd9G7rzNjR5ontCX8EvxOOR", // configure appropriately
        "href" => "http://marketonline.vn",
        "template" => "Kiểm tra send notification to user"
    );

    try {
	$ret = $fb->api('/me/notifications', 'POST', $params);
    } catch(Exception $e) {
	echo ' FAILED... (' . $e->getMessage() . ') : ' . $share_topic['url'] . $line_break;
    }
    
?>