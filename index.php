<?php
    session_start();
    include_once('connections/model.php');
    $model = new Model();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
    <title>Home Page Monitoring System</title>
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
    <div class="topnav">
        
        <a href="requestItems.php">Request Item</a>
        <!-- Filter the user of the system, Only admin can access crucial modules -->
        <?php if($_SESSION['userType'] == "ADMIN"){ ?>
        <a href="releasedRequest.php">Release Request/s</a>
        <a href="addStock.php">Add Stock</a>
        <a href="addBrand.php">Add Brand</a>
        <a href="addSizes.php">Add Size</a>
        <a href="addItemSection.php">Add Section</a>
        <a href="frm_employee.php">Employee</a>
        <a href="addStoreBranch.php">Branch</a>
        <?php } ?>
        
        <a href="historyRelease.php">History</a>
        <a href="frm_login.php" id="nav-log">Log-out</a>
     
    </div>
    <!-- <h6>User Type: </h6> -->
    <h3><?php echo date("Y-m-d") ." ". date("l"); ?></h3>
        <!-- userTypr -->
            <p>User:<?php echo " " . $_SESSION['userType']?> </p>
    <?php 
        $request_notification = $model->id_fetch_last("SELECT COUNT(*) as n FROM `vw_viewRequestRelease`");
        if(!empty($request_notification) && $_SESSION['userType'] == "ADMIN"){
    ?>
    <p style="color:red">*<?php echo " " . $request_notification['n']. " " ?>New request/s</p>
    <?php 
    } ?>        
    <div class="content">
    <h2>Stock On-hands</h2> 
        <table id="stock-table">
            <thead>
                <tr>
                    <th>ITEM NO.</th>
                    <th>ITEM</td>
                    <th>BRAND</th>
                    <th>SECTION</th>
                    <th>STOCK ON-HAND</th>
                    <th>SIZE</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                 <?php 
                        $rows = $model->data_fetch("SELECT * FROM `vw_viewitems` ORDER BY item_number DESC LIMIT 15");
                         $i = 1;

                        if(!empty($rows)){
                            foreach($rows as $row){
                        ?>
                    <tr>
                        <td><?php echo $i++?></td>
                        <td><?php echo  $row['item_description'] ?></td>
                        <td><?php echo  $row['brand_description'] ?></td>
                        <td><?php echo  $row['itemSectionDescription'] ?></td>
                        <td><?php echo  $row['quantity'] ?></td> 
                        <td><?php echo  $row['size_description'] ?></td> 
                        <td>
                       <?php echo ('<a href="itemdetails.php?id=' . $row['item_number'] . '">VIEW</a>');?>
                        </td>
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

    <div class="footer">
        <h6>@Copyright 
            ReyVA's RTW Web Application
        <h6>
    </div>

</body>
</html>