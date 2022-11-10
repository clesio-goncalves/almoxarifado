<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Confirmação de solicitações</title>
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

	<div class="card border-light mb-3">
		<div class="card-header">Listagem de Itens</div>

		<!-- Table -->
		<div class="card-body">
			<table
				class="table table-striped table-bordered dt-responsive nowrap"
				style="width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Item</th>
						<th>Marca</th>
						<th>Quantidade</th>
					</tr>
				</thead>
				<tbody>
					<!-- percorre itens montando as linhas da tabela -->
					<c:forEach var="item" items="${itens}">
						<tr>
							<td>${item.id_item}</td>
							<td>${item.nome}</td>
							<td>${item.marca}</td>
							<td>${item.qnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div align="center">
		<a href="<c:url value="/solicitacao/novo" />"
			class="btn btn-secondary btn-lg"><span
			class="glyphicon glyphicon-trash"></span> Cancelar</a> <a
			href="<c:url value="/solicitacao/adiciona" />"
			class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-floppy-disk"></span> Confirmar</a>

	</div>
</div>

<c:import url="../componentes/rodape.jsp" />