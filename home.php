
<!DOCTYPE html>
<html lang="en">
<head>
<title>Books Booking(Shivaani S 2020115082)</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
	<link rel="stylesheet" href="style.css">
    

    
    

    
    
    <style>
	.content{
	display:flex;
	column-gap:50px;
	}
	



 
  
  
    </style>
</head>

    <?php 
    $host="localhost";
    $username="root";
    $pass="";
    $database="books";
    $conn=mysqli_connect($host,$username,$pass,$database);
    $sql="SELECT * FROM bookdes";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_array($result);
    ?>
	
<body>

<header class="header">

    <div class="header-1">

        <a href="#" class="logo"> <i class="fas fa-book"></i> bookly </a>

        <form action="" class="search-form">
            <input type="search" name="" placeholder="search here..." id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>

        <div class="icons">
            <div id="search-btn" class="fas fa-search"></div>
            <a href="#" class="fas fa-heart"></a>
            <a href="mycart.php" class="fas fa-shopping-cart"></a>
            <div id="login-btn" class="fas fa-user"></div>
        </div>

    </div>

    <div class="header-2">
        <nav class="navbar">
            <a href="#home">home</a>
            <a href="#featured">shop</a>
            <a href="#arrivals">arrivals</a>
            <a href="#reviews">reviews</a>
            <a href="#blogs">blogs</a>
        </nav>
    </div>

</header>

<!-- header section ends -->

<!-- bottom navbar  -->

<nav class="bottom-navbar">
    <a href="#home" class="fas fa-home"></a>
    <a href="#featured" class="fas fa-list"></a>
    <a href="#arrivals" class="fas fa-tags"></a>
    <a href="#reviews" class="fas fa-comments"></a>
    <a href="#blogs" class="fas fa-blog"></a>
</nav>

<!-- login form  -->

<div class="login-form-container">

    <div id="close-login-btn" class="fas fa-times"></div>

    <form action="">
        <h3>sign in</h3>
        <span>username</span>
        <input type="email" name="" class="box" placeholder="enter your email" id="">
        <span>password</span>
        <input type="password" name="" class="box" placeholder="enter your password" id="">
        <div class="checkbox">
            <input type="checkbox" name="" id="remember-me">
            <label for="remember-me"> remember me</label>
        </div>
        <input type="submit" value="sign in" class="btn">
        <p>forget password ? <a href="#">click here</a></p>
        <p>don't have an account ? <a href="#">create one</a></p>
    </form>

</div>
<h1>The Probookstore</h1>
<div class='content'>
<form  action="search.php" method=post>
<input type="text" name="text" placeholder="Search by category,author or title">

<input type="submit" name="submit2" value="search">

</form>
<a href="mycart.php">Go to My Cart</a>
</div>

    <section class='featured'>
	
	
	
        

        <div>
            <?php
            $result=mysqli_query($conn,$sql);//printing everything from table using the attributes from $result
            
            
                while($row=mysqli_fetch_array($result))
            {
                echo "<form action='manage_cart.php' method='post'>
				<div class='content'>
				<div class='swiper-slide box'>
                <div class='icons'>
			

       
				
                <div class='content' >
                    
                    <div>
                        
                            <h3>$row[title]</h3>
                        
                        ID: $row[id]
			<br>Price: $row[price]
                       <br> Category: $row[category]
                        <br>Author:$row[author]
                        <br>Year:$row[year]<br>
						<img src='$row[img]'  width='500' height='600'>
                        <input type='number' min='1' max='10' name='Quantity'  required><br>
                        <button class='btn' type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[price]'>
						
                    </div>
					
					
                </div>
            </form>
			
            ";
            }
            
            
            ?>
            

        </div>
		</div>
		</div>
</section>
    <hr>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="script.js"></script>


</body>
</html>