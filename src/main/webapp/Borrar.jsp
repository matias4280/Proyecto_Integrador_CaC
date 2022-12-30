<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		try{
			Connection cn = DriverManager.getConnection ("jdbc:mysql://localhost:3306/comprarticket","root","");
			
			Statement stm = cn.createStatement();
			
			ResultSet rsId = stm.executeQuery("SELECT MAX(id) FROM ticket");

			while(rsId.next()){

				int eid = rsId.getInt(1); 
				int valor = 0;
				String consulta = "UPDATE `ticket` SET alta= "+ valor +" WHERE id = "+ eid +" ";
				stm.executeUpdate(consulta);

			}
			
			
		}catch(Exception e) {
			out.print("Error al cargar la BD DELETE");
		}

	%>

<jsp:include page="comprar_tickets.html"></jsp:include>



</body>
</html>