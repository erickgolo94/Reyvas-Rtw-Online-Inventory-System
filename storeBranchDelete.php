<?php
    include_once('connections/model.php');
    $model = new Model();  
    #get the id parameter 
    $id = $_REQUEST['id'];
    //$rows = $model->fetch_id($id, "SELECT * FROM tbl_brand WHERE id_brand = '$id'");
    //var_dump($row);
    $IS_ACTIVE = 1; //reverse from default
    $query_delete = "UPDATE tbl_storeBranch SET isActive = '$IS_ACTIVE' WHERE id_sBranch = '$id'";
    
    if($query_result = $model->conn->query($query_delete)){
        echo "<script>alert('Delete Record Succesfully')</script>";
        echo "<script>window.location.href = 'addStoreBranch.php'</script>";
    }else{
        echo "Error Update" . $model->conn->error();
    }

?>