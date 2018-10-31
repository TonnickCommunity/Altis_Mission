<?php

//Passwortgeschützt
include('./loginsection/session.php');

if(!isset($_SESSION['login_user'])){
header("location: ./loginsection/index.php"); // Redirecting To Home Page
}



if (isset($_POST['submit'])) {

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

    <title>Tonnick Community</title>

  </head>


  <body>
		<!-- Header -->
    <div class="header" href="#">
      <h1>Tonnick Teambereich</h1>
      <p>Tonnick Community Teambereich</p>
    </div>

		<!-- Login INFOS -->
	  <div class="loginheader" href="#">
	        <a class="loginheaderleft">Benutzer: <u><?php echo $login_session; ?></u></a>
	        <a href="./loginsection/logout.php" class="loginheaderright">LogOut</a>
		</div>

	 	<div class="parallax"></div>

    <div class="contentbackgroundop">
			<iframe src="./teamcontent/anfragen.php" width="100%" height="100%" onload="resizeIframe(this)"></iframe>
    </div>

    <div class="parallax2"></div>

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

		function resizeIframe(obj) {
	    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
	  }
  </script>

</html>
