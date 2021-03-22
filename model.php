<?php

Class Model {

    private $server = "localhost";
    private $username = "root";
    private $password = "kclove26";
    private $db = "orsmsproto";
    public $conn;

    public function __construct(){

        try{

            $this->conn = new mysqli($this->server, $this->username, $this->password,
                $this->db);


        }catch(Exception $e){

            echo "Connection Failed! " . $e->getMessage();
        }

        
    }

    public function setConn($conn){
            
        $this->conn = $conn;
    }

    public function getConn(){

        return $this->conn;
    }

    #fetch for multiple loop
    public function data_fetch($stmt){

        $data = null;

        if($sql = $this->conn->query($stmt)){
            while($row = mysqli_fetch_assoc($sql)){
                $data[] = $row;
            }

        }
        return $data;
    $this->conn->close();
    }
    
    #function only for details view
    public function fetch_details($item_number){

       $item = null; 
        $stmt = "SELECT * FROM vw_itemDetails WHERE item_number = '$item_number'";
        if($sql = $this->conn->query($stmt)){
            while($row = $sql->fetch_assoc()){
                $item = $row;
            }
        }
        return $item;
        $this->conn->close();
    }

    #fetch id for all maintenance
    public function fetch_id($id, $query){
        $item = null;
        
        if($sql = $this->conn->query($query)){
            while($row = $sql->fetch_assoc()){
                $item = $row;
            }
        }

        return $item;
        $this->conn->close();
    }

    #function for validate request
    public function fetch_validate($id_validate){
        $id = null;
        $query = "SELECT * FROM `vw_viewItemRequest` WHERE id_item = '$id_validate'";
        if($sql = $this->conn->query($query)){
            while($row = $sql->fetch_assoc()){
                $id = $row;
            }
        }
        return $id;
        $this->conn->close();
    }

    #function validate unique id
    public function fetch_unique($unique){
        $id = null;
        $query = "SELECT * FROM `tbl_item` WHERE id_item = '$unique'";
        if($sql = $this->conn->query($query)){
            while($row = $sql->fetch_assoc()){
                $id = $row;
            }
        }
        return $id;
        $this->conn->close();
    }

    public function fetcher($stmt){

        $temp = null;
        if($sql = $this->conn->query($stmt)){
            #loop for whole records
            while($row = $sql->fetch_assoc()){
                $temp[] = $row;
            }
        }
        return $temp;
        $this->conn->close();
    }

    #$this function is for generate the last id in table item
    public function id_fetch_last($query){
           
        $id = null;
        #$query = "SELECT * FROM tbl_item WHERE id_item = (SELECT MAX(id_item) FROM tbl_item)";
        //$query = "SELECT item_number FROM tbl_itemclone WHERE item_number ORDER BY item_number DESC LIMIT 1";
        if($result = $this->conn->query($query)){
            while($row = $result->fetch_assoc()){
                #reference id
                $id = $row;
            }
           
        }
        return $id;
        $this->conn->close();
       
    }

#function for count all rows
public function count_rows_item(){

    $count = null;
    $query = "SELECT COUNT(*) AS total FROM tbl_itemclone";
    if($result = $this->conn->query($query)){
           while($row = $result->fetch_assoc()){
            $count = $row;
        }
     }
     return $count;
     $this->conn->close();
  
}


    #itemclone insertion
    public function insert_item(){
        session_start();
        try{
            if(isset($_POST['item-submit'])){
                if(!empty($_POST['item_description']) && !empty($_POST['lblquantity'])){
                #assigning html elements for variable
                $item_number = $_POST['lbl-item-number'];
                $item_description = $_POST['item_description'];
                $brand = $_POST['brand'];
                $size = $_POST['size'];
                $quantity = $_POST['lblquantity'];
                $section = $_POST['section'];
                $employee = $_SESSION['ID'];

                $query_filter = "SELECT item_description, id_brand, id_size, id_section  FROM tbl_itemclone WHERE 
                 item_description = '$item_description' AND id_brand = '$brand' AND id_size = '$size'
                 AND id_section = '$section'";

                 if($sql_checkRows = $this->conn->query($query_filter)){
                   # $rowsCheck = $this->conn->num_rows($sql_checkRows);
                    if($sql_checkRows->num_rows > 0){
                        #update the query if record existing
                        $query_update = "UPDATE tbl_itemclone SET quantity = quantity + '$quantity' WHERE item_description = '$item_description' 
                                    AND id_brand = '$brand' AND id_size = '$size'";
                        if($result_checkRows = $this->conn->query($query_update)){
                            echo "<script>alert('Item successfully updated to list.');</script>";
                            echo "<script>window.location.href = 'addStock.php';</script>";
                        }#execute update query
                        else{
                            echo "Error UPDATE" .$this->conn->error;
                        }#else false update query
                    }#rowscheckresult
                    else{
                        $query = "INSERT INTO `tbl_itemclone`(`item_number`, `item_description`, `id_brand`, `id_size`, 
                    `id_section`, `quantity`, `date_in`, `time_in`, `emp_id`)
                        VALUES 
                        ('$item_number',
                        '$item_description',
                        '$brand',
                        '$size', 
                        '$section', 
                        '$quantity', 
                        'NOW()',
                        'NOW()', 
                        '$employee')";
                        if($result_insert = $this->conn->query($query)){
                            echo "<script>alert('Item successfully added to list.');</script>";
                            echo "<script>window.location.href = 'addStock.php';</script>";
                        }#result for insert end
                        else{
                            echo "Error INSERT" .$this->conn->error;
                        }#if fails the insert
                    }
                 }#sql checks
                }#for empty fields
                else{
                    echo "<script>alert('Please fill the empty fields or textbox.');</script>"; 
                }#if fields are empty
            }#iffset button
        }catch(Exceprion $e){
            echo " " . $e->getMessage();
        }
        $this->conn->close();
    }#itemclone FUNCTION END

    #function for remove itemList
    public function remove_item_list($id){
        $query = "DELETE FROM `tbl_itemclone` WHERE id_item = '$id'";
        if( $sql = $this->conn->query($query)){
            return true;
        }else{
            return false;
        }
        $this->conn->close();
    }

    #function for back-button item-list
    public function submit_item_back(){
        if(isset($_POST['submit-back'])){
                #return to dashboard
            echo "<script>window.location.href = 'index.php'</script>";
        }
    }

    #function for submit-all-on-list
    public function submit_all(){

        try{
            if(isset($_POST['submit-all'])){
               $item_numb = $_POST['lbl-item-number'];
              
                #if true this query must be execute
                #copying all selected items from clone to original
                $query = "INSERT INTO `tbl_item`(item_number, item_description, id_brand,
                     id_size, id_section, quantity, date_in, time_in, emp_id)
                    SELECT item_number, item_description, id_brand,
                             id_size, id_section, quantity, date_in, time_in, emp_id
                              FROM `tbl_itemclone` WHERE item_number = '$item_numb'";
                 $query1 = "TRUNCATE tbl_itemclone";
                 if($sql = $this->conn->query($query) == true) {
                    echo "<script>alert('Item on list successfully saved!');</script>";

                    #clean the temporary table for next usage
                    $sql1 = $this->conn->query($query1);
                    echo "<script>window.location.href = 'index.php'</script>";
                 } else {
                     echo "Error" .$this->conn->error;
                 }
            }
        }catch(Exception $e){
            echo "Error!" . $e->getMessage();
        }
        
           $this->conn->close();
    }

    #request section
    #function for insert into whishlist
    public function insert_whishlist(){
        if(isset($_POST['validate-insert'])){

            #set all variables
        $id = $_POST['id-value'];
        $request_number = $_POST['lbl-requestLastid'];
        $item_description = $_POST['item-description'];
        $item_brand = $_POST['item-brand'];
        $item_section = $_POST['item-section'];
        $item_size = $_POST['item-size'];
        $item_quantity = $_POST['item-quantity'];
        $txtQty = $_POST['txtquantity']; #from user's request

        //validate if request is enough for our stock!
        if($txtQty > $item_quantity){
         echo "<script>alert('Insufficient item stock!');</script>";
         #check if input is numeric
        }elseif(!is_numeric($txtQty)){
            echo "<script>alert('Invalid input please check if its numeric!');</script>";
        }else{
            
            #query insert the record into whishlist
            $sql_insert = "INSERT INTO tbl_requestclone(
                request_no,
                id_item,
                item_description,
                id_brand,
                id_size,
                id_section,
                quantity,
                date_request,
                time_request,
                id_sBranch
            )VALUES(
                '$request_number',
                '$id',
                '$item_description',
                '$item_brand',
                '$item_size',
                '$item_section',
                '$txtQty',
                NOW(),
                NOW(),
                '1'   
            )";
            #   if($result_insert = $this->conn->query($query))
        if($result = $this->conn->query($sql_insert)){
            echo "<script>alert('Item successfully added to whislist');</script>";
            echo "<script>window.location.href = 'requestItems.php'</script>";
        } else{
            echo "Error INSERT WHISLIST" .$this->conn->error;
        }   
            
     }

     }
}//end function insertion whishlist

 #function for remove RequestitemList
 public function remove_item_request($id){
    $query = "DELETE FROM `tbl_requestclone` WHERE id_request = '$id'";
    if( $sql = $this->conn->query($query)){
        return true;
    }else{
        return false;
    }
    $this->conn->close();
}

