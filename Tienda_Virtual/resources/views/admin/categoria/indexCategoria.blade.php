@extends('layouts.adminLayout.admin_design')
@section('contenido')

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="{{url('/admin/inicio')}}" title="Inicio" class="tip-bottom"><i class="icon-home"></i> Inicio</a> <a href="#"> Categoría</a> <a href="{{url('/admin/indexCategoria')}}" class="current">Ver Categorías</a> </div>
    <h1>Categorías</h1>
    @if(Session::has('flash_message_error'))
        <div class="alert alert-danger alert-block">
            <button type="button" class="close" data-dismiss="alert">X</button>
            <strong>{!! session('flash_message_error') !!}</strong>
        </div>
    @endif
    @if(Session::has('flash_message_success'))
        <div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">X</button>
            <strong>{!! session('flash_message_success') !!}</strong>
        </div>
    @endif
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Ver Categorías</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Id Categoría</th>
                  <th>Nombre</th>
                  <th>Descripción</th>
                  <th>Condición</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
              	@foreach($categorias as $cat)
                <tr class="gradeX">
                  <td>{{$cat->idCategoria}}</td>
                  <td>{{$cat->nombre}}</td>
                  <td>{{$cat->descripcion}}</td>
                  <td>{{$cat->condicion}}</td>
                  <td class="center"><a href="{{url('/admin/editarCategoria/'.$cat->idCategoria)}}" class="btn btn-primary btn-mini">Editar</a>
                    <a href="{{url('/admin/eliminarCategoria/'.$cat->idCategoria)}}" class="btn btn-danger btn-mini elimiarCategoria">Eliminar</a></td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection
