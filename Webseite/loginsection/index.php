<?php

include('login.php'); // Includes Login Script
if(isset($_SESSION['login_user'])){
header("location: ../team.php"); // Redirecting To Profile Page
}

?>



<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>

  <div id="login" class="login">
    <h2>Login</h2>
    <form action="" method="post">
      <label>Benutzername :</label>
      <input id="name" name="username" placeholder="mustername123" type="text">
      <br>
      <br>
      <label>Passwort :</label>
      <input id="password" name="password" placeholder="**********" type="password">
      <br>
      <br>
      <br>
      <table>
        <tr>
          <input name="submit" type="submit" value=" Login ">
        </tr>
        <tr>
          <a class="zurueck" href="../index.php"><img src="../bilder/homeicon.png" alt=""></a>
        </tr>
      </table>
      <span><?php echo $error; ?></span>
    </form>
  </div>
<img src="" alt="">
</body>
</html>
