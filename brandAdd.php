<?php
      include_once('connections/model.php');
      $model = new Model(); 

      if(isset($_POST['submit'])){
        if(!empty($_POST['bDesc'])){

            $IS_ACTIVE = 0;
            $bDesc = $_POST['bDesc'];

            $query_insert = "INSERT INTO tbl_brand(brand_description, isActive)
            VALUES ('$bDesc','$IS_ACTIVE')";

            if($query_result = $model->conn->query($query_insert)){
                echo "<script>alert('New Record Succesfully Saved')</script>";
                echo "<script>window.location.href = 'addBrand.php'</script>";
            }else{
                echo "Error Update" . $model->conn->error;
            }
        }else{
            echo "<script>alert('Please Fill-up the form to proceed.')</script>";
        }   
        
        $model->conn->close();#close the connection
    }//End Add Brand   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Brand</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>ADD BRAND</h1><br /><br /><br /><br /><br /><br />
        <form action=" " method="post">
            <label for="">Brand Description</label><br /> 
           <input type="text" name="bDesc" placeholder="Brand Description.." autofocus><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>