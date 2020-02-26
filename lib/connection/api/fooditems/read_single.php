<?php
//rest api which will be accessed by http
    //Headers
    header('Access-Control-Allow-Origin: *');
    header('Content-Type: application/json');

    include_once '../../Database.php';
    include_once '../../models/fooditems.php';

    //Instantiate database & coonect
    $database = new Database();
    $db = $database->connect();

    //Instantiate fooditems object
     $food = new FoodItems($db);  

     //get id 
     //isset will check if sth is set . it gets the value of id from url
     $food->id = isset($_GET['id']) ? $_GET['id'] : die();

    //get food
    $food->read_single();

    //create array
    $food_arr = array(
        'id' => $food->id,
        'title' => $food->title,
        'name' => $food->name,
        'price' => $food->price,
        'categoryId' => $food->categoryId,
        'image' => $food->image
    );

    //make json
    print_r(json_encode($food_arr));

?>