<?php 

    include_once('connections/model.php');
    $model = new Model();


    if(isset($_POST['submit-employee'])){
        if(empty($_POST['txtFname']) && empty($_POST['txtLname'])
        && empty($_POST['txtMidName']) && empty($_POST['txtPosition'])
        && empty($_POST['ReTypeTxtPassword']) && empty($_POST['txtPassword'])
            && empty($_POST['txtUserType'])){

                echo "<script>alert('Please Fill-Up Form Completely!')</script>";
            }else{
                $IS_ACTIVE = 0; #default zero if the employee existed
                $txtFname = $_POST['txtFname'];
                $txtLname = $_POST['txtLname'];
                $txtMiName = $_POST['txtMidName'];
                $txtPosition = $_POST['txtPosition'];
                $select_branch = $_POST['select-branch'];
                $txtPassword = md5($_POST['txtPassword']); 
                #convert userType into upper string
                $txtUserType = strtoupper($_POST['txtUserType']);
                
                #query string
                $sql_insert = "INSERT INTO tbl_employee(
                    emp_lastName, emp_firstName, emp_midInitial, emp_position, id_sBranch,
                        emp_password, isActive, userType
                ) VALUES (
                    '$txtLname', '$txtFname', '$txtMiName', '$txtPosition', '$select_branch',
                     '$txtPassword', '$IS_ACTIVE', '$txtUserType'
                )";

                   
                        if($result = $model->conn->query($sql_insert)== TRUE){
                           
                                echo "<script>alert('New User Successfully Added!')</script>";
                                echo "<script>window.location.href = 'frm_employee.php'</script>";
                            
                        }else{
                            echo "Insert Employee Error" . $model->conn->error;
                        }
    

                $model->conn->close();#close the connection
            }
    }#insert END
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADD NEW USER</title>
    <link rel="stylesheet" href="css/frm_employeeAdd.css">
    <link rel="icon" href="img/favIconEmployee.png"  type="image/icon type">
</head>
<body>
    <h3>ADD NEW USER / EMPLOYEE</h3>

    <div class="frm-container">
        <form action="" method="post">
            <label for="">First Name</label><br />
            <input type="text" name="txtFname" placeholder="First Name.." autofocus><br />
            <label for="">Last Name</label><br />
            <input type="text" name="txtLname" placeholder="Last Name.." autofocus><br />
            <label for="">Middle Initial</label><br />
            <input type="text" name="txtMidName" placeholder="Middle Initial.." autofocus><br />
            <label for="">Position</label><br />
            <input type="text" name="txtPosition" placeholder="Enter Position.." autofocus><br />
            <label for="">Select Branch</label><br />
           
            <select name="select-branch" id="select-branch" value="">
                <!-- show table for branch -->
                <?php
                //using universal function 'fetcher'
                $result = $model->fetcher("SELECT * FROM tbl_storeBranch WHERE isActive = 0");
                //check if has row
                if(!empty($result)){
                    #loop all rows
                    foreach($result as $row){
            ?>
            <option value=<?php echo $row['id_sBranch'] ?>>
                <?php echo $row['branch_name']?></option>
                <?php } 
                }
                ?>
            </select>
            <label for="">Password</label><br />
            <input type="password" name="txtPassword"><br />
            <!-- <label for="">Re-Type Password</label><br />
            <input type="password" name="ReTypeTxtPassword"><br /> -->
            <label for="">User Type</label><br />
            <input type="text" name="txtUserType" placeholder="Enter type of user" autofocus><br />
            <input type="submit" value="Submit" name="submit-employee">
        </form>
    </div>

</body>
</html>