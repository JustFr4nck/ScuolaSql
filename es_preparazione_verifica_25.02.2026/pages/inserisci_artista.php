<?php 
    include '../db/db.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inserimento artista</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 flex items-center justify-center min-h-screen">

    <div class="bg-white shadow-xl rounded-2xl p-10 w-full max-w-md border border-gray-200">

        <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Inserisci artista</h2>

        <form action="../validators/check_artista.php" method="POST" class="space-y-4">

            <div class="flex flex-col">
                <label for="nome" class="mb-1 font-medium text-gray-700">Nome</label>
                <input type="text" id="nome" name="nome" required placeholder="Inserisci nome"
                       class="border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div class="flex flex-col">
                <label for="cognome" class="mb-1 font-medium text-gray-700">Cognome</label>
                <input type="text" id="cognome" name="cognome" required placeholder="Inserisci cognome"
                       class="border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <div class="flex flex-col">
                <label for="data" class="mb-1 font-medium text-gray-700">Anno di nascita</label>
                <input type="text" id="data" name="data" required placeholder="Inserisci anno"
                       class="border border-gray-300 rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-400">
            </div>

            <button type="submit"
                    class="w-full bg-green-500 hover:bg-green-600 text-white font-semibold px-4 py-2 rounded-lg transition">
                Inserisci
            </button>

        </form>

    </div>

</body>
</html>