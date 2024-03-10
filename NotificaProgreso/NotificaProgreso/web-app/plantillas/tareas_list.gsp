<div class="container">   
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" >
            <h1>Lista de Objetivos</h1>
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        
        <div class="col-md-8" ng-controller="ListaObjetivos">
            
            <div data-ng-repeat="mensaje in mensajes">
                {{ mensaje }}
            </div>   
            
            <table class="table table-hover">
                    <thead>
                        <tr><td>id</td><td>Descripción</td><td>% Completado</td><td colspan="2">Opciones</td></tr> 
                    </thead>
                    <tbody>
                        
                        <tr ng-show="listaObjetivos.length" ng-repeat="registro in listaObjetivos">
                            <td>{{registro.id}}</td>
                            <td>{{registro.descripcion}}</td>
                            <td>{{registro.porcentaje}}</td>
                            <td><a href="#/objetivos/editaObjetivo/{{registro.id}}"> <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"> </span></button></a></td>
                            <td><a href="#/objetivos/borraObjetivo/{{registro.id}}"> <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"> </span></button></a></td>
                        </tr>
                        <tr ng-show="!listaObjetivos.length">
                            <td colspan="3" style="text-align:center;padding-top:50px">No hay registros que mostrar</td>
                        </tr>
                    </tbody>
            </table>   
        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8"><hr></div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <a href="#/objetivos/creaObjetivos"> <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-plus"> </span> Nueva Tarea</button></a>     
        </div>
        <div class="col-md-2"></div>
    </div>
    
</div>