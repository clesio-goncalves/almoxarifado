<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Item</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Item</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do item no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${item.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required value="${item.nome}">
		</div>

		<!-- CATEGORIA -->
		<div class="form-group">
			<label for="categoria" class="form-label mt-4">Categoria<span
				class="obrigatorio">*</span></label>
			<select class="form-select" id="categoria" name="categoria">
				<option selected>Consumo</option>
				<option>Permanente</option>
			</select>
		</div>
		
		<!-- MARCA -->
		<div class="form-group">
			<label for="marca" class="col-form-label">Marca<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="marca" MAXLENGTH="255" required value="${item.marca}">
		</div>
		
		<!-- Valor -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Valor<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="valor"  MAXLENGTH="8" required value="${item.valor}">
		</div>
		
		<!-- Quantidade -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Quantidade<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="qnt"  MAXLENGTH="8" required value="${item.qnt}">
		</div>
		
		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/item/lista" />"
				class="btn btn-secondary btn-lg"> <span
				class="glyphicon glyphicon-remove"></span> Cancelar
			</a>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-refresh"></span> Atualizar
			</button>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />