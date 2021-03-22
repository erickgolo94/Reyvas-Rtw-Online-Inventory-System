<?php
    include_once("connections/model.php");
  #  include 'functions/validations.php';
   # include_once('functions/validations.php');
    $model_request = new Model();
    $request_no = new Model();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select items on warehouse</title>
    <link rel="stylesheet" href="css/requestViewItems.css">
    <link rel="icon" href="img/favIconRequest.png"  type="image/icon type">
</head>
<body>

    <div class="select-item">
        <h2> SELECT ITEMS</h2><br />
        <?php $requestNo = $request_no->id_fetch_last("SELECT * FROM tbl_request WHERE id_request = 
                      (SELECT MAX(id_request) FROM tbl_request)");
            if(!empty($requestNo)){              
        ?>
       <label for="">Request No.<?php echo " ". $requestNo['id_request']?></label><br />
       <input type="hidden" name="lbl-request-no" value="<?php echo $requestNo['id_request']?>">
       <?php
            }      
       ?>
        <a href="requestItems.php">Back to Whislist</a>
        <table>
            <thead>
                <tr>
                    <th>ITEM</td>
                    <th>BRAND</th>
                    <th>SECTION</th>
                    <th>STOCK ON-HAND</th>
                    <th>SIZE</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- open mysql connection database -->
                <?php
                    $rows = $model_request->data_fetch("SELECT * FROM `vw_viewItemRequest` LIMIT 13");
                    if(!empty($rows)){
                        foreach($rows as $row){
                ?>
                <tr>
                    <!-- phpcode goes here.. -->
                    <td><?php echo  $row['item_description'] ?></td>
                        <td><?php echo  $row['brand_description'] ?></td>
                        <td><?php echo  $row['size_description'] ?></td>
                        <td><?php echo  $row['quantity'] ?></td> 
                        <td><?php echo  $row['itemSectionDescription'] ?></td> 
                        <td>
                        <?php echo ('<a href="requestValidate.php?id=' . $row['id_item'] . '">ADD TO LIST</a>');?>
                        </td>
                </tr>
                <?php
                        }
                    }else{
                        echo "No Data Available";
                    }    
                ?>
            </tbody>
        </table>
    </div>

</body>
</html>