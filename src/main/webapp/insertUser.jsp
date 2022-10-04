<%@page import="com.alexandre.crudjspjava.bean.*, com.alexandre.crudjspjava.dao.*"%>
<jsp:useBean id="u" class="com.alexandre.crudjspjava.bean.UsuarioBean"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	int i = UsuarioDao.insertUsuario(u);
	try {
		response.sendRedirect("viewUser.jsp");
	} catch (Exception e) {
		out.println(e);
	}
%>