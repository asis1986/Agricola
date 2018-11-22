
CREATE DATABASE IF NOT EXISTS isolid /*!40100 DEFAULT CHARACTER SET utf8 */;
USE isolid;

-- Volcando estructura para tabla isolid.administrador
CREATE TABLE IF NOT EXISTS administrador (
  `cedula` varchar(13) NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.cliente
CREATE TABLE IF NOT EXISTS cliente (
  `cedula` varchar(13) NOT NULL,
  `primer_nombre` varchar(45) NOT NULL,
  `segundo_nombre` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.compraproducto
CREATE TABLE IF NOT EXISTS compraproducto (
  `cod_compraproducto` int(6) NOT NULL AUTO_INCREMENT,
  `cliente_cedula` varchar(13) NOT NULL,
  `producto_cod_producto` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_compraproducto`,`cliente_cedula`,`producto_cod_producto`),
  KEY `fk_cliente_has_producto_producto1_idx` (`producto_cod_producto`),
  KEY `fk_cliente_has_producto_cliente1_idx` (`cliente_cedula`),
  CONSTRAINT `fk_cliente_has_producto_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_producto_producto1` FOREIGN KEY (`producto_cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.compraproducto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `compraproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `compraproducto` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.humedad
CREATE TABLE IF NOT EXISTS humedad (
  `idhumedad` int(11) NOT NULL AUTO_INCREMENT,
  `medicion` varchar(45) NOT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idhumedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.humedad: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `humedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `humedad` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.humedad_has_cliente
CREATE TABLE IF NOT EXISTS humedad_has_cliente (
  `idtomahumedad` int(11) NOT NULL AUTO_INCREMENT,
  `humedad_idhumedad` int(11) NOT NULL,
  `cliente_cedula` varchar(13) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtomahumedad`,`humedad_idhumedad`,`cliente_cedula`),
  KEY `fk_humedad_has_cliente_cliente1_idx` (`cliente_cedula`),
  KEY `fk_humedad_has_cliente_humedad1_idx` (`humedad_idhumedad`),
  CONSTRAINT `fk_humedad_has_cliente_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_humedad_has_cliente_humedad1` FOREIGN KEY (`humedad_idhumedad`) REFERENCES `humedad` (`idhumedad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.humedad_has_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `humedad_has_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `humedad_has_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.ph
CREATE TABLE IF NOT EXISTS ph (
  `idph` int(11) NOT NULL AUTO_INCREMENT,
  `medicion` varchar(45) NOT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idph`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.ph: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ph` DISABLE KEYS */;
/*!40000 ALTER TABLE `ph` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.ph_has_cliente
CREATE TABLE IF NOT EXISTS ph_has_cliente (
  `idtomaph` int(11) NOT NULL AUTO_INCREMENT,
  `ph_idph` int(11) NOT NULL,
  `cliente_cedula` varchar(13) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtomaph`,`ph_idph`,`cliente_cedula`),
  KEY `fk_ph_has_cliente_cliente1_idx` (`cliente_cedula`),
  KEY `fk_ph_has_cliente_ph1_idx` (`ph_idph`),
  CONSTRAINT `fk_ph_has_cliente_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ph_has_cliente_ph1` FOREIGN KEY (`ph_idph`) REFERENCES `ph` (`idph`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.ph_has_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ph_has_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `ph_has_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.producto
CREATE TABLE IF NOT EXISTS producto (
  `cod_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(45) NOT NULL,
  `precio` varchar(6) NOT NULL,
  PRIMARY KEY (`cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.temperatura
CREATE TABLE IF NOT EXISTS temperatura (
  `idtemperatura` int(11) NOT NULL AUTO_INCREMENT,
  `medicion` varchar(45) NOT NULL,
  `hora` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtemperatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.temperatura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `temperatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `temperatura` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.temperatura_has_cliente
CREATE TABLE IF NOT EXISTS temperatura_has_cliente (
  `idtomatemperatura` int(11) NOT NULL AUTO_INCREMENT,
  `temperatura_idtemperatura` int(11) NOT NULL,
  `cliente_cedula` varchar(13) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtomatemperatura`,`temperatura_idtemperatura`,`cliente_cedula`),
  KEY `fk_temperatura_has_cliente_cliente1_idx` (`cliente_cedula`),
  KEY `fk_temperatura_has_cliente_temperatura1_idx` (`temperatura_idtemperatura`),
  CONSTRAINT `fk_temperatura_has_cliente_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_temperatura_has_cliente_temperatura1` FOREIGN KEY (`temperatura_idtemperatura`) REFERENCES `temperatura` (`idtemperatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.temperatura_has_cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `temperatura_has_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `temperatura_has_cliente` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.usuario
CREATE TABLE IF NOT EXISTS usuario (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `contrasenna` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `cliente_cedula` varchar(13) NOT NULL,
  PRIMARY KEY (`cod_usuario`,`cliente_cedula`),
  KEY `fk_usuario_cliente_idx` (`cliente_cedula`),
  CONSTRAINT `fk_usuario_cliente` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla isolid.usuario_has_administrador
CREATE TABLE IF NOT EXISTS usuario_has_administrador (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_cod_usuario` int(11) NOT NULL,
  `administrador_cedula` varchar(13) NOT NULL,
  `contrasenna` varchar(45) NOT NULL,
  `nick` varchar(45) NOT NULL,
  PRIMARY KEY (`idadmin`,`usuario_cod_usuario`,`administrador_cedula`),
  KEY `fk_usuario_has_administrador_administrador1_idx` (`administrador_cedula`),
  KEY `fk_usuario_has_administrador_usuario1_idx` (`usuario_cod_usuario`),
  CONSTRAINT `fk_usuario_has_administrador_administrador1` FOREIGN KEY (`administrador_cedula`) REFERENCES `administrador` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_administrador_usuario1` FOREIGN KEY (`usuario_cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla isolid.usuario_has_administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_has_administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_administrador` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
