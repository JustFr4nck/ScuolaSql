<?php
include '../data/db.php';

$dataPassed = $_GET['customerNumber'];
$query = "SELECT orderNumber, orderDate, status FROM orders o
            join customers c on o.customerNumber = c.customerNumber
            where o.customerNumber = $dataPassed";
$result = $conn->query($query);

?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elenco ordini</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center py-10">

    <h1 class="text-3xl font-bold text-gray-800 mb-8">
        ELENCO DEGLI ORDINI
    </h1>

    <div class="w-full max-w-4xl bg-white shadow-lg rounded-lg overflow-hidden">
        <table class="w-full text-sm text-left text-gray-600">
            
            <thead class="bg-blue-600 text-white uppercase text-xs">
                <tr>
                    <th class="px-6 py-4 text-center">ID Ordine</th>
                    <th class="px-6 py-4 text-center">Data Ordine</th>
                    <th class="px-6 py-4 text-center">Stato</th>
                </tr>
            </thead>

            <tbody class="divide-y divide-gray-200">
                <?php 
                if($result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        echo "<tr class='hover:bg-blue-50 transition'>";
                        echo "<td class='px-6 py-4 text-center font-medium text-gray-900'>" . $row['orderNumber'] . "</td>";
                        echo "<td class='px-6 py-4 text-center'>" . $row['orderDate'] . "</td>";
                        echo "<td class='px-6 py-4 text-center'>" . $row['status'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr>";
                    echo "<td colspan='3' class='px-6 py-6 text-center text-gray-500'>Nessun ordine trovato</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>

        </table>
    </div>

    <a href="./nuovo_ordine.php" 
       class="mt-8 inline-block bg-green-500 hover:bg-green-600 text-white font-semibold px-6 py-3 rounded-lg shadow transition">
        Aggiungi ordine
    </a>

</body>
</html>