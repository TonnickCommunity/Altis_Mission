<?php

//Passwortgeschützt
include('./loginsection/session.php');

if(!isset($_SESSION['login_user'])){
header("location: ./loginsection/index.php"); // Redirecting To Home Page
}

//DB connection für Kontaktformular
$db = mysqli_connect("localhost", "webseite", "WebsEiTe_ToC_2k18", "webseite");

//delete Anfrage
if (isset($_GET['del_anfrage'])) {
	$id = $_GET['del_anfrage'];

	mysqli_query($db, "DELETE FROM formular WHERE id=".$id);
	header('location: team.php');
}

if (isset($_POST['submit'])) {

		echo '<script type="text/javascript">';
		echo 'setTimeout(function () { swal("Danke!","Der Supportfall wird aufgenommen!","success", {saveMode:true});';
		echo '}, 100);</script>';

		$supporter_name = $_POST['supporter_name'];
		$user_name = $_POST['user_name'];
		$betreff_sup = $_POST['betreff_sup'];
		$beschreibung = $_POST['beschreibung'];

		$sql = "INSERT INTO supportfälle (supporter_name, user_name, betreff_sup, beschreibung) VALUES ('$supporter_name', '$user_name', '$betreff_sup', '$beschreibung')";

		mysqli_query($db, $sql);
	}
?>

<!DOCTYPE html>
<html lang="de" dir="ltr">
  <head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/standard.css" rel="stylesheet" type="text/css">
    <link href="css/anfragen.css" rel="stylesheet" type="text/css">
	<link href="css/supportfall.css" rel="stylesheet" type="text/css">

    <title>Tonnick Community</title>
  
  </head>


  <body>
    <div class="header" href="#">
      <h1>Tonnick Teambereich</h1>
      <p>Tonnick Community Teambereich</p>
    </div>

    <!--NavBar-->
  <div class="subheader" href="#">
        <a class="subheaderleft">Benutzer: <u><?php echo $login_session; ?></u></a>
		<button id="myBtn" class="subheaderleft">Supportfall</button>
        <a href="./loginsection/logout.php" class="subheaderright">LogOut</a>
		
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
			<div class="kontaktformular">
					<h2>Kontaktformular</h2>
				<form method="post" action="team.php" class="input_form">
					<label>"Supporter:</label>
						<input type="text" name="supporter_name" placeholder="Supporter" class="vorname_input" required> <br><br>
					<label>User:</label>
						<input type="text" name="user_name" placeholder="User" class="nachname_input" required> <br><br>
					<label>Betreff:</label>
						<input type="text" name="betreff_sup" placeholder="Betreff" class="betreff_sup_input" required> <br><br>
					<label style="color=black">Beschreibung:</label>
						<textarea rows="3" maxlength="250" type="text" placeholder="Kurze Beschreibung... (max. 250 Zeichen)" name="beschreibung" class="nachricht_input" required></textarea> <br><br>
					<table>
						<tr>
							<button type="submit" name="submit" id="add_btn" class="submit" href="#">Daten absenden</button>
						</tr>
					</table>
				</form>
			</div>	
		</div>
	</div>
 </div>

    <div class="parallax"></div>

    <div class="contentbackground plus">

      <div class="contentheadline">Kontaktanfragen</div>
      <div class="kein_eintrag">-- KEINE EINTRÄGE VORHANDEN --</div>

      <?php
      $formular = mysqli_query($db, "SELECT * FROM formular");
      $i = 1; while ($row = mysqli_fetch_array($formular)) {
      ?>

      <div class="anfragen">

        <table>
          <tr>
            <th class="first_column bold">ID</th>
            <th class="second_column bold">Informationen</th>
            <th></th>
            <th class="delete bold"> <a href="team.php?del_anfrage=<?php echo $row['id'] ?>">x</a> </th>
          </tr>
          <tr>
            <td class="first_column">#<?php echo $row['id']; ?></td>
            <td class="second_column">Vorname:</td>
            <td class="third_column"><?php echo $row['vorname']; ?></a>x</td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">Nachname:</td>
            <td class="third_column"><?php echo $row['nachname']; ?></a>x</td>
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
        <?php $i++; } ?>

    </div>

    <div class="parallax2"></div>

	 <div class="contentbackground plus">

      <div class="contentheadline">Supportfall</div>
      <div class="kein_eintrag">-- KEINE EINTRÄGE VORHANDEN --</div>

      <?php
      $supportfälle = mysqli_query($db, "SELECT * FROM supportfälle");
      $i = 1; while ($row = mysqli_fetch_array($supportfälle)) {
      ?>

      <div class="anfragen">
        <table>
          <tr>
            <th class="first_column bold">ID</th>
            <th class="second_column bold">Informationen</th>
            <th></th>
            <th class="delete bold"> <a href="team.php?del_anfrage=<?php echo $row['id'] ?>">x</a> </th>
          </tr>
          <tr>
            <td class="first_column">#<?php echo $row['id']; ?></td>
            <td class="second_column">Supporter:</td>
            <td class="third_column"><?php echo $row['supporter_name']; ?></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">User:</td>
            <td class="third_column"><?php echo $row['user_name']; ?></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column">Datum:</td>
            <td class="third_column"><?php echo $row['datum']; ?></td>
            <td></td>
          </tr>
          <tr>
            <td class="first_column"></td>
            <td class="second_column"> ------------ </td>
            <td class="third_column"></td>
            <td></td>
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
        <?php $i++; } ?>

    </div>
	
	</div>

    <div class="parallax3"></div>

    <div class="contentbackground"><div class=""><i>text</i><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div></div>

    <div class="parallax4"></div>

  
  </body>
  <script type="text/javascript">
	// Get the modal
		var modal = document.getElementById('myModal');

	// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

	// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

	// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
  </script>

</html>
