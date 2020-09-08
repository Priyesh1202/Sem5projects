<?php      
    // include('connection.php');
    $host = "localhost";  
    $user = "root";  
    $password = '';  
    $db_name = "accounts";  
      
    $conn = mysqli_connect($host, $user, $password, $db_name);  
    if(mysqli_connect_errno()) {  
        die("Failed to connect with MySQL: ". mysqli_connect_error());  
    }  
    $username = $_POST['user'];  
    $password = $_POST['pass'];
    $sql = "select * from login where username = '$username'";
    if(!mysqli_query($conn, $sql)){
        echo "Username already exists";
    }
    else{
        $sql = "insert into login(username,password) values ('$username','$password')";  
          
        if(mysqli_query($conn, $sql)){  
            include 'home.html';  
        }else{  
            echo "Could not insert record: ". mysqli_error($conn);  
        }  
    }
  
mysqli_close($conn);     
?>