<?php

session_start();
include("connection.php");
	include("functions.php");

if(isset($_SESSION['user_id']))
	
{	$a=$_SESSION['username'];


	if(isset($_SESSION['cart'])){
	foreach($_SESSION['cart'] as $k => $value)
	{
		echo $value['Item_Name'];
	$b=$_SESSION['cart'][$k]['Item_Name'];
	$c=$_SESSION['cart'][$k]['Price'];
	$d=$_SESSION['cart'][$k]['Quantity'];
		$sql="insert into icart(username,item_name,price,quantity,book_id) values('$_SESSION[username]','$value[Item_Name]','$value[Price]','$value[Quantity]','$value[id]')";
		$result = pg_query($con,$sql);

}	
	unset($_SESSION['user_id']);
	unset($_SESSION['username']);
	unset($_SESSION['cart']);
	unset($_SESSION['fid']);

}}

header("Location: login.php");
die;
print_r($_SESSION['cart']);
?>