<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PackageHistory extends AbstractModel
{
    protected $table = 'package_history';

    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id',
        'package',
        'created_at',
        'updated_at',
    ];

    public function username() {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
}
