<?php
session_start();
require __DIR__ . "/controllersessao.php";

if (isset($_POST['materias'])) {
    $escolhas = $_POST['materias'];
    

    $_SESSION['materias'] = $escolhas;
    

    header("Location: ../View/home.php");
    exit();
} else {
    header("Location: ../View/home.php");
    exit();
}
?>