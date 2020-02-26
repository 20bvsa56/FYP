<?php
class Database{
    //database params
    private $servername = 'localhost';
    private $username = 'root';
    private $password = '';
    private $dbname = 'tastyorama';
    private $conn;

    //database connection->method to connect
    public function connect(){
        $this->conn = null;//setting connection property to null
        
        try{
            $this->conn = new PDO('mysql:host=' .$this->servername . ';dbname=' .$this->dbname, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }catch(PDOException $e){
            echo 'Connection Error:' . $e->getMessage();
        }
        return $this->conn;
    
    }
}
    
?>