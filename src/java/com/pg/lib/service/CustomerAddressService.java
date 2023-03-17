/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCCustomerAddress;
import com.pg.lib.utility.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class CustomerAddressService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private int getLastPrimarykey() throws SQLException {

        int primarykey = 0;
        try {
            String sql = "select max(address_id) as lastkey from MIZUNOCUSTOMERADDRESS";
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
            rs.close();
        }

        return primarykey;
    }

    public List<BCCustomerAddress> getaddressbyid(String ID) throws SQLException {

        List<BCCustomerAddress> list = new ArrayList<BCCustomerAddress>();
        try {
            String sql = "select * from MIZUNOCUSTOMERADDRESS where ADDRESS_ID = ? ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ID);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetailService ds = new DetailService();
                BCCustomerAddress address = new BCCustomerAddress();
                address.setAddress_id(ds.ChackNull(rs.getString("ADDRESS_ID")));
                address.setAddress_customer(ds.ChackNull(rs.getString("ADDRESS_CUSTOMER")));
                address.setAddress_deliveredto(ds.ChackNull(rs.getString("ADDRESS_DELIVEREDTO")));
                address.setAddress_address1(ds.ChackNull(rs.getString("ADDRESS_ADDRESS1")));
                address.setAddress_address2(ds.ChackNull(rs.getString("ADDRESS_ADDRESS2")));
                address.setAddress_address3(ds.ChackNull(rs.getString("ADDRESS_ADDRESS3")));
                address.setAddress_address4(ds.ChackNull(rs.getString("ADDRESS_ADDRESS4")));
                list.add(address);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return list;
    }

    public List<BCCustomerAddress> GetTableMIZUNOCUSTOMERADDRESS_BYCustomer(String cms) throws SQLException {

        List<BCCustomerAddress> list = new ArrayList<BCCustomerAddress>();

        try {
            String sql = "select * from MIZUNOCUSTOMERADDRESS where address_customer = ? order by address_ID";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, cms);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetailService ds = new DetailService();
                BCCustomerAddress address = new BCCustomerAddress();
                address.setAddress_id(ds.ChackNull(rs.getString("ADDRESS_ID")));
                address.setAddress_customer(ds.ChackNull(rs.getString("ADDRESS_CUSTOMER")));
                address.setAddress_deliveredto(ds.ChackNull(rs.getString("ADDRESS_DELIVEREDTO")));
                address.setAddress_address1(ds.ChackNull(rs.getString("ADDRESS_ADDRESS1")));
                address.setAddress_address2(ds.ChackNull(rs.getString("ADDRESS_ADDRESS2")));
                address.setAddress_address3(ds.ChackNull(rs.getString("ADDRESS_ADDRESS3")));
                address.setAddress_address4(ds.ChackNull(rs.getString("ADDRESS_ADDRESS4")));
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return list;
    }

    public List<BCCustomerAddress> GetTableMIZUNOCUSTOMERADDRESS() throws SQLException {

        List<BCCustomerAddress> list = new ArrayList<BCCustomerAddress>();

        try {
            String sql = "select * from MIZUNOCUSTOMERADDRESS where ADDRESS_ID >99";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetailService ds = new DetailService();

                BCCustomerAddress address = new BCCustomerAddress();
                address.setAddress_id(ds.ChackNull(rs.getString("ADDRESS_ID")));
                address.setAddress_customer(ds.ChackNull(rs.getString("ADDRESS_CUSTOMER")));
                address.setAddress_deliveredto(ds.ChackNull(rs.getString("ADDRESS_DELIVEREDTO")));
                address.setAddress_address1(ds.ChackNull(rs.getString("ADDRESS_ADDRESS1")));
                address.setAddress_address2(ds.ChackNull(rs.getString("ADDRESS_ADDRESS2")));
                address.setAddress_address3(ds.ChackNull(rs.getString("ADDRESS_ADDRESS3")));
                address.setAddress_address4(ds.ChackNull(rs.getString("ADDRESS_ADDRESS4")));
                list.add(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return list;
    }

    public Boolean DeleteDataAddress(String ADDRESS_ID) throws SQLException {

        Boolean status = false;

        int primarykey = getLastPrimarykey() + 1;
        try {
            String sql = "DELETE FROM MIZUNOCUSTOMERADDRESS where ADDRESS_ID = ? ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, ADDRESS_ID);

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
            rs.close();
        }

        return status;
    }

    public Boolean UpdateDataAddress(String ADDRESS_ID, String ADDRESS_CUSTOMER, String ADDRESS_DELIVEREDTO, String ADDRESS_ADDRESS1, String ADDRESS_ADDRESS2, String ADDRESS_ADDRESS3, String ADDRESS_ADDRESS4) throws SQLException {

        Boolean status = false;

        int primarykey = getLastPrimarykey() + 1;
        try {
            String sql = "UPDATE MIZUNOCUSTOMERADDRESS SET  ADDRESS_CUSTOMER = ? , ADDRESS_DELIVEREDTO=?,ADDRESS_ADDRESS1=?,ADDRESS_ADDRESS2=?,ADDRESS_ADDRESS3=?,ADDRESS_ADDRESS4=? where ADDRESS_ID = ? ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, ADDRESS_CUSTOMER);
            ps.setString(2, ADDRESS_DELIVEREDTO);
            ps.setString(3, ADDRESS_ADDRESS1);
            ps.setString(4, ADDRESS_ADDRESS2);
            ps.setString(5, ADDRESS_ADDRESS3);
            ps.setString(6, ADDRESS_ADDRESS4);
            ps.setString(7, ADDRESS_ID);

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
            rs.close();
        }

        return status;
    }

    public Boolean AddDataAddress(String ADDRESS_CUSTOMER, String ADDRESS_DELIVEREDTO, String ADDRESS_ADDRESS1, String ADDRESS_ADDRESS2, String ADDRESS_ADDRESS3, String ADDRESS_ADDRESS4) throws SQLException {

        Boolean status = false;

        int primarykey = getLastPrimarykey() + 1;
        try {
            String sql = "INSERT INTO MIZUNOCUSTOMERADDRESS (ADDRESS_ID, ADDRESS_CUSTOMER, ADDRESS_DELIVEREDTO,ADDRESS_ADDRESS1,ADDRESS_ADDRESS2,ADDRESS_ADDRESS3,ADDRESS_ADDRESS4) VALUES (?, ?, ?, ?,?, ?,?)";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, ADDRESS_CUSTOMER);
            ps.setString(3, ADDRESS_DELIVEREDTO);
            ps.setString(4, ADDRESS_ADDRESS1);
            ps.setString(5, ADDRESS_ADDRESS2);
            ps.setString(6, ADDRESS_ADDRESS3);
            ps.setString(7, ADDRESS_ADDRESS4);

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
            rs.close();
        }

        return status;
    }
}
