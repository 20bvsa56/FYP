<?php

class FoodItems{
    //database stuffs
    private $conn;
    private $table = 'items';

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

    // get single food item
    public function read_single(){
        //create query
        $query='SELECT 
        * 
        FROM 
        ' . $this->table .'
        WHERE id = ? 
        LIMIT 0,1 ';
        //to get one record
        //? ? is positional parameter

        //prepare statement
        $stmt=$this->conn->prepare($query);

        //Bind id to ? above
        $stmt->bindParam(1,$this->id);

        //execute query
        $stmt->execute();

        //fetch associative array
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        //set properties
        $this->title = $row['title'];
        $this->name = $row['name'];
        $this->price = $row['price'];
        $this->image = $row['image'];
        $this->categoryId = $row['categoryId'];

    }

    //create food
    public function create(){
        //create query
        $query = 'INSERT INTO  ' .$this->table. '
            SET
                title = :title,
                name= :name,
                price= :price,
                image= :image,
                categoryId = :categoryId';

        //prepare statement
        $stmt=$this->conn->prepare($query);

        //clean data or wrapping data with securities
        $this->title = htmlspecialchars(strip_tags($this->title));
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->image = htmlspecialchars(strip_tags($this->image));
        $this->categoryId = htmlspecialchars(strip_tags($this->categoryId)); 

        //bind name to parameters
         $stmt->bindParam(':title',$this->title);
         $stmt->bindParam(':name',$this->name);
         $stmt->bindParam(':price',$this->price);
         $stmt->bindParam(':image',$this->image);
         $stmt->bindParam(':categoryId',$this->categoryId);
 
        //execute query
        if($stmt->execute()){
            return true;
        }else{
            //print error if sth goes wrong
            printf("Error: %s.\n, stmt->error");
            return false;
        }
    }

    //update food
    public function update(){
        //update query
        $query = 'UPDATE' .$this->table. '
            SET
                title = :title,
                name= :name,
                price= :price,
                image= :image,
                categoryId = :categoryId
            WHERE 
                id = :id';//named parameter
                

        //prepare statement
        $stmt=$this->conn->prepare($query);

        //clean data or wrapping data with securities
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->title = htmlspecialchars(strip_tags($this->title));
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->image = htmlspecialchars(strip_tags($this->image));
        $this->categoryId = htmlspecialchars(strip_tags($this->categoryId)); 

        //bind name to parameters
         $stmt->bindParam(':id',$this->id);
         $stmt->bindParam(':title',$this->title);
         $stmt->bindParam(':name',$this->name);
         $stmt->bindParam(':price',$this->price);
         $stmt->bindParam(':image',$this->image);
         $stmt->bindParam(':categoryId',$this->categoryId);
 
        //execute query
        if($stmt->execute()){
            return true;
        }else{
            //print error if sth goes wrong
            printf("Error: %s.\n, stmt->error");
            return false;
        }
    }

    //delete food
    public function delete(){
        //create query
        $query='DELETE FROM' .$this->table.'
            WHERE id= :id
        ';

        //prepare statement
        $stmt=$this->conn->prepare($query);

        //clean data or wrapping data with securities
        $this->id = htmlspecialchars(strip_tags($this->id));

        //bind name to parameters
        $stmt->bindParam(':id',$this->id);

        if($stmt->execute()){
            return true;
        }else{
            //print error if sth goes wrong
            printf("Error: %s.\n, stmt->error");
            return false;
        }

    }

}
?>
