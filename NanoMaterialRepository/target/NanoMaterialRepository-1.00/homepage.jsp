<%-- 
    Document   : homepage
    Created on : 15 Jan 2024, 1:29:21?am
    Author     : Muhamad Effendi bin Md Nor Kamal
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Professional Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    #dashboard-container {
      display: flex;
      height: 100vh;
    }

    #sidebar {
      width: 220px;
      background: linear-gradient(to bottom, #2c3e50, #34495e);
      color: #ecf0f1;
      padding: 20px;
      box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.1);
    }

    #sidebar a {
      display: block;
      color: #ecf0f1;
      text-decoration: none;
      margin-bottom: 15px;
      transition: color 0.3s;
    }

    #sidebar a:hover {
      color: #3498db;
    }

    #content {
      flex-grow: 1;
      padding: 20px;
    }

    /* Styling for buttons */
    .dashboard-btn {
      display: block;
      width: 100%;
      padding: 12px;
      background-color: #3498db;
      color: #ecf0f1;
      text-align: center;
      text-decoration: none;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s;
      border-radius: 5px;
    }

    .dashboard-btn:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<div id="dashboard-container">
  <div id="sidebar">
    <a href="#" class="dashboard-btn">Menu</a>
    <a href="#" class="dashboard-btn">Submit Experiment Data</a>
    <a href="#" class="dashboard-btn">View Experiment</a>
    <a href="#" class="dashboard-btn">Account</a>
    <a href="#" class="dashboard-btn">Logout</a>
  </div>

  <div id="content">
    <!-- Your main content goes here -->
    <h1>Welcome to the Nano Material Repository System</h1>
  </div>
</div>

</body>
</html>
