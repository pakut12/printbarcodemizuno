/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCInvoice;
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

    public static List<BCDetailBox> CheckSize(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {
            sql += " SELECT customer_size   FROM ";
            sql += " (  ";
            sql += " SELECT   a.PO,  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') AS firstdigit, a.BOXNO, a.boxseq,  b.customer_color,b.customer_size FROM MIZUNONEWBARBOXDT a ";
            sql += "  INNER JOIN MIZUNOCUSTOMER b ON b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4   ";
            sql += " GROUP BY a.PO,a.BOXNO,a.boxseq, b.customer_color,b.customer_size ";
            sql += " ) tb ";
            sql += " WHERE firstdigit = ? and po = ?  and boxno in (   ";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }
            sql += " group by customer_size ";

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCustomer_size(rs.getString("customer_size"));

                listbox.add(detail);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }


        return listbox;
    }

    public static List<BCDetailBox> CheckQty(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " SELECT  boxno,po,QTY1,QTY2,QTY3,QTY4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4 ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.PO, ";
            sql += " a.BOXNO, ";
            sql += " b.customer_color, ";
            sql += " b.customer_size, ";
            sql += " a.SIZENO1, ";
            sql += " a.SIZENO2, ";
            sql += " a.SIZENO3, ";
            sql += " a.SIZENO4, ";
            sql += " a.QTY1, ";
            sql += " a.QTY2, ";
            sql += " a.QTY3, ";
            sql += " a.QTY4, ";
            sql += " c.QTY_RESULT1, ";
            sql += " c.QTY_RESULT2, ";
            sql += " c.QTY_RESULT3, ";
            sql += " c.QTY_RESULT4 ";
            sql += " FROM ";
            sql += " MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN ";
            sql += " MIZUNOCUSTOMER b ON ";
            sql += "  b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += "  INNER JOIN  MIZUNONEWBARBOXRESULT c ON  c.boxno = a.BOXNO AND c.po = a.po ";
            sql += "  WHERE ";
            sql += " REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN ( ";

            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }

            sql += "  GROUP BY a.po, a.boxno,b.customer_color,b.customer_size,a.SIZENO1,a.SIZENO2,a.SIZENO3,SIZENO4, a.QTY1, a.QTY2, a.QTY3, a.QTY4,c.QTY_RESULT1,c.QTY_RESULT2, c.QTY_RESULT3,c.QTY_RESULT4 ";
            sql += " ) tb ";
            sql += " GROUP BY ";
            sql += "  boxno,po,QTY1,QTY2,QTY3,QTY4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4 ";



            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setBoxno(rs.getString("boxno"));
                detail.setPo(rs.getString("po"));
                detail.setQty1(rs.getString("qty1"));
                detail.setQty2(rs.getString("qty2"));
                detail.setQty3(rs.getString("qty3"));
                detail.setQty4(rs.getString("qty4"));
                detail.setQty_result1(rs.getString("qty_result1"));
                detail.setQty_result2(rs.getString("qty_result2"));
                detail.setQty_result3(rs.getString("qty_result3"));
                detail.setQty_result4(rs.getString("qty_result4"));

                listbox.add(detail);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }


        return listbox;
    }

    public static List<BCDetailBox> GroupCustomeColor(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {

        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();

        String sql = "";
        try {

            sql += " SELECT  a.PO, b.customer_color,b.customer_no,a.DESTINATION   FROM   MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN   MIZUNOCUSTOMER b ON   b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " WHERE REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN ( ";
            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }
            sql += " GROUP BY a.po, b.customer_color,b.customer_no,a.DESTINATION  ";
            sql += " order by a.DESTINATION,b.customer_no  ";


            System.out.println("L : "+ sql);
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setPo(rs.getString("po"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_no(rs.getString("customer_no"));
                detail.setDestination(rs.getString("DESTINATION"));

                listbox.add(detail);
            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return listbox;
    }

    public static List<BCDetailBox> GroupCustomeSizeTotal(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " select REPLACE(tb.customer_no,tb.customer_size) as customer_no,po,customer_size,QTY_RESULT,DESTINATION    from ( ";
            sql += " SELECT  a.PO, a.BOXNO,   b.customer_color,   b.customer_size,b.customer_no,   ";
            sql += " CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN SIZENO1 ";
            sql += "  WHEN customer_no = SKU_ITEM2 THEN SIZENO2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN SIZENO3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN SIZENO4 ";
            sql += " END as sizen, ";
            sql += " CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN QTY_RESULT1 ";
            sql += " WHEN customer_no = SKU_ITEM2 THEN QTY_RESULT2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN QTY_RESULT3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN QTY_RESULT3 ";
            sql += " END as QTY_RESULT, ";
            sql += " a.DESTINATION  ";
            sql += " FROM   MIZUNONEWBARBOXDT a   ";
            sql += " INNER JOIN   MIZUNOCUSTOMER b ON   b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  ";
            sql += " INNER JOIN  MIZUNONEWBARBOXRESULT c ON  c.boxno = a.BOXNO AND c.po = a.po  ";
            sql += " WHERE  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN (   ";
            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }

            sql += " group by a.PO, a.BOXNO,    b.customer_color,   b.customer_size,b.customer_no,CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN SIZENO1 ";
            sql += " WHEN customer_no = SKU_ITEM2 THEN SIZENO2 ";
            sql += " WHEN customer_no = SKU_ITEM3 THEN SIZENO3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN SIZENO4 ";
            sql += " END,CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN QTY_RESULT1 ";
            sql += "  WHEN customer_no = SKU_ITEM2 THEN QTY_RESULT2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN QTY_RESULT3 ";
            sql += "   WHEN customer_no = SKU_ITEM4 THEN QTY_RESULT3 ";
            sql += " END,a.DESTINATION ) tb order by REPLACE(tb.customer_no,tb.customer_size),po,customer_size,DESTINATION  ";


            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCustomer_no(rs.getString("customer_no"));
                detail.setPo(rs.getString("po"));
                detail.setCustomer_size(rs.getString("customer_size"));
                detail.setSumqty(rs.getString("QTY_RESULT"));
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

    public static List<BCDetailBox> GroupCustomeSizeAllTotal(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {
        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();
        String sql = "";
        try {

            sql += " select customer_size,sum(QTY_RESULT) as sumqty   from ( ";
            sql += " SELECT  a.PO, a.BOXNO,   b.customer_color,   b.customer_size,b.customer_no,   ";
            sql += " CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN SIZENO1 ";
            sql += "  WHEN customer_no = SKU_ITEM2 THEN SIZENO2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN SIZENO3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN SIZENO4 ";
            sql += " END as sizen, ";
            sql += " CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN QTY_RESULT1 ";
            sql += " WHEN customer_no = SKU_ITEM2 THEN QTY_RESULT2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN QTY_RESULT3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN QTY_RESULT3 ";
            sql += " END as QTY_RESULT, ";
            sql += " a.DESTINATION  ";
            sql += " FROM   MIZUNONEWBARBOXDT a   ";
            sql += " INNER JOIN   MIZUNOCUSTOMER b ON   b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4  ";
            sql += " INNER JOIN  MIZUNONEWBARBOXRESULT c ON  c.boxno = a.BOXNO AND c.po = a.po  ";
            sql += " WHERE  REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN (   ";
            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }

            sql += " group by a.PO, a.BOXNO,    b.customer_color,   b.customer_size,b.customer_no,CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN SIZENO1 ";
            sql += "  WHEN customer_no = SKU_ITEM2 THEN SIZENO2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN SIZENO3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN SIZENO4 ";
            sql += "  END,CASE ";
            sql += "  WHEN customer_no = SKU_ITEM1 THEN QTY_RESULT1 ";
            sql += "  WHEN customer_no = SKU_ITEM2 THEN QTY_RESULT2 ";
            sql += "  WHEN customer_no = SKU_ITEM3 THEN QTY_RESULT3 ";
            sql += "  WHEN customer_no = SKU_ITEM4 THEN QTY_RESULT3 ";
            sql += "  END,a.DESTINATION ) tb ";
          
            sql += " group by customer_size ";
            sql += " order by customer_size ";

            System.out.println(sql);

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCustomer_size(rs.getString("customer_size"));
                detail.setSumqty(rs.getString("sumqty"));
              
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

            sql += " SELECT COUNT(DISTINCT boxno) AS countbox, po,customer_no,customer_color,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,SKU_ITEM1, SKU_ITEM2,SKU_ITEM3,SKU_ITEM4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,sum(NETWEIGHT) as totalnw,sum(GROSSWEIGHT) as totalgw , DESTINATION ";
            sql += " FROM ( ";
            sql += " SELECT ";
            sql += " a.PO,";
            sql += " a.BOXNO, ";
            sql += " b.customer_no, ";
            sql += "  b.customer_color, ";
            sql += "  b.customer_size, ";
            sql += "  a.SIZENO1, ";
            sql += "  a.SIZENO2, ";
            sql += "  a.SIZENO3, ";
            sql += "  a.SIZENO4, ";
            sql += "  a.SKU_ITEM1, ";
            sql += "  a.SKU_ITEM2, ";
            sql += "  a.SKU_ITEM3, ";
            sql += "  a.SKU_ITEM4, ";
            sql += " a.NETWEIGHT, ";
            sql += " a.GROSSWEIGHT, ";
            sql += " c.QTY_RESULT1, ";
            sql += " c.QTY_RESULT2, ";
            sql += "  c.QTY_RESULT3, ";
            sql += "  c.QTY_RESULT4, ";
            sql += "  a.DESTINATION ";
            sql += "  FROM ";
            sql += "  MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN ";
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

            sql += " GROUP BY a.po, a.boxno, b.customer_no, b.customer_color,b.customer_size,a.SIZENO1,a.SIZENO2,a.SIZENO3,SIZENO4,a.SKU_ITEM1,a.SKU_ITEM2,a.SKU_ITEM3,a.SKU_ITEM4,a.NETWEIGHT,a.GROSSWEIGHT,c.QTY_RESULT1,c.QTY_RESULT2, c.QTY_RESULT3,c.QTY_RESULT4,a.DESTINATION ";
            sql += " ) tb ";
            sql += " GROUP BY ";
            sql += " po,customer_color,customer_no,customer_size,SIZENO1, SIZENO2,SIZENO3,SIZENO4,SKU_ITEM1, SKU_ITEM2,SKU_ITEM3,SKU_ITEM4,QTY_RESULT1,QTY_RESULT2,QTY_RESULT3,QTY_RESULT4,DESTINATION ";
            sql += " ORDER BY ";
            sql += " customer_size ";




            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            ps.setString(3, BOXSEQ);

            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();
                detail.setCountbox(rs.getString("countbox"));
                detail.setPo(rs.getString("po"));
                detail.setCustomer_no(rs.getString("customer_no"));
                detail.setCustomer_color(rs.getString("customer_color"));
                detail.setCustomer_size(rs.getString("customer_size"));
                detail.setSizen01(rs.getString("SIZENO1"));
                detail.setSizen02(rs.getString("SIZENO2"));
                detail.setSizen03(rs.getString("SIZENO3"));
                detail.setSizen04(rs.getString("SIZENO4"));

                detail.setSku_item1(rs.getString("SKU_ITEM1"));
                detail.setSku_item2(rs.getString("SKU_ITEM2"));
                detail.setSku_item3(rs.getString("SKU_ITEM3"));
                detail.setSku_item4(rs.getString("SKU_ITEM4"));

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

            sql = "select * from MIZUNONEWBARBOXINVOICE where INVOICEID = ? order by INVOICENO,PO,FIRSTDIGIT,CAST(STARTBOX as int)";
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
                iv.setCustomer(rs.getString("customer"));
                iv.setShipper(rs.getString("shipper"));
                iv.setShipfrom(rs.getString("shipfrom"));
                iv.setShipto(rs.getString("shipto"));
                iv.setFinald(rs.getString("FINAL"));
                iv.setMfg(rs.getString("MFG"));

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

    public static List<BCDetailBox> GroupDESCRIPTION(String po, String firstdigit, String STARTBOX, String ENDBOX) throws SQLException {

        List<BCDetailBox> listbox = new ArrayList<BCDetailBox>();

        String sql = "";
        try {

            sql += " SELECT  a.DESTINATION   FROM   MIZUNONEWBARBOXDT a ";
            sql += " INNER JOIN   MIZUNOCUSTOMER b ON   b.customer_no = a.SKU_ITEM1 OR b.customer_no = a.SKU_ITEM2 OR b.customer_no = a.SKU_ITEM3 OR b.customer_no = a.SKU_ITEM4 ";
            sql += " WHERE REGEXP_SUBSTR(a.BOXNO, '[[:alpha:]]+') = ? AND a.po = ? AND a.boxno IN ( ";
            for (int s = Integer.parseInt(STARTBOX); s < Integer.parseInt(ENDBOX) + 1; s++) {
                if (s < Integer.parseInt(ENDBOX)) {
                    sql += "'" + firstdigit + String.valueOf(s) + "',";
                } else {
                    sql += "'" + firstdigit + String.valueOf(s) + "') ";
                }
            }
            sql += " GROUP BY a.DESTINATION  ";


            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, firstdigit);
            ps.setString(2, po);
            rs = ps.executeQuery();

            while (rs.next()) {
                BCDetailBox detail = new BCDetailBox();

                detail.setDestination(rs.getString("DESTINATION"));

                listbox.add(detail);
            }


        } catch (Exception e) {
            e.printStackTrace();
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
