<?php
include '../db/db.php';
session_start();

$query = "SELECT a.id_artista, o.nome_opera FROM opera o
          JOIN artista a ON o.id_artista = a.id_artista
          WHERE a.id_artista = '" . $_SESSION["id_artista"] . "'";

$result = $conn->query($query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Opere</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col items-center p-6">

    <h2 class="text-2xl font-bold text-gray-800 mb-6">
        Lista opere:
    </h2>

    <div class="overflow-x-auto w-full max-w-3xl">
        <table class="min-w-full bg-white border border-gray-200 rounded-lg shadow-md">
            <thead class="bg-green-100">
                <tr>
                    <th class="text-left px-6 py-3 text-gray-700 font-medium">Nome Opera</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if ($result && $result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr class='border-t border-gray-200 hover:bg-green-50'>
                            <td class='px-6 py-3 text-gray-800'>" . htmlspecialchars($row["nome_opera"]) . "</td>
                          </tr>";
                }
            } else {
                echo "<tr><td class='px-6 py-3 text-gray-500'>Nessuna opera trovata</td></tr>";
            }
            ?>
            </tbody>
        </table>
    </div>

</body>
</html>