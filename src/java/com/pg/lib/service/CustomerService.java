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

    public int getTotalRecords() throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "SELECT COUNT(*) FROM MIZUNOCUSTOMER c where c.customer_id > 99";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return totalRecords;
    }

    public int getFilteredRecords(String searchValue) throws ClassNotFoundException, SQLException, NamingException {
        int filteredRecords = 0;
        try {

            String sql = "SELECT COUNT(*) FROM MIZUNOCUSTOMER c where c.customer_id > 99 and c.customer_id LIKE ? or c.customer_no LIKE ? or c.customer_barcode LIKE ? or c.customer_color LIKE ? or c.customer_size  LIKE ? or c.customer_description  LIKE ? or c.customer_product  LIKE ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
            ps.setString(4, "%" + searchValue + "%");
            ps.setString(5, "%" + searchValue + "%");
            ps.setString(6, "%" + searchValue + "%");
            ps.setString(7, "%" + searchValue + "%");
            rs = ps.executeQuery();
            if (rs.next()) {
                filteredRecords = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return filteredRecords;
    }

    public List<BCCustomer> getDataFromDatabase(int start, int length, String searchValue, String orderColumn, String orderDir) throws ClassNotFoundException, SQLException, NamingException {
        List<BCCustomer> list = new ArrayList<BCCustomer>();
        try {
            String sql = "SELECT * FROM";
            sql += "(select rownum as rnum,c.* from  MIZUNOCUSTOMER  c" +
                    " where c.customer_id > 99 and (c.customer_id LIKE ? or c.customer_no LIKE ? or c.customer_barcode LIKE ? or c.customer_color LIKE ? or c.customer_size  LIKE ? or c.customer_description  LIKE ? or c.customer_product  LIKE ?) ";

            String[] columns = {"customer_id", "customer_no", "customer_barcode", "customer_color", "customer_size", "customer_description", "customer_product"};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }
            sql += ") WHERE rnum BETWEEN ? AND ?";



            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
            ps.setString(4, "%" + searchValue + "%");
            ps.setString(5, "%" + searchValue + "%");
            ps.setString(6, "%" + searchValue + "%");
            ps.setString(7, "%" + searchValue + "%");
            ps.setInt(8, start);
            ps.setInt(9, length + start);

            rs = ps.executeQuery();
            DetailService ds = new DetailService();

            while (rs.next()) {
                BCCustomer cs = new BCCustomer();
                cs.setCustomer_id(ds.ChackNull(rs.getString("customer_id")));
                cs.setCustomer_no(ds.ChackNull(rs.getString("customer_no")));
                cs.setCustomer_barcode(ds.ChackNull(rs.getString("customer_barcode")));
                cs.setCustomer_color(ds.ChackNull(rs.getString("customer_color")));
                cs.setCustomer_size(ds.ChackNull(rs.getString("customer_size")));
                cs.setCustomer_description(ds.ChackNull(rs.getString("customer_description")));
                cs.setCustomer_product(ds.ChackNull(rs.getString("customer_product")));
                list.add(cs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return list;
    }

    public List<BCCustomer> ChackDetailCustomerAll(String CUSTOMER_NO) throws ClassNotFoundException, SQLException, NamingException {

        List<BCCustomer> list = new ArrayList<BCCustomer>();
        int primarykey = getprimarykey() + 1;
        try {
            DetailService ds = new DetailService();
            String sql = "select * from  MIZUNOCUSTOMER  c where c.CUSTOMER_NO = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,CUSTOMER_NO);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCCustomer cs = new BCCustomer();
                cs.setCustomer_id(rs.getString("customer_id"));
                cs.setCustomer_no(rs.getString("customer_no"));
                cs.setCustomer_barcode(rs.getString("customer_barcode"));
                cs.setCustomer_color(rs.getString("customer_color").toUpperCase());
                cs.setCustomer_size(rs.getString("customer_size").toUpperCase());
                cs.setCustomer_description(rs.getString("customer_description").toUpperCase());
                list.add(cs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return list;

    }

    private String ChackDetailCustomer(String CUSTOMER_NO) throws ClassNotFoundException, SQLException, NamingException {
        String key = "";
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "select * from  MIZUNOCUSTOMER  c  where c.CUSTOMER_NO LIKE ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + CUSTOMER_NO);
            rs = ps.executeQuery();
            while (rs.next()) {
                key = rs.getString("CUSTOMER_ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return key;
    }

    public Boolean AddDetailCustomerMultiple(List<BCCustomer> list) throws ClassNotFoundException, SQLException, NamingException {
        Boolean status = false;
        int primarykey = getprimarykey() + 1;
        String sql = "INSERT INTO MIZUNOCUSTOMER (customer_id, customer_no, customer_barcode, customer_color,customer_size,customer_product,customer_description) VALUES (?, ?, ?, ?,?,?,?)";
        conn = ConnectDB.getConnection();
        ps = conn.prepareStatement(sql);
        try {
            for (int i = 0; i < list.size(); i++) {
                ps.setInt(1, primarykey);
                ps.setString(2, list.get(i).getCustomer_no());
                ps.setString(3, list.get(i).getCustomer_barcode());
                ps.setString(4, list.get(i).getCustomer_color());
                ps.setString(5, list.get(i).getCustomer_size());
                ps.setString(6, list.get(i).getCustomer_product());
                ps.setString(7, list.get(i).getCustomer_description());
                ps.addBatch();
                primarykey++;
                
            }
            ps.executeBatch();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;
    }

    private String SqlAddDetailCustomerMultiple(List<BCCustomer> list) throws ClassNotFoundException, SQLException, NamingException {
        String sql = "INSERT ALL ";
        int primarykey = getprimarykey() + 1;
        for (int n = 0; n < list.size(); n++) {
            DetailService ds = new DetailService();
            sql += " INTO MIZUNOCUSTOMER (customer_id, customer_no, customer_barcode, customer_color,customer_size,customer_product,customer_description) VALUES (";
            sql += "'" + primarykey + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_no()) + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_barcode()) + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_color().toUpperCase()) + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_size().toUpperCase()) + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_product()) + "',";
            sql += "'" + ds.ChackNull(list.get(n).getCustomer_description().toUpperCase().replaceAll("'", "#")) + "')";

            primarykey++;
        }
        sql += " SELECT * FROM dual";
        return sql;
    }

    public Boolean AddDetailCustomer(String customer_no, String customer_barcode, String customer_color, String customer_size, String customer_description, String customer_product) throws ClassNotFoundException, SQLException, NamingException {
        List<BCCustomer> listcustomerdetail = new ArrayList<BCCustomer>();
        Boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            if (!ChackDetailCustomer(customer_no).equals("")) {
                status = UpdateDetailCustomer(ChackDetailCustomer(customer_no), customer_no, customer_barcode, customer_color, customer_size, customer_description, customer_product);
            } else {
                String sql = "INSERT INTO MIZUNOCUSTOMER (customer_id, customer_no, customer_barcode, customer_color,customer_size,customer_product,customer_description) VALUES (?, ?, ?, ?,?,?,?)";
                conn = ConnectDB.getConnection();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, primarykey);
                ps.setString(2, customer_no.toUpperCase());
                ps.setString(3, customer_barcode);
                ps.setString(4, customer_color.toUpperCase());
                ps.setString(5, customer_size.toUpperCase());
                ps.setString(6, customer_product.toUpperCase());
                ps.setString(7, customer_description.toUpperCase());

                if (ps.executeUpdate() > 0) {
                    status = true;
                } else {
                    status = false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }


        return status;
    }

    public Boolean UpdateDetailCustomer(String customer_id, String customer_no, String customer_barcode, String customer_color, String customer_size, String customer_description, String customer_product) throws ClassNotFoundException, SQLException, NamingException {

        Boolean status = false;
        try {
            String sql = "update mizunocustomer c set c.CUSTOMER_NO = ?,c.CUSTOMER_BARCODE=?,c.CUSTOMER_COLOR=?,c.CUSTOMER_SIZE = ?,c.customer_description = ?,c.customer_product = ?  where c.CUSTOMER_ID = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, customer_no);
            ps.setString(2, customer_barcode);
            ps.setString(3, customer_color.toUpperCase());
            ps.setString(4, customer_size.toUpperCase());
            ps.setString(5, customer_description.toUpperCase());
            ps.setString(6, customer_product.toUpperCase());
            ps.setString(7, customer_id);

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
        Boolean status = false;
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
                customerdetail.setCustomer_description(rs.getString("customer_description"));
                customerdetail.setCustomer_product(rs.getString("customer_product"));
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
                customerdetail.setCustomer_description(rs.getString("customer_description"));
                customerdetail.setCustomer_product(rs.getString("customer_product"));
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