//function to insert all request list
public function insert_request_all(){

    try{
       if(isset($_POST['btn-insert'])){

            $request_no = $_POST['lbl-requestno'];

          $query_request = "INSERT INTO tbl_request(request_no, id_item, item_description, id_brand, id_size, id_section,quantity, date_request, 
            time_request, id_sBranch) SELECT request_no, id_item, item_description, id_brand, id_size, id_section,quantity, date_request, 
            time_request, id_sBranch FROM tbl_requestclone WHERE request_no = '$request_no'";
          $query_truncate = "TRUNCATE tbl_requestclone";

          if($result = $this->conn->query($query_request) == true){
            
            
            //$request = include 'requestValidate.php';
            echo "<script>alert('Item on list successfully sent as request!');</script>";    
            #clear the temporary table
            $sql_truncate = $this->conn->query($query_truncate);
           // $request_i = $request->$rq_no + 1; 
            echo "<script>window.location.href = 'requestItems.php'</script>";

          }else{
            echo "Error" .$this->conn->error;
          }
       }

    }catch(Exception $e){
        echo "Error!" . $e->getMessage();
    }

    $this->conn->close();
    }

    //function for cancel button request
    public function btn_cancel(){
        if(isset($_POST['btn-cancel'])){
            #truncate the remaining request to stay clean
            try{

                $sql = "TRUNCATE tbl_requestclone";
                if($sql = $this->conn->query($sql) == true){
                    echo "<script>window.location.href = 'index.php'</script>";
                }

            }catch(Exception $e){
                echo "Error! cancel button" . $e->getMessage();
            }
        }
        $this->conn->close();
    }


    #function to get id request
    public function fetch_request_no($id_request){

        $item = null; 
         $stmt = "SELECT * FROM `vw_viewRequestRelease` WHERE request_no = '$id_request'";
         if($sql = $this->conn->query($stmt)){
             while($row = $sql->fetch_assoc()){
                 $item = $row;
             }
         }
         return $item;
         $this->conn->close();
     }

    #get the id item
    public function fetch_itemRequest($id){

        $item = null; 
         $stmt = "SELECT * FROM vw_viewtbl_request WHERE id_request = '$id'";
         if($sql = $this->conn->query($stmt)){
             while($row = $sql->fetch_assoc()){
                 $item = $row;
             }
         }
         return $item;
         $this->conn->close();
     }

     #get the id release
    public function fetch_itemAvailable($id){

        $item = null; 
         $stmt = "SELECT * FROM tbl_item WHERE id_item = '$id'";
         if($sql = $this->conn->query($stmt)){
             while($row = $sql->fetch_assoc()){
                 $item = $row;
             }
         }
         return $item;
         $this->conn->close();
     }

   
}
?>