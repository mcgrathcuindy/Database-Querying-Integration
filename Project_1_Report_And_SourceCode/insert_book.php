<?php
$mysqli = new mysqli('uindycsci370.c01nodzzpr8s.us-east-1.rds.amazonaws.com', 'mcgrathc', 'Strawberry1', 'books');

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$stmt = $mysqli->prepare("INSERT INTO Books VALUES (?, ?, ?, ?)");
$stmt->bind_param('sssd', $ISBN, $Author, $Title, $Price);

$ISBN = $_POST['ISBN'];
$Author = $_POST['AUTHOR'];
$Title = $_POST['TITLE'];
$Price = $_POST['PRICE'];

/* execute prepared statement */
$stmt->execute();

/* close statement and connection */
$stmt->close();

/*
//DELETE
//Clean up table CountryLanguage 
$mysqli->query("DELETE FROM Books WHERE $deletetype =?");
$stmt->bind_param('s', $deleteparam);
$deleteparam = $_POST['deleteparam']
printf("%d Row deleted.\n", $mysqli->affected_rows);
*/

//close connection 
$mysqli->close();

?>
<html>
    <h1>Uindy Book Entry Results</h1>
    <br>Book inserted into the database<br>
</html>
