<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Servidor</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Servidor</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do servidor no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${servidor.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required value="${servidor.nome}">
		</div>

		<!-- MATRICULA -->
		<div class="form-group">
			<label for="categoria" class="form-label mt-4">Matricula<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="matricula"  MAXLENGTH="255" required value="${servidor.matricula}">
		</div>
		
		<!-- TELEFONE -->
		<div class="form-group">
			<label for="marca" class="col-form-label">Telefone<span
				class="obrigatorio">*</span></label> <input type="tel" class="form-control"
				name="telefone" MAXLENGTH="11" required value="${servidor.telefone}">
		</div>
		
		<!-- EMAIL -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Email<span
				class="obrigatorio">*</span></label> <input type="email" class="form-control"
				name="email"  MAXLENGTH="255" required value="${servidor.email}">
		</div>
		
		<security:csrfInput />

		<!-- OBRIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/servidor/lista" />"
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