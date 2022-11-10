<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Solicitacoes</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Solicitacões</div>

		<!-- Table -->
		<div class="card-body">
			<table id="tabela_id"
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Data</th>
						<th>Horário</th>
						<th>Servidor</th>
						<th>Status</th>
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<!-- percorre itens montando as linhas da tabela -->
					<c:forEach var="solicitacao" items="${solicitacoes}">
						<tr>
							<td>${solicitacao.id}</td>
							<td>${solicitacao.data}</td>
							<td>${solicitacao.horario}</td>
							<td>${solicitacao.servidor.nome}</td>
							<td>${solicitacao.status}</td>
							<td>
								<!-- Exibir --> <a
								href="<c:url value="/solicitacao/exibe?id=${solicitacao.id}"/>"
								class="btn btn-info btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Exibir"> <span
									class="glyphicon glyphicon-search"></span></a> <c:if
									test="${solicitacao.status eq 'Solicitado'}">
									<!-- Aprovar -->
									<a
										href="<c:url value="/solicitacao/aprovar?id=${solicitacao.id}" />"
										class="btn btn-success btn-sm" data-tooltip="tooltip"
										data-placement="bottom" title="Aprovar"><span
										class="glyphicon glyphicon-ok"></span> </a>
									<!-- Rejeitar -->
									<a
										href="<c:url value="/solicitacao/rejeitar?id=${solicitacao.id}" />"
										class="btn btn-danger btn-sm" data-tooltip="tooltip"
										data-placement="bottom" title="Rejeitar"><span
										class="glyphicon glyphicon-remove"></span> </a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div align="center">
		<a href="<c:url value="/solicitacao/novo" />"
			class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
	</div>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />