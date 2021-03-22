<?php 

include_once('connections/model.php');
session_start();
$model = new Model();  
#get the id parameter 
$id = $_REQUEST['id'];
$rows = $model->fetch_id($id, "SELECT * FROM vw_employee WHERE emp_id = '$id'");
//var_dump($rows);

$userType = $_SESSION['userType'];

if($userType == 'ADMIN'){
    
    $IS_ACTIVE = 1; //change if admin
    $sql_delete = "UPDATE tbl_employee SET isActive = '$IS_ACTIVE' WHERE emp_id = '$id'";
    //execute query with validations
    if($query_result = $model->conn->query($sql_delete) == TRUE){
            echo "<script>alert('Employee Successfully Deleted!')</script>";
            echo "<script>window.location.href= 'frm_employee.php'</script>";
    }else{

        echo "ERROR" . $model->conn->error();
    }

}else{
    echo "<script>alert('Sorry only admin account can delete records.')</script>";
    echo "<script>window.location.href = 'frm_employee.php'</script>";
}

$model->conn->close();#close the connection

?>