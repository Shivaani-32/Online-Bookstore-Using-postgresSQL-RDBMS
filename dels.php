<?php
session_start();
include("connection.php");
include("functions.php");
if(isset($_POST['c1']))
{
	$i=$_POST['id'];
	$sql4="select * from customer where orderid1='$i'";
	$res4=pg_query($con,$sql4);
	while($r4=pg_fetch_array($res4))
	{
	$i11=$r4["quantity"];
		$sql="update books set stock=stock+$i11 where title='$r4[itemname]'";
		$res=pg_query($con,$sql);
		$sqlin="insert into cancelorders (namec,totcost,itemname,quantity,price,orderid,userid,dateof) values ('$r4[name]','$r4[totcost]','$r4[itemname]','$r4[quantity]','$r4[price]','$r4[orderid1]','$r4[userid]','$r4[dateof]')";
		$resin=pg_query($con,$sqlin);
	}
	$sql3="delete from customer where orderid1='$i'";
	$res3=pg_query($con,$sql3);
	if($res3)
	{
		echo "<script>alert('Cancellation successful!')
		window.location.href='oderss.php'</script>";
}
}
?>
	