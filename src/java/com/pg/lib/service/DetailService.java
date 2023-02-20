/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.utility.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pakutsing
 */
public class DetailService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public Boolean AddDataToMIZUNONEWBARBOXHD(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id) throws SQLException {
        Boolean status = true;

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
