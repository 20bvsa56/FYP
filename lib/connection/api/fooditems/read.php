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

    //query fooditems & calling read method
    $result= $food->read();
    //get row count
    $num = $result->rowCount();

    //check if any fooditems
    if($num > 0){
    //food array
    $fooditems_arr = array();
    $fooditems_arr['data']=array();//data will go here

    //result will give result from read function so looping thorugh it
    while($row = $result->fetch(PDO::FETCH_ASSOC)){
        extract($row);

        $fooditem = array(
            'id' => $id,
            'title' => $title,
            'name' => $name,
            'price' => $price,
            'categoryId' => $categoryId,
            'image' => $image
        );

        //push to 'data'
        array_push($fooditems_arr['data'], $fooditem);
    }

    //turn to json & output
    echo json_encode($fooditems_arr);
        
    }
    else{
        //no food items
        echo json_encode(
            array('message'=> 'No food items found')
        );
    }
    
?>