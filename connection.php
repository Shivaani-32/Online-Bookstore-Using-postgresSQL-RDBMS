<?php



if(!$con = pg_connect("host=localhost port=5432 dbname=db user=postgres password=shivaani"))
{

	die("failed to connect!");
}
