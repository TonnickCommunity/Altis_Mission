<?php
  //Passwortgeschützt

  include('../loginsection/session.php');

  if(!isset($_SESSION['login_user'])){
  header("location: ../loginsection/index.php"); // Redirecting To Home Page
  }


  //delete Anfrage
  if (isset($_GET['del_anfrage'])) {
  	$id = $_GET['del_anfrage'];

  	mysqli_query($db, "DELETE FROM formular WHERE id=".$id);
  	header('location: anfragen.php');
  }
?>

<!DOCTYPE html>
<html lang="de" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Anfragen</title>

    <link rel="stylesheet" href="../css/standard.css">
    <link rel="stylesheet" href="../css/anfragen.css">
  </head>
  <body>

      <div class="contentheadline"> <a class="arrow inactive" href="#">&#9664;&#160;</a> Kontaktanfragen <a class="arrow" href="supportfall.php">&#160;&#9654;</a></div>
      <div class="kein_eintrag">-- KEINE EINTRÄGE VORHANDEN --</div>

      <?php
      $formular = mysqli_query($db, "SELECT * FROM formular");
      while ($row = mysqli_fetch_array($formular)) {
      ?>

      <div class="anfragen">

        <table>
          <tr>
            <th class="first_column bold">ID</th>
            <th class="second_column bold">Informationen</th>
            <th></th>
            <th class="delete bold"> <a href="anfragen.php?del_anfrage=<?php echo $row['id'] ?>">&#10003;</a> </th>
          </tr>
          <tr>
            <td class="first_column">#<?php echo $row['id']; ?></td>
            <td class="second_column">Vorname:</td>
            <td class="third_column"><?php echo $row['vorname']; ?></a></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">Nachname:</td>
            <td class="third_column"><?php echo $row['nachname']; ?></a></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">E-Mail:</td>
            <td class="third_column"><?php echo $row['email']; ?></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column"> __________ </td>
            <td class="third_column"></td>
            <td> </td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">Betreff:</td>
            <td class="third_column"><?php echo $row['betreff']; ?></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">Nachricht:</td>
            <td class="third_column"><?php echo $row['nachricht']; ?></td>
            <td></td>
          </tr>
        </table>
      </div>
        <?php } ?>

  </body>
</html>
