<?php
    class Curso extends Conectar {
        public function insert_curso($titulo,$descripcion,$objetivo,$codigo_curso,$id_categoria,$modalidad,$duracion_horas,$nivel,$tipo_certificado,$fecha_inicio,$fecha_fin){
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "INSERT INTO curso (id_curso, titulo, descripcion, objetivo, codigo_curso, id_categoria, modalidad, duracion_horas, nivel, tipo_certificado, fecha_inicio, fecha_fin, estado, fecha_creacion, fecha_actualizacion, creado_por) VALUES (NULL,?,?,?,?,?,?,?,?,?,?,?,'publicado',now(),now(),'1'";
            $sql = $conectar -> prepare($sql);
            $sql -> bindValue(1, $titulo);
            $sql -> bindValue(2, $descripcion);
            $sql -> bindValue(3, $objetivo);
            $sql -> bindValue(4, $codigo_curso);
            $sql -> bindValue(5, $id_categoria);
            $sql -> bindValue(6, $modalidad);
            $sql -> bindValue(7, $duracion_horas,);
            $sql -> bindValue(8, $nivel);
            $sql -> bindValue(9, $tipo_certificado);
            $sql -> bindValue(10, $fecha_inicio);
            $sql -> bindValue(11, $fecha_fin);
            return $resultado = $sql -> fetchAll();
        }

        public function update_curso($id_curso,$titulo,$descripcion,$objetivo,$codigo_curso,$id_categoria,$modalidad,$duracion_horas,$nivel,$tipo_certificado,$fecha_inicio,$fecha_fin){
            $conectar = parent::conexion();
            $sql = "UPDATE curso 
                        SET titulo=?, 
                            descripcion=?, 
                            objetivo=?, 
                            codigo_curso=?, 
                            id_categoria=?,
                            modalidad=?,
                            duracion_horas=?,
                            nivel=?,
                            tipo_certificado=?,
                            fecha_inicio=?,
                            fecha_fin=?
                        WHERE
                            id_curso=?";
            $sql = $conectar -> prepare($sql);
            $sql -> bindValue(1, $titulo);
            $sql -> bindValue(2, $descripcion);
            $sql -> bindValue(3, $objetivo);
            $sql -> bindValue(4, $codigo_curso);
            $sql -> bindValue(5, $id_categoria);
            $sql -> bindValue(6, $modalidad);
            $sql -> bindValue(7, $duracion_horas,);
            $sql -> bindValue(8, $nivel);
            $sql -> bindValue(9, $tipo_certificado);
            $sql -> bindValue(10, $fecha_inicio);
            $sql -> bindValue(11, $fecha_fin);
            $sql -> bindValue(12, $id_curso);
            return $resultado = $sql -> fetchAll();
        }

        public function delete_curso($id_curso){
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "UPDATE curso SET estado = 'inactivo' WHERE id_curso=?";
            $sql = $conectar -> prepare($sql);
            $sql -> bindValue(1, $id_curso);
            $sql -> execute();
            return $resultado = $sql -> fetchAll();
        }

        public function get_curso(){
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "SELECT * FROM cursos WHERE estado='publicado'";
            $sql = $conectar -> prepare($sql);
            $sql -> execute();
            return $resultado = $sql -> fetchAll();
        }

        public function get_curso_id($id_curso){
            $conectar = parent::conexion();
            parent::set_names();
            $sql = "SELECT * FROM cursos WHERE estado='publicado' AND id_curso = ?";
            $sql = $conectar -> prepare($sql);
            $sql -> bindValue(1, $id_curso);
            $sql -> execute();
            return $resultado = $sql -> fetchAll();
        }
    }
?>