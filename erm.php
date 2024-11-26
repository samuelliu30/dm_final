$servername = "localhost"; // Change if necessary
$username = "root"; // Your database username
$password = ""; // Your database password
$dbname = "dm_togoCafe"; // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch products
$productQuery = "SELECT * FROM products"; // Adjust table name as necessary
$productResult = $conn->query($productQuery);

if ($productResult->num_rows > 0) {
    while($row = $productResult->fetch_assoc()) {
        echo "Product ID: " . $row["id"]. " - Name: " . $row["name"]. "<br>";
    }
} else {
    echo "0 results for products";
}

// Query to fetch recipes
$recipeQuery = "SELECT * FROM recipes"; // Adjust table name as necessary
$recipeResult = $conn->query($recipeQuery);

if ($recipeResult->num_rows > 0) {
    while($row = $recipeResult->fetch_assoc()) {
        echo "Recipe ID: " . $row["id"]. " - Title: " . $row["title"]. "<br>";
    }
} else {
    echo "0 results for recipes";
}

$conn->close();
