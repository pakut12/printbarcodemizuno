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
                primarykey++;
                
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
