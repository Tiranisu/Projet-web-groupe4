<?php
  require_once('../resources/database.php');
  // Enable all warnings and errors.
  ini_set('display_errors', 1);
  error_reporting(E_ALL);
          
  // Database connection.
  $db = dbConnect();
?>

<!DOCTYPE HTML>
<html lang='fr'>
  <head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Se connecter </title>
    <link href="../styles/auth.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
  <body>
    <!-- menu bootstrap -->
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand mb-0 h1" href="#">
                <p>Sport'Isen</p>
            </a>
        </div>
    </nav>

    <br>
    <div id="form">
        <p id="registertext">Connexion</p>
        <br>
        <section style="font-size: normal; color: black; font-weight: bolder; padding-bottom: 5px;">Vos informations de connexion sont incorrectes.</section>
        <p id="validmail" style="display: none; color: #FF0000;"><img src="../resources/library/approved mail.png" style="padding-bottom: 5px;" ></img> Adresse valide ! </p>

        <p><input id="mail" type="text" name="email" placeholder= "E-mail" required></p>

        <p id="validmail" style="display: none; color: #13D802;"><img src="../resources/library/approved mail.png" style="padding-bottom: 5px;" ></img> Adresse valide ! </p>
        <p id="unvalidmail" style="display: none; color: #FF0000;"><img src="../resources/library/cancel mail.png" style="padding-bottom: 5px;"></img> Aucun compte a cette adresse ! </p>
        
        <p><input id="text" type="password" name="password" placeholder= "Mot de passe" required></p>
        <input type="submit" id="connect" name="connect" value="Se connecter">
        <br>
        <br>
        <br>
        <section style="font-size: normal; color: black; font-weight: bolder; padding-bottom: 5px;">Pas de compte ?</section>
        <input type="submit" id="register_redirect" name="register" value="S'inscrire">x
        <br>
    </div>
    <script src="../js/connect.js"></script>
</body> 
</html>
