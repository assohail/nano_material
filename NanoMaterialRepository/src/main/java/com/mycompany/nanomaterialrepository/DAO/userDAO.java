package com.mycompany.nanomaterialrepository.DAO;

import com.mycompany.nanomaterialrepository.model.user;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class userDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/user";
    private final String username = "root";
    private final String password = "mypass";

    private static final String SELECT_USER_BY_ID = "SELECT * FROM user WHERE id=?";
    private static final String SELECT_ALL_USER = "SELECT * FROM user";
    private static final String INSERT_USER = "INSERT INTO user(name,email,phoneNum,username,password,role) VALUES(?,?,?,?,?,?)";
    private static final String UPDATE_USER = "UPDATE user set name=?, email=?, phoneNum=?, username=?, password=?, role=? WHERE id=?";
    private static final String DELETE_USER = "DELETE FROM user WHERE id=?";

    protected Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, username, password);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }

    public List<user> selectAllUser() {
        List<user> user = new ArrayList();

        try (
                Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phoneNum = rs.getString("phoneNum");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");

                System.out.println(name);
                System.out.println(email);
                System.out.println(phoneNum);
                System.out.println(username);
                System.out.println(password);
                System.out.println(role);
                

                user.add(new user(id, name, email, phoneNum, username, password, role));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public user selectUserID(int id) {
        user user = null;

        try (
                Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {

            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phoneNum = rs.getString("phoneNum");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String role = rs.getString("role");

                user = new user(id, name, email, phoneNum, username, password, role);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public void insertStudent(user user) throws SQLException {
        try (
                Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {

            preparedStatement.setString(1, user.getname());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhoneNum());
            preparedStatement.setString(4, user.getUsername());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getRole());
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateUser(user user) throws SQLException {
        boolean recordUpdated = false;

        try (
                Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {

            preparedStatement.setString(1, user.getname());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhoneNum());
            preparedStatement.setString(4, user.getUsername());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.setString(6, user.getRole());
            preparedStatement.setInt(7, user.getId());

            recordUpdated = preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return recordUpdated;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean recordDeleted = false;

        try (
                Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {

            preparedStatement.setInt(1, id);

            recordDeleted = preparedStatement.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("deleteUser => Value for recordDeleted = " + recordDeleted);

        return recordDeleted;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    public String[] login(String username,String password){
        String data[] = {"page","id"};
        
        try(
                Connection connection=getConnection();
                PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_USER)) {
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while(rs.next())
            {
                if(username.equals(rs.getString(5)))
                {
                    data[0] = "/homepage.jsp";
                    data[1] = rs.getString(1);
                }
                else{
                    
                    data[0] = "/login.jsp";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return data;
    }
}


