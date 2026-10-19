<?php

/*
   LOGOUT
   Encerra a sessão e volta para a página inicial.
*/

session_start();
session_unset();
session_destroy();

header("Location: ../View/inicial.php");
exit();
?>
