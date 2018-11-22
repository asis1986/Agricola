

<?php

require('../vendor/autoload.php');
//require('./data.connection.php');
require('./src/config/db.php');

$app = new \Slim\Slim();
$app->get('/api/probar', function () use($app){

  // realizamos la  consulta sql para listar todos los clientes

  try {

    $bda = new Connection();
    $bda = $bda->getConnection();
   
    echo json_encode($bda);
  //cerramos la consulta
    $listar = null;
    $bda = null;

  //Exportar y mostrar en un archivo Json

  } catch (PDOException $e) {
 
  //capturar el posible error y mostrarlo en un mensaje
    echo '{"error":{"text":' . $e . getMessage() . ' }';
  }
});

//crear las rutas para el cliente
//importamos el archivo client.php que se encuentra en la carpeta routes
//require('./src/routes/client.php');
require('./src/routes/users.php');
//require('./src/routes/products.php');

$app->run();


?>