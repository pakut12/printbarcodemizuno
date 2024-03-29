/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;

import com.pg.lib.model.BCUser;
import com.pg.lib.utility.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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

    public List<BCDetailBox> getsumdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String startbox, String endbox, String firstdigit, String start, String end, String searchValue, String datestart, String datestop, String orderColumn, String orderDir) throws ClassNotFoundException, SQLException, NamingException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();
        try {

            String sql = "";

            sql += " select * from ( ";
            sql += " SELECT ROWNUM as rnum, a.* ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1, a.QTY2,a.QTY3,a.QTY4, b.CUSTOMER_PRODUCT, a.PALLET, TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE,TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS') AS DATE_MODIFY,a.PO, ";
            sql += "  a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1, c.qty_result2, c.qty_result3,c.qty_result4 ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += "  INNER JOIN MIZUNONEWBARBOXRESULT c ON (c.po = a.po AND c.boxno = a.boxno) ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON (b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4) ";
            sql += "  WHERE  ";
            sql += " (a.boxno  LIKE upper('%" + searchValue + "%') or a.PROD_ORDER  LIKE upper('%" + searchValue + "%') or a.PO LIKE upper('%" + searchValue + "%') or a.SHIPTO LIKE upper('%" + searchValue + "%')  or  a.DESTINATION  LIKE upper('%" + searchValue + "%') or a.PO_OLD LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%')  or b.customer_product  LIKE  upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') ) ";

            if (!firstdigit.equals("") || !startbox.equals("") || !endbox.equals("")) {
                sql += " and a.boxno in (";
                for (int n = Integer.parseInt(startbox); n < Integer.parseInt(endbox) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(endbox)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') ";
                    }
                }
            }

            if (!prodorder.equals("")) {
                sql += " and a.PROD_ORDER = '" + prodorder + "'  ";
            }

            if (!po.equals("")) {
                sql += " and  a.PO = '" + po + "'  ";
            }

            if (!SHIPTO.equals("")) {
                sql += " and  a.SHIPTO = '" + SHIPTO + "'   ";
            }

            if (!DESTINATION.equals("")) {
                sql += " and  a.DESTINATION = '" + DESTINATION + "'  ";
            }

            if (!po_old.equals("")) {
                sql += " and  a.PO_OLD = '" + po_old + "'  ";
            }

            if (!pallet.equals("")) {
                sql += " and  a.PALLET = '" + pallet + "'   ";
            }

            if (!customer_no.equals("")) {
                sql += " and  b.customer_no  = '" + customer_no + "'  ";
            }

            if (!customer_product.equals("")) {
                sql += " and  b.customer_product  = '" + customer_product + "' ";
            }

            if (!datestart.equals("") && !datestop.equals("")) {
                sql += " and  a.DATE_CREATE  between TO_DATE('" + datestart + "', 'yyyy/mm/dd') and TO_DATE('" + datestop + "', 'yyyy/mm/dd') ";
            }

            sql += " GROUP BY ";
            sql += "  a.USER_CREATE,a.USER_EDIT,b.customer_no, a.QTY1,a.QTY2,a.QTY3, a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'),TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO, c.qty_result1, c.qty_result2,c.qty_result3,c.qty_result4 ";
            sql += "  ORDER BY ";
            sql += "  a.PO, b.customer_no,CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+') AS INT) ";

            sql += " ) a  ) ";


            String[] columns = {"PO", "PO_OLD", "SKU_ITEM1,SKU_ITEM2,SKU_ITEM3,SKU_ITEM4", "CUSTOMER_PRODUCT", "PROD_ORDER", "PALLET", "REGEXP_SUBSTR(BOXNO, '[[:alpha:]]+') ,CAST(REGEXP_SUBSTR(BOXNO, '\\d+') AS INT) ", "qty1, qty2,qty3,qty4 ", "qty_result1, qty_result2,qty_result3,qty_result4 ", "DATE_CREATE", "DATE_MODIFY", "DATE_CREATE", "DATE_MODIFY",};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }
            System.out.println(sql);


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setDate_create(rs.getString("DATE_CREATE"));
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

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return list;
    }

    public int getFilteredRecordsdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String startbox, String endbox, String firstdigit, int start, int end, String searchValue, String datestart, String datestop) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "";
            sql += " SELECT ROWNUM, a.* ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.GROSSWEIGHT,a.NETWEIGHT,a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1, a.QTY2,a.QTY3,a.QTY4, b.CUSTOMER_PRODUCT, a.PALLET, TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE,a.PO, ";
            sql += " a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1, c.qty_result2, c.qty_result3,c.qty_result4 ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += "  INNER JOIN MIZUNONEWBARBOXRESULT c ON (c.po = a.po AND c.boxno = a.boxno) ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON (b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4) ";
            sql += "  WHERE  ";
            sql += " (a.boxno  LIKE upper('%" + searchValue + "%') or a.PROD_ORDER  LIKE upper('%" + searchValue + "%') or a.PO LIKE upper('%" + searchValue + "%') or a.SHIPTO LIKE upper('%" + searchValue + "%')  or  a.DESTINATION  LIKE upper('%" + searchValue + "%') or a.PO_OLD LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%')  or b.customer_product  LIKE  upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') ) ";

            if (!firstdigit.equals("") || !startbox.equals("") || !endbox.equals("")) {
                sql += " and a.boxno in (";
                for (int n = Integer.parseInt(startbox); n < Integer.parseInt(endbox) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(endbox)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') ";
                    }
                }
            }

            if (!prodorder.equals("")) {
                sql += " and a.PROD_ORDER = '" + prodorder + "'  ";
            }

            if (!po.equals("")) {
                sql += " and  a.PO = '" + po + "'  ";
            }

            if (!SHIPTO.equals("")) {
                sql += " and  a.SHIPTO = '" + SHIPTO + "'   ";
            }

            if (!DESTINATION.equals("")) {
                sql += " and  a.DESTINATION = '" + DESTINATION + "'  ";
            }

            if (!po_old.equals("")) {
                sql += " and  a.PO_OLD = '" + po_old + "'  ";
            }

            if (!pallet.equals("")) {
                sql += " and  a.PALLET = '" + pallet + "'   ";
            }

            if (!customer_no.equals("")) {
                sql += " and  b.customer_no  = '" + customer_no + "'  ";
            }

            if (!customer_product.equals("")) {
                sql += " and  b.customer_product  = '" + customer_product + "' ";
            }

            if (!datestart.equals("") && !datestop.equals("")) {
                sql += " and  a.DATE_CREATE  between TO_DATE('" + datestart + "', 'yyyy/mm/dd') and TO_DATE('" + datestop + "', 'yyyy/mm/dd') ";
            }


            sql += " GROUP BY ";
            sql += "  a.GROSSWEIGHT,a.NETWEIGHT,a.USER_CREATE,a.USER_EDIT,b.customer_no, a.QTY1,a.QTY2,a.QTY3, a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO, c.qty_result1, c.qty_result2,c.qty_result3,c.qty_result4 ";
            sql += "  ORDER BY ";
            sql += "  a.PO, b.customer_no,CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+') AS INT) ";

            sql += " ) a";

            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
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

    public int getTotalRecordsdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String startbox, String endbox, String firstdigit, String datestart, String datestop) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;

        try {
            String sql = "";
            sql += " SELECT count(*) ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += "  a.GROSSWEIGHT,a.NETWEIGHT,a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1, a.QTY2,a.QTY3,a.QTY4, b.CUSTOMER_PRODUCT, a.PALLET, TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE,a.PO, ";
            sql += "  a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1, c.qty_result2, c.qty_result3,c.qty_result4 ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += "  INNER JOIN MIZUNONEWBARBOXRESULT c ON (c.po = a.po AND c.boxno = a.boxno) ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON (b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4) ";
            sql += "  WHERE  ";
            sql += " (a.boxno  LIKE '%%' or a.PROD_ORDER  LIKE '%%' or a.PO LIKE '%%' or a.SHIPTO LIKE '%%'  or  a.DESTINATION  LIKE '%%' or a.PO_OLD LIKE '%%'  or a.PALLET LIKE '%%' or b.customer_no  LIKE '%%'  or b.customer_product  LIKE  '%%')  ";

            if (!firstdigit.equals("") || !startbox.equals("") || !endbox.equals("")) {
                sql += " and a.boxno in (";
                for (int n = Integer.parseInt(startbox); n < Integer.parseInt(endbox) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(endbox)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') ";
                    }
                }
            }

            if (!prodorder.equals("")) {
                sql += " and a.PROD_ORDER = '" + prodorder + "'  ";
            }

            if (!po.equals("")) {
                sql += " and  a.PO = '" + po + "'  ";
            }

            if (!SHIPTO.equals("")) {
                sql += " and  a.SHIPTO = '" + SHIPTO + "'   ";
            }

            if (!DESTINATION.equals("")) {
                sql += " and  a.DESTINATION = '" + DESTINATION + "'  ";
            }

            if (!po_old.equals("")) {
                sql += " and  a.PO_OLD = '" + po_old + "'  ";
            }

            if (!pallet.equals("")) {
                sql += " and  a.PALLET = '" + pallet + "'   ";
            }

            if (!customer_no.equals("")) {
                sql += " and  b.customer_no  = '" + customer_no + "'  ";
            }

            if (!customer_product.equals("")) {
                sql += " and  b.customer_product  = '" + customer_product + "' ";
            }

            if (!datestart.equals("") && !datestop.equals("")) {
                sql += " and  a.DATE_CREATE  between TO_DATE('" + datestart + "', 'yyyy/mm/dd') and TO_DATE('" + datestop + "', 'yyyy/mm/dd') ";
            }

            sql += " GROUP BY ";
            sql += "  a.GROSSWEIGHT,a.NETWEIGHT,b.customer_no, a.QTY1,a.QTY2,a.QTY3, a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO, c.qty_result1, c.qty_result2,c.qty_result3,c.qty_result4 ";
            sql += "  ORDER BY ";
            sql += "  a.PO, b.customer_no,CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+') AS INT) ";
            sql += " ) a ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
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

    private String sqllistreportdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String startbox, String endbox, String firstdigit, String start, String end, String searchValue, String datestart, String datestop, String orderColumn, String orderDir) {
        String sql = "";
        try {

            sql += " select * from ( ";
            sql += " SELECT ROWNUM as rnum, a.* ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.GROSSWEIGHT,a.NETWEIGHT,a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1, a.QTY2,a.QTY3,a.QTY4, b.CUSTOMER_PRODUCT, a.PALLET, TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE,TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS') AS DATE_MODIFY,a.PO, ";
            sql += " a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1, c.qty_result2, c.qty_result3,c.qty_result4 ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNONEWBARBOXRESULT c ON (c.po = a.po AND c.boxno = a.boxno) ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON (b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4) ";
            sql += "  WHERE  ";
            sql += " (a.boxno  LIKE upper('%" + searchValue + "%') or a.PROD_ORDER  LIKE upper('%" + searchValue + "%') or a.PO LIKE upper('%" + searchValue + "%') or a.SHIPTO LIKE upper('%" + searchValue + "%')  or  a.DESTINATION  LIKE upper('%" + searchValue + "%') or a.PO_OLD LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%') or b.customer_product  LIKE  upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') ) ";

            if (firstdigit != null && startbox != null && endbox != null) {
                if (!firstdigit.equals("") || !startbox.equals("") || !endbox.equals("")) {
                    sql += " and a.boxno in (";
                    for (int n = Integer.parseInt(startbox); n < Integer.parseInt(endbox) + 1; n++) {
                        String num = firstdigit + String.valueOf(n);
                        if (n < Integer.parseInt(endbox)) {
                            sql += "'" + num + "',";
                        } else {
                            sql += "'" + num + "') ";
                        }
                    }
                }
            }

            if (!prodorder.equals("")) {
                sql += " and a.PROD_ORDER = '" + prodorder + "'  ";
            }

            if (!po.equals("")) {
                sql += " and  a.PO = '" + po + "'  ";
            }

            if (!SHIPTO.equals("")) {
                sql += " and  a.SHIPTO = '" + SHIPTO + "'   ";
            }

            if (!DESTINATION.equals("")) {
                sql += " and  a.DESTINATION = '" + DESTINATION + "'  ";
            }

            if (!po_old.equals("")) {
                sql += " and  a.PO_OLD = '" + po_old + "'  ";
            }

            if (!pallet.equals("")) {
                sql += " and  a.PALLET = '" + pallet + "'   ";
            }

            if (!customer_no.equals("")) {
                sql += " and  b.customer_no  = '" + customer_no + "'  ";
            }

            if (!customer_product.equals("")) {
                sql += " and  b.customer_product  = '" + customer_product + "' ";
            }

            if (!datestart.equals("") && !datestop.equals("")) {
                sql += " and  a.DATE_CREATE  between TO_DATE('" + datestart + "', 'yyyy/mm/dd') and TO_DATE('" + datestop + "', 'yyyy/mm/dd') ";
            }

            sql += " GROUP BY ";
            sql += "  a.GROSSWEIGHT,a.NETWEIGHT,a.USER_CREATE,a.USER_EDIT,b.customer_no, a.QTY1,a.QTY2,a.QTY3, a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'),TO_CHAR(a.DATE_MODIFY, 'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PO_OLD,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO, c.qty_result1, c.qty_result2,c.qty_result3,c.qty_result4 ";
            sql += "  ORDER BY ";
            sql += "  a.PO, b.customer_no,CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+') AS INT) ";

            sql += " ) a  ) ";
            if (!start.equals("") && !end.equals("")) {
                sql += "where rnum  between " + Integer.parseInt(start) + " AND " + (Integer.parseInt(start) + Integer.parseInt(end));
            }

            String[] columns = {"PO", "PO_OLD", "SKU_ITEM1,SKU_ITEM2,SKU_ITEM3,SKU_ITEM4", "CUSTOMER_PRODUCT", "PROD_ORDER", "PALLET", "REGEXP_SUBSTR(BOXNO, '[[:alpha:]]+') ,CAST(REGEXP_SUBSTR(BOXNO, '\\d+') AS INT) ", "qty1, qty2,qty3,qty4 ", "qty_result1, qty_result2,qty_result3,qty_result4 ", "DATE_CREATE", "DATE_MODIFY", "DATE_CREATE", "DATE_MODIFY",};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }else{
                sql += " ORDER BY " + columns[6] ;
            }



            System.out.println(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportdetailinventories(String prodorder, String SHIPTO, String DESTINATION, String po, String po_old, String customer_no, String customer_product, String pallet, String startbox, String endbox, String firstdigit, String start, String end, String searchValue, String datestart, String datestop, String orderColumn, String orderDir) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            HashMap<String, BCUser> listuser = AuthenticationService.getmapuser();
            String sql = sqllistreportdetailinventories(prodorder, SHIPTO, DESTINATION, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, start, end, searchValue, datestart, datestop, orderColumn, orderDir);
            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                BCUser userc = listuser.get(rs.getString("USER_CREATE"));
                BCUser userm = listuser.get(rs.getString("USER_EDIT"));

                BCDetailBox report = new BCDetailBox();
                report.setDate_create(rs.getString("DATE_CREATE"));
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

                if (userc != null) {
                    report.setUser_create(userc.getUser_firstname() + " " + userc.getUser_lastname());
                } else {
                    report.setUser_create("");
                }

                if (userm != null) {
                    report.setUser_edit(userm.getUser_firstname() + " " + userm.getUser_lastname());
                } else {
                    report.setUser_edit("");
                }
                
                report.setNetweight(rs.getString("NETWEIGHT"));
                report.setGrossweight(rs.getString("GROSSWEIGHT"));


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

    public int getFilteredRecordsproductdetails(String po, String customer_no, String customer_product, String pallet, String boxstart, String boxend, String firstdigit,
            int start, int length, String searchValue, String orderColumn, String orderDir, String datestart, String datestop) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "";
            sql += "select count(*) from (select rownum as rnum,x.* from (";
            sql += "select a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 ";
            sql += "where ";

            if (!po.isEmpty()) {
                sql += "a.po = '" + po + "' and";
            }

            if (!datestart.isEmpty() && !datestop.isEmpty()) {
                sql += " c.DATE_CREATE BETWEEN TO_DATE('" + datestart + "', 'yyyy/mm/dd') AND TO_DATE('" + datestop + "', 'yyyy/mm/dd') and ";
            }

            if (!customer_no.isEmpty()) {
                sql += " b.customer_no = '" + customer_no + "' and ";
            }

            if (!customer_product.isEmpty()) {
                sql += " b.customer_product = '" + customer_product + "' and ";
            }

            if (!pallet.isEmpty()) {
                sql += " a.PALLET  = '" + pallet + "' and ";
            }

            if (!firstdigit.equals("") || !boxstart.equals("") || !boxend.equals("")) {
                sql += " a.boxno in (";

                for (int n = Integer.parseInt(boxstart); n < Integer.parseInt(boxend) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(boxend)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') and";
                    }
                }
            }
            sql += "(a.PO LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%')  or b.customer_product  LIKE  upper('%" + searchValue + "%') or a.PROD_ORDER LIKE  upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') )";

            sql += " GROUP BY a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 ";

            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";
            sql += ")x)";

            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
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

    public int getTotalRecordsproductdetails(String po, String customer_no, String customer_product, String pallet, String boxstart, String boxend, String firstdigit, String datestart, String datestop) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "";
            sql += "select count(*) from (select rownum as rnum,x.* from (";
            sql += "select b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 ";
            sql += "where ";

            if (!po.isEmpty()) {
                sql += "a.po = '" + po + "' and";
            }

            if (!datestart.isEmpty() && !datestop.isEmpty()) {
                sql += " c.DATE_CREATE BETWEEN TO_DATE('" + datestart + "', 'yyyy/mm/dd') AND TO_DATE('" + datestop + "', 'yyyy/mm/dd') and ";
            }

            if (!customer_no.isEmpty()) {
                sql += " b.customer_no = '" + customer_no + "' and ";
            }

            if (!customer_product.isEmpty()) {
                sql += " b.customer_product = '" + customer_product + "' and ";
            }

            if (!pallet.isEmpty()) {
                sql += " a.PALLET  = '" + pallet + "' and ";
            }

            if (!firstdigit.equals("") || !boxstart.equals("") || !boxend.equals("")) {
                sql += " a.boxno in (";

                for (int n = Integer.parseInt(boxstart); n < Integer.parseInt(boxend) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(boxend)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') and";
                    }
                }
            }
            sql += "(a.PO LIKE '%%'  or a.PALLET LIKE '%%' or b.customer_no  LIKE '%%' or b.customer_product  LIKE  '%%' or a.PROD_ORDER LIKE  '%%' or a.BOXNO LIKE '%%')";

            sql += " GROUP BY b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 ";
            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";
            sql += ")x)";





            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
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

    public List<BCDetailBox> getsumproductdetails(String po, String customer_no, String customer_product, String pallet, String boxstart, String boxend, String firstdigit,
            int start, int length, String searchValue, String orderColumn, String orderDir, String datestart, String datestop) throws ClassNotFoundException, SQLException, NamingException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            String sql = "";
            sql += "select * from (select rownum as rnum,x.* from (";
            sql += "select a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 ";
            sql += "where ";

            if (!po.isEmpty()) {
                sql += "a.po = '" + po + "' and";
            }

            if (!datestart.isEmpty() && !datestop.isEmpty()) {
                sql += "c.DATE_CREATE BETWEEN TO_DATE('" + datestart + "', 'yyyy/mm/dd') AND TO_DATE('" + datestop + "', 'yyyy/mm/dd') and";
            }

            if (!customer_no.isEmpty()) {
                sql += " b.customer_no = '" + customer_no + "' and ";
            }

            if (!customer_product.isEmpty()) {
                sql += " b.customer_product = '" + customer_product + "' and ";
            }

            if (!pallet.isEmpty()) {
                sql += " a.PALLET  = '" + pallet + "' and ";
            }

            if (!firstdigit.equals("") || !boxstart.equals("") || !boxend.equals("")) {
                sql += " a.boxno in (";

                for (int n = Integer.parseInt(boxstart); n < Integer.parseInt(boxend) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(boxend)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') and";
                    }
                }
            }
            sql += "(a.PO LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%')  or b.customer_product  LIKE  upper('%" + searchValue + "%') or a.PROD_ORDER LIKE  upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') )";

            sql += " GROUP BY a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(c.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 ";

            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";
            sql += ")x) ";


            String[] columns = {"PO", "SKU_ITEM1,SKU_ITEM2,SKU_ITEM3,SKU_ITEM4", "CUSTOMER_PRODUCT", "PROD_ORDER", "PALLET", "REGEXP_SUBSTR(BOXNO, '[[:alpha:]]+') ,CAST(REGEXP_SUBSTR(BOXNO, '\\d+') AS INT) ", "qty_result1, qty_result2,qty_result3,qty_result4 ", "DATE_CREATE", "DATE_CREATE", "DATE_MODIFY",};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }


            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setDate_create(rs.getString("DATE_CREATE"));
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

    private String sqllistreportproductdetails(String po, String customer_no, String customer_product, String pallet, String boxstart, String boxend, String firstdigit,
            int start, int length, String searchValue, String orderColumn, String orderDir, String datestart, String datestop) {
        String sql = "";
        try {


            sql += "select * from (select rownum as rnum,x.* from (";
            sql += "select a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE,TO_CHAR(a.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') as DATE_MODIFY,a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 from MIZUNONEWBARBOXDT a  inner join MIZUNONEWBARBOXRESULT c on c.po = a.po and c.boxno = a.boxno inner join MIZUNOCUSTOMER b ON  b.customer_no = a.SKU_ITEM1 or  b.customer_no = a.SKU_ITEM2 or b.customer_no = a.SKU_ITEM3 or  b.customer_no = a.SKU_ITEM4 ";
            sql += "where ";


            if (!po.isEmpty()) {
                sql += "a.po = '" + po + "' and";
            }

            if (!datestart.isEmpty() && !datestop.isEmpty()) {
                sql += " c.DATE_CREATE BETWEEN TO_DATE('" + datestart + "', 'yyyy/mm/dd') AND TO_DATE('" + datestop + "', 'yyyy/mm/dd') and ";
            }

            if (!customer_no.isEmpty()) {
                sql += " b.customer_no = '" + customer_no + "' and ";
            }

            if (!customer_product.isEmpty()) {
                sql += " b.customer_product = '" + customer_product + "' and ";
            }

            if (!pallet.isEmpty()) {
                sql += " a.PALLET  = '" + pallet + "' and ";
            }

            if (!firstdigit.isEmpty() || !boxstart.isEmpty() || !boxend.isEmpty()) {
                sql += " a.boxno in (";

                for (int n = Integer.parseInt(boxstart); n < Integer.parseInt(boxend) + 1; n++) {
                    String num = firstdigit + String.valueOf(n);
                    if (n < Integer.parseInt(boxend)) {
                        sql += "'" + num + "',";
                    } else {
                        sql += "'" + num + "') and";
                    }
                }
            }
            sql += "(a.PO LIKE upper('%" + searchValue + "%')  or a.PALLET LIKE upper('%" + searchValue + "%') or b.customer_no  LIKE upper('%" + searchValue + "%')  or b.customer_product  LIKE  upper('%" + searchValue + "%') or a.PROD_ORDER LIKE  upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or a.BOXNO LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') or TO_CHAR(a.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS') LIKE upper('%" + searchValue + "%') )";
            sql += " GROUP BY a.USER_CREATE,a.USER_EDIT,b.customer_no,a.QTY1,a.QTY2,a.QTY3,a.QTY4,b.CUSTOMER_PRODUCT,a.PALLET,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS'),TO_CHAR(a.DATE_MODIFY,'DD/MM/YYYY HH24:MI:SS'),a.PO,a.PROD_ORDER,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.BOXNO,c.qty_result1,c.qty_result2,c.qty_result3,c.qty_result4 ";

            sql += " order by a.po,b.customer_no, CAST(REGEXP_SUBSTR(a.BOXNO, '\\d+')  as int)";
            sql += ")x)";

            if (start == 0 && length == 0) {
            } else {
                sql += " where rnum BETWEEN " + start + " AND " + (start + length);
            }

            String[] columns = {"PO", "SKU_ITEM1,SKU_ITEM2,SKU_ITEM3,SKU_ITEM4", "CUSTOMER_PRODUCT", "PROD_ORDER", "PALLET", "REGEXP_SUBSTR(BOXNO, '[[:alpha:]]+') ,CAST(REGEXP_SUBSTR(BOXNO, '\\d+') AS INT) ", "qty_result1, qty_result2,qty_result3,qty_result4 ", "DATE_CREATE", "DATE_CREATE", "DATE_MODIFY",};
            if (orderColumn != null && !orderColumn.isEmpty()) {
                sql += " ORDER BY " + columns[Integer.parseInt(orderColumn)] + " " + orderDir;
            }



        } catch (Exception e) {
            e.printStackTrace();
        }
        return sql;
    }

    public List<BCDetailBox> listreportproductdetails(String po, String customer_no, String customer_product, String pallet, String boxstart, String boxend, String firstdigit,
            int start, int length, String searchValue, String orderColumn, String orderDir, String datestart, String datestop) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();

        try {
            HashMap<String, BCUser> listuser = AuthenticationService.getmapuser();

            String sql = sqllistreportproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, start, length, searchValue, orderColumn, orderDir, datestart, datestop);
            System.out.println(sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                BCUser userc = listuser.get(rs.getString("USER_CREATE"));
                BCUser userm = listuser.get(rs.getString("USER_EDIT"));


                BCDetailBox report = new BCDetailBox();
                report.setDate_create(rs.getString("DATE_CREATE"));
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

                if (userc != null) {
                    report.setUser_create(userc.getUser_firstname() + " " + userc.getUser_lastname());
                } else {
                    report.setUser_create("");
                }

                if (userm != null) {
                    report.setUser_edit(userm.getUser_firstname() + " " + userm.getUser_lastname());
                } else {
                    report.setUser_edit("");
                }







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

    public int getTotalRecords(String customer, String customer_no, String customer_product, String datestart, String dateend, String po) throws ClassNotFoundException, SQLException, NamingException {
        int totalRecords = 0;
        try {
            String sql = "";
            sql += "select count(*) from (" +
                    "select rownum as rnum,x.* from (" +
                    "SELECT a.PO,REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') as firstdigit,min(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxstart,max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxend,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE " +
                    "FROM MIZUNONEWBARBOXDT a " +
                    "INNER JOIN MIZUNOCUSTOMER b " +
                    "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  " +
                    "where  ";
            if (!po.equals("")) {
                sql += " a.po  =  '" + po + "' and ";
            }

            if (!customer.equals("")) {
                sql += " a.SHIPTO  =  '" + customer + "' and ";
            }
            if (!customer_no.equals("")) {
                sql += " b.customer_no   =  '" + customer_no + "'  and ";
            }
            if (!customer_product.equals("")) {
                sql += " b.customer_product  =  '" + customer_product + "' and  ";
            }
            if (!datestart.equals("") || !dateend.equals("")) {
                sql += "  a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') and ";
            }
            sql += "(PO like '%%'  or  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') like '%%'  ) ";
            sql += " GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'),REGEXP_SUBSTR(a.BOXALL, '[[:digit:]]+'), TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') " +
                    "ORDER BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) " +
                    ")x )  ";

            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            if (!datestart.equals("") || !dateend.equals("")) {
                ps.setString(1, datestart);
                ps.setString(2, dateend);
            }
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

    public int getFilteredRecords(String customer, String customer_no, String customer_product, String datestart, String dateend, String searchValue, String po) throws ClassNotFoundException, SQLException, NamingException {
        int filteredRecords = 0;
        try {
            String sql = "";
            sql += "select count(*) from (" +
                    "select rownum as rnum,x.* from (" +
                    "SELECT a.PO,REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') as firstdigit,min(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxstart,max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxend,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE " +
                    "FROM MIZUNONEWBARBOXDT a " +
                    "INNER JOIN MIZUNOCUSTOMER b " +
                    "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  " +
                    "where ";
            if (!po.equals("")) {
                sql += " a.po  =  '" + po + "' and ";
            }
            if (!customer.equals("")) {
                sql += " a.SHIPTO  =  '" + customer + "' and ";
            }
            if (!customer_no.equals("")) {
                sql += " b.customer_no   =  '" + customer_no + "'  and ";
            }
            if (!customer_product.equals("")) {
                sql += " b.customer_product  =  '" + customer_product + "' and  ";
            }

            if (!datestart.equals("") || !dateend.equals("")) {
                sql += "  a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') and";
            }
            sql += "(PO like ?  or  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') like  ?  ) " +
                    "GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'),REGEXP_SUBSTR(a.BOXALL, '[[:digit:]]+'), TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') " +
                    "ORDER BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) " +
                    ")x )  ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            if (!datestart.equals("") || !dateend.equals("")) {
                ps.setString(1, datestart);
                ps.setString(2, dateend);
                ps.setString(3, "%" + searchValue + "%");
                ps.setString(4, "%" + searchValue + "%");
            } else {
                ps.setString(1, "%" + searchValue + "%");
                ps.setString(2, "%" + searchValue + "%");
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

    public static List<BCDetailBox> GetPOALL(String id) throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();
        String sql = "";
        try {
            sql += "SELECT * ";
            sql += " FROM (";
            sql += "   SELECT";
            sql += "    a.po,";
            sql += "   REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit,";
            sql += "   REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS boxno,";
            sql += "    a.DATE_CREATE AS date_create";
            sql += "   FROM";
            sql += "     MIZUNONEWBARBOXDT a";
            sql += "  INNER JOIN";
            sql += "      MIZUNONEWBARBOXRESULT c ON c.po = a.po AND c.boxno = a.boxno";
            sql += "  INNER JOIN";
            sql += "    MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1";
            sql += "      OR b.customer_no = a.SKU_ITEM2";
            sql += "   OR b.customer_no = a.SKU_ITEM3";
            sql += "    OR b.customer_no = a.SKU_ITEM4";
            sql += " ) where po = ?";
            sql += " group by po,firstdigit,boxno,date_create ";
            sql += " ORDER BY po,firstdigit,CAST(REGEXP_SUBSTR(BOXNO, '[[:digit:]]+')  as int),date_create ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox box = new BCDetailBox();
                box.setPo(rs.getString("po"));
                box.setFirstdigit(rs.getString("firstdigit"));
                box.setBoxno(rs.getString("boxno"));
                box.setDate_create(rs.getString("date_create"));
                list.add(box);

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

    public List<BCDetailBox> listreportviewpo(
            String customer, String customer_no, String customer_product, String datestart, String dateend,
            int start, int length, String searchValue, String orderColumn, String orderDir, String po)
            throws SQLException {
        List<BCDetailBox> list = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += "select * from (" +
                    "select rownum as rnum,x.* from (" +
                    "SELECT a.PO,REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') as firstdigit,min(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxstart,max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) as boxend,TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') as DATE_CREATE " +
                    "FROM MIZUNONEWBARBOXDT a " +
                    "INNER JOIN MIZUNOCUSTOMER b " +
                    "ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  " +
                    "where ";
            if (!po.equals("")) {
                sql += " a.po  =  '" + po + "' and ";
            }
            if (!customer.equals("")) {
                sql += " a.SHIPTO  =  '" + customer + "' and ";
            }
            if (!customer_no.equals("")) {
                sql += " b.customer_no   =  '" + customer_no + "'  and ";
            }
            if (!customer_product.equals("")) {
                sql += " b.customer_product  =  '" + customer_product + "' and  ";
            }
            if (!datestart.equals("") || !dateend.equals("")) {
                sql += " a.DATE_CREATE BETWEEN TO_DATE(?, 'yyyy/mm/dd') AND TO_DATE(?, 'yyyy/mm/dd') and ";
            }
            sql += " (PO like upper(?)  or  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') like upper(?) ) " +
                    "GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'),REGEXP_SUBSTR(a.BOXALL, '[[:digit:]]+'), TO_CHAR(a.DATE_CREATE,'DD/MM/YYYY HH24:MI:SS') " +
                    "ORDER BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), max(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+')  as int)) " +
                    ")x )where rnum BETWEEN ? AND ? ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            if (!datestart.equals("") || !dateend.equals("")) {
                ps.setString(1, datestart);
                ps.setString(2, dateend);
                ps.setString(3, "%" + searchValue + "%");
                ps.setString(4, "%" + searchValue + "%");
                ps.setInt(5, start);
                ps.setInt(6, start + length);
            } else {
                ps.setString(1, "%" + searchValue + "%");
                ps.setString(2, "%" + searchValue + "%");
                ps.setInt(3, start);
                ps.setInt(4, start + length);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                BCDetailBox report = new BCDetailBox();
                report.setBoxno(rs.getString("rnum"));
                report.setPo(rs.getString("po"));
                report.setStartbox(rs.getString("boxstart"));
                report.setEndbox(rs.getString("boxend"));
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
