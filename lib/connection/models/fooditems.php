<?php

class FoodItems{
    //database stuffs
    private $conn;
    private $table = 'fooditems';

    //Table properties
    public $id;
    public $title;
    public $name;
    public $price;
    public $categoryId;
    public $image;

    //constructor with database
    public function __construct($db){
        $this->conn = $db;
    }

    //get fooditems
    public function read(){
        //create query
        $query='SELECT 
                * 
                FROM 
                ' . $this->table .'
                ';
        
        //prepare statement
        $stmt=$this->conn->prepare($query);

        //execute query
        $stmt->execute();

        return $stmt;

    }

}
?>
