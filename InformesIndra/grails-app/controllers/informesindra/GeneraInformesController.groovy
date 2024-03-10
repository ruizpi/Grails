package informesindra

import groovy.sql.Sql

class GeneraInformesController {
    
    def dataSource

    def index() { 
    
        Sql sql = new Sql(dataSource)
        sql.eachRow("select * from productos") { 
                row ->
                println "row: ${row}"
        }
        
        render "Hola Mundo"
    }
}
