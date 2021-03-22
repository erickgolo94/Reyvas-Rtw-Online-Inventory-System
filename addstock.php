<?php
  include_once('connections/model.php');
  $model = new Model();
  $model_insert = new Model();
  $model_item_number = new Model();
  $model_table = new Model();
  $model_submit_return = new Model();
  $model_all = new Model();

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Stock Page</title>
  <link rel="stylesheet" href="css/addStock.css">
  <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
</head>
<body>
      <div class="header">
          <h1>ADD STOCK SECTION</h1>
      </div>
    <div class="sidenav">
        <form action="" method="post">
          <!-- fetch the last id for item_number() -->
          <?php
            $item = $model_item_number->id_fetch_last("SELECT * FROM tbl_item WHERE id_item = 
                      (SELECT MAX(id_item) FROM tbl_item)");
            if(!empty($item)){
          ?>
           
          <label>Item No. <?php echo " " .$item['id_item']?> </label>
          <!-- get item no. value -->
          <input type="hidden" name="lbl-item-number" value="<?php echo $item['id_item']?>">
          <!-- <h6>1</h6> -->
          <?php }
          ?>
          <br/> <br/>
          <label for="">Item Description</label><br/>
          <input type="text" name="item_description" id="item_description" 
          placeholder="Input item description"> <br/><br/>
          <label for="">Brand</label><br/>
          <!-- fetch for brand table -->
         
          <select name="brand" id="brand">
          <?php 
            $result = $model->fetcher("SELECT * FROM `tbl_brand` WHERE isActive = 0");
            if(!empty($result)){
            #fetch 1 by 1
            foreach($result as $row){
          ?>
              <option value=<?php echo $row["id_brand"]?>>
              <?php echo $row['brand_description'] ?></option>
                     <?php }
               }
          ?>
          </select><br/><br/>
               
          <label for="">Size</label><br/>
          <select name="size" id="size">
              <?php
                  $result = $model->fetcher("SELECT * FROM `tbl_sizes` WHERE isActive = 0");
                  if(!empty($result)){
                    #fetch all size
                    foreach($result as $row){
          ?>
          <option value=<?php echo $row['id_size']?>
          ><?php echo $row['size_description']?></option>
          <?php }
          }
          ?>
          </select><br/><br/>

          <label for="">Quantity</label><br/>
          <input type="text" name="lblquantity" id="quantity" 
              placeholder="Input item quantity"> <br/><br/>


          <label for="">Section</label><br/>
          <select name="section" id="section">
            <?php
                $result = $model->fetcher("SELECT * FROM `tbl_itemsection` WHERE isActive = 0");
                if(!empty($result)){
                  #loop for each section
                  foreach($result as $row){ 
            ?>
              <option value=<?php echo $row['id_section']?>
                ><?php echo $row['itemSectionDescription'] ?></option>
                <?php } 
                }
                ?>
          </select><br/><br/>
       <!-- <input type="submit" value="Add Item" name="item"> -->
        <button type="submit" name="item-submit" class="btn-add">Add to list</button>
          <?php $insert = $model_insert->insert_item();#insert to list ?>
        <button type="submit" name="submit-all" class="btn-submit-all">Done</button>
          <?php  $model_all->submit_all();#submitted all record?>
        <button type="submit" name="submit-back" class="btn-submit-back">Back to dashboard</button>
         <?php  $return = $model_submit_return->submit_item_back();#return function?>
        </form>
    </div>

         

    <div class="container">
          <?php #header for showing count all row
            $count = $model->count_rows_item(); 
            if(!empty($count)){      
          ?>
        <p><?php echo $count['total']?> item/s</p>
            <?php }
              $count_value = $count['total'];
            ?>
        <table>
          <thead>
            <tr>
              <!-- <th>Item Added</th> -->
              <th>Item No.</th>
              <th>Item Description</th>
              <th>Brand</th>
              <th>Size</th>
              <th>Quantity</th>
              <th>Section</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
                <?php 
                  $rows = $model_table->data_fetch("SELECT * FROM `vw_temporyItem`");
                    $i = 1;

                        if(!empty($rows)){
                          foreach($rows as $row){
                ?>
            <tr>
            
              <td><?php echo $row['item_number']?></td>
              <td><?php echo $row['item_description']?></td>
              <td><?php echo $row['brand_description']?></td>
              <td><?php echo $row['size_description']?></td>
              <td><?php echo $row['quantity']?></td>
              <td><?php echo $row['itemSectionDescription']?></td>
              <td>
              <?php echo ('<a href="itemListRemove.php?id=' . $row['id_item'] . '">Remove</a>');?>
              
              </td>
            </tr>
            <?php }
            }else{
            }?>
          </tbody>
        </table>
    </div>

</body>
</html>