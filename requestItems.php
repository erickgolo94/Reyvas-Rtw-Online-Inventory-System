<?php
    #connect;
    include_once("connections/model.php");
    $display_select = new Model();
    $request_itemNo = new Model();
    $insert_request = new Model();
    $cancel_request = new Model();
 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Branch Request Item/s Page</title>
    <link rel="stylesheet" href="css/requestItems.css">
    <link rel="icon" href="img/favIconRequest.png"  type="image/icon type">
</head>
<body>
  
    <div class="content-items">
      <form action="" method="post">
        <h1>Request Item list</h1>
        <?php $id_last = $request_itemNo->id_fetch_last("SELECT count(*) AS c FROM tbl_request");
            if(!empty($id_last)){          
        ?>
        <label>Request No. <?php echo " ". $id_last['c'] ?></label><br /><br />
        <input type="hidden" name="lbl-requestno" value="<?php echo $id_last['c']?>">
        <?php }
        ?>
        <button type="submit" name="btn-add" ><a href="requestViewItems.php">VIEW ITEMS</a></button>
        <button type="submit" name="btn-insert" class="btn-insert">SUBMIT REQUEST</button>
        <?php  $record = $insert_request->insert_request_all();?>
        <button type="submit" name="btn-cancel" class="btn-cancel">CANCEL / BACK</button>
        <?php $cancel = $cancel_request->btn_cancel()?>
        
        <table class="item-onhand">
            <thead>
                    
                    <th>Item Description</td>
                    <th>Brand</th>
                    <th>Size</th>
                    <th>Section</th>
                    <th>Quantity</th>
                    <th>Actions</th>
            </thead>
            <tbody>
                <tr>
                    <?php 
                        $select_rows = $display_select->data_fetch("SELECT * FROM vw_viewRequestlist");
                        if(!empty($select_rows)){
                            foreach($select_rows as $row){
                    ?>
                    <!-- some php code here.. -->
                    <td><?php echo $row['item_description'] ?></td>
                    <td><?php echo $row['brand_description']?></td>
                    <td><?php echo $row['size_description']?></td>
                    <td><?php echo $row['itemSectionDescription']?></td>
                    <td><?php echo $row['quantity']?></td>
                    <td>
                    <?php echo ('<a href="itemRequestRemove.php?id=' . $row['id_request'] . '">Remove Item</a>');?>
                    </td>
                </tr>
                <?php }
                }else{
                    echo "No Item on Whish list yet!";
                }
                ?>
            </tbody>
        </table>
      </form>
    </div>


</body>
</html>