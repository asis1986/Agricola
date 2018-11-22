<?php
//include_once "data.connection.php";


//Funcíon para realizar Conexíón a bases de datos

function getConnection(){

  $dbhost = "127.0.0.1";
  $dbuser = "root";
  $dbpass = "palmett1786";
  $dbname = "mydb";
  $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  return $dbh;

}



/*
try {
  $connect = new PDO(dsn, user, password);
  echo 'Conexión exitosa';
} catch (PDOException $e) {
  echo 'estas Mal:(';
  echo json_encode([
    "error" => [
      "text" => $e->getMessage()
    ]
  ]);
  //echo '{"error":{"text":' . $e->getMessage() . '}}';
}
 */ 

