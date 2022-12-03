<?php
    $server = "us-cdbr-east-06.cleardb.net"; //server của database
    $username = "bec96958bdb28c"; 
    $password = "f9d591dd";
    $db = "heroku_178d09976bce30c"; // tên database

    $conn = new mysqli($server, $username, $password, $db);
    if ($conn->connect_error) {
        die ("Connect failed". $conn->connect_error);
    }
?>