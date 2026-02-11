<?php 
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    header("Location: finalPage.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conferma del voto</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">

    <div class="bg-white shadow-xl rounded-2xl p-10 max-w-2xl w-full text-center">

        <h1 class="text-3xl font-bold text-blue-700 mb-6">
            Conferma del voto
        </h1>

        <h3 class="text-lg font-semibold mb-2 text-gray-800">
            La terza ed ultima fase del voto consiste nella conferma della selezione
        </h3>

        <p class="text-gray-600 mb-6">
            Qui sotto è riepilogata la sua scelta di voto.<br>
            Confermando questa scelta lei esprime in modo definitivo il suo voto.
        </p>

        <div class="bg-blue-50 border border-blue-200 rounded-lg p-6 mb-6">
            <h3 class="text-gray-700 mb-2"><span class="font-semibold">Lista:</span> <?php echo $_SESSION["nome_lista"]; ?></h3>
            <h3 class="text-gray-700"><span class="font-semibold">Candidato:</span> <?php echo $_SESSION["candidato"]; ?></h3>
        </div>

        <form method="POST" class="space-y-4">

            <button type="submit"
                class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg shadow-md transition duration-300">
                Conferma
            </button>

            <div>
                <a href="../index.html"
                   class="inline-block bg-gray-400 hover:bg-gray-500 text-white font-semibold py-2 px-6 rounded-lg shadow-md transition duration-300">
                   Annulla
                </a>
            </div>

        </form>

    </div>

</body>
</html>