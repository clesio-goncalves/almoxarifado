<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Exibe os dados do item</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">
	<div class="card border-light mb-3">
		<div class="card-header">Exibe os dados do item</div>
		<!-- Table -->
		<div class="card-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered dt-responsive nowrap">
					<tr>
						<th width="30%">ID</th>
						<td>${item.id}</td>
					</tr>
					<tr>
						<th>Nome</th>
						<td style="font-weight: bold; color: black;">${item.nome}</td>
					</tr>
					<tr>
						<th>Categoria</th>
						<td style="font-weight: bold; color: black;">${item.categoria}</td>
					</tr>
					<tr>
						<th>Marca</th>
						<td style="font-weight: bold; color: black;">${item.marca}</td>
					</tr>
					<tr>
						<th>Valor</th>
						<td style="font-weight: bold; color: black;">${item.valor}</td>
					</tr>
					<tr>
						<th>Quantidade</th>
						<td style="font-weight: bold; color: black;">${item.qnt}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div align="center">
		<!-- Cadastrar -->
		<a href="<c:url value="/item/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
		<!-- Editar -->
		<a href="<c:url value="/item/edita?id=${item.id}" />"
			class="btn btn-warning btn-lg"><span
			class="glyphicon glyphicon-edit"></span> Editar </a>
		<!-- Excluir -->
		<button type="button" class="btn btn-danger btn-lg"
			data-toggle="modal" data-target="#modal${item.id}">
			<span class="glyphicon glyphicon-trash"></span> Excluir
		</button>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal${item.id}">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Exclusão do item</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Deseja realmente excluir o item <br>ID (${item.id}) ->
						${item.nome}?
					</p>
				</div>
				<div class="modal-footer">
					<a href="<c:url value="/item/remove?id=${item.id}" />"
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
	<a class="btn btn-success" href="<c:url value="/item/lista" />"><span
		class="glyphicon glyphicon-chevron-left"></span> Voltar</a>
</div>
<script type="text/javascript"
	src="<c:url value="/resources/js/tooltip.js" />"></script>
<c:import url="../componentes/rodape.jsp" />