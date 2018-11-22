<?php

require('../vendor/autoload.php');
//creamos una nueva instancia de la clase Slim y utilizamos su método App
$app = new \Slim\Slim();



//Listado de Clientes
//ruta que se utilizará para listar los clientes
$app->get('/cliente/lista-clientes', function () use ($app) {

  // realizamos la  consulta sql para listar todos los clientes
  $query = "SELECT * FROM cliente";

  try {
//instanceamos la clase que conecta la base de datos
    $bda = new Connection();
    $bda = $bda->getConnection();
    $listar = $bda->query($query);
    if ($listar->rowCount() > 0) {
      $clientes = $listar->fetchAll(PDO::FETCH_OBJ);
      // mostramos en el listado de los productos en formato json
      echo json_encode($clientes);
    } else {
      echo json_encode("No existen datos en la base de datos");
    }
    

  //cerramos la consulta
    $listar = null;
    $bda = null;

  //Exportar y mostrar en un archivo Json

    


  } catch (PDOException $e) {
 
  //capturar el posible error y mostrarlo en un mensaje
    echo '{"error":{"text":' . $e . getMessage() . ' }';
  }
});

$app->post('/cliente/ingresar-cliente', function() use($app){

  //instancia de la clase Connection que se utiliza para conectar la base de datos
  $db = new Connection();
  $db=$db->getConnection();
  //se pasan los datos por un objeto json para ser procesados y enviados a la base de datos
  $request = $app->request->post('json');
  $data = json_decode($request,true);

  // estado activo para cuando se 
  $data['activo'] = 1;
  //se utiliza el hash  de php con becript para encriptar contraseñas
   $data['contrasenna']=password_hash($data['contrasenna'],PASSWORD_BCRYPT);

   //sentencia sql para ingresar los datos en la tabla cliente
  $insert = $db->query("INSERT INTO cliente VALUES('{$data["cedula"]}',
                                                   '{$data["primer_nombre"]}',
                                                   '{$data["segundo_nombre"]}',
                                                   '{$data["primer_apellido"]}',
                                                    '{$data["segundo_apellido"]}',
                                                   '{$data["telefono"]}'
                                                   )");


//sentencia sql para ingresar datos en la tabla usuario
  $insert = $db->query("INSERT INTO usuario VALUES(NULL,
                                                   '{$data["contrasenna"]}',
                                                   '{$data["correo"]}',
                                                   '{$data["activo"]}',
                                                   '{$data["cedula"]}'
                                                   )");
  if ($insert) {
    $result = array('status' => 'success', 'code' => '200', 'message' => 'cliente Creado Correctamente');
  } else {
    $result = array('status' => 'error', 'code' => '404', 'message' => 'Error al intentear crear el Cliente');
  }
  echo json_encode($result);

});


