<?php
    define('DB_HOST', 'localhost');
    define('DB_USER', 'root');
    define('DB_PASSWORD', '');
    define('DB_NAME', 'dm_togoCafe');
    $link=mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD);
    if ($link) {echo 'Connected to server...<br>';}
    $connect=mysqli_select_db($link, DB_NAME);
    if ($connect) {echo 'Connected to database...<br>';}

    // Capture user input for product name
    echo '<form method="POST" action="">';
    echo '<label for="product_name">Enter Product Name:</label>';
    echo '<input type="text" id="product_name" name="product_name" required>';
    echo '<input type="submit" value="Submit">';
    echo '</form>';

    // Record user's input to $product_name
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $product_name = $_POST['product_name'];
    }

    // Update SQL query to select product price based on user input
    $sql = "SELECT price FROM product WHERE product_name = '$product_name'";
    $results = mysqli_query($link, $sql);
    if ($results) {
        if (mysqli_num_rows($results) > 0) {
            $product = mysqli_fetch_array($results);
            echo '<h1>Product Price</h1>';
            echo '<p>Price: $' . $product['price'] . '</p>';
        } else {
            echo '<p>No product found with that name.</p>';
        }
    }
    // Query the recipe based on the product name
    $recipeSql = "SELECT r.recipe_id, r.material_id, r.product_id, r.quantity, m.material_name FROM recipe r JOIN raw_materials m ON r.material_id = m.material_id WHERE r.product_id IN (SELECT product_id FROM product WHERE product_name = '$product_name')";
    $recipeResults = mysqli_query($link, $recipeSql);
    if ($recipeResults) {
        if (mysqli_num_rows($recipeResults) > 0) {
            echo '<h1>Recipe for ' . $product_name . '</h1>';
            while ($recipeRow = mysqli_fetch_array($recipeResults)) {
                echo '<div style="border: 2px solid #e4e4e4; padding: 15px;">';
                echo '<p>Recipe ID: ' . $recipeRow['recipe_id'] . '</p>';
                echo '<p>Material Name: ' . $recipeRow['material_name'] . '</p>';
                echo '<p>Quantity: ' . $recipeRow['quantity'] . '</p>';
                echo '</div>';
            }
        } else {
            echo '<p>No recipe found for ' . $product_name . '.</p>';
        }
    }
?>
