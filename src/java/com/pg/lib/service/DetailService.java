/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.utility.ConnectDB;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

/**
 *
 * @author pakutsing
 */
public class DetailService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private HashMap<String, String> GetAddress(String address) {
        HashMap<String, String> listaddress = new HashMap<String, String>();

        if (address.equals("TSG")) {
            listaddress.put("address1", "THAI SPORTS GARMENT CO.,LTD.");
            listaddress.put("address2", "666 RAMA 3 ROAD");
            listaddress.put("address3", "BANGPONGPANG YANNAWA");
            listaddress.put("address4", "BANGKOK 10120 THAILAND");
        } else if (address.equals("MUS")) {
            listaddress.put("address1", "MIZUNO USA INC.");
            listaddress.put("address2", "BRASELTON DC");
            listaddress.put("address3", "920 HIGHWAY 124");
            listaddress.put("address4", "BRASELTON GA 30517 USA");
        } else if (address.equals("MCA")) {
            listaddress.put("address1", "MIZUNO CORPORATION");
            listaddress.put("address2", "17ANZED COURT");
            listaddress.put("address3", "MULGRAVE,VIC,3170");
            listaddress.put("address4", "AUSTRALIA");
        } else if (address.equals("MCL")) {
            listaddress.put("address1", "MIZUNO CANADA INC-TDC");
            listaddress.put("address2", "5206 TIMBERLEA BLVD");
            listaddress.put("address3", "MISSISSAUGA ON");
            listaddress.put("address4", "L4W2S5 CANADA");
        }

        return listaddress;
    }

    private String SqlAddDataToMIZUNONEWBARBOXDT(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id) {
        String sql = "INSERT ALL ";
        try {
            for (int n = 1; n < Integer.parseInt(numberbox_end) + 1; n++) {
                sql += " INTO MIZUNONEWBARBOXDT (PO,BOXNO,BOXALL,SHIPFROM,SFADDRESS1,SFADDRESS2,SFADDRESS3,SFADDRESS4,SHIPTO,STADDRESS1,STADDRESS2,STADDRESS3,STADDRESS4,QTYPERBOX,DESCTXT,GROSSWEIGHT,NETWEIGHT,COUNTRY_ORIGIN,SKU_ITEM1,UPC_CODE1,COLORNO1,SIZENO1,QTY1,SKU_ITEM2,UPC_CODE2,COLORNO2,SIZENO2,QTY2,SKU_ITEM3,UPC_CODE3,COLORNO3,SIZENO3,QTY3,SKU_ITEM4,UPC_CODE4,COLORNO4,SIZENO4,QTY4,STATUSSHOOT) VALUES (";
                sql += "'" + po + "',";
                sql += "'" + initial + n + "',";
                sql += "'" + initial + quantitytotal_box + "',";
                sql += "'TSG',";
                sql += "'" + GetAddress("TSG").get("address1") + "',";
                sql += "'" + GetAddress("TSG").get("address2") + "',";
                sql += "'" + GetAddress("TSG").get("address3") + "',";
                sql += "'" + GetAddress("TSG").get("address4") + "',";
                sql += "'" + customer_num + "',";
                sql += "'" + GetAddress(customer_num).get("address1") + "',";
                sql += "'" + GetAddress(customer_num).get("address2") + "',";
                sql += "'" + GetAddress(customer_num).get("address3") + "',";
                sql += "'" + GetAddress(customer_num).get("address4") + "',";
                sql += "'" + quantity_box + "',";
                sql += "'" + description + "',";
                sql += "'" + gw + "',";
                sql += "'" + nw + "',";
                sql += "'" + country + "',";
                sql += "'" + customer1_id[0] + "',";
                sql += "'" + customer1_id[1] + "',";
                sql += "'" + customer1_id[2] + "',";
                sql += "'" + customer1_id[3] + "',";
                sql += "'" + customer1_id[4] + "',";
                sql += "'" + customer2_id[0] + "',";
                sql += "'" + customer2_id[1] + "',";
                sql += "'" + customer2_id[2] + "',";
                sql += "'" + customer2_id[3] + "',";
                sql += "'" + customer2_id[4] + "',";
                sql += "'" + customer3_id[0] + "',";
                sql += "'" + customer3_id[1] + "',";
                sql += "'" + customer3_id[2] + "',";
                sql += "'" + customer3_id[3] + "',";
                sql += "'" + customer3_id[4] + "',";
                sql += "'" + customer4_id[0] + "',";
                sql += "'" + customer4_id[1] + "',";
                sql += "'" + customer4_id[2] + "',";
                sql += "'" + customer4_id[3] + "',";
                sql += "'" + customer4_id[4] + "',";
                sql += "'N')";
            }
            sql += " SELECT * FROM dual";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sql;
    }

    public Boolean AddDataToMIZUNONEWBARBOXDT(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id) throws SQLException {
        Boolean status = false;

        try {
            String sql = SqlAddDataToMIZUNONEWBARBOXDT(customer_num, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            
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

    public Boolean AddDataToMIZUNONEWBARBOXHD(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id) throws SQLException {
        Boolean status = false;

        try {
            String sql = "INSERT INTO MIZUNONEWBARBOXHD (PO,FIRSTDIGIT,STARTBOX,ENDBOX,ALLBOX,SHIPFROM,SHIPTO,QTYPERBOX,DESCTXT,GROSSWEIGHT,NETWEIGHT,COUNTRY_ORIGIN,SKU_ITEM1,UPC_CODE1,COLORNO1,SIZENO1,QTY1,SKU_ITEM2,UPC_CODE2,COLORNO2,SIZENO2,QTY2,SKU_ITEM3,UPC_CODE3,COLORNO3,SIZENO3,QTY3,SKU_ITEM4,UPC_CODE4,COLORNO4,SIZENO4,QTY4) " +
                    "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, po);
            ps.setString(2, initial);
            ps.setString(3, numberbox_start);
            ps.setString(4, numberbox_end);
            ps.setString(5, quantitytotal_box);
            ps.setString(6, "TSG");
            ps.setString(7, customer_num);
            ps.setString(8, quantity_box);
            ps.setString(9, description);
            ps.setString(10, gw);
            ps.setString(11, nw);
            ps.setString(12, country);
            ps.setString(13, customer1_id[0]);
            ps.setString(14, customer1_id[1]);
            ps.setString(15, customer1_id[2]);
            ps.setString(16, customer1_id[3]);
            ps.setString(17, customer1_id[4]);
            ps.setString(18, customer2_id[0]);
            ps.setString(19, customer2_id[1]);
            ps.setString(20, customer2_id[2]);
            ps.setString(21, customer2_id[3]);
            ps.setString(22, customer2_id[4]);
            ps.setString(23, customer3_id[0]);
            ps.setString(24, customer3_id[1]);
            ps.setString(25, customer3_id[2]);
            ps.setString(26, customer3_id[3]);
            ps.setString(27, customer3_id[4]);
            ps.setString(28, customer4_id[0]);
            ps.setString(29, customer4_id[1]);
            ps.setString(30, customer4_id[2]);
            ps.setString(31, customer4_id[3]);
            ps.setString(32, customer4_id[4]);

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
}
