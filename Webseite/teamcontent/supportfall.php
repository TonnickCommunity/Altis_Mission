<?php
  //Passwortgeschützt
  include('../loginsection/session.php');

  if(!isset($_SESSION['login_user'])){
  header("location: ../loginsection/index.php"); // Redirecting To Home Page
  }

  //delete Anfrage
  if (isset($_GET['del_supportfall'])) {
  	$id = $_GET['del_supportfall'];

  	mysqli_query($db, "DELETE FROM supportfälle WHERE id=".$id);
  	header('location: supportfall.php');
  }
?>

<!DOCTYPE html>
<html lang="de" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Supportfall</title>

    <link rel="stylesheet" href="../css/standard.css">
    <link rel="stylesheet" href="../css/supportfall.css">
  </head>

  <body>

    <div class="contentheadline"> <a class="arrow" href="anfragen.php">&#9664;&#160;</a> Supportfall <a class="arrow inactive" href="#">&#160;&#9654;</a></div>
    <div class="kein_eintrag">-- KEINE EINTRÄGE VORHANDEN --</div>

    <?php
    $supportfalle = mysqli_query($db, "SELECT * FROM supportfälle");
    while ($row = mysqli_fetch_array($supportfalle)) {
    ?>

    <div class="supportfall">

      <table>
        <tr>
          <th class="first_column bold">ID</th>
          <th class="second_column bold">Informationen</th>
          <th></th>
          <th class="delete bold"> <a href="supportfall.php?del_supportfall=<?php echo $row['id'] ?>">&#10003;</a> </th>
        </tr>
        <tr>
          <td class="first_column">#<?php echo $row['id']; ?></td>
          <td class="second_column">Supporter:</td>
          <td class="third_column"><?php echo $row['supporter_name']; ?></a></td>
          <td></td>
        </tr>
        <tr>
          <td class="first_column"></td>
          <td class="second_column">User:</td>
          <td class="third_column"><?php echo $row['user_name']; ?></a></td>
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
          <td class="third_column"><?php echo $row['betreff_sup']; ?></td>
          <td></td>
        </tr>
        <tr>
          <td class="first_column"></td>
          <td class="second_column">Beschreibung:</td>
          <td class="third_column"><?php echo $row['beschreibung']; ?></td>
          <td></td>
        </tr>
      </table>
    </div>
      <?php } ?>

  </body>
</html>
