<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>  

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel = "stylesheet" type="text/css" href="style_extra.css">
    
    <title>Compra de tickets</title>
</head>
    <body>
       
        <header>
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark" style="background-color: #454647">
                <div class="container">
                  <a class="navbar-brand" href="index.html">
                    Conf Bs As
                  </a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse flex-row-reverse" id="navbarNav">
                    <ul class="navbar-nav">
                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">La Conferencia</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Los Oradores</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">El Lugar y La Fecha</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Conviértete en Orador</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link " style="color:Yellow ; font-weight: 700;" href="index.html">Volver al inicio</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
        </header>
        
        <main>

            <div style="text-align: center">
            <br>
            <br>
            <br>
            <br>
                <span>COMPRA REALIZADA</span>
                <h1>DATOS DE LA COMPRA</h1>
              </div>
            <div class="container" style="margin-bottom: 150px">
              <form action="">
                <div class="row mb-3">
                  <div class="col-sm-6">
                    <input class="form-control" type="text" name="nombre" id="nombre" value=<%= request.getParameter("nombre") %>>
                  </div>
                  <div class="col-sm-6">
                    <input class="form-control" type="text" name="apellido" id="apellido" value=<%= request.getParameter("apellido") %>>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col">
                    <input class="form-control" type="text" name="mail" id="mail" value=<%= request.getParameter("mail") %>>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-sm-6">
                    <label for="cantidad">Cantidad</label>
                    <input class="form-control" type="text" name="cantidad" id="cantidad"value=<%= request.getParameter("cantidad") %>>
                  </div>
                  <div class="col-sm-6">
                    <label for="categoria">Categoria</label>
                    <input class="form-control" type="text" name="categoria" id="categoria" value=<%= request.getParameter("categoria") %>>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col">
                    <div class="alert alert-primary" role="alert">
                    <%
                    String categoria = request.getParameter("categoria");
                   	String cantidad = request.getParameter("cantidad");
                    double precio = 200;
                    double total = precio * Integer.parseInt(cantidad);
                    double descuento = (total* Integer.parseInt(categoria))/100;
                    double montoTotal = total - descuento;
                   %>
                      Total_pagado: $ <span id="precioPagar"><%= montoTotal %></span>
          
                    </div>
                 
                </div>
                </div>
             <div class="row mb-3">
                  <div class="d-grid col-sm-6 mx-auto">
                    <button type="button" class="btn btn-success" id="borrar" onclick="location.href='Borrar.jsp'">
                      Borrar
                    </button>
                  </div>
                  <div class="d-grid col-sm-6 mx-auto">
                    <button type="button" class="btn btn-success" id="resumen" onclick="location.href='Modificar.jsp'">
                      Modificar
                    </button>
                  </div>
                </div>
              </form>
            </div>
            


        </main>

        <footer>
            <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #454647">
              <div class="container">
                <ul class="navbar-nav" style="justify-content: space-between; width: 100%">
                  <li class="nav-item">
                    <a class="nav-link" href="#">Preguntas Frecuentes</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Contáctanos</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Prensa</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Conferencias</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Términos y Condiciones</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Privacidad</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Estudiantes</a>
                  </li>
                </ul>
              </div>
            </nav>
          </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>