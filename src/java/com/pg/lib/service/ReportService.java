/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCReportDetailsProduct;
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
            sql = "SELECT * FROM MIZUNONEWBARBOXDT a INNER JOIN MIZUNOCUSTOMER b ON a.SKU_ITEM1= b.CUSTOMER_NO OR a.SKU_ITEM2= b.CUSTOMER_NO OR a.SKU_ITEM3= b.CUSTOMER_NO OR a.SKU_ITEM4= b.CUSTOMER_NO WHERE  " +
                    "b.CUSTOMER_NO LIKE  '%" + customer_no + "' and  " +
                    "b.CUSTOMER_PRODUCT LIKE  '%" + customer_product + "' " +
                    "and a.PALLET LIKE '%" + pallet + "' " +
                    "and a.BOXNO in (";
            for (int n = Integer.parseInt(start); n < Integer.parseInt(end) + 1; n++) {
                String num = firstdigit + String.valueOf(n);
                if (n < Integer.parseInt(end)) {
                    sql += "'" + num + "',";
                } else {
                    sql += "'" + num + "')";
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return sql;
    }

    public List<BCReportDetailsProduct> listreportproductdetails(String customer_no, String customer_product, String pallet, String start, String end, String firstdigit) throws SQLException {
        List<BCReportDetailsProduct> list = new ArrayList<BCReportDetailsProduct>();

        try {
            String sql = sqllistreportproductdetails(customer_no, customer_product, pallet, start, end, firstdigit);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCReportDetailsProduct report = new BCReportDetailsProduct();
                report.setDate(rs.getString("date_modify"));
                report.setPo(rs.getString("po"));
                report.setProd_order(rs.getString("prod_order"));
                report.setQty(rs.getString(""));
                report.setMark(rs.getString(""));


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
