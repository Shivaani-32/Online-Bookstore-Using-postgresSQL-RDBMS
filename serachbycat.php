<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- custom css file link  -->
	<link rel="stylesheet" href="style1.css">
	<style>
	.row {
    border:1px solid black; 
	background-color:black;
}

			.btn3{
    margin-top: 1rem;
    display:inline-block;
    padding:.9rem 1rem;
    border-radius: .5rem;
    color:#fff;
    background:red;
    font-size: 1.2rem;
    cursor: pointer;
    font-weight: 500;
}
</style>
</head>
<body>
<header class="header">

    <div class="header-1">

        <a href="#" class="logo"> <i class="fas fa-book"></i> bookTown</a>
		
        <!--<form action="" class="search-form">
            <input type="search" name="" placeholder="search here..." id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>-->

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
			<a href="uupdate.php">profile</a>
			<a href="oderss.php">My orders</a>
			
        </nav>
    </div>

</header>
<form  action="serach.php" method="post">
 
    <input type="text" name="cat" placeholder="Search category of books">
  
  <input type="submit" name="submit1" value="Search">
</form>

