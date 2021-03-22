<?php
    #start session
    //session_start();
    include_once("connections/model.php");
    $model = new Model();
    $id = $_REQUEST['id'];
    $rows = $model->fetch_request_no($id);
    //var_dump($rows)   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Release request item section</title>
    <link rel="stylesheet" href="css/releasedRequest.css">
</head>
<body>
    <div class="header">
        <h2>Releasing Items</h2>
    </div>
        
    <div class="content">
        <label for="">Request Number: <?php echo " ". $id ?> </label>
        <input type="hidden" name="lblRequestNo" value=<?php echo $id?>>
        <form action="" method="post">
           <table>
            <thead>
                <tr>
                    <th>Request No</th>
                    <th>Item</th>
                    <th>Brand</th>
                    <th>Size</th>
                    <th>Section</th>
                    <th>Quantity</th>
                    <th>Request Date</th>
                    <th>Request Time</th>
                    <th>Branch</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <?php
                    $STATUS = 0; 
                    $rows = $model->data_fetch("SELECT r.id_request, r.request_no, r.id_item,
                        r.item_description, b.brand_description, s.size_description,
                        isec.itemSectionDescription, r.quantity, r.date_request,
                        r.time_request, br.branch_name, r.reqStatus
                        FROM tbl_request r
                        INNER JOIN
                        tbl_brand b
                        ON(r.id_brand = b.id_brand)
                        INNER JOIN
                        tbl_sizes s
                        ON(r.id_size = s.id_size)
                        INNER JOIN
                        tbl_itemsection isec
                        ON(r.id_section = isec.id_section)
                        INNER JOIN
                        tbl_storeBranch br
                        ON(r.id_sBranch = br.id_sBranch) WHERE request_no = '$id' AND `reqStatus` = '$STATUS' 
                            GROUP BY id_request ORDER BY id_request DESC");
                            if(!empty($rows)){
                                foreach($rows as $row){       
                    ?>
                    <td><?php echo $row['request_no']?></td>
                    <td><?php echo $row['item_description']?></td>
                    <td><?php echo $row['brand_description']?></td>
                    <td><?php echo $row['size_description']?></td>
                    <td><?php echo $row['itemSectionDescription']?></td>
                    <td><?php echo $row['quantity']?></td>
                    <td><?php echo $row['date_request']?></td>
                    <td><?php echo $row['time_request']?></td>
                    <td><?php echo $row['branch_name']?></td>
                    <td><?php echo ('<a href="processRelease.php?id=' . $row['id_request'] . '">Confirm</a>');?></td>
                </tr>
                <?php }
                    }else{
                        echo "No request found at the moment!";
                }?>
            </tbody>
           </table>
        </form>
    </div>

     
</body>
</html>