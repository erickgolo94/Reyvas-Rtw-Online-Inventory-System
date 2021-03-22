<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <title>View Item Details</title>
    <link rel="icon" href="img/favCloth3.png"  type="image/icon type">
  </head>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-md-12 mt-5">
                <h1>ITEM DETAILS</h1>
                <hr style="height: 1px; color:black; background-color:black;">
            </div>
        </div>
        <div class="row">
          <div class="col-md-5 mx-auto">
            <?php
              include 'connections/model.php'; #include only for once it use
              $model = new Model();
              $id = $_REQUEST['id'];
              $row = $model->fetch_details($id);
              //var_dump($row);
              if(!empty($row)){
                

            ?>
            <div class="card">
              <div class="card-header">
                Single Record
              </div>
            <div class="card-body">

                  <!-- fetch all fields -->
                  <p>No. <?php echo $row['id_item']?></p>
                  <p>Item :<?php echo $row['item_description'] ?> </p>
                  <p>Section : <?php echo $row['itemSectionDescription']?> </p>
                  <p>Brand : <?php echo $row['brand_description']?></p>
                  <p>Size : <?php echo $row['size_description']?> </p>
                  <p>Item Available : <?php echo $row['quantity']?></p>
                  <p>Date In : <?php echo $row['date_in']?></p>
                  <p>Time In : <?php echo $row['time_in']?></p>
                  
                  <p>In-Charge by : <?php echo $row['employee']?></p>

              </div>

              <?php
                    }else {
                        echo "No Data";
                    }   
                ?>

            </div>
          </div>
        </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
    -->
  </body>
</html>