<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once '../../Database.php';
    include_once '../../models/registration.php';

    //Instantiate database & connect
    $database = new Database();
    $db = $database->connect();

    //Instantiate fooditems object
    $user = new Registration($db);

    //query fooditems & calling read method
    $result= $user->read();
    //get row count
    $num = $result->rowCount();

    //check if any users
    if($num > 0){
    //user array
    $users_arr = array();
    $users_arr['data']=array();//data will go here

    //result will give result from read function so looping thorugh it
    while($row = $result->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $userlist = array(
            'id' => $id,
            'username' => $username,
            'email' => $email,
            'password' => $password
        );

        //push to 'data'
        array_push($users_arr['data'], $userlist);
    }

    //turn to json & output
    echo json_encode($users_arr);
        
    }
    else{
        //no food items
        echo json_encode(
            array('message'=> 'No users found')
        );
    }
    
?>