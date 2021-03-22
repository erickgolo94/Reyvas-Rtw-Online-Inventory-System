<?php

    include_once('connections/model.php');
    $model = new Model();  
    #get the id parameter 
    $id = $_REQUEST['id'];
    $rows = $model->fetch_id($id, "SELECT * FROM tbl_sizes WHERE id_size = '$id'");
    //var_dump($row);

    if(isset($_POST['submit'])){

        $IS_ACTIVE = 0;
        $id_size = $_POST['size-id'];
        $sDesc = $_POST['sDesc'];

        $query_update = "UPDATE tbl_sizes SET size_description = '$sDesc' WHERE id_size = '$id_size'";

        if($query_result = $model->conn->query($query_update)){
            echo "<script>alert('Record Update Succesfully')</script>";
            echo "<script>window.location.href = 'addSizes.php'</script>";
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
    <title>Edit Size</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>EDIT</h1><br /><br /><br /><br /><br /><br />
        <form action=" " method="post">
            <input type="hidden" name="size-id" value=<?php echo $rows['id_size']?>>
            <label for="">Size Description</label><br /> 
           <input type="text" name="sDesc" value=<?php echo $rows['size_description']?>><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>