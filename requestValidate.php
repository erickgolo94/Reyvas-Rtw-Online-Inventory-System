<?php
    include_once('connections/model.php');
    $model = new Model();
    $model_request = new Model();
    $whishlist_insert = new Model();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Quantity</title>
    <link rel="stylesheet" href="css/requestValidate.css">
    <link rel="icon" href="img/favIconRequest.png"  type="image/icon type">
</head>
<body>  
    <h2>Input Quantity</h2>
   <form action="" method="POST">
        <!-- fetch the last id -->
        <?php 
           
            $request_id = $model_request->id_fetch_last("SELECT count(*) AS c FROM tbl_request");
           
            if(!empty($request_id)){
                #$rq_no = $request_id['request_no'];
        ?>
        <label>Request No. <?php echo " ". $request_id['c'] ?></label><br />
        <!-- get the request no value -->
        <input type="hidden" name="lbl-requestLastid" value="<?php echo $request_id['c'] ?>">
        <?php
           } else {
                //return 100;
            ?>   
             
          <?php }?>
    
    <a href="requestItems.php">Cancel</a>
    <div class="container-view">
            <!-- open the connection -->
            <?php
               
                $id = $_REQUEST['id'];
                $row_view = $model->fetch_validate($id);
                $row_value = $model->fetch_unique($id);
               # var_dump($row); testing
                # loop
                if(!empty($row_view) && !empty($row_value)){
            ?>
            <input type="hidden" name="id-value" value="<?php echo $id?>">
            <p><b>Item Description:</b> <?php echo "  ". $row_view['item_description'] ?></p>
            <input type="hidden" name="item-description" value="<?php echo $row_value['item_description']?>">
            <p><b>Item Brand: </b> <?php echo "  ". $row_view['brand_description'] ?></p>
            <input type="hidden" name="item-brand" value="<?php echo $row_value['id_brand']?>">
            <p><b>Item Section:</b><?php echo "  ". $row_view['itemSectionDescription']?></p>
            <input type="hidden" name="item-section" value="<?php echo $row_value['id_section']?>">
            <p><b>Item Size: </b><?php echo "  ". $row_view['size_description']?></p>
            <input type="hidden" name="item-size" value="<?php echo $row_value['id_size']?>">
            <p><b>Available Quantity:</b><?php echo " ". $row_view['quantity'] ?> </p>
            <input type="hidden" name="item-quantity" value="<?php echo $row_view['quantity']?>">
            
            <?php }
            else {
                echo "No Data";
            }?>
            <input type="text" name="txtquantity" id="txtquantity" placeholder="Input quantity" autofocus><br />
            <input type="submit" value="ADD ITEM" name="validate-insert">
           

            <?php
                $whishlist_insert->insert_whishlist();
            ?>


        </div>
   </form>
</body>
</html>