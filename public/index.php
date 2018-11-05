

<?php
require('../vendor/autoload.php');
require('./data.connection.php');
$app = new \Slim\Slim();


//creamos la conexón a la base de datos


// calizar la conexión a la base de datos
try {
  $connect = new mysqli(dsn, user, password, bdname);
  echo 'Coneccion exitosa';
} catch (PDOException $e) {
  echo 'estas Mal:(';
  echo '{"error":{"text":' . $e->getMessage() . '}}';
}

//ruta por post para ingresar datos a la base de datos
$app->post('/ingresar', function () use ($app, $connect) {
  $json = $app->request->post('json');
  $data = json_decode($json, true);
  var_dump($data);
  $insert = $connect->prepare("INSERT INTO cliente VALUES(
                                                   '{$data["cedula"]}',
                                                   '{$data["primer_nombre"]}',
                                                   '{$data["segundo_nombre"]}',
                                                   '{$data["primer_apellido"]}',
                                                   '{$data["segundo_apellido"]}',
                                                  '{$data["telefono"]}')");
  $insert->execute();
  $insert->close();
  $connect->close();
  if ($insert) {
    $result = array('status' => 'success', 'code' => '200', 'message' => 'Usuario Creado Correctamente');
  } else {
    $result = array('status' => 'error', 'code' => '404', 'message' => 'Error al intentear crear el Usuario');
  }
  echo json_encode($result);

});



//ruta por get para traer datos desde la base de datos

$app->get('/lista-clientes', function () use ($connect, $app) {
  $sql = 'SELECT * FROM cliente;';
  $query = $connect->query($sql);

  $clientes = array();

  while ($cliente = $query->fetch_assoc()) {
    $clientes[] = $cliente;
  }
  $result = array("status" => "success", "message" => $clientes);

  var_dump($result);
  return json_encode($result);

});



// Actualizar datos del cliente
$app->put('/users/:id', function ($id) use ($connect, $app) {

  $request = $app->request;

  $sql = "UPDATE cliente SET
                                  primer_nombre = '{$request->params("primer_nombre")}',
                                  segundo_nombre = '{$request->params("segundo_nombre")}',
                                  primer_apellido = '{$request->params("primer_apellido")}',
                                  segundo_apellido = '{$request->params("segundo_apellido")}',
                                  telefono = '{$request->params("telefono")}'
                                 WHERE cedula=$id";

  $update = $connect->query($sql);

  if ($update) {
    $result = array("status" => "true", "message" => "Usuario modificado correctamente");
  } else {
    $result = array("status" => "false", "message" => "Usuario NO modificado");
  }
  echo json_encode($result);
});

$app->run();


?>