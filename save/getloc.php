<?php
$server = "localhost";
$user = "root";
$password = "";
$db = "location";
// Create connection
$conn = new mysqli($server, $user, $password, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$lat;
$lng;
$latlng = array();

$sqladc = "SELECT lat,lng FROM loc ORDER BY id DESC LIMIT 1";
$res  = $conn->query($sqladc);

while($data = mysqli_fetch_array($res))
{   
	$latlng['lat']=$data['lat'];
	$latlng['lng']=$data['lng'];
	echo json_encode($latlng, JSON_FORCE_OBJECT);
}

?>