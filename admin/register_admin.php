<?php

include '../components/connect.php';

session_start();

$admin_id = $_SESSION['user_id'];

if(!isset($admin_id)){
   header('location:user_login.php');
}

if(isset($_POST['submit'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = sha1($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

   $select_admin = $conn->prepare("SELECT * FROM `users` WHERE name = ?");
   $select_admin->execute([$name]);

   if($select_admin->rowCount() > 0){
      $message[] = 'Username already exist!';
   }else{
      if($pass != $cpass){
         $message[] = 'Confirm password not matched!';
      }else{
         $insert_admin = $conn->prepare("INSERT INTO `users`(name,email, password,user_type) VALUES(?,?,?,?)");
         $insert_admin->execute([$name,$email, $cpass,'admin']);
         $message[] = 'New admin registered successfully!';
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Register admin</title>

   <link rel="shortcut icon" type="image/png" href="/images/logomini.png"/>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../components/admin_header.php'; ?>

<section class="form-container">

   <form action="" method="post">
      <h3>register now</h3>
      <input type="text" name="name" required placeholder="Enter your username" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="email" name="email" required placeholder="Enter your email" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="password" name="pass" required placeholder ="Create Password (Min. 8 Characters)"  pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$" title="Please include at least 1 uppercase character, 1 lowercase character, and 1 number."  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="password" name="cpass" required placeholder="Confirm your password (Min. 8 Characters)"   pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$"  title="Please include at least 1 uppercase character, 1 lowercase character, and 1 number."  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
      <input type="submit" value="register now" class="btn" name="submit">
   </form>

</section>












<script src="../js/admin_script.js"></script>
   
</body>
</html>