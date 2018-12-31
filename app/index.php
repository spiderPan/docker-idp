<?php 

$from = 'noreply@thepan.co';
$to='panbanglanfeng@gmail.com';
$subject='This is test subject';
$message = 'test';
$headers = array(
	'From'=>$from,
	'Reply-To'=>'panbanglanfeng@gmail.com',
	'X-Mailer'=>'PHP/'.phpversion()
);

if(mail($to,$subject,$message,$headers)){
	echo 'Mail Successfully!';
}else{
	echo 'Mail Failed';
}
?>
