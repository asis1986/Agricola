<?php


//creamos una nueva instancia de la clase Slim y utilizamos su método App
$app = new \Slim\Slim();



//ruta por post para ingresar un nuevo producto

$app->post('/producto/ingresa-producto', function() use ($app){
 
 //sentencia sql a utilizar
$sql = "INSERT INTO producto(cod_producto, nombre_producto, precio) values(:cod_producto,:nombre_producto,:precio)";


try {
//creamos una nueva instancia de la conexión a la base de datos
  
    $bda = new Connection();
//Utilizamos el metodo para realizar la conexión
    $bda = $bda->getConnection();
    $request = $app->request->post('json');
    $data = json_decode($request, true);
  //$statement = $bda->prepare();
    $insert = $bda->prepare("INSERT INTO producto VALUES(NULL,'{$data["nombre_producto"]}','{$data["precio"]}')");

  $insert->execute();
// Mensaje para notificar que los datos fueron guardados en base de datos
    echo '{"notice":{"text": "Producto agregado"}';
} catch (PDOException $e) {
  //Mensaje que se enviará en caso de un posible error
    echo '{"error":{"text":' . $e . getMessage() . ' }';
}

});

$app->get('/producto/lista-productos', function() use($app){
    $query = "SELECT * FROM producto";

    try {

        $bda = new Connection();
        $bda = $bda->getConnection();
        $listar = $bda->query($query);
        if ($listar->rowCount() > 0) {
            $productos = $listar->fetchAll(PDO::FETCH_OBJ);
            echo json_encode($productos);
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