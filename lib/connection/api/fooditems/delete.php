<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: DELETE');
    header('Access-Control-Allow-Headers: Access-Control-Allow-Methods, Access-Control-Allow-Headers, Content-Type, Authorization, X-Requested-With' );

    include_once '../../Database.php';
    include_once '../../models/fooditems.php';

    //Instantiate database & coonect
    $database = new Database();
    $db = $database->connect();

    //Instantiate fooditems object
    $food = new FoodItems($db);

    //get raw posted data
    $data = json_decode(file_get_contents("php://input"));

    //set id to delete
    $food->id = $data->id;

    //delete food 
    if($food->delete()){
        echo json_encode(
            array('message' => "Food item deleted")
        );
    }else{
        echo json_encode(
            array('message' => "Food item not deleted")
        );
    }
    