<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "tastyorama";

    //create connection
    $conn = new mysql ($servername, $username, $password, $dbname);
    //check connection
    if ($conn->connect_error){
        die("Connection Failed." . $conn->connect_error);
        return;
    }
?>