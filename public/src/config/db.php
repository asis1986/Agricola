<?php

class Connection{
 
      // arreglar codificación de caracteres utf-8

  function getConnection()
  { 

    try {
      $dbhost = "localhost";
      $dbuser = "root";
      $dbpass = "";
      $dbname = "isolid";
      $dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
      $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $dbh->exec("set names utf8");
      echo json_encode("Conectado");
      return $dbh;
    } catch (PDOException $e) {
     
    }
   

  }
      

    
}

?>