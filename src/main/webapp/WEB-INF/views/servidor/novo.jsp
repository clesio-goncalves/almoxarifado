<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<title>Cadastrar Servidor</title>

<c:import url="../componentes/cabecalho.jsp" />
<div class="jumbotron">
	<div class="container">
		<h1>Cadastrar Servidor</h1>
		<p class="lead">Preencha o formulário abaixo para realizar o
			cadastro do servidor no sistema.</p>
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

		<!-- MATRICULA -->
		<div class="form-group">
			<label for="categoria" class="form-label mt-4">Matricula<span
				class="obrigatorio">*</span></label> <input type="number" class="form-control"
				name="matricula" MAXLENGTH="255" required>
		</div>
		
		<!-- TELEFONE -->
		<div class="form-group">
			<label for="marca" class="col-form-label">Telefone<span
				class="obrigatorio">*</span></label> <input type="tel" class="form-control"
				name="telefone" MAXLENGTH="11" required>
		</div>
		
		<!-- EMAIL -->
		<div class="form-group">
			<label for="nome" class="col-form-label">Email<span
				class="obrigatorio">*</span></label> <input type="email" class="form-control"
				name="email"  MAXLENGTH="255" required>
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