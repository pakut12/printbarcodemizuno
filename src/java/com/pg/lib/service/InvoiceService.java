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

    public static List<BCInvoice> getDataFromDatabaseById(String id) throws ClassNotFoundException, SQLException, NamingException {
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
                invoice.setInvoicedate(Utility.CoverDateFromSql(rs.getDate("invoicedate"), 1));
                invoice.setSaveingno(rs.getString("saveingno"));
                invoice.setPo(rs.getString("po"));
                invoice.setFirstdigit(rs.getString("firstdigit"));
                invoice.setStartbox(rs.getString("startbox"));
                invoice.setEndbox(rs.getString("endbox"));
                invoice.setContainerno(rs.getString("containerno"));
                invoice.setDate_create(Utility.CoverDateFromSql(rs.getTimestamp("date_create"), 2));
                invoice.setDate_modified(Utility.CoverDateFromSql(rs.getTimestamp("date_modified"), 2));
                invoice.setCustomer(rs.getString("customer"));
                invoice.setShipfrom(rs.getString("SHIPFROM"));
                invoice.setShipto(rs.getString("SHIPTO"));
                invoice.setShipper(rs.getString("SHIPPER"));
                invoice.setFinald(rs.getString("FINAL"));

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

    public int getTotalRecords(int start, int length, String searchValue, String orderColumn, String orderDir, String search_invoiceno, String search_invoicedate, String search_datestart, String search_dateend) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "SELECT count(*) as total  FROM ( ";
            sql += " SELECT INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE   ";
            sql += "  FROM MIZUNONEWBARBOXINVOICE c ";
            sql += "  WHERE c.INVOICEID > 99 ";

            if (!search_invoiceno.equals("")) {
                sql += "  and c.INVOICENO = '" + search_invoiceno + "' ";
            }

            if (!search_invoicedate.equals("")) {
                sql += " and c.INVOICEDATE = TO_DATE('" + Utility.CoverDate(search_invoicedate) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }

            System.out.println(search_datestart);
            System.out.println(search_dateend);

            if (!search_datestart.equals("") && !search_dateend.equals("")) {
                sql += " and c.DATE_CREATE BETWEEN TO_DATE('" + Utility.CoverDate(search_datestart) + "', 'dd/mm/yyyy HH24:MI:SS') and  TO_DATE('" + Utility.CoverDate(search_dateend) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }
            sql += " group by INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE ";
            sql += ")tb ";

            sql += " order by INVOICEID ";
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

    public int getFilteredRecords(int start, int length, String searchValue, String orderColumn, String orderDir, String search_invoiceno, String search_invoicedate, String search_datestart, String search_dateend) throws ClassNotFoundException, SQLException, NamingException {
        int filteredRecords = 0;
        try {
            String sql = "SELECT count(*) as total  FROM ( ";
            sql += " SELECT INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE   ";
            sql += "  FROM MIZUNONEWBARBOXINVOICE c ";
            sql += "  WHERE c.INVOICEID > 99 ";

            if (!search_invoiceno.equals("")) {
                sql += "  and c.INVOICENO = '" + search_invoiceno + "' ";
            }

            if (!search_invoicedate.equals("")) {
                sql += " and c.INVOICEDATE = TO_DATE('" + Utility.CoverDate(search_invoicedate) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }

            System.out.println(search_datestart);
            System.out.println(search_dateend);

            if (!search_datestart.equals("") && !search_dateend.equals("")) {
                sql += " and c.DATE_CREATE BETWEEN TO_DATE('" + Utility.CoverDate(search_datestart) + "', 'dd/mm/yyyy HH24:MI:SS') and  TO_DATE('" + Utility.CoverDate(search_dateend) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }
            sql += " group by INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE ";
            sql += ")tb ";

            sql += " order by INVOICEID ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
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

    public List<BCInvoice> getDataFromDatabase(int start, int length, String searchValue, String orderColumn, String orderDir, String search_invoiceno, String search_invoicedate, String search_datestart, String search_dateend) throws ClassNotFoundException, SQLException, NamingException {
        List<BCInvoice> list = new ArrayList<BCInvoice>();
        String sql = "";
        try {
            sql += "SELECT * FROM ( ";
            sql += "SELECT rownum as rnum,tb.*  FROM ( ";
            sql += " SELECT INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE   ";
            sql += "  FROM MIZUNONEWBARBOXINVOICE c ";
            sql += "  WHERE c.INVOICEID > 99 ";

            if (!search_invoiceno.equals("")) {
                sql += "  and c.INVOICENO = '" + search_invoiceno + "' ";
            }

            if (!search_invoicedate.equals("")) {
                sql += " and c.INVOICEDATE = TO_DATE('" + Utility.CoverDate(search_invoicedate) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }


            if (!search_datestart.equals("") && !search_dateend.equals("")) {
                sql += " and c.DATE_CREATE BETWEEN TO_DATE('" + Utility.CoverDate(search_datestart) + "', 'dd/mm/yyyy HH24:MI:SS') and  TO_DATE('" + Utility.CoverDate(search_dateend) + "', 'dd/mm/yyyy HH24:MI:SS') ";
            }
            sql += " group by INVOICEID,INVOICENO,INVOICEDATE,CUSTOMER,DATE_CREATE ";
         

            String[] columns = {"INVOICENO", "INVOICEDATE", "CUSTOMER", "DATE_CREATE"};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }
            sql += ")tb) where rnum BETWEEN ? and ? ";

            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, start);
            ps.setInt(2, length + start);

            System.out.println(start);
            System.out.println(length + start);

            rs = ps.executeQuery();


            while (rs.next()) {
                BCInvoice invoice = new BCInvoice();

                invoice.setInvoiceid(rs.getString("invoiceid"));
                invoice.setInvoiceno(rs.getString("invoiceno"));
                invoice.setInvoicedate(Utility.CoverDateFromSql(rs.getDate("invoicedate"), 1));
                invoice.setDate_create(Utility.CoverDateFromSql(rs.getTimestamp("date_create"), 2));
                invoice.setCustomer(rs.getString("customer"));

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

    public static boolean delinvoice(String id) throws SQLException {
        boolean status = false;

        try {
            String sql = "delete from  MIZUNONEWBARBOXINVOICE where INVOICEID = ?";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);

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

    public static boolean updateinvoice(String invoiceno, String invoicedate, String saveingno, String listpo, String datecreate, String customer, String shipper, String from, String to, String finald) throws ClassNotFoundException, SQLException, NamingException, JSONException {
        boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO TSG.MIZUNONEWBARBOXINVOICE (INVOICEID, INVOICENO, INVOICEDATE, SAVEINGNO, PO, FIRSTDIGIT, STARTBOX, ENDBOX, CONTAINERNO, DATE_CREATE,DATE_MODIFIED,CUSTOMER,SHIPPER,SHIPFROM,SHIPTO,FINAL) " +
                    "VALUES ( ?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),?,?,?,?,?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),?,?,?,?,?)";
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

                System.out.println("-----------------------");
                System.out.println(shipper);
                System.out.println(from);
                System.out.println(to);
                System.out.println("-----------------------");

                ps.setInt(1, primarykey);
                ps.setString(2, invoiceno);
                ps.setString(3, Utility.CoverDate(invoicedate));
                ps.setString(4, saveingno);
                ps.setString(5, po);
                ps.setString(6, firstdigit);
                ps.setString(7, startbox);
                ps.setString(8, endbox);
                ps.setString(9, containerno);
                ps.setString(10, datecreate);
                ps.setString(11, Utility.GetDateNow());
                ps.setString(12, customer);
                ps.setString(13, shipper);
                ps.setString(14, from);
                ps.setString(15, to);
                ps.setString(16, finald);
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

    public static boolean addinvoice(String invoiceno, String invoicedate, String saveingno, String listpo, String customer, String shipper, String from, String to, String addfinal) throws ClassNotFoundException, SQLException, NamingException, JSONException {
        boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO TSG.MIZUNONEWBARBOXINVOICE (INVOICEID, INVOICENO, INVOICEDATE, SAVEINGNO, PO, FIRSTDIGIT, STARTBOX, ENDBOX, CONTAINERNO, DATE_CREATE,CUSTOMER,SHIPPER,SHIPFROM,SHIPTO,FINAL) " +
                    "VALUES ( ?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),?,?,?,?,?,?,TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS'),?,?,?,?,?)";

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
                ps.setString(11, customer);
                ps.setString(12, shipper);
                ps.setString(13, from);
                ps.setString(14, to);
                ps.setString(15, addfinal);

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
