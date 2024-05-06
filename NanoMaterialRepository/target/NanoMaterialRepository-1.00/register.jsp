<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .container {
                display: flex;
                align-items: flex-start;
                justify-content: center;
            }

            form {
                width: 400px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            form h2 {
                margin-bottom: 20px;
                color: #333;
                text-align: center;
            }

            form label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            form input[type="text"],
            form input[type="email"],
            form select,
            form input[type="password"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                outline: none;
                box-sizing: border-box;
            }

            form input[type="submit"] {
                width: calc(100% - 20px);
                padding: 10px;
                border: none;
                background-color: #3498db;
                color: #fff;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            form input[type="submit"]:hover {
                background-color: #2184c6;
            }

            .image-container {
                width: 400px;
                margin-left: 20px;
            }

            .image-container img {
                width: 100%;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
            <div class="container">
                <c:choose>
                    <c:when test="${user.id != null}">
                        <form action="<%=request.getContextPath()%>/update" method="post">
                        </c:when>
                        <c:when test="${user.id == null}">
                            <form action="<%=request.getContextPath()%>/create" method="post">
                            </c:when>
                        </c:choose>

                        <c:if test="${user != null}">
                            <input type="hidden" name="id" value="<c:out value='${user.id}' />" />
                        </c:if>

                            <h2>
                                <c:choose>
                                    <c:when test="${User != null}">
                                        Account Update
                                    </c:when>
                                    <c:when test="${User == null}">
                                        Account Registration
                                    </c:when>
                                </c:choose>
                            </h2>

                            <label> Name </label> 
                            <input  type="text"
                                    value="<c:out value='${user.name}' />"
                                    name="name" required>
                            <label> Email </label> 
                            <input  type="text"
                                    value="<c:out value='${user.email}' />" 
                                    name="email" required>

                            <label> Phone Number </label> 
                            <input  type="text"
                                    value="<c:out value='${user.phoneNum}' />" 
                                    name="phoneNum" required>

                            <label> Username </label> 
                            <input  type="text"
                                    value="<c:out value='${user.username}' />" 
                                    name="username" required>

                            <label> Password </label> 
                            <input  type="text"
                                    value="<c:out value='${user.password}' />" 
                                    name="password" required>
                            
                            <label for="role">Role:</label>
                            <select id="role" name="role">
                                <option value="Student">Student</option>
                                <option value="Academic staff">Academic Staff</option>
                            </select>
                        </fieldset>

                        <button type="submit" class="btn btn-success">Register</button>

                    </form>    
            </div>
            
         </body>
</html>