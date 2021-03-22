<?php
    include_once('connections/model.php');
    $model = new Model();
    $model_request = New Model();
    $model_itemAvailable = New Model();

    $id_release = $_REQUEST['id'];
    $req_row = $model_request->fetch_itemRequest($id_release);
    //var_dump($item_row);
    $STATUS = 1; #update status when query update success
    $ADMIN = "Administrator";
    $id_request = $req_row['id_request'];
    $request_no = $req_row['request_no'];
    $id_item = $req_row['id_item'];
    $item = $req_row['item_description'];
    $brand = $req_row['brand_description']; 
    $size = $req_row['size_description'];
    $section = $req_row['itemSectionDescription'];
    $quantity_request = $req_row['quantity'];
    $date_request = $req_row['date_request'];
    $time_request = $req_row['time_request'];
    $branch = $req_row['branch_name'];
    $status = $req_row['reqStatus'];

   
    //for item availability 
    $item_row = $model_itemAvailable->fetch_itemAvailable($id_item); #get the quantity on tbl_item 
    //var_dump($item_row);

    $item_stock = $item_row['quantity'];

    try{
        #insert first query
      $insert_query =  "INSERT INTO `tbl_release`(`request_no`, `item_description`, `brand`, `size`, `section`, `quantity`, 
      `date_request`, `time_request`, `branch`, `date_release`, `time_release`, `release_by`)
            VALUES 
            ('$request_no',
            '$item',
            '$brand',
            '$size',
            '$section',
            '$quantity_request',
            '$date_request',
            '$time_request',
            '$branch',
            NOW(),
            NOW(),
            '$ADMIN')";
    #query update for new quantity value
    $new_qty = $item_stock - $quantity_request;#sum new value
    // echo $item_stock ." - " .$quantity_request . "<br />";
    $update_quantity = "UPDATE tbl_item SET quantity = '$new_qty' WHERE id_item = '$id_item'";
    #update status
    $update_status = "UPDATE tbl_request SET reqStatus = '$STATUS' WHERE id_request = '$id_request'";
    
    if($release_insert = $model->conn->query($insert_query) && 
        $release_updateI = $model->conn->query($update_quantity) && 
            $release_updateS = $model->conn->query($update_status) == TRUE){
           // $_SESSION['request'] = $request_no;   
            echo "<script>alert('Request now released!');</script>";
            echo "<script>window.location.href = 'releasedRequest.php'</script>";
           
        }else{
            echo "Error Operation" .$model->conn->error;
   }

    }catch(Exceprion $e){
        echo "Error!" . $e->getMessage();
    }
?>