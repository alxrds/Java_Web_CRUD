<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.alexandre.crudjspjava.bean.*, com.alexandre.crudjspjava.dao.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	List<UsuarioBean> list = UsuarioDao.getAllUsuarios();
	request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualização de Usuários</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<h1>Listagem de Usuários</h1>
		
		<table class="table">
			<thead>
				<tr>
					<th># ID</th>
					<th>Nome</th>
					<th>Sobrenome</th>
					<th>E-mail</th>
					<th>Sexo</th>
					<th>País</th>
					<th>Editar</th>
					<th>Excluir</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="usuario">
					<tr>
						<td># ${usuario.getId()}</td>
						<td>${usuario.getNome()}</td>
						<td>${usuario.getSobrenome()}</td>
						<td>${usuario.getEmail()}</td>
						<td>${usuario.getSexo()}</td>
						<td>${usuario.getPais()}</td>
						<td><a href="editForm.jsp?id=${usuario.getId()}" class="btn btn-primary"><i class="bi bi-pencil-square"></i></a></td>
						<td><a href="deleteUser.jsp?id=${usuario.getId()}" class="btn btn-danger"><i class="bi bi-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</br>
		<a href="insertForm.jsp" class="btn btn-success">Adicionar novo usuário <i class="bi bi-plus-lg"></i></a>
	</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>