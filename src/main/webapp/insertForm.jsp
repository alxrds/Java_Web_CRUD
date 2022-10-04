<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="com.alexandre.crudjspjava.bean.*, com.alexandre.crudjspjava.dao.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição de Usuário</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<h1>Inserir Usuário</h1>
	 
	 <form action="insertUser.jsp" method="post">
	 	<div class="row mb-3">
	 		<label>Nome: </label>
	 		<div class="col-sm-10">
	 			<input type="text" name="nome" class="form-control" value="" required>
	 		</div>
	 	</div>
	 	<div class="row mb-3">
		 	<label>Sobrenome:</label>
		 	<div class="col-sm-10">
		 		<input type="text" name="sobrenome" class="form-control" value="" required>
			</div>
		</div>
		<div class="row mb-3">
		 	<label>E-mail</label>
		 	<div class="col-sm-10">
		 		<input type="email" name="email" class="form-control" value="" required>
			</div>
		</div>
		<fieldset class="row mb-3">
	 		<label>Sexo</label>
	 		<div class="form-check">
	 			<input type="radio" name="sexo" value="M" required> Masculino
	 		</div>
	 		<div class="form-check">
	 			<input type="radio" name="sexo" value="F" required> Feminino
	 		</div>
	 	</fieldset>
			<div class="row mb-3">
		 		<label>País</label>
		 		<div class="col-sm-10">
		 			<input type="text" name="pais" class="form-control" value="" required>
		 		</div>
		 	</div>
		 	<button type="submit" class="btn btn-success">Salvar</button>
		 	<a href="viewUser.jsp" class="btn btn-danger">Cancelar</a>
	 	</form>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>