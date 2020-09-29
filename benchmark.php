<?php

use GuzzleHttp\Exception\GuzzleException;

require_once "vendor/autoload.php";

$client = new GuzzleHttp\Client();

try {
    $response = $client->post("http://18.130.116.85/recipes", [
        'form_params' => [
            'offset' => $_POST['offset'] ?? 0,
            'limit' => $_POST['limit'] ?? 20
        ]
    ]);
    echo $response->getBody();
} catch (GuzzleException $e) {
    die($e->getMessage());
}
