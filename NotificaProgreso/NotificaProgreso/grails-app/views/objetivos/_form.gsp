<%@ page import="notificaprogreso.Objetivos" %>



<div class="fieldcontain ${hasErrors(bean: objetivosInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="objetivos.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${objetivosInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: objetivosInstance, field: 'detalleObjetivo', 'error')} ">
	<label for="detalleObjetivo">
		<g:message code="objetivos.detalleObjetivo.label" default="Detalle Objetivo" />
		
	</label>
	
<ul class="one-to-many">
    <g:each in="${objetivosInstance?.detalleObjetivo}" var="d">
        <li><g:link controller="detallesObjetivo" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
    </g:each>
    <li class="add">
        <g:link controller="detallesObjetivo" action="create" params="['objetivos.id': objetivosInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'detallesObjetivo.label', default: 'DetallesObjetivo')])}</g:link>
    </li>
</ul>


</div>

