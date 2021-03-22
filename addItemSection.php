<?php 
    include_once('connections/model.php');
    $model = new Model();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ITEM SECTION</title>
    <link rel="stylesheet" href="css/maintenance.css">
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    <div class="content-view">
        <p>content</p>
        <div class="header-content">
            <h3>Item Section</h3>
        </div>
    
    <div class="content">
            <a href="itemSectionAdd.php" id="linkAdd">Add New</a>
            <a href="index.php" id="linkBack">Back</a>
            <table>
                <thead>
                    <tr>
                       <th>Number</th>
                       <th>Item Description</th>
                       <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $rows = $model->data_fetch("SELECT * FROM tbl_itemSection WHERE isActive = 0 LIMIT 14");
                        $i = 1; //init by 1
                        if(!empty($rows)){
                            foreach($rows as $row){
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?php echo $row['itemSectionDescription'] ?></td>
                        <td>
                        <?php echo ('<a href="itemSectionEdit.php?id=' . $row['id_section'] . '">Edit</a>');?>
                        <?php echo ('<a href="itemSectionDelete.php?id=' . $row['id_section'] . '">Delete</a>');?>
                        </td>
                    </tr>
                    <?php

                            }
                        }else {

                            echo "No Section Record Available!";
                        }    
                                
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>