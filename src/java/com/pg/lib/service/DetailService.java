/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.utility.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class DetailService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private String SqlDetailBoxForPrint(String po, String start, String end) {

        int boxstart = Integer.parseInt(start.substring(1));
        int boxend = Integer.parseInt(end.substring(1));
        String letter = end.substring(0, 1);

        String sql = "select * from MIZUNONEWBARBOXDT where po = '" + po + "' and boxno in (";

        for (int n = boxstart; n < boxend + 1; n++) {
            String num = letter + String.valueOf(n);
            if (n < boxend) {
                sql += "'" + num + "',";
            } else {
                sql += "'" + num + "')";
            }
        }
        return sql;
    }

    public List<BCDetailBox> GetDetailBoxForPrint(String po, String start, String end) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList();
        try {
            String sql = SqlDetailBoxForPrint(po, start, end);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox box = new BCDetailBox();
                box.setPo(rs.getString("po"));
                box.setShipfrom(rs.getString("shipfrom"));
                box.setShipto(rs.getString("shipto"));
                box.setQtyperbox(rs.getString("qtyperbox"));
                box.setGrossweight(rs.getString("grossweight"));
                box.setNetweight(rs.getString("netweight"));
                box.setCountry_origin(rs.getString("country_origin"));
                box.setAllbox(rs.getString("boxall"));
                box.setBoxno(rs.getString("boxno"));
                box.setSku_item1(rs.getString("sku_item1"));
                box.setUpc_code1(rs.getString("upc_code1"));
                box.setQty1(rs.getString("qty1"));
                box.setSizen01(rs.getString("sizeno1"));
                box.setColorn01(rs.getString("colorno1"));
                box.setDesctxt(rs.getString("desctxt"));
                box.setSku_item2(rs.getString("sku_item2"));
                box.setUpc_code2(rs.getString("upc_code2"));
                box.setQty2(rs.getString("qty2"));
                box.setSizen02(rs.getString("sizeno2"));
                box.setColorn02(rs.getString("colorno2"));
                box.setSku_item3(rs.getString("sku_item3"));
                box.setUpc_code3(rs.getString("upc_code3"));
                box.setQty3(rs.getString("qty3"));
                box.setSizen03(rs.getString("sizeno3"));
                box.setColorn03(rs.getString("colorno3"));
                box.setSku_item4(rs.getString("sku_item4"));
                box.setUpc_code4(rs.getString("upc_code4"));
                box.setQty4(rs.getString("qty4"));
                box.setSizen04(rs.getString("sizeno4"));
                box.setColorn04(rs.getString("colorno4"));
                box.setSfaddress1(rs.getString("sfaddress1"));
                box.setSfaddress2(rs.getString("sfaddress2"));
                box.setSfaddress3(rs.getString("sfaddress3"));
                box.setSfaddress4(rs.getString("sfaddress4"));
                box.setStaddress1(rs.getString("staddress1"));
                box.setStaddress2(rs.getString("staddress2"));
                box.setStaddress3(rs.getString("staddress3"));
                box.setStaddress4(rs.getString("staddress4"));
                box.setStatusshoot(rs.getString("statusshoot"));
                listbox.add(box);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return listbox;
    }

    public Boolean DeleteDetailBox(String PO, String BOXNO) throws SQLException {
        Boolean status = false;
        try {
            String sql = "DELETE FROM MIZUNONEWBARBOXDT WHERE PO = ? AND BOXNO = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, PO);
            ps.setString(2, BOXNO);
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

    public Boolean UpdateDetailBox(
            String BOXALL, String SHIPFROM, String SFADDRESS1, String SFADDRESS2, String SFADDRESS3, String SFADDRESS4,
            String SHIPTO, String STADDRESS1, String STADDRESS2, String STADDRESS3, String STADDRESS4, String QTYPERBOX, String DESCTXT,
            String GROSSWEIGHT, String NETWEIGHT, String COUNTRY_ORIGIN,
            String SKU_ITEM1, String UPC_CODE1, String COLORNO1, String SIZENO1, String QTY1,
            String SKU_ITEM2, String UPC_CODE2, String COLORNO2, String SIZENO2, String QTY2,
            String SKU_ITEM3, String UPC_CODE3, String COLORNO3, String SIZENO3, String QTY3,
            String SKU_ITEM4, String UPC_CODE4, String COLORNO4, String SIZENO4, String QTY4,
            String PO, String BOXNO) throws SQLException {

        Boolean status = false;

        try {
            String sql = "UPDATE MIZUNONEWBARBOXDT SET " +
                    "BOXALL = ?," +
                    "SHIPFROM = ?," +
                    "SFADDRESS1 = ?," +
                    "SFADDRESS2 = ?," +
                    "SFADDRESS3 = ?," +
                    "SFADDRESS4 = ?," +
                    "SHIPTO = ?," +
                    "STADDRESS1 = ?," +
                    "STADDRESS2 = ?," +
                    "STADDRESS3 = ?," +
                    "STADDRESS4 = ?," +
                    "QTYPERBOX  = ?," +
                    "DESCTXT  = ?," +
                    "GROSSWEIGHT  = ?," +
                    "NETWEIGHT  = ?," +
                    "COUNTRY_ORIGIN  = ?," +
                    "SKU_ITEM1  = ?," +
                    "UPC_CODE1  = ?," +
                    "COLORNO1  = ?," +
                    "SIZENO1  = ?," +
                    "QTY1  = ?," +
                    "SKU_ITEM2  = ?," +
                    "UPC_CODE2  = ?," +
                    "COLORNO2  = ?," +
                    "SIZENO2  = ?," +
                    "QTY2  = ?," +
                    "SKU_ITEM3  = ?," +
                    "UPC_CODE3  = ?," +
                    "COLORNO3  = ?," +
                    "SIZENO3  = ?," +
                    "QTY3  = ?," +
                    "SKU_ITEM4  = ?," +
                    "UPC_CODE4  = ?," +
                    "COLORNO4  = ?," +
                    "SIZENO4  = ?," +
                    "QTY4  = ?," +
                    "STATUSSHOOT  = ?" +
                    "WHERE PO = ? AND BOXNO = ?";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, BOXALL);
            ps.setString(2, "TSG");
            ps.setString(3, GetAddress("TSG").get("address1"));
            ps.setString(4, GetAddress("TSG").get("address2"));
            ps.setString(5, GetAddress("TSG").get("address3"));
            ps.setString(6, GetAddress("TSG").get("address4"));
            ps.setString(7, SHIPTO);
            ps.setString(8, GetAddress(SHIPTO).get("address1"));
            ps.setString(9, GetAddress(SHIPTO).get("address2"));
            ps.setString(10, GetAddress(SHIPTO).get("address3"));
            ps.setString(11, GetAddress(SHIPTO).get("address4"));
            ps.setString(12, QTYPERBOX);
            ps.setString(13, DESCTXT);
            ps.setString(14, GROSSWEIGHT);
            ps.setString(15, NETWEIGHT);
            ps.setString(16, COUNTRY_ORIGIN);
            ps.setString(17, SKU_ITEM1);
            ps.setString(18, UPC_CODE1);
            ps.setString(19, COLORNO1);
            ps.setString(20, SIZENO1);
            ps.setString(21, QTY1);
            ps.setString(22, SKU_ITEM2);
            ps.setString(23, UPC_CODE2);
            ps.setString(24, COLORNO2);
            ps.setString(25, SIZENO2);
            ps.setString(26, QTY2);
            ps.setString(27, SKU_ITEM3);
            ps.setString(28, UPC_CODE3);
            ps.setString(29, COLORNO3);
            ps.setString(30, SIZENO3);
            ps.setString(31, QTY3);
            ps.setString(32, SKU_ITEM4);
            ps.setString(33, UPC_CODE4);
            ps.setString(34, COLORNO4);
            ps.setString(35, SIZENO4);
            ps.setString(36, QTY4);
            ps.setString(37, "N");
            ps.setString(38, PO);
            ps.setString(39, BOXNO);
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

    public List<BCDetailBox> GetDetailBox(String posearch, String numstart) throws SQLException {

        List<BCDetailBox> listdetail = new ArrayList<BCDetailBox>();

        try {
            String sql = "SELECT * FROM MIZUNONEWBARBOXDT WHERE PO = ? AND BOXNO = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, posearch);
            ps.setString(2, numstart);
            rs = ps.executeQuery();

            while (rs.next()) {

                BCDetailBox box = new BCDetailBox();
                box.setPo(rs.getString("po"));


                box.setShipfrom(rs.getString("shipfrom"));
                box.setShipto(rs.getString("shipto"));
                box.setQtyperbox(rs.getString("qtyperbox"));

                box.setGrossweight(rs.getString("grossweight"));
                box.setNetweight(rs.getString("netweight"));
                box.setCountry_origin(rs.getString("country_origin"));
                box.setAllbox(rs.getString("boxall"));
                box.setBoxno(rs.getString("boxno"));
                box.setSku_item1(rs.getString("sku_item1"));
                box.setUpc_code1(rs.getString("upc_code1"));
                box.setQty1(rs.getString("qty1"));
                box.setSizen01(rs.getString("sizeno1"));
                box.setColorn01(rs.getString("colorno1"));
                box.setDesctxt(rs.getString("desctxt"));
                box.setSku_item2(rs.getString("sku_item2"));
                box.setUpc_code2(rs.getString("upc_code2"));
                box.setQty2(rs.getString("qty2"));
                box.setSizen02(rs.getString("sizeno2"));
                box.setColorn02(rs.getString("colorno2"));

                box.setSku_item3(rs.getString("sku_item3"));
                box.setUpc_code3(rs.getString("upc_code3"));
                box.setQty3(rs.getString("qty3"));
                box.setSizen03(rs.getString("sizeno3"));
                box.setColorn03(rs.getString("colorno3"));

                box.setSku_item4(rs.getString("sku_item4"));
                box.setUpc_code4(rs.getString("upc_code4"));
                box.setQty4(rs.getString("qty4"));
                box.setSizen04(rs.getString("sizeno4"));
                box.setColorn04(rs.getString("colorno4"));

                box.setSfaddress1(rs.getString("sfaddress1"));
                box.setSfaddress2(rs.getString("sfaddress2"));
                box.setSfaddress3(rs.getString("sfaddress3"));
                box.setSfaddress4(rs.getString("sfaddress4"));
                box.setStaddress1(rs.getString("staddress1"));
                box.setStaddress2(rs.getString("staddress2"));
                box.setStaddress3(rs.getString("staddress3"));
                box.setStaddress4(rs.getString("staddress4"));
                box.setStatusshoot(rs.getString("statusshoot"));

                listdetail.add(box);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listdetail;
    }

    private String SQLDeleteDetailBoxMIZUNONEWBARBOXDTAll(String PO, String firstdigit, String startbox, String endbox) throws SQLException {
        String sql = "DELETE FROM MIZUNONEWBARBOXDT WHERE PO = '" + PO + "' and BOXNO in (";

        for (int s = Integer.parseInt(startbox); s < Integer.parseInt(endbox) + 1; s++) {
            if (s < Integer.parseInt(endbox)) {
                sql += "'" + firstdigit + String.valueOf(s) + "',";
            } else {
                sql += "'" + firstdigit + String.valueOf(s) + "')";
            }
        }

        return sql;
    }

    public Boolean DeleteDetailBoxMIZUNONEWBARBOXDTAll(String PO, String firstdigit, String startbox, String endbox) throws SQLException {
        Boolean status = false;
        try {
            String sql = SQLDeleteDetailBoxMIZUNONEWBARBOXDTAll(PO, firstdigit, startbox, endbox);
    

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

    public Boolean DeleteDetailBoxMIZUNONEWBARBOXHDAll(String PO, String firstdigit, String startbox, String endbox) throws SQLException {
        Boolean status = false;
        try {
            String sql = "DELETE FROM MIZUNONEWBARBOXHD WHERE PO = ? and firstdigit = ? and startbox = ? and endbox = ? ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, PO);
            ps.setString(2, firstdigit);
            ps.setString(3, startbox);
            ps.setString(4, endbox);

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

    public Boolean UpdateDetailBoxAll(String pobefore, String startboxbefore, String endboxbefore, String shipto, String qtyperbox, String firstdigit, String startbox, String endbox, String allbox, String po, String desctxt, String grossweight, String netweight, String country_origin, String sku_item1, String upc_code1, String colorno1, String sizeno1, String qty1, String sku_item2, String upc_code2, String colorno2, String sizeno2, String qty2, String sku_item3, String upc_code3, String colorno3, String sizeno3, String qty3, String sku_item4, String upc_code4, String colorno4, String sizeno4, String qty4, String pallet, String prodorder) throws SQLException {

        Boolean status = false;

        try {
            String sql = "update MIZUNONEWBARBOXHD set allbox =  ?,FIRSTDIGIT = ?,SHIPFROM = ?,SHIPTO = ?,QTYPERBOX  = ?,DESCTXT  = ?,GROSSWEIGHT  = ?,NETWEIGHT  = ?,COUNTRY_ORIGIN  = ?,SKU_ITEM1  = ?,UPC_CODE1  = ?,COLORNO1  = ?,SIZENO1  = ?,QTY1  = ?,SKU_ITEM2  = ?,UPC_CODE2  = ?,COLORNO2  = ?,SIZENO2  = ?,QTY2  = ?,SKU_ITEM3  = ?,UPC_CODE3  = ?,COLORNO3  = ?,SIZENO3  = ?,QTY3  = ?,SKU_ITEM4  = ?,UPC_CODE4  = ?,COLORNO4  = ?,SIZENO4  = ?,QTY4  = ?,PO = ? ,STARTBOX = ? ,ENDBOX = ? ,pallet = ? ,prod_order = ?  WHERE PO = ? AND STARTBOX = ? AND ENDBOX = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, allbox);
            ps.setString(2, firstdigit);
            ps.setString(3, "TSG");
            ps.setString(4, shipto);
            ps.setString(5, qtyperbox);
            ps.setString(6, desctxt);
            ps.setString(7, grossweight);
            ps.setString(8, netweight);
            ps.setString(9, country_origin);
            ps.setString(10, sku_item1);
            ps.setString(11, upc_code1);
            ps.setString(12, colorno1);
            ps.setString(13, sizeno1);
            ps.setString(14, qty1);
            ps.setString(15, sku_item2);
            ps.setString(16, upc_code2);
            ps.setString(17, colorno2);
            ps.setString(18, sizeno2);
            ps.setString(19, qty2);
            ps.setString(20, sku_item3);
            ps.setString(21, upc_code3);
            ps.setString(22, colorno3);
            ps.setString(23, sizeno3);
            ps.setString(24, qty3);
            ps.setString(25, sku_item4);
            ps.setString(26, upc_code4);
            ps.setString(27, colorno4);
            ps.setString(28, sizeno4);
            ps.setString(29, qty4);
            ps.setString(30, po);
            ps.setString(31, startbox);
            ps.setString(32, endbox);
            ps.setString(33, pallet);
            ps.setString(34, prodorder);
            ps.setString(35, pobefore);
            ps.setString(36, startboxbefore);
            ps.setString(37, endboxbefore);

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

    public List<BCDetailBox> GetDetailBoxAll(String PO, String STARTBOX, String ENDBOX, String firstdigit) throws SQLException {

        List<BCDetailBox> listdetail = new ArrayList<BCDetailBox>();

        try {
            String sql = "SELECT * FROM MIZUNONEWBARBOXHD WHERE PO = ? AND STARTBOX = ? AND ENDBOX = ? AND firstdigit = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, PO);
            ps.setString(2, STARTBOX);
            ps.setString(3, ENDBOX);
            ps.setString(4, firstdigit);
            rs = ps.executeQuery();

            while (rs.next()) {

                BCDetailBox box = new BCDetailBox();
                box.setPo(rs.getString("po"));
                box.setStartbox(rs.getString("startbox"));
                box.setEndbox(rs.getString("endbox"));
                box.setFirstdigit(rs.getString("firstdigit"));
                box.setShipfrom(rs.getString("shipfrom"));
                box.setShipto(rs.getString("shipto"));
                box.setQtyperbox(rs.getString("qtyperbox"));
                box.setDesctxt(rs.getString("desctxt"));
                box.setGrossweight(rs.getString("grossweight"));
                box.setNetweight(rs.getString("netweight"));
                box.setCountry_origin(rs.getString("country_origin"));
                box.setAllbox(rs.getString("allbox"));
                box.setSku_item1(rs.getString("sku_item1"));
                box.setUpc_code1(rs.getString("upc_code1"));
                box.setQty1(rs.getString("qty1"));
                box.setSizen01(rs.getString("sizeno1"));
                box.setColorn01(rs.getString("colorno1"));

                box.setSku_item2(rs.getString("sku_item2"));
                box.setUpc_code2(rs.getString("upc_code2"));
                box.setQty2(rs.getString("qty2"));
                box.setSizen02(rs.getString("sizeno2"));
                box.setColorn02(rs.getString("colorno2"));

                box.setSku_item3(rs.getString("sku_item3"));
                box.setUpc_code3(rs.getString("upc_code3"));
                box.setQty3(rs.getString("qty3"));
                box.setSizen03(rs.getString("sizeno3"));
                box.setColorn03(rs.getString("colorno3"));

                box.setSku_item4(rs.getString("sku_item4"));
                box.setUpc_code4(rs.getString("upc_code4"));
                box.setQty4(rs.getString("qty4"));
                box.setSizen04(rs.getString("sizeno4"));
                box.setColorn04(rs.getString("colorno4"));

                box.setPallet(rs.getString("pallet"));
                box.setProdorder(rs.getString("prod_order"));

                listdetail.add(box);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listdetail;
    }

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

    private String SqlAddDataToMIZUNONEWBARBOXDT(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id, String pallet, String prodorder) {
        String sql = "INSERT ALL ";
        try {
            for (int n = Integer.parseInt(numberbox_start); n < Integer.parseInt(numberbox_end) + 1; n++) {
                sql += " INTO MIZUNONEWBARBOXDT (PO,BOXNO,BOXALL,SHIPFROM,SFADDRESS1,SFADDRESS2,SFADDRESS3,SFADDRESS4,SHIPTO,STADDRESS1,STADDRESS2,STADDRESS3,STADDRESS4,QTYPERBOX,DESCTXT,GROSSWEIGHT,NETWEIGHT,COUNTRY_ORIGIN,SKU_ITEM1,UPC_CODE1,COLORNO1,SIZENO1,QTY1,SKU_ITEM2,UPC_CODE2,COLORNO2,SIZENO2,QTY2,SKU_ITEM3,UPC_CODE3,COLORNO3,SIZENO3,QTY3,SKU_ITEM4,UPC_CODE4,COLORNO4,SIZENO4,QTY4,PALLET,PROD_ORDER,STATUSSHOOT) VALUES (";
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
                sql += "'" + pallet + "',";
                sql += "'" + prodorder + "',";
                sql += "'N')";
            }
            sql += " SELECT * FROM dual";
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sql;
    }

    public Boolean AddDataToMIZUNONEWBARBOXDT(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id, String pallet, String prodorder) throws SQLException {
        Boolean status = false;

        try {
            String sql = SqlAddDataToMIZUNONEWBARBOXDT(customer_num, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id, pallet, prodorder);

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

    public Boolean AddDataToMIZUNONEWBARBOXHD(String customer_num, String quantity_box, String initial, String numberbox_start, String numberbox_end, String po, String gw, String nw, String country, String quantitytotal_box, String description, String[] customer1_id, String[] customer2_id, String[] customer3_id, String[] customer4_id, String pallet, String prodorder) throws SQLException {
        Boolean status = false;

        try {
            String sql = "INSERT INTO MIZUNONEWBARBOXHD (PO,FIRSTDIGIT,STARTBOX,ENDBOX,ALLBOX,SHIPFROM,SHIPTO,QTYPERBOX,DESCTXT,GROSSWEIGHT,NETWEIGHT,COUNTRY_ORIGIN,SKU_ITEM1,UPC_CODE1,COLORNO1,SIZENO1,QTY1,SKU_ITEM2,UPC_CODE2,COLORNO2,SIZENO2,QTY2,SKU_ITEM3,UPC_CODE3,COLORNO3,SIZENO3,QTY3,SKU_ITEM4,UPC_CODE4,COLORNO4,SIZENO4,QTY4,PALLET,PROD_ORDER) " +
                    "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            ps.setString(33, pallet);
            ps.setString(34, prodorder);
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
