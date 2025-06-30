/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DbUtils;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public UserDAO() {}

    public UserDTO getUserByUserName(String username) {
        try {
            String sql = "SELECT * FROM tblUsers WHERE username = ?";
            Connection conn = DbUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String userName = rs.getString("username");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String role = rs.getString("role");

                return new UserDTO(userName, name, password, role);
            }
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean login(String username, String password) {
        try {
            UserDTO user = getUserByUserName(username);
            if (user != null) {
                if (user.getPassword().equals(password)) {
                    return true;
                }
            }
        } catch (Exception e) {
        }

        return false;
    }

    public List<UserDTO> getAllUsers() {
        List<UserDTO> userList = new ArrayList<>();
        String sql = "SELECT username, name, password, role FROM tblUsers";
        try {
            Connection conn = DbUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUsername(rs.getString("username"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                userList.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return userList;
    }
    
    public boolean updatePassword(String userName, String newPassword) {
        String sql = "UPDATE tblUsers SET password = ? WHERE userName = ?";
        try {
            Connection conn = DbUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, userName);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

