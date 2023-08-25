/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.utility.ConnectDB;
import com.pg.lib.utility.Utility;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class PackingListService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static List<BCDetailBox> getPOByInvoicenoandInvoiceDate(String Invoiceno, String InvoiceDate) throws SQLException {
        List<BCDetailBox> listpo = new ArrayList<BCDetailBox>();
        String sql = "";
        try {
            sql += "select *  from (select REGEXP_SUBSTR(BOXNO, '[[:alpha:]]+') AS firstdigit ,po FROM MIZUNONEWBARBOXDT where INVOICENO = ? and INVOICEDATE = TO_DATE(?, 'dd/mm/yyyy HH24:MI:SS') ) group by firstdigit,po order by po";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, Invoiceno);
            ps.setString(2, InvoiceDate);
            rs = ps.executeQuery();


            while (rs.next()) {
                BCDetailBox po = new BCDetailBox();
                po.setPo(rs.getString("PO"));
                po.setFirstdigit(rs.getString("firstdigit"));
                listpo.add(po);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return listpo;
    }

    public static List<BCDetailBox> getPackingListCustomerColorByPO(String po, String firstdigit, String customer_color) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += "SELECT tb.* ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += "  a.PO, ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit, ";
            sql += " MIN(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxstart, ";
            sql += " MAX(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxend, ";
            sql += " TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE, ";
            sql += " a.SKU_ITEM1, ";
            sql += " a.qty1, ";
            sql += " a.SIZENO1, ";
            sql += " a.SKU_ITEM2, ";
            sql += " a.qty2, ";
            sql += " a.SIZENO2, ";
            sql += " a.SKU_ITEM3, ";
            sql += " a.qty3, ";
            sql += " a.SIZENO3, ";
            sql += " a.SKU_ITEM4, ";
            sql += " a.qty4, ";
            sql += " a.SIZENO4, ";
            sql += " COUNT(TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS')) AS ctn, ";
            sql += " SUM(a.qty1) AS sumqty1, ";
            sql += " SUM(a.qty2) AS sumqty2, ";
            sql += " SUM(a.qty3) AS sumqty3, ";
            sql += " SUM(a.qty4) AS sumqty4, ";
            sql += " SUM(a.NETWEIGHT) AS sumnw, ";
            sql += " SUM(a.GROSSWEIGHT) AS sumgw, ";
            sql += " b.customer_no, ";
            sql += " b.customer_color, ";
            sql += " b.customer_size ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'), a.SKU_ITEM1, a.qty1, a.SIZENO1, a.SKU_ITEM2, a.qty2, a.SIZENO2, a.SKU_ITEM3, a.SIZENO3, a.qty3, a.SKU_ITEM4, a.SIZENO4, a.qty4,b.customer_no,b.customer_color,b.customer_size ";
            sql += ") tb ";
            sql += " WHERE firstdigit = ? and po = ? and customer_color= ?";
            sql += " ORDER BY tb.PO, tb.firstdigit, tb.boxend ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            ps.setString(3, customer_color);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("PO"));
                detail.setFirstdigit(rs.getString("firstdigit"));
                detail.setStartbox(rs.getString("boxstart"));
                detail.setEndbox(rs.getString("boxend"));
                detail.setDate_create(rs.getString("DATE_CREATE"));
                detail.setSku_item1(rs.getString("SKU_ITEM1"));
                detail.setQty1(rs.getString("qty1"));
                detail.setSizen01(rs.getString("SIZENO1"));
                detail.setSku_item2(rs.getString("SKU_ITEM2"));
                detail.setQty2(rs.getString("qty2"));
                detail.setSizen02(rs.getString("SIZENO2"));
                detail.setSku_item3(rs.getString("SKU_ITEM3"));
                detail.setQty3(rs.getString("qty3"));
                detail.setSizen03(rs.getString("SIZENO3"));
                detail.setSku_item4(rs.getString("SKU_ITEM4"));
                detail.setQty4(rs.getString("qty4"));
                detail.setSizen04(rs.getString("SIZENO4"));
                detail.setCtn(rs.getString("ctn"));
                detail.setSumqty1(rs.getString("sumqty1"));
                detail.setSumqty2(rs.getString("sumqty2"));
                detail.setSumqty3(rs.getString("sumqty3"));
                detail.setSumqty4(rs.getString("sumqty4"));
                detail.setSumnw(rs.getString("sumnw"));
                detail.setSumgw(rs.getString("sumgw"));
                detail.setCustomer_no(rs.getString("customer_no"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_size(rs.getString("customer_size"));

                listbox.add(detail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listbox;
    }

    public static List<BCDetailBox> getPackingListByPO(String po, String firstdigit) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += "SELECT tb.* ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += "  a.PO, ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit, ";
            sql += " MIN(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxstart, ";
            sql += " MAX(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxend, ";
            sql += " TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE, ";
            sql += " a.SKU_ITEM1, ";
            sql += " a.qty1, ";
            sql += " a.SIZENO1, ";
            sql += " a.SKU_ITEM2, ";
            sql += " a.qty2, ";
            sql += " a.SIZENO2, ";
            sql += " a.SKU_ITEM3, ";
            sql += " a.qty3, ";
            sql += " a.SIZENO3, ";
            sql += " a.SKU_ITEM4, ";
            sql += " a.qty4, ";
            sql += " a.SIZENO4, ";
            sql += " COUNT(TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS')) AS ctn, ";
            sql += " SUM(a.qty1) AS sumqty1, ";
            sql += " SUM(a.qty2) AS sumqty2, ";
            sql += " SUM(a.qty3) AS sumqty3, ";
            sql += " SUM(a.qty4) AS sumqty4, ";
            sql += " SUM(a.NETWEIGHT) AS sumnw, ";
            sql += " SUM(a.GROSSWEIGHT) AS sumgw, ";
            sql += " b.customer_no, ";
            sql += " b.customer_color, ";
            sql += " b.customer_size ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'), a.SKU_ITEM1, a.qty1, a.SIZENO1, a.SKU_ITEM2, a.qty2, a.SIZENO2, a.SKU_ITEM3, a.SIZENO3, a.qty3, a.SKU_ITEM4, a.SIZENO4, a.qty4,b.customer_no,b.customer_color,b.customer_size ";
            sql += ") tb ";
            sql += " WHERE firstdigit = ? and po = ? ";
            sql += " ORDER BY tb.PO, tb.firstdigit, tb.boxend ";
            
            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("PO"));
                detail.setFirstdigit(rs.getString("firstdigit"));
                detail.setStartbox(rs.getString("boxstart"));
                detail.setEndbox(rs.getString("boxend"));
                detail.setDate_create(rs.getString("DATE_CREATE"));
                detail.setSku_item1(rs.getString("SKU_ITEM1"));
                detail.setQty1(rs.getString("qty1"));
                detail.setSizen01(rs.getString("SIZENO1"));
                detail.setSku_item2(rs.getString("SKU_ITEM2"));
                detail.setQty2(rs.getString("qty2"));
                detail.setSizen02(rs.getString("SIZENO2"));
                detail.setSku_item3(rs.getString("SKU_ITEM3"));
                detail.setQty3(rs.getString("qty3"));
                detail.setSizen03(rs.getString("SIZENO3"));
                detail.setSku_item4(rs.getString("SKU_ITEM4"));
                detail.setQty4(rs.getString("qty4"));
                detail.setSizen04(rs.getString("SIZENO4"));
                detail.setCtn(rs.getString("ctn"));
                detail.setSumqty1(rs.getString("sumqty1"));
                detail.setSumqty2(rs.getString("sumqty2"));
                detail.setSumqty3(rs.getString("sumqty3"));
                detail.setSumqty4(rs.getString("sumqty4"));
                detail.setSumnw(rs.getString("sumnw"));
                detail.setSumgw(rs.getString("sumgw"));
                detail.setCustomer_no(rs.getString("customer_no"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_size(rs.getString("customer_size"));

                listbox.add(detail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listbox;
    }

    public static List<BCDetailBox> GroupCustomerNoByPO(String po, String firstdigit) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += "SELECT tb.PO,tb.customer_color ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += "  a.PO, ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit, ";
            sql += " MIN(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxstart, ";
            sql += " MAX(CAST(REGEXP_SUBSTR(a.BOXNO, '[[:digit:]]+') AS INT)) AS boxend, ";
            sql += " TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS') AS DATE_CREATE, ";
            sql += " a.SKU_ITEM1, ";
            sql += " a.qty1, ";
            sql += " a.SIZENO1, ";
            sql += " a.SKU_ITEM2, ";
            sql += " a.qty2, ";
            sql += " a.SIZENO2, ";
            sql += " a.SKU_ITEM3, ";
            sql += " a.qty3, ";
            sql += " a.SIZENO3, ";
            sql += " a.SKU_ITEM4, ";
            sql += " a.qty4, ";
            sql += " a.SIZENO4, ";
            sql += " COUNT(TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS')) AS ctn, ";
            sql += " SUM(a.qty1) AS sumqty1, ";
            sql += " SUM(a.qty2) AS sumqty2, ";
            sql += " SUM(a.qty3) AS sumqty3, ";
            sql += " SUM(a.qty4) AS sumqty4, ";
            sql += " SUM(a.NETWEIGHT) AS sumnw, ";
            sql += " SUM(a.GROSSWEIGHT) AS sumgw, ";
            sql += " b.customer_no, ";
            sql += " b.customer_color, ";
            sql += " b.customer_size ";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " GROUP BY a.PO, REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+'), TO_CHAR(a.DATE_CREATE, 'DD/MM/YYYY HH24:MI:SS'), a.SKU_ITEM1, a.qty1, a.SIZENO1, a.SKU_ITEM2, a.qty2, a.SIZENO2, a.SKU_ITEM3, a.SIZENO3, a.qty3, a.SKU_ITEM4, a.SIZENO4, a.qty4,b.customer_no,b.customer_color,b.customer_size ";
            sql += ") tb ";
            sql += " WHERE firstdigit = ? and po = ? ";
            sql += "  GROUP BY tb.PO,tb.customer_color ";
            sql += "  ORDER BY tb.PO,tb.customer_color ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));

                listbox.add(detail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listbox;
    }
}
