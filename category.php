<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Category</title>
   
   <link rel="shortcut icon" type="image/png" href="/images/logomini.png"/>
   
   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="products">

   <h1 class="heading">Category</h1>
         <section class="category1">

         <div class="box-container">

            <a href="category.php?category=backpack" class="box">
               <img src="uploaded_img/home-backpack.png" alt="">
               <h3>Backpack</h3>
            </a>

            <a href="category.php?category=watch" class="box">
               <img src="uploaded_img/home-watch.png" alt="">
               <h3>Watch</h3>
            </a>

            <a href="category.php?category=wallet" class="box">
               <img src="uploaded_img/home-wallet.png" alt="">
               <h3>Wallet</h3>
            </a>

            <a href="category.php?category=jewelry" class="box">
               <img src="uploaded_img/home-jewelry.png" alt="">
               <h3>Jewelry</h3>
            </a>
            
            <a href="shop.php" class="box">
               <img src="uploaded_img/all.png" alt="">
               <h3>See All</h3>
            </a>
         </div>

      </section>
   <div class="box-container">

   <?php
         $category = $_GET['category'];
         $select_product = $conn->prepare("SELECT * FROM `products` WHERE category = ?");
         $select_product->execute([$category]);
         if($select_product->rowCount() > 0){
            while($fetch_product = $select_product->fetch(PDO::FETCH_ASSOC)){
      ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>$</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">no products found!</p>';
   }
   ?>

   </div>

</section>





<?php include 'components/footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>