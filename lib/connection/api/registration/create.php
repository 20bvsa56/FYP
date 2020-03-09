<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Methods, Access-Control-Allow-Headers, Content-Type, Authorization, X-Requested-With' );

    include_once '../../Database.php';
    include_once '../../models/registration.php';

    //Instantiate database & coonect
    $database = new Database();
    $db = $database->connect();

    //Instantiate registration object
    $user = new Registration($db);

    //get raw posted data
    $data = json_decode(file_get_contents("php://input"));

    $user->username = $data->username;
    $user->email = $data->email;
    $user->password = $data->password;

    //create user 
    if($user->create()){
        echo json_encode(
            array('message' => "User registered")
        );
    }else{
        echo json_encode(
            array('message' => "User not registered")
        );
    }
    