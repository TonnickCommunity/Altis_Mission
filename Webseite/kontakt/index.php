<?php

	// connect to database
	$db = mysqli_connect("localhost", "webseite", "WebsEiTe_ToC_2k18", "webseite");

	// insert a quote if submit button is clicked
	if (isset($_POST['submit'])) {

			echo '<script type="text/javascript">';
			echo 'setTimeout(function () { swal("Danke!","Deine Kontaktanfrage wurde erfolgreich übermittelt!","success", {saveMode:true});';
			echo '}, 100);</script>';

			$vorname = $_POST['vorname'];
			$nachname = $_POST['nachname'];
			$email = $_POST['email'];
			$betreff = $_POST['betreff'];
			$nachricht = $_POST['nachricht'];

			$sql = "INSERT INTO formular (vorname, nachname, email, betreff, nachricht) VALUES ('$vorname', '$nachname', '$email', '$betreff', '$nachricht')";

			mysqli_query($db, $sql);
		}
?>


<!DOCTYPE html>
<html>
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.1/sweetalert.min.js"></script>

  <link rel="stylesheet" type="text/css" href="../css/kontakt.css">

	<title>Kontaktformular</title>
</head>

<body>
	<div class="kontaktformular">
		<h2>Kontaktformular</h2>

		<form method="post" action="index.php" class="input_form">

	    <label>Vorname:</label>
			<input type="text" name="vorname" placeholder="Max" class="vorname_input" required> <br><br>

			<label>Nachname:</label>
			<input type="text" name="nachname" placeholder="Mustermann" class="nachname_input" required> <br><br>

	    <label>E-Mail:</label>
			<input type="email" name="email" placeholder="max.mustermann@muster.de" class="email_input" required> <br><br>

	    <label>Betreff:</label>
			<input type="text" name="betreff" placeholder="Musterbetreff" class="betreff_input" required> <br><br>

	    <label>Nachricht:</label>
			<textarea rows="3" maxlength="250" type="text" placeholder="Ihre Nachricht... (max. 250 Zeichen)" name="nachricht" class="nachricht_input" required></textarea> <br><br>

			<table>
				<tr>
					<button type="submit" name="submit" id="add_btn" class="submit" href="#">Daten absenden</button>
				</tr>
				<tr>
					<a class="zurueck" href="../index.php"><img src="../bilder/homeicon.png" alt=""></a>
				</tr>
			</table>

		</form>

	</div>

</body>

</html>
