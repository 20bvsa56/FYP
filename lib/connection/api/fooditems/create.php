<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');
    header('Access-Control-Allow-Methods: POST');
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

    $food->title = $data->title;
    $food->name = $data->name;
    $food->price = $data->price;
    $food->image = $data->image;
    $food->categoryId = $data->categoryId;

    //create food 
    if($food->create()){
        echo json_encode(
            array('message' => "Food item added")
        );
    }else{
        echo json_encode(
            array('message' => "Food item not added")
        );
    }
    