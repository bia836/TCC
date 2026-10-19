<?php
session_start();
require __DIR__ . "/controllersessao.php";

if (isset($_POST['materias'])) {
    $escolhas = $_POST['materias'];
    
    // Store the selected subjects in session
    $_SESSION['materias'] = $escolhas;
    
    // Redirect to home page
    header("Location: ../View/home.php");
    exit();
} else {
    // If no subjects selected, still redirect to home
    header("Location: ../View/home.php");
    exit();
}
?>