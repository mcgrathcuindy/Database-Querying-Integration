<?php

$servername = "uindycsci370.c01nodzzpr8s.us-east-1.rds.amazonaws.com";
$username = "mcgrathc";
$password = "Strawberry1";
$db = "books";
$port = 3306;
$deleteType = $_POST['deleteType'];
$searchTerm = $_POST['searchTerm'];

$conn = mysqli_connect($servername, $username, $password,$db,$port);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sqlCount = "SELECT COUNT(*) FROM Books WHERE $deleteType LIKE '%$searchTerm%'";
$sql = "DELETE FROM Books WHERE $deleteType LIKE '%$searchTerm%'";
$result = $conn->query($sql);
$resultCount = $conn->query($sqlCount);
echo "<br>";
?>
<html>
    <h1>Uindy Delete Results</h1>
    <br>Book deleted:
</html>

<?php
echo nl2br("$resultCount->num_rows \n\n");
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        ?>
        <html><strong><?php echo "Title: " . $row["Title"]. "";?></strong></html>
        <?php 
        echo nl2br("\nAuthor: " . $row["Author"]. " \n");
        echo nl2br("ISBN: " . $row["ISBN"]. " \n");
        echo nl2br("Price: " . $row["Price"]." \n");
    }
}


?>
