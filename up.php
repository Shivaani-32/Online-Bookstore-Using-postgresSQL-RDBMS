<?php
session_start();

	include("connection.php");
	include("functions.php");
	if(isset($_POST['s2']))
	{
		$sql="UPDATE users1
SET passwordd='$_POST[password]'
where user_name='$_SESSION[username]'";

    $result=pg_query($con,$sql);
    echo "<script>
                alert('Password updated!');
                window.location.href='uupdate.php';
                </script>";
	}
	if(isset($_POST['s1']))
	{
		$sql="UPDATE users1
SET user_name='$_POST[user_name]'
where user_name='$_SESSION[username]'";


    $result=pg_query($con,$sql);
	$sql1="select * from icart where username='$_SESSION[username]'";
	$result1=pg_query($con,$sql1);
	if($result1 && pg_num_rows($result1) > 0)
	{
	
$sql3="UPDATE icart SET user_name='$_POST[user_name]'
where user_name='$_SESSION[username]'";
$res=pg_query($con,$sql3);
	}
	
$_SESSION['username']=$_POST['user_name'];
    echo "<script>
	alert('Username updated!');
                
                window.location.href='uupdate.php';
                </script>";
	}
	
	?>
