<%-- 
    Document   : login
    Created on : 13 Jan 2024, 2:59:26 am
    Author     : Muhamad Effendi bin Md Nor Kamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
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
            <form id="loginForm" action="<%=request.getContextPath()%>/login" method="post">
                <h2>Login</h2>

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="student">Student</option>
                    <option value="staff">Academic Staff</option>

                    <input type="submit" value="Login">
                    </form>
                <img src="systemlogo.jpg" alt="Image">

                    
                    </div>
                    </body>
                    </html>
