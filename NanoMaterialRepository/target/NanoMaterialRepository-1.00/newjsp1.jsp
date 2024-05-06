<%-- 
    Document   : register
    Created on : 13 Jan 2024, 12:52:59 am
    Author     : MSI GF63
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
            <form id="registrationForm" action="/update">
                <h2>Account Registration</h2>

                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>



                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Register">
            </form>

            <div class="image-container">
                <img src="systemlogo.jpg" alt="Registration Image" width="400" height="300"> 
            </div>
        </div>
    </body>
</html>
