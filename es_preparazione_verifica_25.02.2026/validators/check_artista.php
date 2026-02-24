<?php
include '../db/db.php';

if (isset($_POST["nome"]) && isset($_POST["cognome"]) && isset($_POST["data"])) {
    $cognome = $_POST["cognome"];
    $nome = $_POST["nome"];
    $data = $_POST["data"];

    $query_check = 'SELECT * FROM artista';
    $result = $conn->query($query_check);

    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            if($row["cognome_artista"] == $cognome || $row["nome_artista"] == $nome){
                header("location:../errors_pages/error_insert.html");
                exit;
            }
        }
    }

    $query_insert = "INSERT INTO artista (cognome_artista, nome_artista, anno_nascita_artista)
          VALUES (?, ?, ?)";

    $stmt = $conn->prepare($query_insert);
    $stmt->bind_param("sss", $cognome,$nome, $data);
    $stmt->execute();
    header("location:../pages/inserimento_completato.html");
}
?>