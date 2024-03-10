<%@ page import="notificaprogreso.DetallesObjetivo" %>



<div class="fieldcontain ${hasErrors(bean: detallesObjetivoInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="detallesObjetivo.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${detallesObjetivoInstance?.fecha}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: detallesObjetivoInstance, field: 'numHoras', 'error')} required">
	<label for="numHoras">
		<g:message code="detallesObjetivo.numHoras.label" default="Num Horas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numHoras" value="${fieldValue(bean: detallesObjetivoInstance, field: 'numHoras')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: detallesObjetivoInstance, field: 'objectivo', 'error')} required">
	<label for="objectivo">
		<g:message code="detallesObjetivo.objectivo.label" default="Objectivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objectivo" name="objectivo.id" from="${notificaprogreso.Objetivos.list()}" optionKey="id" required="" value="${detallesObjetivoInstance?.objectivo?.id}" class="many-to-one"/>

</div>

