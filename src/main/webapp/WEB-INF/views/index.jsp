<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Inicio</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/index.css" />">
<c:import url="componentes/cabecalho.jsp" />

<div class="jumbotron">
	<div class="container">
		<div class="imagem">
			<img src="<c:url value="https://almoxarifado.pas.ifsuldeminas.edu.br/assets/images/almoxarif.png" />"
				class="tamanho_imagem">
		</div>
		<hr class="my-4">
		<h1>Bem-vindo!</h1>
		<p class="lead">Setor de Almoxarifado e Patrimônio</p>
	</div>
</div>

<c:import url="componentes/rodape.jsp" />