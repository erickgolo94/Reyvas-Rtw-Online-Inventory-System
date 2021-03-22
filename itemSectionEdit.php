<?php

    include_once('connections/model.php');
    $model = new Model();  
    #get the id parameter 
    $id = $_REQUEST['id'];
    $rows = $model->fetch_id($id, "SELECT * FROM tbl_itemSection WHERE id_section = '$id'");
    //var_dump($row);

    if(isset($_POST['submit'])){

        $IS_ACTIVE = 0;
        $id_itemSection = $_POST['is-id'];
        $isDesc = $_POST['isDesc'];

        $query_update = "UPDATE tbl_itemSection SET itemSectionDescription = '$isDesc' WHERE id_section = '$id_itemSection'";

        if($query_result = $model->conn->query($query_update)){
            echo "<script>alert('Record Update Succesfully')</script>";
            echo "<script>window.location.href = 'addItemSection.php'</script>";
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
    <title>Edit Item Section</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>EDIT</h1><br /><br /><br /><br /><br /><br />
        <form action=" " method="post">
            <input type="hidden" name="is-id" value=<?php echo $rows['id_section']?>>
            <label for="">Item Section Description</label><br /> 
           <input type="text" name="isDesc" value=<?php echo $rows['itemSectionDescription']?>><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>