<?php 
    include '../db/db.php';
    $query = "SELECT nome_artista, cognome_artista, anno_nascita_artista FROM artista WHERE anno_nascita_artista BETWEEN 1970 AND 1980";
    $result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elenco autori 1970-1980</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col items-center p-6">

    <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">
        ELENCO AUTORI FRA 1970 e 1980
    </h2>

    <div class="overflow-x-auto w-full max-w-3xl">
        <table class="min-w-full bg-white border border-gray-200 rounded-lg shadow-md">
            <thead class="bg-blue-100">
                <tr>
                    <th class="text-left px-6 py-3 text-gray-700 font-medium">Nome Autore</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                if($result && $result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        $fullname = htmlspecialchars($row["nome_artista"]) . " " . htmlspecialchars($row["cognome_artista"]);
                        echo "<tr class='border-t border-gray-200 hover:bg-blue-50'>
                                <td class='px-6 py-3 text-gray-800'>$fullname</td>
                              </tr>";
                    }
                } else {
                    echo "<tr><td class='px-6 py-3 text-gray-500'>Nessun autore trovato</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>

</body>
</html>