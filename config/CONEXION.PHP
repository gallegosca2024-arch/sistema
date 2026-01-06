<?php
/* Iniciando la sesión del usuario SOLO si no existe */
    session_start();

/* Clase Conector */
class Conectar {

    protected $dbh;
    
    /* Función protegida de la cadena de conexión */
    protected function Conexion() {
        try {
            $conectar = $this->dbh = new PDO(
                "mysql:host=localhost;dbname=kairo_siste",
                "root",
                ""
            );
            return $conectar;
        } catch (Exception $e) {
            die("¡Error BD!: " . $e->getMessage());
        }
    }

    /* Función protegida para impedir problemas con ñ o tildes */
    protected function set_names() {
        return $this->Conexion()->query("SET NAMES 'utf8'");
    }

    public static function ruta() {
        return "http://localhost/SISTEMA_CERTIFICACION/";
    }
}
