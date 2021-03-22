<?php
      include_once('connections/model.php');
      $model = new Model(); 

      if(isset($_POST['submit'])){

          if(!empty($_POST['branch-name']) && !empty($_POST['branch-address'])
            && !empty($_POST['branch-contact'])){

                $IS_ACTIVE = 0;
                $branch_name = $_POST['branch-name'];
                $branch_address = $_POST['branch-address'];
                $branch_contact = $_POST['branch-contact'];

                $query_insert = "INSERT INTO tbl_storeBranch(branch_name, branch_address, branch_contact, isActive)
                VALUES ('$branch_name','$branch_address','$branch_contact','$IS_ACTIVE')";

                if($query_result = $model->conn->query($query_insert)){
                    echo "<script>alert('New Record Succesfully Saved')</script>";
                    echo "<script>window.location.href = 'addStoreBranch.php'</script>";
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
    <title>New Branch Address</title>
    <link rel="stylesheet" href="css/maintenance-edit.css">
    <link rel="icon" href="img/favIconStore.png"  type="image/icon type">
</head>
<body>
    

    <div class="content">
        <h1>New Branch</h1><br /><br /><br />
        <form action=" " method="post">
            <label for="">Branch Name</label><br /> 
           <input type="text" name="branch-name" placeholder="Name of branch.." autofocus><br /><br />
           <label for="">Branch Address</label><br /> 
           <input type="text" name="branch-address" placeholder="Address.." autofocus><br /><br />
           <label for="">Branch Contact No.</label><br /> 
           <input type="text" name="branch-contact" placeholder="Contact No.." autofocus><br /><br />
            <input type="submit" value="SAVE" name="submit">
          
        </form>
    </div>

</body>
</html>