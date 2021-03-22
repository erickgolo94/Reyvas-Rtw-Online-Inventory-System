<?php
    include_once("connections/model.php");
    $model = new Model();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request/s Pending</title>
    <link rel="stylesheet" href="css/releasedRequest.css">
</head>
<body>
    <div class="header">
        <h2>Pending Request/s</h2>
    </div>

    <div class="content">
        <form action="" method="post">
           <table>
            <thead>
                <tr>
                    <th>Request Number</th>
                    <th>Date Requested</th>
                    <th>Time Requested</th>
                    <th>Branch Requested</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <?php 
                        $rows = $model->data_fetch("SELECT * FROM `vw_viewRequestRelease`");
                            if(!empty($rows)){
                                foreach($rows as $row){       
                    ?>
                    <td><?php echo $row['request_no']?></td>
                    <td><?php echo $row['date_request']?></td>
                    <td><?php echo $row['time_request']?></td>
                    <td><?php echo $row['branch_name']?></td>
                    <td><?php echo ('<a href="releaseItems.php?id=' . $row['request_no'] . '">OPEN</a>');?></td>
                </tr>
                <?php }
                    }else{
                        echo "No request found at the moment!" . "<br /><br />";
                ?>
                    <a href="requestItems.php">Create Request</a><br />
                    <a href="index.php">Back</a>
                <?php  } ?>
            </tbody>
           </table>
        </form>
    </div>

    <div class="footer">
        <p>@erickgolodev</p>
    </div>    
</body>
</html>