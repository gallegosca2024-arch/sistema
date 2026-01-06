<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error 404 | Página no encontrada</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }

        .container {
            text-align: center;
            max-width: 520px;
            padding: 40px;
            background: rgba(255,255,255,0.05);
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            backdrop-filter: blur(10px);
        }

        h1 {
            font-size: 120px;
            font-weight: 700;
            line-height: 1;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 26px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        p {
            font-size: 15px;
            opacity: 0.85;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #17a2b8;
            color: #fff;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #138496;
            transform: translateY(-2px);
        }

        @media (max-width: 576px) {
            h1 {
                font-size: 80px;
            }
            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>404</h1>
        <h2>Página no encontrada</h2>
        <p>
            Lo sentimos, la página que estás buscando no existe, fue movida
            o no está disponible en este momento.
        </p>
        <a href="../../view/adminLogin/" class="btn">Volver al inicio</a>
    </div>

</body>
</html>
