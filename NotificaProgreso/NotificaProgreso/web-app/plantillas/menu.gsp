            <div class="container"  ng-controller="MenuController">
                <div class="navbar navbar-default">
                   <div class="navbar-header">
                    <a class="navbar-brand" href="#">Proyecto HS</a>
                  </div>
                  <ul class="nav navbar-nav">
                    <li ng-class="{ active: isActive('')}"><a href="/NotificaProgreso/">Principal</a></li>
                    <li ng-class="{ active: isActive('/objetivos/listaObjetivos')}"><a href="#/objetivos/listaObjetivos">Tareas</a></li>
                    <li ng-class="{ active: isActive('/desglosetareas')}"><a href="/desglosatareas">Desglose de Tareas</a></li>
                    <li class="divider-vertical"></li>
                    <li><a href="#">More</a></li>
                    <li><a href="#">Options</a></li>
                  </ul>
                </div>
            </div>
            