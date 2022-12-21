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
	<link rel="stylesheet" href="style1.css">

    

    
    

    
    
    <style>
	.content{
	display:flex;
	column-gap:50px;
	}
	body{
	background-image: url('bg.jpg');
	}
	



 
  
  
    </style>
</head>

    <?php 
   
	$con=pg_connect("host=localhost port=5432 dbname=db user=postgres password=shivaani");
    $sql="SELECT title, cost, book_id,name,published_date FROM books inner join publishers on publishers.publisher_id=books.publisher_id";
    $result=pg_query($con,$sql);
    $row=pg_fetch_array($result);
    ?>
	
<body>

<header class="header">

    <div class="header-1">

        <a href="#" class="logo"> <i class="fas fa-book"></i> bookTown </a>

        <h1>SIGN UP</h2>
        </form>

        <div class="icons">
            <div id="search-btn" class="fas fa-search"></div>
            <a href="#" class="fas fa-heart"></a>
            <a href="mycart.php" class="fas fa-shopping-cart"></a>
        
			<div id="login-btn" class="fas fa-phone"></div>
			<a href="signup.html" class="fas fa-user"></a>
        </div>

    </div>

    <div class="header-2">
        <nav class="navbar">
             <a href="index.html">home</a>
            <a href="home 1.php">shop</a>
            <a href="login.php">log in</a>
            
        </nav>
    </div>

</header>

<!-- header section ends -->

<!-- bottom navbar  -->
<div class="login-form-container">

    <div id="close-login-btn" class="fas fa-times"></div>

    <form action="mailto:shivaanis32@gmail.com">
        <h3>Mail us</h3>
        <span>Enter your queries</span>
        <input type="textarea" name="" rows='4' cols='150'  placeholder="enter your queries" id="">
        <span>password</span>
        <input type="password" name="" class="box" placeholder="enter your password" id="">
        
        <input type="submit" value="sign in" class="btn">
        
    </form>

</div>

<nav class="bottom-navbar">
    <a href="#home" class="fas fa-home"></a>
    <a href="#featured" class="fas fa-list"></a>
    <a href="#arrivals" class="fas fa-tags"></a>
    <a href="#reviews" class="fas fa-comments"></a>
    <a href="#blogs" class="fas fa-blog"></a>
</nav>

<!-- login form  -->


   
   <div class="content1">

    <form method="post">
        <h3>Sign Up</h3>
        <span>Enter Email</span><br>
        <input type="email" name="user_name"   placeholder="Enter Email" id=""><br>
        <span>password</span><br>
        <input type="password" name="password"  placeholder="Password" id=""><br>
        
        <input type="submit" value="signup" class="btn">
        
    </form>

</div>
<?php
session_start();

	include("connection.php");
	include("functions.php");


	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//something was posted
		$user_name = $_POST['user_name'];
		$password = $_POST['password'];
		

		if(!empty($user_name) && !empty($password) && !is_numeric($user_name))
		{
			$check = "Select tid  from users1 Where user_name ='$user_name'";
        $result = pg_query($con,$check);
			if (pg_num_rows($result)>=1)
			{ echo "<script>alert('Aldready registered pls login')</script>"; 
		echo "<h2 class='hh'>				Aldready Registered Login!</h2>";
		//header("Location: login.php");
			}
			else{
			//save to database
			$user_id = random_num(10);
			$query = "insert into users1 (user_id,user_name,passwordd) values ('$user_id','$user_name','$password')";

			pg_query($con, $query);
			

			header("Location: login.php");
			die;
			}
		}else
		{
			echo "<h2 class='hh'>Please enter some valid information!</h2>";
		}
	}
?>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<!-- custom js file link  -->
<script src="script.js"></script>

</body>