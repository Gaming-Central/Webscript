# Installations Skript

echo "Willkommen"
wget http://151.80.246.165/git/licenses/webscript-lizenz.txt
mv "webscript-lizenz.txt" "LICENSE"
less LICENSE
echo "Fortschritt(5%)"
echo 
echo "Bitte einen Ordner zum installieren Auswählen:"
read od
echo "Die Datein werden in $od erstellt."
echo 
chmod -R 777 $od
cd $od
echo
ls -la $od
mkdir AdminPanel
wget http://151.80.246.165/git/download/CHANGELOG
touch upload.php
touch checkuser.php
touch formular.php
touch logout.php
touch ./AdminPanel/index.php
touch index.php
echo "Fortschritt(10%)"
echo 
wget http://151.80.246.165/git/download/chanel.txt
mv "chanel.txt" "chan.php"
echo 
echo "Fortschritt(15%)"
echo '<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
?>' >>upload.php
echo 
echo "Fortschritt(20%)"
echo '<html>
<head>
<meta charset="utf-8">
</head>
<body>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "LoginSystem";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT `Id`, `Nickname` FROM `benutzerdaten` ";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($row = mysqli_fetch_assoc($result)) {
        echo $row["Nickname"];
	echo "<br>";
    }
} else {
    echo "0 results";
}

mysqli_close($conn);
?>

<!-- Useradd Skript -->
<form action="useradd.php" method="post">
  Name:      <input type="text" name="name" size="20"><br>
  Vorame:    <input type="text" name="vname" size="20"><br>
  Nachname:  <input type="text" name="lname" size="20"><br>
  Kennwort:  <input type="password" name="pwd" size="20"><br>
  <input type="submit" value="Erstellen">
</form>

</body>
</html>' >>AdminPanel/index.php
echo 
echo "Fortschritt(25%)"
echo '<?php
session_start ();
if (!isset ($_SESSION["user_id"]))
{
  header ("Location: formular.php");
}
?>
 ' >>checkuser.php
echo 
echo "Fortschritt(30%)"
echo '<?php session_start (); ?>
<html>
<head>
  <title>Login</title>
</head>
 
<body>
<?php
if (isset ($_REQUEST["fehler"]))
{
  echo "Die Zugangsdaten waren ungültig.";
}
?>

<!-- Login Formular -->

<form action="login.php" method="post">
  Name:     <input type="text" name="name" size="20"><br>
  Kennwort: <input type="password" name="pwd" size="20"><br>
  <input type="submit" value="Login">
</form>
</body>
</html>
 ' >>formular.php
echo 
echo "Fortschritt(35%)"
echo 
wget http://151.80.246.165/git/download/logi.txt
mv "logi.txt" "login.php"
echo 
echo "Fortschritt(40%)"
echo ' <?php
// Wird ausgeführt um mit der Ausgabe des Headers zu warten.
ob_start ();
 
session_start ();
session_unset ();
session_destroy ();
 
header ("Location: formular.php");

?>
 ' >>logout.php
echo 
echo "Fortschritt(45%)"
echo 
wget http://151.80.246.165/git/download/useradd.php
echo 
echo "Fortschritt(50%)"
echo ' 
<?php
include("checkuser.php");
?>

<html>

<head>

<meta charset=utf-8>

  <title>Interne Seite</title>

</head>

<body>

<a href=AdminPanel/index.php>Administration</a>

<br>

<!-- TeamSpeak Channel erstell Skript -->

<form action="chan.php" method="post">
  Name des permanenten Channels:      <input type="text" name="name" size="20"><br>
  <input type="submit" value="Erstellen">
</form>

<br>

<!-- Upload-Funktion -->

<form action="upload.php" method="post" enctype="multipart/form-data">
    Datei auswählen<br>
    <input type="file" name="fileToUpload" id="fileToUpload"><br>
    <input type="submit" value="Hochladen" name="submit">
</form>

<hr color="#FF0000">

<!-- Wiedergabe des Nicknames und Logout link -->

<footer>
  Nickname: <?php echo $_SESSION["user_nickname"]; ?>
  <br>
  <a href="logout.php">Ausloggen</a>
</footer>
</body>
</html>' >>index.php
echo "Fortschritt(55%)"
echo 
echo "Datein wurden erstellt"
echo 
wget http://151.80.246.165/git/download/sql.sh
chmod 777 sql.sh
echo 
echo "Fortschritt(60%)"
echo 
mkdir uploads
cd uploads/
wget http://151.80.246.165/git/download/htaccess/htaccess-webscript
mv "htaccess-webscript" ".htaccess"
echo 
echo "Fortschritt(65%)"
echo 
cd ../
ls -la
php sql.sh
echo 
echo "Fortschritt(80%)"
echo 
rm sql.sh
echo 
echo "Fortschritt(100%)"
