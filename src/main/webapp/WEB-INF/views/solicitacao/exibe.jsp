<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados da solicitacão</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados da solicitacao</div>
		<!-- Table -->
		<div class="card-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="30%">ID</th>
						<td>${solicitacao.id}</td>
					</tr>
					<tr>
						<th>Data</th>
						<td style="font-weight: bold; color: black;">${solicitacao.data}</td>
					</tr>
					<tr>
						<th>Horário</th>
						<td>${solicitacao.horario}</td>
					</tr>
					<tr>
						<th>Status</th>
						<td style="font-weight: bold; color: black;">${solicitacao.status}</td>
					</tr>
					<tr>
						<th>Servidor</th>
						<td>${solicitacao.servidor.nome}</td>
					</tr>
					<tr>
						<th>Responsável</th>
						<td>${solicitacao.responsavel.nome}</td>
					</tr>
				</table>
			</div>
			<legend>ITENS SOLICITADOS</legend>
			<div class="table-responsive">
				<table class="table table-hover table-bordered dt-responsive nowrap"
					style="width: 100%; margin-top: 10px;">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Marca</th>
							<th>Quantidade</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item_solicitacao" items="${itens_solicitacao}">
							<tr>
								<td>${item_solicitacao.item.id}</td>
								<td>${item_solicitacao.item.nome}</td>
								<td>${item_solicitacao.item.marca}</td>
								<td>${item_solicitacao.qnt}</td>
								<td>
									<!-- Exibir --> <a
									href="<c:url value="/item/exibe?id=${item_solicitacao.item.id}"/>"
									class="btn btn-info btn-sm" data-tooltip="tooltip"
									data-placement="bottom" title="Exibir"> <span
										class="glyphicon glyphicon-search"></span></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tr style="background-color: #fff; font-weight: bold;">
						<td colspan="5" align="center">Total de Itens:
							${fn:length(itens_solicitacao)}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<c:if test="${solicitacao.status eq 'Solicitado'}">
		<div align="center">
			<!-- Aprovar -->
			<a href="<c:url value="/solicitacao/aprovar?id=${solicitacao.id}" />"
				class="btn btn-success btn-lg"><span
				class="glyphicon glyphicon-ok"></span> Aprovar </a>
			<!-- Rejeitar -->
			<a
				href="<c:url value="/solicitacao/rejeitar?id=${solicitacao.id}" />"
				class="btn btn-danger btn-lg"><span
				class="glyphicon glyphicon-remove"></span> Rejeitar </a>
		</div>
	</c:if>
	<a class="btn btn-success" href="<c:url value="/solicitacao/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/tooltip.js" />"></script>
<c:import url="../componentes/rodape.jsp" />