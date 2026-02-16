<?php 
include '../data/db.php';
session_start();
$query = "SELECT productName, quantityInStock FROM products";
$result = $conn->query($query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuovo_Ordine</title>
</head>
<body>
    <form action="nuovo_ordine.php" method="POST">

    <select name="ordine" required>
        <option>___SELEZIONA_PRODOTTO___</option>
        <?php 
            if($result->num_rows > 0){

                while($row = $result->fetch_assoc()){
                    echo "<option>" . $row["productName"] . "</option>";
                }
            }
        ?>

    </select>

    <label for="quantita">Inserisci quantità</label>
    <input id="quantita" name="quantita" type="number" min=1>

    <button>Add to cart</button>

    </form>
</body>
</html>