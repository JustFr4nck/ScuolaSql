<?php 
include '../data/db.php';
session_start();

$query = "SELECT cognome, nome FROM candidati";
$result = $conn->query($query);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $_SESSION["candidato"] = $_POST["candidato"];
    header("location: markSelection.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selezione del candidato</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">

<div class="bg-white shadow-xl rounded-2xl p-10 max-w-2xl w-full">

    <h1 class="text-3xl font-bold text-blue-700 mb-6 text-center">
        Selezione del candidato
    </h1>

    <h3 class="text-lg font-semibold mb-2 text-gray-800">
        La seconda fase del voto prevede la scelta del candidato
    </h3>

    <p class="text-gray-600 mb-6">
        Scelga il candidato a cui assegnare il suo voto dall'elenco a comparsa qui sotto.
        Dopo la selezione le verrà proposta la conferma definitiva del voto.
    </p>

    <form method="POST" class="space-y-6">

        <div>
            <select name="candidato" required
                class="w-full border border-gray-300 rounded-lg px-4 py-3 
                       focus:outline-none focus:ring-2 focus:ring-blue-500 
                       focus:border-blue-500 transition">
                
                <option value="">-- Seleziona candidato --</option>

                <?php 
                if($result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        $nomeCompleto = $row["cognome"] . " " . $row["nome"];
                        echo "<option value='" . htmlspecialchars($nomeCompleto) . "'>" 
                            . htmlspecialchars($nomeCompleto) .
                            "</option>";
                    }
                }
                ?>
            </select>
        </div>

        <div class="text-center">
            <button type="submit"
                class="bg-blue-600 hover:bg-blue-700 text-white font-semibold 
                       py-3 px-8 rounded-lg shadow-md transition duration-300">
                Conferma
            </button>
        </div>

    </form>

</div>

</body>
</html>
