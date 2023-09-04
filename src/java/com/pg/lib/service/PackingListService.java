/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.utility.ConnectDB;
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

    
     public static List<BCDetailBox> GroupCustomeSizeTotal(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " SELECT COUNT(DISTINCT boxno) AS countbox, po,customer_color,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,sum(NETWEIGHT) as totalnw,sum(GROSSWEIGHT) as totalgw , DESTINATION ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.PO,";
            sql += " a.BOXNO, ";
            sql += "   b.customer_color, ";
            sql += "  b.customer_size, ";
            sql += "  a.SIZENO1, ";
            sql += "  a.SIZENO2, ";
            sql += " a.SIZENO3, ";
            sql += " a.SIZENO4, ";
            sql += " a.NETWEIGHT, ";
            sql += " a.GROSSWEIGHT, ";
            sql += " c.QTY_RESULT1, ";
            sql += " c.QTY_RESULT2, ";
            sql += "  c.QTY_RESULT3, ";
            sql += "  c.QTY_RESULT4, ";
            sql += "  a.DESTINATION ";
            sql += "  FROM ";
            sql += "  MIZUNONEWBARBOXDT a ";
            sql += "INNER JOIN ";
            sql += "  MIZUNOCUSTOMER b ON ";
            sql += "  b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " INNER JOIN  MIZUNONEWBARBOXRESULT c ON  c.boxno = a.BOXNO AND c.po = a.po ";
            sql += "  WHERE ";
            sql += "    REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN (";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }

            sql += " GROUP BY a.po, a.boxno,b.customer_color,b.customer_size,a.SIZENO1,a.SIZENO2,a.SIZENO3,SIZENO4,a.NETWEIGHT,a.GROSSWEIGHT,c.QTY_RESULT1,c.QTY_RESULT2, c.QTY_RESULT3,c.QTY_RESULT4,a.DESTINATION ";
            sql += " ) tb ";
            sql += " GROUP BY ";
            sql += " po,customer_color,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,DESTINATION ";
            sql += " ORDER BY ";
            sql += " customer_size ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            
            rs = ps.executeQuery();


            System.out.println(sql);
            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCountbox(rs.getString("countbox"));
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_size(rs.getString("customer_size"));
                detail.setSizen01(rs.getString("SIZENO1"));
                detail.setSizen02(rs.getString("SIZENO2"));
                detail.setSizen03(rs.getString("SIZENO3"));
                detail.setSizen04(rs.getString("SIZENO4"));
                detail.setQty_result1(rs.getString("QTY_RESULT1"));
                detail.setQty_result2(rs.getString("QTY_RESULT2"));
                detail.setQty_result3(rs.getString("QTY_RESULT3"));
                detail.setQty_result4(rs.getString("QTY_RESULT4"));
                detail.setSumnw(rs.getString("totalnw"));
                detail.setSumgw(rs.getString("totalgw"));
                detail.setDestination(rs.getString("DESTINATION"));
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
    
    public static List<BCDetailBox> GroupCustomerSizeByPO(String po, String firstdigit, String STARTBOX, String ENDBOX, String BOXSEQ) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " SELECT COUNT(DISTINCT boxno) AS countbox, po,customer_color,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,sum(NETWEIGHT) as totalnw,sum(GROSSWEIGHT) as totalgw , DESTINATION ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.PO,";
            sql += " a.BOXNO, ";
            sql += "   b.customer_color, ";
            sql += "  b.customer_size, ";
            sql += "  a.SIZENO1, ";
            sql += "  a.SIZENO2, ";
            sql += " a.SIZENO3, ";
            sql += " a.SIZENO4, ";
            sql += " a.NETWEIGHT, ";
            sql += " a.GROSSWEIGHT, ";
            sql += " c.QTY_RESULT1, ";
            sql += " c.QTY_RESULT2, ";
            sql += "  c.QTY_RESULT3, ";
            sql += "  c.QTY_RESULT4, ";
            sql += "  a.DESTINATION ";
            sql += "  FROM ";
            sql += "  MIZUNONEWBARBOXDT a ";
            sql += "INNER JOIN ";
            sql += "  MIZUNOCUSTOMER b ON ";
            sql += "  b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " INNER JOIN  MIZUNONEWBARBOXRESULT c ON  c.boxno = a.BOXNO AND c.po = a.po ";
            sql += "  WHERE ";
            sql += "    REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? and a.BOXSEQ = ? AND a.boxno IN (";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }

            sql += " GROUP BY a.po, a.boxno,b.customer_color,b.customer_size,a.SIZENO1,a.SIZENO2,a.SIZENO3,SIZENO4,a.NETWEIGHT,a.GROSSWEIGHT,c.QTY_RESULT1,c.QTY_RESULT2, c.QTY_RESULT3,c.QTY_RESULT4,a.DESTINATION ";
            sql += " ) tb ";
            sql += " GROUP BY ";
            sql += " po,customer_color,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,DESTINATION ";
            sql += " ORDER BY ";
            sql += " customer_size ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            ps.setString(3, BOXSEQ);

            rs = ps.executeQuery();


            System.out.println(sql);
            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCountbox(rs.getString("countbox"));
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_size(rs.getString("customer_size"));
                detail.setSizen01(rs.getString("SIZENO1"));
                detail.setSizen02(rs.getString("SIZENO2"));
                detail.setSizen03(rs.getString("SIZENO3"));
                detail.setSizen04(rs.getString("SIZENO4"));
                detail.setQty_result1(rs.getString("QTY_RESULT1"));
                detail.setQty_result2(rs.getString("QTY_RESULT2"));
                detail.setQty_result3(rs.getString("QTY_RESULT3"));
                detail.setQty_result4(rs.getString("QTY_RESULT4"));
                detail.setSumnw(rs.getString("totalnw"));
                detail.setSumgw(rs.getString("totalgw"));
                detail.setDestination(rs.getString("DESTINATION"));
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

    public static List<BCInvoice> getPackingListByid(String id) throws SQLException {
        List<BCInvoice> listbox = new ArrayList<BCInvoice>();
        String sql = "";
        try {

            sql = "select * from MIZUNONEWBARBOXINVOICE where INVOICEID = ? ";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCInvoice iv = new BCInvoice();
                iv.setInvoiceid(rs.getString("INVOICEID"));
                iv.setInvoiceno(rs.getString("INVOICENO"));
                iv.setInvoicedate(rs.getString("INVOICEDATE"));
                iv.setPo(rs.getString("PO"));
                iv.setSaveingno(rs.getString("SAVEINGNO"));
                iv.setFirstdigit(rs.getString("FIRSTDIGIT"));
                iv.setStartbox(rs.getString("STARTBOX"));
                iv.setEndbox(rs.getString("ENDBOX"));
                iv.setContainerno(rs.getString("CONTAINERNO"));
                iv.setDate_create(rs.getString("DATE_CREATE"));
                iv.setDate_modified(rs.getString("DATE_MODIFIED"));

                listbox.add(iv);
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

    public static List<BCDetailBox> GroupCustomerNoBySEQ(String po, String firstdigit, String STARTBOX, String ENDBOX, String seq) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " SELECT *";
            sql += "  FROM ( ";
            sql += "  SELECT ";
            sql += "  a.PO, ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit,";
            sql += " a.BOXNO,";
            sql += " a.boxseq, ";
            sql += " b.customer_color";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " GROUP BY a.PO,a.BOXNO,a.boxseq, b.customer_color";
            sql += " ) tb ";
            sql += " WHERE firstdigit = ? and po = ? and boxseq = ? ";
            sql += " and boxno in (";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }


            sql += "  ORDER BY tb.PO,CAST(REGEXP_SUBSTR(tb.boxno, '\\d+')  as int) ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            ps.setString(3, seq);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setFirstdigit(rs.getString("firstdigit"));
                detail.setBoxseq(rs.getString("boxseq"));
                detail.setBoxno(rs.getString("boxno"));
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

  

    public static List<BCDetailBox> GroupCustomerNoByPO(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " SELECT *";
            sql += "  FROM ( ";
            sql += "  SELECT ";
            sql += "  a.PO, ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit,";
            sql += " a.BOXNO,";
            sql += " a.boxseq, ";
            sql += " b.customer_color";
            sql += " FROM MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " GROUP BY a.PO,a.BOXNO,a.boxseq, b.customer_color";
            sql += " ) tb ";
            sql += " WHERE firstdigit = ? and po = ?  ";
            sql += " and boxno in (";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }


            sql += "  ORDER BY tb.PO,CAST(REGEXP_SUBSTR(tb.boxno, '\\d+')  as int) ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setFirstdigit(rs.getString("firstdigit"));
                detail.setBoxseq(rs.getString("boxseq"));
                detail.setBoxno(rs.getString("boxno"));
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
