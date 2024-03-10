package notificaprogreso

class DetallesObjetivo {
    
    static belongsTo = [objectivo: Objetivos]

    Date fecha
    Float numHoras
    
    
    static constraints = {
        fecha unique: true, nullable: false
    }
    static mapping = {
        numHoras defaultValue: 0
    }
}
