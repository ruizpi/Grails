
<%@ page import="notificaprogreso.DetallesObjetivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detallesObjetivo.label', default: 'DetallesObjetivo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-detallesObjetivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-detallesObjetivo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list detallesObjetivo">
			
				<g:if test="${detallesObjetivoInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="detallesObjetivo.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${detallesObjetivoInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${detallesObjetivoInstance?.numHoras}">
				<li class="fieldcontain">
					<span id="numHoras-label" class="property-label"><g:message code="detallesObjetivo.numHoras.label" default="Num Horas" /></span>
					
						<span class="property-value" aria-labelledby="numHoras-label"><g:fieldValue bean="${detallesObjetivoInstance}" field="numHoras"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${detallesObjetivoInstance?.objectivo}">
				<li class="fieldcontain">
					<span id="objectivo-label" class="property-label"><g:message code="detallesObjetivo.objectivo.label" default="Objectivo" /></span>
					
						<span class="property-value" aria-labelledby="objectivo-label"><g:link controller="objetivos" action="show" id="${detallesObjetivoInstance?.objectivo?.id}">${detallesObjetivoInstance?.objectivo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:detallesObjetivoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${detallesObjetivoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
