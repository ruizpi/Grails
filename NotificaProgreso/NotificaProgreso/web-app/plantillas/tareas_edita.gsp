
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8"><h1> Edita Objetivo <h1/></div>
    <div class="col-md-2"></div>
    
</div>

<div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" ng-controller="editaObjetivo">
            
            <div data-ng-repeat="mensaje in mensajes">
                {{ mensaje }}
            </div>    

            <form role="form" ng-submit="actualizaObjetivo()" method="POST" name="objetivo" novalidate>
                <input ng-model="objetivo.id" class="form-control" placeholder="id" name="id" type="hidden" autofocus>
                <div class="form-group">
                  <label for="descripcion">Descripción</label>
                  <input type="text" class="form-control" ng-model="objetivo.descripcion" id="descripcion" placeholder="Descripcion" >
                </div>
                <div class="form-group">
                  <label for="porcCompletado">% Completado</label>
                  <input type="text" class="form-control" ng-model="objetivo.porcentaje" id="porcCompletado" placeholder="% Completado" >
                </div>
                <button type="submit" class="btn btn-primary btn-sm">
                            Update
                </button>
               
            </form>      
        </div>
        <div class="col-md-2"></div>
</div>

