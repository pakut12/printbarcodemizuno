package com.pg.lib.service;

import com.pg.lib.model.BCUser;
import com.pg.lib.utility.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AuthenticationService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static String getstatus(String status) {
        String statustext = null;

        if (status.equals("1")) {
            statustext = "Admin";
        } else if (status.equals("2")) {
            statustext = "User";
        } else if (status.equals("3")) {
            statustext = "Packing";
        }

        return statustext;
    }

    public static Boolean chacklogin(String user, String pass) throws SQLException {
        Boolean status = false;
        try {
            String sql = "select * from MIZUNONEWBARBOXUSER where user_user = ? and user_pass = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            if (ps.executeUpdate() > 0) {
                status = true;
            } else {
                status = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;
    }

    public static List<BCUser> chackuser(String user) throws SQLException {
        List<BCUser> listuser = new ArrayList();
        try {
            String sql = "select * from MIZUNONEWBARBOXUSER where user_user = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCUser userdetail = new BCUser();
                userdetail.setUser_id(rs.getString("user_id"));
                userdetail.setUser_user(rs.getString("user_user"));
                userdetail.setUser_pass(rs.getString("user_pass"));
                userdetail.setUser_firstname(rs.getString("user_firstname"));
                userdetail.setUser_lastname(rs.getString("user_lastname"));
                userdetail.setUser_status(rs.getString("user_status"));
                userdetail.setDate_create(rs.getString("date_create"));
                userdetail.setDate_modify(rs.getString("date_modify"));
                listuser.add(userdetail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return listuser;
    }

    public static List<BCUser> gettableuser() throws SQLException {
        List<BCUser> listuser = new ArrayList();
        try {
            String sql = "select * from MIZUNONEWBARBOXUSER where user_id > 99";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCUser userdetail = new BCUser();
                userdetail.setUser_id(rs.getString("user_id"));
                userdetail.setUser_user(rs.getString("user_user"));
                userdetail.setUser_pass(rs.getString("user_pass"));
                userdetail.setUser_firstname(rs.getString("user_firstname"));
                userdetail.setUser_lastname(rs.getString("user_lastname"));
                userdetail.setUser_status(rs.getString("user_status"));
                userdetail.setDate_create(rs.getString("date_create"));
                userdetail.setDate_modify(rs.getString("date_modify"));
                listuser.add(userdetail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return listuser;
    }

    private static int getprimerykey() throws SQLException {
        int primerykey = 0;
        try {
            String sql = "select MAX(user_id) as primerykey from MIZUNONEWBARBOXUSER ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primerykey = rs.getInt("primerykey");

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return primerykey;
    }

    public static Boolean adduser(String user, String pass, String status, String firstname, String lastname) throws SQLException {
        Boolean statusadd = false;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();

            int primerykey = getprimerykey() + 1;
            String sql = "INSERT INTO MIZUNONEWBARBOXUSER (user_id, user_user, user_pass,user_status,user_firstname,user_lastname,date_create) VALUES (?, ?, ?,?,?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'))";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primerykey);
            ps.setString(2, user);
            ps.setString(3, pass);
            ps.setString(4, status);
            ps.setString(5, firstname);
            ps.setString(6, lastname);
            ps.setString(7, formatter.format(date));

            if (ps.executeUpdate() > 0) {
                statusadd = true;
            } else {
                statusadd = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return statusadd;
    }

    public static Boolean deluser(String id) throws SQLException {
        Boolean statusadd = false;
        try {
            int primerykey = getprimerykey() + 1;
            String sql = "delete from MIZUNONEWBARBOXUSER where user_id = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            if (ps.executeUpdate() > 0) {
                statusadd = true;
            } else {
                statusadd = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return statusadd;
    }

    public static List<BCUser> getuserbyid(String id) throws SQLException {
        List<BCUser> listuser = new ArrayList();
        try {
            String sql = "select * from MIZUNONEWBARBOXUSER where user_id = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCUser userdetail = new BCUser();
                userdetail.setUser_id(rs.getString("user_id"));
                userdetail.setUser_user(rs.getString("user_user"));
                userdetail.setUser_pass(rs.getString("user_pass"));
                userdetail.setUser_firstname(rs.getString("user_firstname"));
                userdetail.setUser_lastname(rs.getString("user_lastname"));
                userdetail.setUser_status(rs.getString("user_status"));
                userdetail.setDate_create(rs.getString("date_create"));
                userdetail.setDate_modify(rs.getString("date_modify"));
                listuser.add(userdetail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return listuser;
    }

    public static Boolean updateuser(String edit_id, String edit_user, String edit_pass, String edit_status, String edit_firstname, String edit_lastname) throws SQLException {
        Boolean statusadd = false;
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();

            int primerykey = getprimerykey() + 1;
            String sql = "UPDATE MIZUNONEWBARBOXUSER SET user_user = ?, user_pass = ?,user_status = ?,USER_FIRSTNAME = ?,USER_LASTNAME = ?,DATE_MODIFY=TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS') WHERE user_id = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, edit_user);
            ps.setString(2, edit_pass);
            ps.setString(3, edit_status);
            ps.setString(4, edit_firstname);
            ps.setString(5, edit_lastname);
            ps.setString(6, formatter.format(date));
            ps.setString(7, edit_id);

            if (ps.executeUpdate() > 0) {
                statusadd = true;
            } else {
                statusadd = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return statusadd;
    }
}
