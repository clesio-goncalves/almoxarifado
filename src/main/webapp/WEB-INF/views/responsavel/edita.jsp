<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Responsavel</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Responsavel</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do responsavel no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${responsavel.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required
				value="${responsavel.nome}">
		</div>

		<!-- MATRICULA -->
		<div class="form-group">
			<label for="categoria" class="form-label mt-4">Matricula<span
				class="obrigatorio">*</span></label> <input type="number"
				class="form-control" name="matricula" MAXLENGTH="255" required
				value="${responsavel.matricula}">
		</div>

		<security:csrfInput />

		<!-- OBRIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/responsavel/lista" />"
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