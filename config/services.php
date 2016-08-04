<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Stripe, Mailgun, Mandrill, and others. This file provides a sane
    | default location for this type of information, allowing packages
    | to have a conventional place to find your various credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
    ],

    'mandrill' => [
        'secret' => env('MANDRILL_SECRET'),
    ],

    'ses' => [
        'key'    => env('SES_KEY'),
        'secret' => env('SES_SECRET'),
        'region' => 'us-east-1',
    ],

    'stripe' => [
        'model'  => App\Models\User::class,
        'key'    => env('STRIPE_KEY'),
        'secret' => env('STRIPE_SECRET'),
    ],
    
    'paypal' => [
        'client_id' => 'Abh07NvWYVC60JvAdF8swfDopZ7bFokSfwDa0qVZNPEDrLNvuTYBuAFfQ4CorwRpWN_mE7NgQGAkgq_F',
        'secret' => 'EKn9LUzsG8fwtu-TaRoca1og2I_ny3lNS-c2Mu2gxP7bbPOm73BD2rP1-BY9j6X1VA1Q7NDlL2uxohKK'
    ],
];
