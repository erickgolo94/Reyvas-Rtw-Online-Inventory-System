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
    <title>History Release Transaction</title>
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
   
    <!-- <h6>User Type: </h6> -->
    <h3><?php echo date("Y-m-d") ." ". date("l"); ?></h3>
    
    <div class="content">
    <h2>History Release Transactions</h2> 
        <table id="stock-table">
            <thead>
                <tr>
                  <th>Row ID</th>
                  <th>Request No.</th>
                  <th>Item</th>
                  <th>Brand</th>
                  <th>Size</th>
                  <th>Section</th>
                  <th>Quantity</th>
                  <th>Date Requested</th>
                  <th>Time Requested</th>
                  <th>Branch Request</th>
                  <th>Date Release</th>
                  <th>Time Release</th>
                  
                </tr>
            </thead>
            <tbody>
                 <?php 
                        $rows = $model->data_fetch("SELECT * FROM tbl_release ORDER BY request_no DESC");
                        $i = 1;

                        if(!empty($rows)){
                            foreach($rows as $row){
                        ?>
                    <tr>
                        <td><?php echo  $i++?></td>
                        <td><?php echo  $row['request_no'] ?></td>
                        <td><?php echo  $row['item_description'] ?></td>
                        <td><?php echo  $row['brand'] ?></td>
                        <td><?php echo  $row['size'] ?></td> 
                        <td><?php echo  $row['section'] ?></td> 
                        <td><?php echo  $row['quantity'] ?></td>
                        <td><?php echo  $row['date_request'] ?></td>
                        <td><?php echo  $row['time_request'] ?></td>
                        <td><?php echo  $row['branch'] ?></td>
                        <td><?php echo  $row['date_release'] ?></td>
                        <td><?php echo  $row['time_release'] ?></td>
                             
                
                        <!-- <td></td>   -->
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