<?php 
    include '../data/db.php';
    $query = "SELECT customerNumber, contactLastName, contactFirstName FROM customers";
    $result = $conn->query($query);


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elenco_clienti</title>
</head>
<body>

<h1>ELENCO DEI CLIENTI:</h1>

<table border="1">
    <tr>
        <th>Cliente</th>
    </tr>

    <?php 
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            $fullname = $row['contactLastName'] . " " . $row['contactFirstName'];

            echo '<tr>
                    <td>
                        <a href="./elenco_ordini.php?customerNumber=' . $row['customerNumber'] . '">
                            ' . $fullname . '
                        </a>
                    </td>
                  </tr>';
        }
    } else {
        echo "<tr><td>Nessun cliente trovato</td></tr>";
    }
    ?>
</table>

</body>
</html>