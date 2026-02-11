<?php 
include '../data/db.php';
session_start();

$query = "SELECT id_lista, nome_lista FROM liste";
$result = $conn->query($query);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $_SESSION["nome_lista"] = $_POST["lista"];
    header("Location: candidateSelection.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selezione della lista</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-white shadow-xl rounded-2xl p-10 max-w-2xl w-full">

        <h1 class="text-3xl font-bold text-blue-700 mb-6 text-center">
            Selezione della lista
        </h1>

        <h3 class="text-lg font-semibold mb-2 text-gray-800">
            La prima fase di voto prevede la selezione della lista
        </h3>

        <p class="text-gray-600 mb-6">
            Scelga la lista a cui assegnare il suo voto dall'elenco a comparsa qui sotto. 
            Appena selezionata, le verrà proposto l'elenco dei candidati per quella lista.
        </p>

        <form method="POST" class="space-y-6">

            <div>
                <select name="lista" required
                    class="w-full border border-gray-300 rounded-lg px-4 py-3 
                           focus:outline-none focus:ring-2 focus:ring-blue-500 
                           focus:border-blue-500 transition">
                    <option value="">-- Seleziona lista --</option>

                    <?php 
                    if($result->num_rows > 0){
                        while($row = $result->fetch_assoc()){
                            echo "<option value='" . htmlspecialchars($row["nome_lista"]) . "'>" 
                                . htmlspecialchars($row["nome_lista"]) . 
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
