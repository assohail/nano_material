package com.mycompany.nanomaterialrepository.controller;

import com.mycompany.nanomaterialrepository.DAO.userDAO;
import com.mycompany.nanomaterialrepository.model.user;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/")
public class userServlet extends HttpServlet {

    private userDAO userDAO;

    @Override
    public void init() {
        userDAO = new userDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getServletPath();
            System.out.println("studentUser ==> Action = " + action);

            switch (action) {
                case "/new":
                    displayNewUserForm(request, response);
                    break;
                case "/list":
                    retrieveUser(request, response);
                    break;
                case "/edit":
                    displayEditUserForm(request, response);
                    break;
                case "/create":
                    createUser(request, response);
                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/login":
                    loginCheck(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void displayNewUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    private void retrieveUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<user> listUser = userDAO.selectAllUser();
        request.setAttribute("user", listUser);
        
        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/userList.jsp");
        dispatcher.forward(request, response);
    }

    private void displayEditUserForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        user currentUser = userDAO.selectUserID(id);
        request.setAttribute("user", currentUser);

        ServletContext sc = getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phoneNum");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        user user = new user(name, email, phoneNum, username, password, role);
        userDAO.insertStudent(user);
        response.sendRedirect("list");
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phoneNum");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        user stud = new user(id, name, email, phoneNum, username, password, role);
        userDAO.updateUser(stud);
        response.sendRedirect("list");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        response.sendRedirect("list");
    }

    private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String data[] = {"page", "id"};
        switch (role) {
            case "student":
                userDAO user = new userDAO();
                data = user.login(username, password);
                System.out.println("Data is = "+username+password);
                request.setAttribute("userID", data[1]);
                break;
        }

        RequestDispatcher RequetsDispatcherObj = request.getRequestDispatcher(data[0]);
        RequetsDispatcherObj.forward(request, response);
    }

}
