<?php

require('../vendor/autoload.php');
//creamos una nueva instancia de la clase Slim y utilizamos su método App
$app = new \Slim\Slim();


$app->post('/users/signin', function() use ($app){

    //$query = "SELECT * FROM usuario WHERE "

});

$app->get('/usuario/lista-usuarios', function () use ($app) {
    $query = "SELECT * FROM usuario";

    try {

        $bda = new Connection();
        $bda = $bda->getConnection();
        $listar = $bda->query($query);
        if ($listar->rowCount() > 0) {
            $usuarios = $listar->fetchAll(PDO::FETCH_OBJ);
            echo json_encode($usuarios);
        } else {
            echo json_encode("No existen datos en la base de datos");
        }
        $listar = null;
        $bda = null;

  //Exportar y mostrar en un archivo Json

    } catch (PDOException $e) {
 
  //capturar el posible error y mostrarlo en un mensaje
        echo '{"error":{"text":' . $e . getMessage() . ' }';
    }
})


?>