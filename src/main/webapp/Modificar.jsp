<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel = "stylesheet" type="text/css" href="style_extra.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<H2> Formulario para actualizar los datos</H2>

 <form action="Modificar.jsp">
                <div class="row mb-3">
                  <div class="col-sm-6">
                    <input class="form-control" type="text" name="nombreA" id="nombreA" placeholder="Nombre">
                  </div>
                  <div class="col-sm-6">
                    <input class="form-control" type="text" name="apellidoA" id="apellidoA" placeholder="Apellido">
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col">
                    <input class="form-control" type="text" name="mailA" id="mailA" placeholder="correo">
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-sm-6">
                    <label for="cantidad">Cantidad</label>
                    <input class="form-control" type="number" name="cantidadA" id="cantidadA" placeholder="cantidad">
                  </div>
                  <div class="col-sm-6">
                    <label for="categoria">Categoria</label>
                    <select class="form-select" name="categoriaA" id="categoriaA">
                      <option value="80">Estudiante</option>
                      <option value="50">Trainee</option>
                      <option value="15">Junior</option>
                    </select>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col">
                    <div class="alert alert-primary" role="alert">
                      Total a pagar: $ <span id="precioPagar">0</span>
                    </div>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="d-grid col-sm-6 mx-auto">
                    <button type="button" class="btn btn-success" id="borrar" onclick="resumen">
                      Borrar
                    </button>
                  </div>
                  <div class="d-grid col-sm-6 mx-auto">
                    <button type="submit" class="btn btn-success" id="resumen">
                      Actualizar
                    </button>
                  </div>
                </div>
              </form>

	<%	
		
		String nombre = request.getParameter("nombreA");
		String apellido = request.getParameter("apellidoA");
		String mail = request.getParameter("mailA");
		String cantidad = request.getParameter("cantidadA");
		String categoria = request.getParameter("categoriaA");
			
		//out.println(nombre + " " + apellido + " " + mail + " " + cantidad + " " + categoria);
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try{
			Connection cn = DriverManager.getConnection ("jdbc:mysql://localhost:3306/comprarticket","root","");
			Statement stm = cn.createStatement();
			ResultSet rsId = stm.executeQuery("SELECT MAX(id) FROM ticket");

			while(rsId.next()){

				int eid = rsId.getInt(1);

				String consulta = "UPDATE ticket SET nombre='"+ nombre +"' ,apellido='"+ apellido +"' ,mail='"+ mail +"' , cantidad='"+ cantidad +"' ,categoria='"+ categoria +"' WHERE id = "+ eid +" ";
				stm.executeUpdate(consulta);

			}
			%>
			<h2>Datos actualizados</h2>
			<% 
			
		}catch(Exception e) {
			
		}
	
	%>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>