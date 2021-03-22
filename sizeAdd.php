<?php
      include_once('connections/model.php');
      $model = new Model(); 

      if(isset($_POST['submit'])){
          if(!empty($_POST['sDesc'])){
            
            $IS_ACTIVE = 0;
            $sDesc = $_POST['sDesc'];

            $query_insert = "INSERT INTO tbl_sizes(size_description, isActive)
            VALUES ('$sDesc','$IS_ACTIVE')";

            if($query_result = $model->conn->query($query_insert)){
                echo "<script>alert('New Record Succesfully Saved')</script>";
                echo "<script>window.location.href = 'addSizes.php'</script>";
            }else{
                echo "Error Insert" . $model->conn->error();
            }

          }else{
                echo "<script>alert('Please fill-up the form to proceed.')</script>";
          }

    }   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Size</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>ADD SIZE</h1><br /><br /><br /><br /><br /><br />
        <form action=" " method="post">
            <label for="">Size Description</label><br /> 
           <input type="text" name="sDesc" placeholder="Size Description.." autofocus><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>