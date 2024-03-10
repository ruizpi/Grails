/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// create our angular app and inject ui.bootstrap
var miAplicacion = angular.module('app', ['ngRoute','ui.bootstrap'])

miAplicacion.config([ '$routeProvider',function($routeProvider){
                
                $routeProvider.when('/objetivos/listaObjetivos',{
                    templateUrl : 'plantillas/tareas_list.gsp',
                    controller : 'ListaObjetivos'
                }).when('/objetivos/creaObjetivos',{
                    templateUrl : 'plantillas/tareas_crea.gsp',
                    controller : 'creaObjetivo'
                }).when('/objetivos/editaObjetivo/:objetivoId',{
                    templateUrl : 'plantillas/tareas_edita.gsp',
                    controller : 'editaObjetivo'
                }).when('/animales/ave2',{
                    templateUrl : 'plantillas/ave2.html'
                }).when('/animales/ave3',{
                    templateUrl : 'plantillas/ave3.html'
                }).otherwise({
                    redirectTo:'',
                    templateUrl: 'plantillas/contenidoHome.gsp'
                })
                
            } ])

miAplicacion.controller('MenuController',['$scope','$location',function($scope, $location){
        $scope.isActive = function (viewLocation) { 
        return viewLocation === $location.path();
    }; 
}])

miAplicacion.controller('ListaObjetivos',['$scope','$http',function($scope, $http){
         
         var load = function() {
            console.log('call load()...');
            $http.get('objetivos/listaObjetivos')
                    .success(function(data, status, headers, config) {
                        $scope.listaObjetivos = data
            });
            
         } 
         load();
         
         
 }])
 
 miAplicacion.controller("creaObjetivo",['$scope', '$http', '$location', function($scope, $http, $location){
        $scope.nuevoObjetivo = {};
        $scope.msg = {};
        $scope.saveObjetivo = function()
        {
           
           $http.post('objetivos/guardaObjetivo', $scope.nuevoObjetivo)
                   .success(function(data, status, headers, config) {
                        $location.path('/objetivos/listaObjetivos');
                        // window.location.reload();
                        var obj1 = data;
                        
                        var mensajes = []
                        
                        mensajes.push (obj1.message)
                        
                        
                        $scope.mensajes = mensajes
                        
                    }).error(function(data, status, headers, config) {

                       
                        var obj1 = data;
                        
                        var mensajes = []
                        
                        mensajes.push (obj1.message)
                        var errores = obj1.errors
                        
                        for(i=0; i< errores.length; i++) {
                            mensajes.push(errores[i].message + ' '+ errores[i].field + ' - ' + errores[i].badValue);
                        }
                        
                        $scope.mensajes = mensajes
                        	
                    
                    });
        };
    }

 ]);
 
 miAplicacion.controller("editaObjetivo",['$scope', '$http', '$location','$routeParams', '$route', function($scope, $http, $location, $routeParams, $route){
       
        
       
        var objetivoId = $routeParams.objetivoId
           
        $http.get('/NotificaProgreso/objetivos/editaObjetivo/'+objetivoId)
                .success(function(data, status, headers, config) {
                        $scope.objetivo = data

                
                    })
                   
        $scope.actualizaObjetivo = function()
        {
           
            $http.post('objetivos/guardaObjetivo', $scope.objetivo)
                   .success(function(data, status, headers, config) {
                        $location.path('/objetivos/listaObjetivos');
                        //window.location.reload();	
                        var obj1 = data;
                        
                        var mensajes = []
                        
                        mensajes.push (obj1.message)                       
                        
                        $scope.mensajes = mensajes
                        // CON ESTO LO QUE SE HACE ES REFRESCAR LA VISTA
                        $route.reload()
                        
                    }).error(function(data, status, headers, config) {

                       
                        var obj1 = data;
                        
                        var mensajes = []
                        
                        mensajes.push (obj1.message)
                        var errores = obj1.errors
                        
                        for(i=0; i< errores.length; i++) {
                            mensajes.push(errores[i].message + ' '+ errores[i].field + ' - ' + errores[i].badValue);
                        }
                        
                        $scope.mensajes = mensajes
                        	
                    
                    });
        };
        

    }
    
    
]);
