package notificaprogreso



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DetallesObjetivoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DetallesObjetivo.list(params), model:[detallesObjetivoInstanceCount: DetallesObjetivo.count()]
    }

    def show(DetallesObjetivo detallesObjetivoInstance) {
        respond detallesObjetivoInstance
    }

    def create() {
        respond new DetallesObjetivo(params)
    }

    @Transactional
    def save(DetallesObjetivo detallesObjetivoInstance) {
        if (detallesObjetivoInstance == null) {
            notFound()
            return
        }

        if (detallesObjetivoInstance.hasErrors()) {
            respond detallesObjetivoInstance.errors, view:'create'
            return
        }

        detallesObjetivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'detallesObjetivo.label', default: 'DetallesObjetivo'), detallesObjetivoInstance.id])
                redirect detallesObjetivoInstance
            }
            '*' { respond detallesObjetivoInstance, [status: CREATED] }
        }
    }

    def edit(DetallesObjetivo detallesObjetivoInstance) {
        respond detallesObjetivoInstance
    }

    @Transactional
    def update(DetallesObjetivo detallesObjetivoInstance) {
        if (detallesObjetivoInstance == null) {
            notFound()
            return
        }

        if (detallesObjetivoInstance.hasErrors()) {
            respond detallesObjetivoInstance.errors, view:'edit'
            return
        }

        detallesObjetivoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DetallesObjetivo.label', default: 'DetallesObjetivo'), detallesObjetivoInstance.id])
                redirect detallesObjetivoInstance
            }
            '*'{ respond detallesObjetivoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DetallesObjetivo detallesObjetivoInstance) {

        if (detallesObjetivoInstance == null) {
            notFound()
            return
        }

        detallesObjetivoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DetallesObjetivo.label', default: 'DetallesObjetivo'), detallesObjetivoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'detallesObjetivo.label', default: 'DetallesObjetivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
