<?php 
session_start();

if (!isset($_SESSION['login'])) {
    header("Location: ../index.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer</title>
</head>
<body>

    <h1>Ini Halaman Customer</h1>
    
</body>
</html>