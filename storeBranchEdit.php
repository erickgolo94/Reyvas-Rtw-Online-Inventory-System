<?php

    include_once('connections/model.php');
    $model = new Model();  
    #get the id parameter 
    $id = $_REQUEST['id'];
    $rows = $model->fetch_id($id, "SELECT * FROM tbl_storeBranch WHERE id_sBranch = '$id'");
    //var_dump($row);

    if(isset($_POST['submit'])){

        $IS_ACTIVE = 0;
        $id_sBranch = $_POST['sBranch-id'];
        $branch_name = $_POST['sBranch-name'];
        $branch_address = $_POST['sBranch-address'];
        $branch_contact = $_POST['sBranch-contact'];

        $query_update = "UPDATE tbl_storeBranch SET branch_name = '$branch_name' ,
            branch_address = '$branch_address', branch_contact = '$branch_contact' WHERE id_sBranch = '$id_sBranch'";

        if($query_result = $model->conn->query($query_update)){
            echo "<script>alert('Record Update Succesfully')</script>";
            echo "<script>window.location.href = 'addStoreBranch.php'</script>";
        }else{
            echo "Error Update" . $model->conn->error();
        }

    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Branch Info</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favIconStore.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>EDIT</h1><br /><br /><br /><br />
        <form action=" " method="post">
            <input type="hidden" name="sBranch-id" value=<?php echo $rows['id_sBranch']?>>
            <label for="">Branch Name</label><br /> 
           <input type="text" name="sBranch-name" value=<?php echo $rows['branch_name']?>><br /><br />
           <label for="">Branch Address</label><br />
           <input type="text" name="sBranch-address" value=<?php echo $rows['branch_address']?>><br /><br />
           <label for="">Branch Contact</label><br />
           <input type="text" name="sBranch-contact" value=<?php echo $rows['branch_contact']?>><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>