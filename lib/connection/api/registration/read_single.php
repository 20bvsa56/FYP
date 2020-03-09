<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once '../../Database.php';
    include_once '../../models/registration.php';

    //Instantiate database & coonect
    $database = new Database();
    $db = $database->connect();

    //Instantiate fooditems object
     $user = new Registration($db);  

     //get id 
     //isset will check if sth is set . it gets the value of id from url
     $user->id = isset($_GET['id']) ? $_GET['id'] : die();

    //get food
    $user->read_single();

    //create array
    $user_arr = array(
        'id' => $user->id,
        'username' => $user->username,
        'email' => $user->email,
        'password' => $user->password
    );

    //make json
    print_r(json_encode($user_arr));

?>

