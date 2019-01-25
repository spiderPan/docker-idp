<?php

// echo phpinfo();

$db_dsn = array(
    'host'    => 'mysql',
    'dbname'  => 'db_movies',
    'charset' => 'utf8',
);

$dsn = 'mysql:' . http_build_query($db_dsn, '', ';');

$db_user = 'root';
$db_pass = 'root';

try {
    $pdo = new PDO($dsn, $db_user, $db_pass);
} catch (Exception $exception) {
    echo 'Connection Failed:' . $exception->getMessage();
    exit();
}
