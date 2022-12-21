<!DOCTYPE html>
<html lang="en">
<head>
<title>Books Booking(Shivaani S 2020115082)</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    

    
    
    <style>
	body{
	background-color:azure;}
	h1{text-align:center;
	border:2px solid black;}
	table,td{
	border:2px solid black;}
    
      
   
    



 
  
  
    </style>
</head>
<body>
<br><a href="mycart.php">Go to My Cart</a>
<?php
$d=0;

echo "<br><a href='home.php'>Go to homepage</a>";
if (isset($_POST['submit2']))
{$c=$_POST['text'];
	 $host="localhost";
    $username="root";
    $pass="";
    $database="books";
    $conn=mysqli_connect($host,$username,$pass,$database);
    $sql="SELECT * FROM bookdes WHERE category='$c'";//Searching the input with each attribute given
	$sql1="SELECT * FROM bookdes WHERE author='$c'";
	$sql2="SELECT * FROM bookdes WHERE title='$c'";
    $result=mysqli_query($conn,$sql);
    
	if(mysqli_num_rows($result) > 0)//if the no of rows is not 0 then printing the rows from table
	{
	while($row=mysqli_fetch_array($result))
	{	echo "<table>";
		echo "<tr>";
		echo "<td>".$row['title']."</td>"."<td>".$row['author']."</td>"."<td>".$row['year']."</td>"."</tr>";//printing the results
		echo "</table>";
		echo "<form action='manage_cart.php' method='post'>
                
                    
                    
                        
                            <h3>$row[title]</h3>
                        
                        ID: $row[id]
                        <br>Price: $row[price]
                       <br> Category: $row[category]
                        <br>Author:$row[author]
                        <br>Year:$row[year]<br>
                        <input type='number' min='1' max='10' name='Quantity'  required><br>
                        <button type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[price]'>
                    
                
            </form>";
	}
	
	}
	$result1=mysqli_query($conn,$sql1);//checking if it matches any author
	  if (mysqli_num_rows($result1) > 0)
	{
		while($row=mysqli_fetch_array($result1))
	{	echo"<table>";
		echo "<tr>";
	echo "</td>"."<td>".$row['title']."</td>"."<td>".$row['author']."</td>"."<td>".$row['year']."</td>"."</tr>";
	echo "</table>";
	echo "<form action='manage_cart.php' method='post'>
                
                    
                    
                        
                            <h3>$row[title]</h3>
                        
                        ID: $row[id]
                        <br>Price: $row[price]
                       <br> Category: $row[category]
                        <br>Author:$row[author]
                        <br>Year:$row[year]<br>
                        <input type='number' min='1' max='10' name='Quantity'  required><br>
                        <button type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[price]'>
                    
            </form>";
}
	}
	$result2=mysqli_query($conn,$sql2);//checking if it matches title
	if (mysqli_num_rows($result2) > 0){
		
		while($row=mysqli_fetch_array($result2))
			
	{	echo "<table>";
		echo "<tr>";
	echo "</td>"."<td>".$row['title']."</td>"."<td>".$row['author']."</td>"."<td>".$row['year']."</td>"."</tr>";
	echo "</table>";
	echo "<form action='manage_cart.php' method='post'>
                
                    
                    
                        
                            <h3>$row[title]</h3>
                        
                        ID: $row[id]
                        <br>Price: $row[price]
                       <br> Category: $row[category]
                        <br>Author:$row[author]
                        <br>Year:$row[year]<br>
                        <input type='number' min='1' max='10' name='Quantity'  required><br>
                        <button type='submit' name='Add' >Add To Cart</button>
                        <input type='hidden' name='Item_Name' value='$row[title]'>
                        <input type='hidden' name='Price' value='$row[price]'>
                    
             
            </form>";
}
	}
	if((mysqli_num_rows($result2) == 0) and (mysqli_num_rows($result1) ==0) and (mysqli_num_rows($result) ==0))
	{
		echo "<br><h2>Search Results not found</h2>";
	}
	//if none of them match then the num rows give 0 so no results found	
	

}



?>
</body>
</html>