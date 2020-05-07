<?php

$servername = "uindycsci370.c01nodzzpr8s.us-east-1.rds.amazonaws.com";
$username = "mcgrathc";
$password = "Strawberry1";
$db = "books";
$port = 3306;
$searchType = $_POST['searchType'];
$searchTerm = $_POST['searchTerm'];

$conn = mysqli_connect($servername, $username, $password,$db,$port);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sqlCount = "SELECT COUNT(*) FROM Books WHERE $searchType LIKE '%$searchTerm%'";
$sql = "SELECT ISBN, Author, Title, Price FROM Books WHERE $searchType LIKE '%$searchTerm%'";
$result = $conn->query($sql);
$resultCount = $conn->query($sqlCount);
echo "<br>";
?>
<html>
    <h1>Uindy Search Results</h1>
    <br>Number of books found:
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

