<?php
    include 'connections/model.php';
    $model = new Model();
    $id = $_REQUEST['id'];
    $remove = $model->remove_item_request($id);

    #condition 
    if($remove){
        echo "<script>alert('Remove Item Success');</script>";
        echo "<script>window.location.href = 'requestItems.php'</script>";
    }
?>