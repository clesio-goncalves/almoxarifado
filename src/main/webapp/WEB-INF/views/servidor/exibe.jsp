<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do servidor</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados do servidor</div>
		<!-- Table -->
		<div class="card-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="30%">ID</th>
						<td>${servidor.id}</td>
					</tr>
					<tr>
						<th>Nome</th>
						<td style="font-weight: bold; color: black;">${servidor.nome}</td>
					</tr>
					<tr>
						<th>Matricula</th>
						<td style="font-weight: bold; color: black;">${servidor.matricula}</td>
					</tr>
					<tr>
						<th>Telefone</th>
						<td style="font-weight: bold; color: black;">${servidor.telefone}</td>
					</tr>
					<tr>
						<th>Email</th>
						<td style="font-weight: bold; color: black;">${servidor.email}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/servidor/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/servidor/edita?id=${servidor.id}" />"
			class="btn btn-warning btn-lg"><span
			class="glyphicon glyphicon-edit"></span> Editar </a>
		<!-- Excluir -->
		<button type="button" class="btn btn-danger btn-lg"
			data-toggle="modal" data-target="#modal${servidor.id}">
			<span class="glyphicon glyphicon-trash"></span> Excluir
		</button>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal${servidor.id}">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Exclusão do servidor</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Deseja realmente excluir o servidor <br>ID (${servidor.id}) ->
						${servidor.nome}?
					</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value="/servidor/remove?id=${servidor.id}" />"
						class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>
						Excluir</a>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-log-out"></span> Fechar
					</button>
				</div>
			</div>
		</div>
	</div>
	<a class="btn btn-success" href="<c:url value="/servidor/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/tooltip.js" />"></script>
<c:import url="../componentes/rodape.jsp" />