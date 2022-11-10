<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Item</title>

<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1>Cadastrar Item</h1>
		<p class="lead">Preencha o formulário abaixo para realizar o
			cadastro do item no sistema.</p>
	</div>
</div>
<div class="container">
	<form action="adiciona" method="POST">

		<!-- NOME -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Nome<span
				class="obrigatorio">*</span></label> <input type="text" class="form-control"
				name="nome" autofocus MAXLENGTH="255" required>
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
				name="marca" MAXLENGTH="255" required>
		</div>
		
		<!-- Valor -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Valor<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="valor"  MAXLENGTH="8" required>
		</div>
		
		<!-- Quantidade -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Quantidade<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="qnt"  MAXLENGTH="8" required>
		</div>

		<security:csrfInput />

		<!-- OBTIGATÓRIO -->
		<label for="obrigatorio">(*) Campo obrigatório</label>
		<br>
		<div>
			<button type="reset" class="btn btn-secondary btn-lg">
				<span class="glyphicon glyphicon-trash"></span> Limpar
			</button>
			<button type="submit" class="btn btn-primary btn-lg">
				<span class="glyphicon glyphicon-floppy-disk"></span> Salvar
			</button>
		</div>
	</form>
</div>

<c:import url="../componentes/rodape.jsp" />