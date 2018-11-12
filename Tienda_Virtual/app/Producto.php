<?php

namespace tiendaVirtual;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $table = 'Producto';
    protected $primaryKey = 'idProducto';
    public $timestamps = false;

    protected $fillable = [
    'nombre',
    'descripcion',
    'imagen',
    'precio',
    'categoria',
    'stock',
    'estado'];
}
