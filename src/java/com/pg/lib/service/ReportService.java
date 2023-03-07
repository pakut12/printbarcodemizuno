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

    private String sqllistreportproductdetails(String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) {
        String sql = "";
        try {
            if (firstdigit.equals("") || start.equals("") || end.equals("")) {
                sql = "select c.DATE_MODIFY,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                      "where a.PALLET LIKE '%" + pallet + "' and b.customer_no LIKE '%" + customer_no + "' and b.customer_product LIKE '%" + customer_product + "'";
            } else {
                sql = "select c.DATE_MODIFY,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 " +
                        "where a.PALLET LIKE '%" + pallet + "' and b.customer_no LIKE '%" + customer_no + "' and b.customer_product LIKE '%" + customer_product + "' and a.boxno in (";
                for (int n = Integer.parseInt(start); n < Integer.parseInt(end) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(end)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "')";
                    }
                }
            }
           sql += " order by CAST(substr(boxno,2) as int)";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportproductdetails(String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            String sql = sqllistreportproductdetails(customer_no, customer_product, pallet, start, end, firstdigit);
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
