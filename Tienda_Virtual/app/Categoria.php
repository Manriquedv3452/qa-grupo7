<?php

namespace tiendaVirtual;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $table = 'Categoria';
    protected $primaryKey = 'idCategoria';
    public $timestamps = false;

    protected $fillable = [
      'nombre',
      'descripcion',
      'condicion'];
}
