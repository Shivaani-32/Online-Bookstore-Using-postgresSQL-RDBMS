<!DOCTYPE html>
<html lang="en">

<head>
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
	.imggg{
	width:150px;
height:200px;}
.next{
	float:right;
font-size:20px;}
	



 
  
  
    
}
</style>
</head>
<?php 
   
	$con=pg_connect("host=localhost port=5432 dbname=db user=postgres password=shivaani");
    $sql="SELECT img,title, cost, book_id,name,published_date,stock FROM books inner join publishers on publishers.publisher_id=books.publisher_id and book_id<230";
    $result=pg_query($con,$sql);
    $row=pg_fetch_array($result);
	
    ?>
	
<body>
<header class="header">

    <div class="header-1">

        <a href="#" class="logo"> <i class="fas fa-book"></i> bookTown </a>
		
        <!--<form action="" class="search-form">
            <input type="search" name="" placeholder="search here..." id="search-box">
            <label for="search-box" class="fas fa-search"></label>
        </form>-->

        <div class="icons">
            <div id="search-btn" class="fas fa-search"></div>
            
            <a href="mycart.php" class="fas fa-shopping-cart"></a>
			<?php
session_start();



	if(isset($_SESSION['user_id']))
	{
		echo "<a href='logout.php'>LOGOUT</a>";
	}
	else
	{
		echo "<a href='login.php'>LOGIN</a>";
	}
	?>
			 <div id="login-btn" class="fas fa-user"></div>
        </div>

    </div>

    <div class="header-2">
        <nav class="navbar">
            <a href="home 1.php">home</a>
            <a href="home 1.php">shop</a>
            
            
          
			
			<a href="oderss.php">My orders</a>
			
        </nav>
    </div>

</header>

<section>

<?php
include("connection.php");
include("functions.php");
if (isset($_POST['submit2']))
{$c=$_POST['text'];
	 
    
    $sql="SELECT * FROM books WHERE category ilike '%$c%'";//Searching the input with each attribute given
	$sql9="SELECT book_authors.book_id FROM book_authors INNER JOIN authors ON authors.author_id = book_authors.author_id and authors.name ilike '%$c%'";
	$sql2="SELECT * FROM books WHERE title ilike '%$c%'";
	$resss=pg_query($con,$sql2);
    $result=pg_query($con,$sql);
	$result1=pg_query($con,$sql9);?>
    <div class='content' >
	<?php
	if(pg_num_rows($result) > 0)//if the no of rows is not 0 then printing the rows from table
	{
		
	while($row=pg_fetch_array($result))
		
	{if($row["stock"]>0)
					$i="            Available";
				else
					$i="Unavailable";
				echo "	
	
	
		<div>
		<h2>$row[title]</h2><form action='manage_cart.php' method='post'>
                        
			Rs. $row[cost]
                       
                        <br>Year:$row[published_date]<br>
						$row[title]<br>
						<img class='imggg' src='$row[img]'><br>
                        <input type='number' min='1' max='$row[stock]' name='Quantity'  required><br>
                        <button class='btn' type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[cost]'>
						<input type='hidden' name='book_id' value='$row[book_id]'>
						<input type='text' name='stock' value='$i' readonly>
						
                        </form>
                    </div>";
					
				
	} }
//$result1=pg_query($con,$sql1);//checking if it matches any author
	else if (pg_num_rows($result1) > 0)
	  {	
		  while($row1=pg_fetch_array($result1))
		  {$s=$row1["book_id"];
		$sql44="SELECT img,title, cost, book_id,name,published_date,stock FROM books inner join publishers on publishers.publisher_id=books.publisher_id and book_id='$s'";
	  
				$ress=pg_query($con,$sql44);
				while($row=pg_fetch_array($ress))
				{
					if($row["stock"]>0)
					$i="            Available";
				else
					$i="Unavailable";
				echo "	
	
	
		<div>
		<h2>$row[title]</h2><form action='manage_cart.php' method='post'>
                        
			Rs. $row[cost]
                       
                        <br>Year:$row[published_date]<br>
						$row[title]<br>
						<img class='imggg' src='$row[img]'><br>
                        <input type='number' min='1' max='$row[stock]' name='Quantity'  required><br>
                        <button class='btn' type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[cost]'>
						<input type='hidden' name='book_id' value='$row[book_id]'>
						<input type='text' name='stock' value='$i' readonly>
						
                        </form>
	  </div>";}}}
	else  if(pg_num_rows($resss) > 0)
	  {
		  while($row=pg_fetch_array($resss))
		
	{if($row["stock"]>0)
					$i="            Available";
				else
					$i="Unavailable";
				echo "	
	
	
		<div>
		<h2>$row[title]</h2><form action='manage_cart.php' method='post'>
                        
			Rs. $row[cost]
                       
                        <br>Year:$row[published_date]<br>
						$row[title]<br>
						<img class='imggg' src='$row[img]'><br>
                        <input type='number' min='1' max='$row[stock]' name='Quantity'  required><br>
                        <button class='btn' type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[cost]'>
						<input type='hidden' name='book_id' value='$row[book_id]'>
						<input type='text' name='stock' value='$i' readonly>
						
                        </form>
                    </div>";
					
				
	} }
		  
		 else if((pg_num_rows($result) == 0) and (pg_num_rows($result1) ==0) and (pg_num_rows($resss) ==0))
	{
		echo "<br><h2>Search Results not found</h2>";
	}
					
			
}
	?>
	</div>
	</section>
	<hr>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	<script src="script.js"></script>
	</body>
	</html>