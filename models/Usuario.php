<?php
class Usuario extends Conectar
{
    /* Función para login de acceso de usuarios*/
    public function login()
    {
        $conectar = parent::conexion();
        parent::set_names();
        if (isset($_POST["Enviar"])) {
            $correo = $_POST["correo"];
            $pass = $_POST["pass"];


            if (empty($correo) and empty($pass)) {
                /* En caso esten vacíos correo y contraseña, devolver al index con mensaje = 2 */
                header("Location:" . Conectar::ruta() . "view/adminLogin/index.php?m=2");
                exit();
            } else {
                $sql = "SELECT * FROM usuarios WHERE correo=? AND pass=? AND estado='activo'";
                $stmt = $conectar->prepare($sql);
                $stmt->bindValue(1, $correo);
                $stmt->bindValue(2, $pass);
                $stmt->execute();
                $resultado = $stmt->fetch();
                if (is_array($resultado) and count($resultado) > 0) {
                    $_SESSION["id_usuario"] = $resultado["id_usuario"];
                    $_SESSION["nombres"] = $resultado["nombres"];
                    $_SESSION["apellidos"] = $resultado["apellidos"];
                    $_SESSION["correo"] = $resultado["correo"];
                    /*si el login es correcto, redirigir a la vista home */
                    header("Location:" . Conectar::ruta() . "view/adminHome/");
                    exit();
                } else {
                    header("Location:" . Conectar::ruta() . "view/adminLogin/index.php?m=1");
                    exit();
                }
            }
        }
    }
}
