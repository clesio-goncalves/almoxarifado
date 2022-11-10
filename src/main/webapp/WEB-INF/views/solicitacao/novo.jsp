<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Solicitacao</title>

<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1>Solicitação de itens do Almoxarifado</h1>
		<br>
	</div>
</div>
<div class="container">
	<form action="adiciona_itens" method="POST">
		<div class="card border-light mb-3">
			<div class="card-header">Listagem de Items</div>

			<!-- Table -->
			<div class="card-body">
				<table id="tabela_id"
					class="table table-striped table-bordered dt-responsive nowrap"
					style="width: 100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Categoria</th>
							<th>Marca</th>
							<th>Valor</th>
							<th>Estoque</th>
							<th>Quantidade</th>
						</tr>
					</thead>
					<tbody>

						<!-- percorre itens montando as linhas da tabela -->
						<c:forEach var="item" items="${itens}">
							<tr>
								<td>${item.id}</td>
								<td>${item.nome}</td>
								<td>${item.categoria}</td>
								<td>${item.marca}</td>
								<td>${item.valor}</td>
								<td>${item.qnt}</td>
								<td><input type="number" class="form-control"
									name="${item.id}_qnt"></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>

		<security:csrfInput />

		<div>
			<button type="reset" class="btn btn-secondary btn-lg">
				<span class="glyphicon glyphicon-trash"></span> Limpar
			</button>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-floppy-disk"></span> Solicitar
			</button>
		</div>

	</form>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />