<?php 
    include 'db.php';

    session_start();

    $q_n_autori = "SELECT NomeAutore FROM Autori";
    $result = $conn->query($q_n_autori);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Romanziere</title>
</head>
<body>
    
<form method="POST" action="romanzi.php">
    <select name="" id="">
        <?php while($row = $result->fetch_assoc()) : ?>
            <option value="<?php echo $row['NomeAutore']; ?>">
                <?php echo $row['NomeAutore']; ?>
            </option>
        <?php endwhile; ?>
    </select>
    <button>Visualizza romanzi</button>
</form>
</body>
</html>