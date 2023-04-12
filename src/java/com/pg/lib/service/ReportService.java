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
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class ReportService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private String sqllistreportdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) {
        String sql = "";
        try {
            if (firstdigit.equals("") || start.equals("") || end.equals("")) {
                sql = "select b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') as DATE_MODIFY,a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                        "where  NVL(a.PROD_ORDER ,'NULL')  LIKE '%" + prodorder + "' and NVL(a.PO  ,'NULL') LIKE '%" + po + "' and NVL(a.SHIPTO  ,'NULL') LIKE '%" + SHIPTO + "'  and  NVL(a.DESTINATION  ,'NULL') LIKE '%" + DESTINATION + "' and NVL(a.PO_OLD ,'NULL') LIKE '%" + po_old + "'  and NVL(a.PALLET  ,'NULL') LIKE '%" + pallet + "' and NVL(b.customer_no  ,'NULL')  LIKE '%" + customer_no + "'  and  NVL(b.customer_product  ,'NULL')  LIKE  '%" + customer_product + "'  ";
            } else {
                sql = "select b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') as DATE_MODIFY,a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                        "where  NVL(a.PROD_ORDER ,'NULL')  LIKE '%" + prodorder + "' and NVL(a.PO  ,'NULL') LIKE '%" + po + "' and NVL(a.SHIPTO  ,'NULL') LIKE '%" + SHIPTO + "'  and  NVL(a.DESTINATION  ,'NULL') LIKE '%" + DESTINATION + "' and NVL(a.PO_OLD ,'NULL') LIKE '%" + po_old + "'  and NVL(a.PALLET  ,'NULL') LIKE '%" + pallet + "' and NVL(b.customer_no  ,'NULL')  LIKE '%" + customer_no + "'  and  NVL(b.customer_product  ,'NULL')  LIKE  '%" + customer_product + "' and a.boxno in (";

                for (int n = Integer.parseInt(start); n < Integer.parseInt(end) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(end)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "')";
                    }
                }
            }
            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";

            System.out.println(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            String sql = sqllistreportdetailinventories(prodorder, SHIPTO, DESTINATION, po, po_old, customer_no, customer_product, pallet, start, end, firstdigit);
            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setDate_modify(rs.getString("DATE_MODIFY"));
                report.setPo(rs.getString("po"));
                report.setPo_old(rs.getString("po_old"));
                report.setPallet(rs.getString("pallet"));
                report.setProdorder(rs.getString("prod_order"));
                report.setBoxno(rs.getString("boxno"));
                report.setQty_result1(rs.getString("qty_result1"));
                report.setQty_result2(rs.getString("qty_result2"));
                report.setQty_result3(rs.getString("qty_result3"));
                report.setQty_result4(rs.getString("qty_result4"));
                report.setSku_item1(rs.getString("sku_item1"));
                report.setSku_item2(rs.getString("sku_item2"));
                report.setSku_item3(rs.getString("sku_item3"));
                report.setSku_item4(rs.getString("sku_item4"));
                report.setCustomer_product(rs.getString("customer_product"));
                report.setQty1(rs.getString("qty1"));
                report.setQty2(rs.getString("qty2"));
                report.setQty3(rs.getString("qty3"));
                report.setQty4(rs.getString("qty4"));
                report.setCustomer_no(rs.getString("customer_no"));
                report.setCustomer_product(rs.getString("customer_product"));
                list.add(report);
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

    private String sqllistreportproductdetails(String po, String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) {
        String sql = "";
        try {
            if (firstdigit.equals("") || start.equals("") || end.equals("")) {
                sql = "select b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') as DATE_MODIFY,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                        "where  NVL(a.PO  ,'NULL') LIKE '%" + po + "'  and  NVL(a.PALLET ,'NULL')  LIKE '%" + pallet + "' and NVL(b.customer_no ,'NULL') LIKE '%" + customer_no + "' and  NVL(b.customer_product ,'NULL')   LIKE '%" + customer_product + "' ";
            } else {
                sql = "select b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') as DATE_MODIFY,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                        "where  NVL(a.PO  ,'NULL') LIKE '%" + po + "'  and  NVL(a.PALLET ,'NULL')  LIKE '%" + pallet + "' and NVL(b.customer_no ,'NULL') LIKE '%" + customer_no + "' and  NVL(b.customer_product ,'NULL')   LIKE '%" + customer_product + "' and a.boxno in (";
                for (int n = Integer.parseInt(start); n < Integer.parseInt(end) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(end)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "')";
                    }
                }
            }
            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportproductdetails(String po, String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            String sql = sqllistreportproductdetails(po, customer_no, customer_product, pallet, start, end, firstdigit);
            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setDate_modify(rs.getString("DATE_MODIFY"));
                report.setPo(rs.getString("po"));
                report.setProdorder(rs.getString("prod_order"));
                report.setBoxno(rs.getString("boxno"));
                report.setQty_result1(rs.getString("qty_result1"));
                report.setQty_result2(rs.getString("qty_result2"));
                report.setQty_result3(rs.getString("qty_result3"));
                report.setQty_result4(rs.getString("qty_result4"));
                report.setSku_item1(rs.getString("sku_item1"));
                report.setSku_item2(rs.getString("sku_item2"));
                report.setSku_item3(rs.getString("sku_item3"));
                report.setSku_item4(rs.getString("sku_item4"));
                report.setCustomer_product(rs.getString("customer_product"));
                report.setQty1(rs.getString("qty1"));
                report.setQty2(rs.getString("qty2"));
                report.setQty3(rs.getString("qty3"));
                report.setQty4(rs.getString("qty4"));
                report.setCustomer_no(rs.getString("customer_no"));
                report.setPallet(rs.getString("pallet"));
                list.add(report);
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

    private String sqlreportviewpo(String customer, String customer_no, String customer_product) {
        String sql = "";
        try {

            sql = "select TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,a.PO from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                    "where NVL(a.SHIPTO,'NULL')  LIKE '%" + customer + "' and NVL(b.customer_no ,'NULL') LIKE '%" + customer_no + "' and  NVL(b.customer_product ,'NULL')   LIKE '%" + customer_product + "' ";
            sql += " GROUP BY c.DATE_CREATE,a.PO order by a.PO ";

          
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportviewpo(String customer, String customer_no, String customer_product) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            String sql = sqlreportviewpo(customer, customer_no, customer_product);
            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setDate_create(rs.getString("DATE_CREATE"));
                report.setPo(rs.getString("po"));

                list.add(report);
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
}
