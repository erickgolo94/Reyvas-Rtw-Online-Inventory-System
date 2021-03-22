<?php

    include_once('connections/model.php');
    $model = new Model();  
    #get the id parameter 
    $id = $_REQUEST['id'];
    $rows = $model->fetch_id($id, "SELECT * FROM tbl_brand WHERE id_brand = '$id'");
    //var_dump($row);

    if(isset($_POST['submit'])){

        $IS_ACTIVE = 0;
        $id_brand = $_POST['brand-id'];
        $bDesc = $_POST['bDesc'];

        $query_update = "UPDATE tbl_brand SET brand_description = '$bDesc' WHERE id_brand = '$id_brand'";

        if($query_result = $model->conn->query($query_update)){
            echo "<script>alert('Record Update Succesfully')</script>";
            echo "<script>window.location.href = 'addBrand.php'</script>";
        }else{
            echo "Error Update" . $model->conn->error();
        }

        $model->conn->close();#close the connection
    }//End update
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Brand</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>EDIT</h1><br /><br /><br /><br /><br /><br />
        <form action=" " method="post">
            <input type="hidden" name="brand-id" value=<?php echo $rows['id_brand']?>>
            <label for="">Brand Description</label><br /> 
           <input type="text" name="bDesc" value=<?php echo $rows['brand_description']?>><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>