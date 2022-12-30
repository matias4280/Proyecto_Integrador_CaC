<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pagina vacia</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String mail = request.getParameter("mail");
String cantidad = request.getParameter("cantidad");
String categoria = request.getParameter("categoria");


Class.forName("com.mysql.cj.jdbc.Driver");
try {
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/comprarticket","root","");
	System.out.println("Conexion exitosa");
	String insertStr="INSERT INTO  ticket(nombre,apellido,mail,cantidad,categoria) VALUES(?,?,?,?,?);";
	PreparedStatement myInsert = conexion.prepareStatement(insertStr);
	myInsert.setString(1, nombre); 
	myInsert.setString(2, apellido); 
	myInsert.setString(3, mail);
	myInsert.setString(4, cantidad);
	myInsert.setString(5, categoria);
	myInsert.executeUpdate();
	//stm.executeUpdate("INSERT INTO  VALUES ("+nombre+","+apellido+","+mail+","+cantidad+","+categoria+")");
	
	
} catch (Exception e) {
	System.out.print("Error de conexion");
	e.printStackTrace();
}

%>


<jsp:include page="ticket.jsp"></jsp:include>

</body>
</html>