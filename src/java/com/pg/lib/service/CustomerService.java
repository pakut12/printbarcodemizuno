/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCCustomer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pg.lib.utility.*;
import javax.naming.NamingException;

/**
 *
 * @author pakutsing
 */
public class CustomerService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Boolean AddDetailCustomer(String customer_no, String customer_barcode, String customer_color, String customer_size) throws ClassNotFoundException, SQLException, NamingException {
        List<BCCustomer> listcustomerdetail = new ArrayList<BCCustomer>();
        Boolean status = true;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO MIZUNOCUSTOMER (customer_id, customer_no, customer_barcode, customer_color,customer_size) VALUES (?, ?, ?, ?,?)";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, customer_no.toUpperCase());
            ps.setString(3, customer_barcode);
            ps.setString(4, customer_color.toUpperCase());
            ps.setString(5, customer_size.toUpperCase());

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

    public Boolean UpdateDetailCustomer(String customer_id, String customer_no, String customer_barcode, String customer_color, String customer_size) throws ClassNotFoundException, SQLException, NamingException {

        Boolean status = true;
        try {
            String sql = "update mizunocustomer c set c.CUSTOMER_NO = ?,c.CUSTOMER_BARCODE=?,c.CUSTOMER_COLOR=?,c.CUSTOMER_SIZE = ? where c.CUSTOMER_ID = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer_no);
            ps.setString(2, customer_barcode);
            ps.setString(3, customer_color);
            ps.setString(4, customer_size);
            ps.setString(5, customer_id);

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

    public Boolean DelDetailCustomer(String customer_id) throws ClassNotFoundException, SQLException, NamingException {

        List<BCCustomer> listcustomerdetail = new ArrayList<BCCustomer>();
        Boolean status = true;
        try {
            String sql = "delete from MIZUNOCUSTOMER where customer_id = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer_id);
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

    public List<BCCustomer> getDetailCustomer() throws ClassNotFoundException, SQLException, NamingException {
        List<BCCustomer> listcustomerdetail = new ArrayList<BCCustomer>();
        try {
            String sql = "select * from MIZUNOCUSTOMER where customer_id != 99 order by customer_id desc ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCCustomer customerdetail = new BCCustomer();
                customerdetail.setCustomer_id(rs.getString("customer_id"));
                customerdetail.setCustomer_no(rs.getString("customer_no"));
                customerdetail.setCustomer_barcode(rs.getString("customer_barcode"));
                customerdetail.setCustomer_color(rs.getString("customer_color"));
                customerdetail.setCustomer_size(rs.getString("customer_size"));
                listcustomerdetail.add(customerdetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return listcustomerdetail;
    }

    public List<BCCustomer> getDetailCustomerByID(String id) throws ClassNotFoundException, SQLException, NamingException {
        List<BCCustomer> listcustomerdetail = new ArrayList<BCCustomer>();
        try {
            String sql = "select * from MIZUNOCUSTOMER where customer_id = ? order by customer_id desc ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCCustomer customerdetail = new BCCustomer();
                customerdetail.setCustomer_id(rs.getString("customer_id"));
                customerdetail.setCustomer_no(rs.getString("customer_no"));
                customerdetail.setCustomer_barcode(rs.getString("customer_barcode"));
                customerdetail.setCustomer_color(rs.getString("customer_color"));
                customerdetail.setCustomer_size(rs.getString("customer_size"));
                listcustomerdetail.add(customerdetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }

        return listcustomerdetail;
    }

    private int getprimarykey() throws ClassNotFoundException, SQLException, NamingException {
        int primarykey = 0;
        try {
            String sql = "select MAX(customer_id) as lastkey from MIZUNOCUSTOMER";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                primarykey = rs.getInt("lastkey");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }

        return primarykey;
    }
}
