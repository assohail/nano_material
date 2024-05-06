<%-- 
    Document   : userList
    Created on : 14 Jan 2024, 10:28:32 pm
    Author     : Muhamad Effendi bin Md Nor Kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Database</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <style>
            body{background-color: white;}
        </style>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark"
                 style="background-color: white">
                <div>
                    <ul class="navbar-nav">
                        <li>
                            <a href="<%=request.getContextPath()%>/list" 
                               style="font-size:20px"
                               class="nav-link"> User List </a> 
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/new"
                               style="font-size:20px"
                               class="nav-link"> Form </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
        
        <div class="row">
            <div class="container">
                <h3 class="text-center">User Database</h3>
                <hr>
                <div class="container text-left">                               
                    <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>   
                </div>
                
                <br>
                
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th style="text-align: center" colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${user}">

                            <tr>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.name}" /></td>
                                <td><c:out value="${user.email}" /></td>
                                <td><c:out value="${user.phoneNum}" /></td>
                                <td><c:out value="${user.username}" /></td>
                                <td><c:out value="${user.password}" /></td>
                                <td><c:out value="${user.role}" /></td>
                                
                                <td style="text-align: center"><a href="edit?id=<c:out value='${user.id}' />">Edit</a></td>
                                <td style="text-align: center"><a href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
		</table>
            </div>
        </div>
    </body>
</html>
