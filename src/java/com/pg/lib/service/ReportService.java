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
import javax.naming.NamingException;

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

    public int getTotalRecords(String customer, String customer_no, String customer_product, String datestart, String dateend) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "select count(*) from (";
            sql += "select rownum as rnum,x.* from (";
            sql += "SELECT a.PO,a.FIRSTDIGIT,a.DATE_CREATE,a.STARTBOX,a.ENDBOX ";
            sql += "FROM MIZUNONEWBARBOXHD a ";
            sql += "INNER JOIN MIZUNOCUSTOMER b ";
            sql += "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  ";
            sql += "WHERE NVL(a.SHIPTO,'NULL') LIKE ? AND NVL(b.customer_no ,'NULL') LIKE ? AND NVL(b.customer_product ,'NULL') LIKE ?  ";
            if (!datestart.equals("") || !dateend.equals("")) {
                sql += " and a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') ";
            }

            sql += " GROUP BY  a.PO,a.FIRSTDIGIT,a.DATE_CREATE,a.STARTBOX,a.ENDBOX   ";


            sql += ")x) ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + customer + "%");
            ps.setString(2, "%" + customer_no + "%");
            ps.setString(3, "%" + customer_product + "%");
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

    public int getFilteredRecords(String customer, String customer_no, String customer_product, String datestart, String dateend, String searchValue) throws ClassNotFoundException, SQLException, NamingException {
        int filteredRecords = 0;
        try {
            String sql = "select count(*) from (";
            sql += "select rownum as rnum,x.* from (";
            sql += "SELECT a.PO,a.FIRSTDIGIT,a.DATE_CREATE,a.STARTBOX,a.ENDBOX ";
            sql += "FROM MIZUNONEWBARBOXHD a ";
            sql += "INNER JOIN MIZUNOCUSTOMER b ";
            sql += "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  ";
            sql += "WHERE NVL(a.SHIPTO,'NULL') LIKE ? AND NVL(b.customer_no ,'NULL') LIKE ? AND NVL(b.customer_product ,'NULL') LIKE ?  ";
            if (!datestart.equals("") || !dateend.equals("")) {
                sql += " and a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') ";
            }
            sql += " and (PO like ? or  startbox like ? or endbox like ? or FIRSTDIGIT like ? ) ";
            sql += " GROUP BY  a.PO,a.FIRSTDIGIT,a.DATE_CREATE,a.STARTBOX,a.ENDBOX   ";


            sql += ")x) ";


            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            if (!datestart.equals("") || !dateend.equals("")) {
                ps.setString(1, "%" + customer + "%");
                ps.setString(2, "%" + customer_no + "%");
                ps.setString(3, "%" + customer_product + "%");
                ps.setString(4, datestart);
                ps.setString(5, dateend);
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");

            } else {
                ps.setString(1, "%" + customer + "%");
                ps.setString(2, "%" + customer_no + "%");
                ps.setString(3, "%" + customer_product + "%");
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");

            }

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

    public List<BCDetailBox> listreportviewpo(
            String customer, String customer_no, String customer_product, String datestart, String dateend,
            int start, int length, String searchValue, String orderColumn, String orderDir)
            throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();
        String sql = "";
        try {
            sql += "select * from (";
            sql += "select rownum as rnum,x.* from (";
            sql += "SELECT a.PO,a.FIRSTDIGIT,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,a.STARTBOX,a.ENDBOX ";
            sql += "FROM MIZUNONEWBARBOXHD a ";
            sql += "INNER JOIN MIZUNOCUSTOMER b ";
            sql += "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  ";
            sql += "WHERE NVL(a.SHIPTO,'NULL') LIKE ? AND NVL(b.customer_no ,'NULL') LIKE ? AND NVL(b.customer_product ,'NULL') LIKE ?  ";
            if (!datestart.equals("") || !dateend.equals("")) {
                sql += " and a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') ";
            }
            sql += " and (PO like ? or  startbox like ? or endbox like ? or FIRSTDIGIT like ? ) ";
            sql += " GROUP BY  a.PO,a.FIRSTDIGIT,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS'),a.STARTBOX,a.ENDBOX   ";

            String[] columns = {"PO", "FIRSTDIGIT", "STARTBOX", "ENDBOX", "DATE_CREATE"};
            if (orderColumn != null && !orderColumn.isEmpty()) {
               // sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
                 sql += " ORDER BY a.PO,a.FIRSTDIGIT,LPAD(a.startbox, 10) ";
            } else {
                sql += " ORDER BY a.PO,a.FIRSTDIGIT,LPAD(a.startbox, 10) ";
            }
            sql += ")x) where rnum BETWEEN ? AND ?";

            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);

            if (!datestart.equals("") || !dateend.equals("")) {
                ps.setString(1, "%" + customer + "%");
                ps.setString(2, "%" + customer_no + "%");
                ps.setString(3, "%" + customer_product + "%");
                ps.setString(4, datestart);
                ps.setString(5, dateend);
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");

                ps.setInt(10, start);
                ps.setInt(11, length + start);
            } else {
                ps.setString(1, "%" + customer + "%");
                ps.setString(2, "%" + customer_no + "%");
                ps.setString(3, "%" + customer_product + "%");
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");

                ps.setInt(8, start);
                ps.setInt(9, length + start);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setBoxno(rs.getString("rnum"));
                report.setPo(rs.getString("po"));
                report.setStartbox(rs.getString("STARTBOX"));
                report.setEndbox(rs.getString("ENDBOX"));
                report.setDate_create(rs.getString("DATE_CREATE"));
                report.setFirstdigit(rs.getString("firstdigit"));

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
