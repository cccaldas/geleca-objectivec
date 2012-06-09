<?php 
	$path = shell_exec("pwd") . "/";
	$path = str_replace("\n", "", $path);

	$data = $_POST["data"];
	$file = $_POST["file"];
	$data = str_replace(" ", "+", $data); //replace whitespaces
	$data = base64_decode($data);
	file_put_contents($path.$file, $data);
 ?>