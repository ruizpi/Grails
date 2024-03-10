
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8"><h1> Crea Objetivos <h1/></div>
    <div class="col-md-2"></div>
    
</div>

<div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" ng-controller="creaObjetivo">
            
            <div data-ng-repeat="mensaje in mensajes">
                {{ mensaje }}
            </div>    
            
            <form role="form" ng-submit="saveObjetivo()" method="POST" name="objetivo" novalidate>
                <div class="form-group">
                  <label for="descripcion">Descripción</label>
                  <input type="text" class="form-control" ng-model="nuevoObjetivo.descripcion" id="descripcion" placeholder="Descripcion">
                </div>
                <div class="form-group">
                  <label for="porcCompletado">% Completado</label>
                  <input type="text" class="form-control" ng-model="nuevoObjetivo.porcentaje" id="porcCompletado" placeholder="% Completado">
                </div>
                <button type="submit" class="btn btn-primary btn-sm">
                            Save
                </button>
               
            </form>      
        </div>
        <div class="col-md-2"></div>
</div>

