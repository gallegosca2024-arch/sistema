<?php

    /* Clase Conector */
    class Conectar {

        protected $dbh;
        
        /* Función protegida de la cadena de conexión */
        protected function Conexion() {
            try {
                /* Cadena de Conexión a la Base de Batos */
                $conectar = $this->dbh = new PDO("mysql:host=localhost;dbname=kairo_siste", "root", "");
                return $conectar;
                /* En Caso Que Hubiera Un Error en la Cadena de Conexión */
            } catch (Exception $e) {
                print "¡Error BD!: " . $e->getMessage() . "<br/>";
                die();
            }
        }

        /* Función protegida para impedir problemas con las ñ o tildes */
        protected function set_names() {
            return $this->Conexion()->query("SET NAMES 'utf8'");
        }

        public function ruta () {
            return "http://localhost/SISTEMA_CERTIFICACION/";
        }
    }

?>