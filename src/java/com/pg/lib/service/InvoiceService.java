/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCCustomer;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.utility.ConnectDB;
import com.pg.lib.utility.Utility;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class InvoiceService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    
    public static  List<BCInvoice> getDataFromDatabaseById(String id) throws ClassNotFoundException, SQLException, NamingException {
        List<BCInvoice> list = new ArrayList<BCInvoice>();
        try {
            String sql = "select * FROM MIZUNONEWBARBOXINVOICE c WHERE c.INVOICEID = ?";
            
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCInvoice invoice = new BCInvoice();

                invoice.setInvoiceid(rs.getString("invoiceid"));
                invoice.setInvoiceno(rs.getString("invoiceno"));
                invoice.setInvoicedate(Utility.CoverDateFromSql(rs.getDate("invoicedate"),1));
                invoice.setSaveingno(rs.getString("saveingno"));
                invoice.setPo(rs.getString("po"));
                invoice.setFirstdigit(rs.getString("firstdigit"));
                invoice.setStartbox(rs.getString("startbox"));
                invoice.setEndbox(rs.getString("endbox"));
                invoice.setContainerno(rs.getString("containerno"));
                invoice.setDate_create(Utility.CoverDateFromSql(rs.getTimestamp("date_create"),2));
                invoice.setDate_modified(Utility.CoverDateFromSql(rs.getTimestamp("date_modified"),2));

                list.add(invoice);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            rs.close();
            ps.close();
        }
        return list;
    }
    
    public int getTotalRecords() throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "SELECT COUNT(*) FROM MIZUNONEWBARBOXINVOICE c where c.INVOICEID > 99";
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
            rs.close();
        }
        return totalRecords;
    }

    public int getFilteredRecords(String searchValue) throws ClassNotFoundException, SQLException, NamingException {
        int filteredRecords = 0;
        try {
            String sql = "SELECT count(*) as total  FROM ( ";
            sql += " SELECT ROWNUM AS rnum, c.* ";
            sql += "  FROM MIZUNONEWBARBOXINVOICE c ";
            sql += "  WHERE c.INVOICEID > 99 ";
            sql += "  AND (c.INVOICEID like ?  or c.INVOICENO like ?  or   c.INVOICEDATE LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%'  or c.SAVEINGNO like ? or c.PO like ? or c.FIRSTDIGIT like ? or  c.STARTBOX like ? or c.ENDBOX like ? or c.CONTAINERNO like ? or c.DATE_CREATE LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%' or  c.DATE_MODIFIED LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%'  ) ";
            sql += ") ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
            ps.setString(4, "%" + searchValue + "%");
            ps.setString(5, "%" + searchValue + "%");
            ps.setString(6, "%" + searchValue + "%");
            ps.setString(7, "%" + searchValue + "%");
            ps.setString(8, "%" + searchValue + "%");
            ps.setString(9, "%" + searchValue + "%");
            ps.setString(10, "%" + searchValue + "%");
            ps.setString(11, "%" + searchValue + "%");

            rs = ps.executeQuery();

            while (rs.next()) {
                filteredRecords = rs.getInt("total");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            rs.close();
            ps.close();
        }
        return filteredRecords;
    }

    public List<BCInvoice> getDataFromDatabase(int start, int length, String searchValue, String orderColumn, String orderDir) throws ClassNotFoundException, SQLException, NamingException {
        List<BCInvoice> list = new ArrayList<BCInvoice>();
        try {
            String sql = "SELECT * FROM ( ";
            sql += " SELECT ROWNUM AS rnum, c.* ";
            sql += "  FROM MIZUNONEWBARBOXINVOICE c ";
            sql += "  WHERE c.INVOICEID > 99 ";
            sql += "  AND (c.INVOICEID like ?  or c.INVOICENO like ?  or   c.INVOICEDATE LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%'  or c.SAVEINGNO like ? or c.PO like ? or c.FIRSTDIGIT like ? or  c.STARTBOX like ? or c.ENDBOX like ? or c.CONTAINERNO like ? or c.DATE_CREATE LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%' or  c.DATE_MODIFIED LIKE '%' || TO_DATE(?, 'dd/mm/yyyy') || '%'  ) ";
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
            ps.setString(8, "%" + searchValue + "%");
            ps.setString(9, "%" + searchValue + "%");
            ps.setString(10, "%" + searchValue + "%");
            ps.setString(11, "%" + searchValue + "%");
            ps.setInt(12, start);
            ps.setInt(13, length + start);

            rs = ps.executeQuery();

                    
            while (rs.next()) {
                BCInvoice invoice = new BCInvoice();

                invoice.setInvoiceid(rs.getString("invoiceid"));
                invoice.setInvoiceno(rs.getString("invoiceno"));
                invoice.setInvoicedate(Utility.CoverDateFromSql(rs.getDate("invoicedate"),1));
                invoice.setSaveingno(rs.getString("saveingno"));
                invoice.setPo(rs.getString("po"));
                invoice.setFirstdigit(rs.getString("firstdigit"));
                invoice.setStartbox(rs.getString("startbox"));
                invoice.setEndbox(rs.getString("endbox"));
                invoice.setContainerno(rs.getString("containerno"));
                invoice.setDate_create(Utility.CoverDateFromSql(rs.getTimestamp("date_create"),2));
                invoice.setDate_modified(Utility.CoverDateFromSql(rs.getTimestamp("date_modified"),2));

                list.add(invoice);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            rs.close();
            ps.close();
        }
        return list;
    }

    private static int getprimarykey() throws ClassNotFoundException, SQLException, NamingException, JSONException {
        int primarykey = 0;
        try {
            String sql = "select max(INVOICEID) as lastkey  from MIZUNONEWBARBOXINVOICE ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primarykey = rs.getInt("lastkey");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }

        return primarykey;
    }

    public static boolean addinvoice(String invoiceno, String invoicedate, String saveingno, String listpo) throws ClassNotFoundException, SQLException, NamingException, JSONException {
        boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO TSG.MIZUNONEWBARBOXINVOICE (INVOICEID, INVOICENO, INVOICEDATE, SAVEINGNO, PO, FIRSTDIGIT, STARTBOX, ENDBOX, CONTAINERNO, DATE_CREATE) " +
                    "VALUES ( ?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),?,?,?,?,?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'))";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);

            JSONArray poJsonArray = new JSONArray(listpo);

            for (int i = 0; i < poJsonArray.length(); i++) {
                JSONObject obj = poJsonArray.getJSONObject(i);

                String po = obj.getString("po");
                String firstdigit = obj.getString("firstdigit");
                String startbox = obj.getString("startbox");
                String endbox = obj.getString("endbox");
                String containerno = obj.getString("containerno");

                ps.setInt(1, primarykey);
                ps.setString(2, invoiceno);
                ps.setString(3, Utility.CoverDate(invoicedate));
                ps.setString(4, saveingno);
                ps.setString(5, po);
                ps.setString(6, firstdigit);
                ps.setString(7, startbox);
                ps.setString(8, endbox);
                ps.setString(9, containerno);
                ps.setString(10, Utility.GetDateNow());

                ps.addBatch();
             

            }

            ps.executeBatch();

            status = true;
        } catch (SQLException e) {
            status = false;
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;
    }
}
