<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Listar Items</title>
<c:import url="../componentes/css_data_table.jsp" />
<c:import url="../componentes/cabecalho.jsp" />

<div class="container">

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
						<th>Quantidade</th>
						<th>Ações</th>
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
							<td>
								<!-- Exibir --> <a
								href="<c:url value="/item/exibe?id=${item.id}"/>"
								class="btn btn-info btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Exibir"> <span
									class="glyphicon glyphicon-search"></span></a> <!-- Editar --> <a
								href="<c:url value="/item/edita?id=${item.id}" />"
								class="btn btn-warning btn-sm" data-tooltip="tooltip"
								data-placement="bottom" title="Editar"><span
									class="glyphicon glyphicon-pencil"></span> </a> <!-- Excluir -->
								<button type="button" class="btn btn-danger btn-sm"
									data-tooltip="tooltip" data-placement="bottom" title="Excluir"
									data-toggle="modal" data-target="#modal${item.id}">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
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
													Deseja realmente excluir o Item <br>ID (${item.id})
													-> ${item.nome}?
												</p>
											</div>
											<div class="modal-footer">
												<a href="<c:url value="/item/remove?id=${item.id}" />"
													class="btn btn-danger"><span
													class="glyphicon glyphicon-trash"></span> Excluir</a>
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">
													<span class="glyphicon glyphicon-log-out"></span> Fechar
												</button>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div align="center">
		<a href="<c:url value="/item/novo" />" class="btn btn-primary btn-lg"><span
			class="glyphicon glyphicon-plus"></span> Cadastrar</a>
	</div>
</div>

<c:import url="../componentes/js_data_table.jsp" />
<c:import url="../componentes/rodape.jsp" />