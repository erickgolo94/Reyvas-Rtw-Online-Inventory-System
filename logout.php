<?php

    session_start();
    #destroy all session;
    session_destroy();
    if(!isset($_SESSION)){
        echo "<script>alert('User Successfully Log-In')</script>";
        echo "<script>window.location.href = 'frm_login.php'</script>";
    }else{
        echo "<script>alert('Session has value')</script>";
    }

?>