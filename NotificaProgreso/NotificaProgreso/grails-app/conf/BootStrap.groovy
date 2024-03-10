import grails.converters.JSON
import notificaprogreso.Objetivos
import notificaprogreso.DetallesObjetivo

class BootStrap {

    def init = { servletContext ->
        
        //Register Review domain for JSON rendering
        JSON.registerObjectMarshaller(Objetivos) {
            def output = [:]
            output['id'] = it.id
            output['descripcion'] = it.descripcion
            output['porcentaje'] = it.porcentaje
            return output;
        }
    
        JSON.registerObjectMarshaller(DetallesObjetivo) {
            def output = [:]
            output['id'] = it.id
            output['fecha'] = dateFormatter.format(it.fecha)
            output['numHoras'] = it.numHoras
            output['objetivoId'] = [it.objetivo.id]
            return output;
        }
        
    }
    def destroy = {
    }
}
