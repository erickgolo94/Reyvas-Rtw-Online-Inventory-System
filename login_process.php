<?php 

    include_once("connections/model.php");
    session_start();//start session
    $model = new Model();


    if(isset($_POST['submit-login'])){
        if(!empty($_POST['txtPassword'])){
            
            $password = $_POST['txtPassword'];
            $password_md5 = md5($password);
            $user_id = null;


           $sql_login = "SELECT * FROM tbl_employee WHERE emp_password = 
            '$password_md5' LIMIT 1";
            $user = $model->conn->query($sql_login) or die($model->conn->error);
            $row = $user->fetch_assoc();
            #count if has record already
            $count = $user->num_rows;

            if($count > 0){
               
                #set session
               $_SESSION['userType'] = $row['userType'];
               $_SESSION['ID'] = $row['emp_id'];

               echo "<script>alert('Login Complete!')</script>";
               echo "<script>window.location.href = 'index.php'</script>";
            }else{
                echo "<script>alert('Invalid username or password.')</script>";
                echo "<script>window.location.href = 'frm_login.php'</script>";
            }

            // echo $_SESSION['userType']; 
            //    echo $_SESSION['ID'];

            #create select statement
            //  $stmt = $model->conn->prepare("SELECT emp_password 
            //     FROM tbl_employee WHERE emp_password = ? LIMIT 1");
            // $stmt->bind_param('s', $password);
            // $stmt->execute();


            // $stmt->bind_result('is',$user_id, $password);
            // $stmt->store_result();
            

        }else{

            echo "<script>alert('Please enter the password!')</script>";
            echo "<script>window.location.href = 'frm_login.php'</script>";

        }

    }

?>