<?php 
    include_once('connections/model.php');
    $model = new Model();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Branche's</title>
    <link rel="stylesheet" href="css/maintenance.css">
    <link rel="icon" href="img/favIconStore.png"  type="image/icon type">
</head>
<body>
    <div class="content-view">
        <p>content</p>
        <div class="header-content">
            <h3>RTW's ReyVa Branche's</h3>
        </div>
    
    <div class="content">
            <a href="storeBranchAdd.php" id="linkAdd">Add New</a>
            <a href="index.php" id="linkBack">Back</a>
            <table>
                <thead>
                    <tr>
                       <th>Number</th>
                       <th>Branch</th>
                       <th>Address</th>
                       <th>Contact Number</th>
                       <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $rows = $model->data_fetch("SELECT * FROM tbl_storeBranch WHERE isActive = 0 LIMIT 14");
                        $i = 1; //init by 1
                        if(!empty($rows)){
                            foreach($rows as $row){
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?php echo $row['branch_name'] ?></td>
                        <td><?php echo $row['branch_address'] ?></td>
                        <td><?php echo $row['branch_contact'] ?></td>
                        <td>
                        <?php echo ('<a href="storeBranchEdit.php?id=' . $row['id_sBranch'] . '">Edit</a>');?>
                        <?php echo ('<a href="storeBranchDelete.php?id=' . $row['id_sBranch'] . '">Delete</a>');?>
                        </td>
                    </tr>
                    <?php

                            }
                        }else {

                            echo "No Branch Record Available!";
                        }    
                                
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>