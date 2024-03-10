package notificaprogreso

class Objetivos {
    
    String descripcion
    Float porcentaje
    
    static hasMany = [detalleObjetivo: DetallesObjetivo]
    
    static constraints = {
        descripcion nullable : true, unique : true
        detalleObjetivo nullable : true
        
    }
    
    String toString(){
        "${descripcion} - ${porcentaje}"
    }
}
