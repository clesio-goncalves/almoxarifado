<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Editar Solicitacao</title>

<c:import url="../componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<h1>Editar Solicitacao</h1>
		<p class="lead">Preencha o formulário abaixo para realizar a
			alteração do solicitacao no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="altera" method="POST">

		<!-- ID -->
		<input type="hidden" name="id" value="${solicitacao.id}" required>

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required value="${solicitacao.nome}">
		</div>
		
		<!-- Quantidade -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Quantidade<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="qnt"  MAXLENGTH="8" required value="${solicitacao.qnt}">
		</div>
		
		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<div>
			<a href="<c:url value="/solicitacao/lista" />"
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