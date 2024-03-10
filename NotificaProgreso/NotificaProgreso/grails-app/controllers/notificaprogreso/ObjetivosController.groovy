package notificaprogreso



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import groovy.json.JsonBuilder




@Transactional(readOnly = false)
class ObjetivosController {

    def messageSource 
    
    static allowedMethods = [listaObjetivos: "GET", save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Objetivos.list(params), model:[objetivosInstanceCount: Objetivos.count()]
    }

    def show(Objetivos objetivosInstance) {
        respond objetivosInstance
    }

    def create() {
        respond new Objetivos(params)
    }

    @Transactional
    def save(Objetivos objetivosInstance) {
        if (objetivosInstance == null) {
            notFound()
            return
        }

        if (objetivosInstance.hasErrors()) {
            respond objetivosInstance.errors, view:'create'
            return
        }

        objetivosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'objetivos.label', default: 'Objetivos'), objetivosInstance.id])
                redirect objetivosInstance
            }
            '*' { respond objetivosInstance, [status: CREATED] }
        }
    }

    def edit(Objetivos objetivosInstance) {
        respond objetivosInstance
    }

    @Transactional
    def update(Objetivos objetivosInstance) {
        if (objetivosInstance == null) {
            notFound()
            return
        }

        if (objetivosInstance.hasErrors()) {
            respond objetivosInstance.errors, view:'edit'
            return
        }

        objetivosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Objetivos.label', default: 'Objetivos'), objetivosInstance.id])
                redirect objetivosInstance
            }
            '*'{ respond objetivosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Objetivos objetivosInstance) {

        if (objetivosInstance == null) {
            notFound()
            return
        }

        objetivosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Objetivos.label', default: 'Objetivos'), objetivosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivos.label', default: 'Objetivos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    
    def listaObjetivos()
    {
        def listaObjetivos = Objetivos.list()
        render listaObjetivos as JSON
    }
    
    def guardaObjetivo(){
        def objetivo = null;
        def parametrosJson = request.JSON
     
        def mensaje;
        
        if(parametrosJson.id){
            objetivo = Objetivos.get(parametrosJson.id as long)
            objetivo.properties = parametrosJson      
        }
      
        if(!objetivo){
            objetivo = new Objetivos(parametrosJson)
        }
        
        //bindData(objetivo,parametrosJson)
       

        def respuesta = [:]
 
        if (objetivo.hasErrors()) {            
            def errors = objetivo.errors.allErrors.collect{
                [   'message': messageSource.getMessage(it, null) , 
                    'field': it.getField(), 
                    'badValue': it.getRejectedValue()
                ]
            }

            render(status:400, contentType: "application/json"){
                [message:'Fallo al guardar', 'errors': errors]
            }

        }
        
        def errors = []
        
        objetivo.save()
        render(status:200, contentType: "application/json"){
                [message:'Registro guardado', 'errors': errors]
        }

    }
    
    def editaObjetivo(Long id)
    {     
        def objetivo = Objetivos.get(id)
        render objetivo as JSON     
    }
  /*  
    private void renderErrors(cmd) {
            renderErrors([cmd])
    }

      private void renderErrors(List commands) {
        render(contentType: "text/json") {
            status = "fail"
            serverErrors = array {
                commands.each { cmd ->
                    for (int i = 0; i < cmd.errors.allErrors.size(); i++) {
                        def formattedMessage = g.message(code: cmd.errors.getFieldError(cmd.errors.allErrors.get(i).field).code)
                        if (!cmd.errors.getFieldError(cmd.errors.allErrors.get(i).field).code?.contains("com.company")) {
                            formattedMessage = g.message(code: cmd.errors.objectName + "." + cmd.errors.allErrors.get(i).field + "." + cmd.errors.getFieldError(cmd.errors.allErrors.get(i).field).code)
                       
                        }
                        serverError(field: cmd.errors.allErrors.get(i).field, message: formattedMessage)
                    }
                }
            }
            
            
        }
    }*/
    
}
