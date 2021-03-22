<?php 
    //start the session
    session_start();
    //call connection
    include_once('connections/model.php');

    $model = new Model();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user's login</title>
    <link rel="stylesheet" href="css/frm_login.css">
    <link rel="icon" href="img/favIconLogin.png"  type="image/icon type">
</head>
<body>
    <div class="login-container">
       <form action="login_process.php" method="POST">
        <p id="lbl-header">Reyva's RTW</p><br />
                <p id="lbl-sub">Log-in</p>
            <input type="password" id="txtPassword" name="txtPassword" placeholder="Enter Password" autofocus><br /><br />
            <input type="submit" value="Log-In" name="submit-login">
       </form>
    </div>
</body>
</html>