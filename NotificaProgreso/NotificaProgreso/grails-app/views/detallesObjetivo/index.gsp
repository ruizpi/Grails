
<%@ page import="notificaprogreso.DetallesObjetivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'detallesObjetivo.label', default: 'DetallesObjetivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-detallesObjetivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-detallesObjetivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="fecha" title="${message(code: 'detallesObjetivo.fecha.label', default: 'Fecha')}" />
					
						<g:sortableColumn property="numHoras" title="${message(code: 'detallesObjetivo.numHoras.label', default: 'Num Horas')}" />
					
						<th><g:message code="detallesObjetivo.objectivo.label" default="Objectivo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${detallesObjetivoInstanceList}" status="i" var="detallesObjetivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${detallesObjetivoInstance.id}">${fieldValue(bean: detallesObjetivoInstance, field: "fecha")}</g:link></td>
					
						<td>${fieldValue(bean: detallesObjetivoInstance, field: "numHoras")}</td>
					
						<td>${fieldValue(bean: detallesObjetivoInstance, field: "objectivo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${detallesObjetivoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
