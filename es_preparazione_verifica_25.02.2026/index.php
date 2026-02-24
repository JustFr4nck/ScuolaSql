
<?php 
    include 'db/db.php';
    session_start();
    $query = 'SELECT id_artista, cognome_artista FROM artista';
    $result = $conn->query($query);

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $_SESSION["id_artista"] = $_POST["select_art"];
        header("location:pages/opere.php");
    }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Scegli l'opera</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen flex flex-col items-center p-6">

    <h2 class="text-2xl font-bold text-gray-800 mb-6">Scegli artista</h2>

    <form action="index.php" method="POST" class="mb-6 w-full max-w-md">
        <select name="select_art" id="select_art" onchange="this.form.submit()"
                class="w-full border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-400">
            <option value="">___seleziona_artista___</option>
            <?php 
                if($result && $result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        echo "<option value='". htmlspecialchars($row['id_artista']) ."'>"
                             . htmlspecialchars($row['cognome_artista']) . "</option>";
                    }
                }
            ?>
        </select>
    </form>

    <div class="flex flex-col space-y-3 w-full max-w-md">
        <a href="./pages/inserisci_artista.php"
           class="block text-center bg-green-500 hover:bg-green-600 text-white font-semibold px-4 py-2 rounded-lg transition">
            Inserisci artista
        </a>
        <a href="./pages/visualizza_70_80.php"
           class="block text-center bg-blue-500 hover:bg-blue-600 text-white font-semibold px-4 py-2 rounded-lg transition">
            Visualizza gli artisti tra il 1970 e 1980
        </a>
    </div>

</body>
</html>