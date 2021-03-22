<?php
    include 'connections/model.php';
    $model = new Model();
    $id = $_REQUEST['id'];
    $remove = $model->remove_item_list($id);

    #condition 
    if($remove){
        echo "<script>alert('Remove Item Success');</script>";
        echo "<script>window.location.href = 'addstock.php'</script>";
    }
?>