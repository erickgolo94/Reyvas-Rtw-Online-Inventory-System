<?php
    include_once('connections/model.php');
    $model = new Model();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <title>Employee Records</title>
    <link rel="icon" href="img/favIconEmployee.png"  type="image/icon type">
</head>
<body>
  
    
    <div class="content">
    <h2>Employee's Records</h2> 
        <a href="index.php">BACK</a><br />
        <a href="frm_employeeAdd.php">ADD NEW USER</a>
        <table id="stock-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee </td>
                    <th>Position</th>
                    <th>User Type</th>
                    <th>Branch From</th>
                    
                    <th>Password</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                 <?php 
                        $rows = $model->data_fetch("SELECT * FROM `vw_employee` WHERE isActive = 0 LIMIT 15");
                         $i = 1;

                        if(!empty($rows)){
                            foreach($rows as $row){
                        ?>
                    <tr>
                        <td><?php echo $i++?></td>
                        <td><?php echo  $row['employee'] ?></td>
                        <td><?php echo  $row['emp_position'] ?></td>
                        <td><?php echo  $row['userType'] ?></td>
                        <td><?php echo  $row['branch_name'] ?></td>
                         
                        <td><?php echo  $row['emp_password'] ?></td> 
                        <td>
                       <?php echo ('<a href="frm_employeDelete.php?id=' . $row['emp_id'] . '">Delete</a>');?>
                        </td>
                    </tr>
                    <?php

                            }
                        }else {

                            echo "No Data!";
                        }    
                                
                    ?>
            </tbody>
        </table>
    </div>

</body>
</html>