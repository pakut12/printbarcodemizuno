/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCReportDetailsProduct;
import com.pg.lib.service.DetailService;
import com.pg.lib.service.ReportService;
import com.pg.lib.utility.Utility;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Report extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type").trim();
            if (type.equals("getreportproductdetails")) {

                try {

                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String boxstart = request.getParameter("start").trim();
                    String boxend = request.getParameter("end").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String po = request.getParameter("po").trim();
                    String datestart = request.getParameter("datestart").replaceAll("-", "/");
                    String datestop = request.getParameter("datestop").replaceAll("-", "/");

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, 0, 0, "", "", "", datestart, datestop);


                    System.out.println(pallet);
                    request.setAttribute("pallet", pallet);
                    request.setAttribute("listproduct", list);
                    request.setAttribute("customer_product", customer_product);
                    request.setAttribute("customer_no", customer_no);

                    getServletContext().getRequestDispatcher("/report/reportproduct.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("gettablereport")) {
                try {
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String boxstart = request.getParameter("boxstart").trim();
                    String boxend = request.getParameter("boxend").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String po = request.getParameter("po").trim();
                    String datestart = request.getParameter("datestart").replaceAll("-", "/");
                    String datestop = request.getParameter("datestop").replaceAll("-", "/");

                    int draw = Integer.parseInt(request.getParameter("draw").trim());
                    int start = Integer.parseInt(request.getParameter("start").trim());
                    int length = Integer.parseInt(request.getParameter("length").trim());
                    String searchValue = request.getParameter("search[value]").trim();
                    String orderColumn = request.getParameter("order[0][column]").trim();
                    String orderDir = request.getParameter("order[0][dir]").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, start, length, searchValue, orderColumn, orderDir, datestart, datestop);
                    List<BCDetailBox> listsum = rs.getsumproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, start, length, searchValue, orderColumn, orderDir, datestart, datestop);

                    int sumqty = 0;
                    int sumqty_result = 0;
                    int sumdiff = 0;
                    int diff = 0;
                    int summark = 0;
                    String qty_result = "";
                    String qty = "";

                    for (BCDetailBox li : listsum) {
                        int mark = 0;


                        if (li.getSku_item1().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result1();
                            qty = li.getQty1();
                        } else if (li.getSku_item2().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result2();
                            qty = li.getQty2();

                        } else if (li.getSku_item3().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result3();
                            qty = li.getQty3();

                        } else if (li.getSku_item4().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result4();
                            qty = li.getQty4();

                        }

                        if (Integer.parseInt(qty_result) < Integer.parseInt(qty)) {
                            mark++;
                            diff = Integer.parseInt(qty) - Integer.parseInt(qty_result);
                        }

                        sumqty_result += Integer.parseInt(qty_result);
                        sumqty += Integer.parseInt(qty);
                        sumdiff += diff;
                        summark += mark;

                    }


                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", rs.getTotalRecordsproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, datestart, datestop));
                    obj.put("recordsFiltered", rs.getFilteredRecordsproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, start, length, searchValue, orderColumn, orderDir, datestart, datestop));
                    obj.put("data", gson.toJsonTree(list));

                    DecimalFormat df = new DecimalFormat("#,###");


                    obj.put("sumqty_result", df.format(sumqty_result));
                    obj.put("sumqty", df.format(sumqty));
                    obj.put("sumdiff", df.format(sumdiff));
                    obj.put("summark", df.format(summark));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getreportproductdetailspdf")) {
                try {
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String boxstart = request.getParameter("start").trim();
                    String boxend = request.getParameter("end").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String po = request.getParameter("po").trim();
                    String datestart = request.getParameter("datestart").replaceAll("-", "/");
                    String datestop = request.getParameter("datestop").replaceAll("-", "/");



                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, boxstart, boxend, firstdigit, 0, 0, "", "", "", datestart, datestop);

                    request.setAttribute("pallet", pallet);
                    request.setAttribute("listproduct", list);
                    request.setAttribute("customer_product", customer_product);
                    request.setAttribute("customer_no", customer_no);

                    getServletContext().getRequestDispatcher("/report/reportproductpdf.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("gettablereportdetailinventories")) {

                try {
                    String customer = request.getParameter("customer").trim();
                    String destination = request.getParameter("destination").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String startbox = request.getParameter("startbox").trim();
                    String endbox = request.getParameter("endbox").trim();
                    String po = request.getParameter("po").trim();
                    String po_old = request.getParameter("po_old").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String datestart = request.getParameter("datestart").trim();
                    String datestop = request.getParameter("datestop").trim();


                    int draw = Integer.parseInt(request.getParameter("draw").trim());
                    int start = Integer.parseInt(request.getParameter("start").trim());
                    int length = Integer.parseInt(request.getParameter("length").trim());
                    String searchValue = request.getParameter("search[value]").trim();
                    String orderColumn = request.getParameter("order[0][column]").trim();
                    String orderDir = request.getParameter("order[0][dir]").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, String.valueOf(start), String.valueOf(length), searchValue, datestart, datestop, orderColumn, orderDir);
                    List<BCDetailBox> listsum = rs.getsumdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, String.valueOf(start), String.valueOf(length), searchValue, datestart, datestop, orderColumn, orderDir);

                    int sumqty = 0;
                    int sumqty_result = 0;
                    int sumdiff = 0;
                    int diff = 0;
                    int summark = 0;
                    String qty_result = "";
                    String qty = "";

                    for (BCDetailBox li : listsum) {
                        int mark = 0;

                        if (li.getSku_item1().equals(li.getCustomer_no())) {

                            qty_result = li.getQty_result1();
                            qty = li.getQty1();
                            if (Integer.parseInt(li.getQty_result1()) != Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty1()) - Integer.parseInt(li.getQty_result1());
                            }
                        } else if (li.getSku_item2().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result2();
                            qty = li.getQty2();
                            if (Integer.parseInt(li.getQty_result2()) != Integer.parseInt(li.getQty2())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty2()) - Integer.parseInt(li.getQty_result2());
                            }
                        } else if (li.getSku_item3().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result3();
                            qty = li.getQty3();
                            if (Integer.parseInt(li.getQty_result3()) != Integer.parseInt(li.getQty3())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty3()) - Integer.parseInt(li.getQty_result3());
                            }
                        } else if (li.getSku_item4().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result4();
                            qty = li.getQty4();
                            if (Integer.parseInt(li.getQty_result4()) != Integer.parseInt(li.getQty4())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty4()) - Integer.parseInt(li.getQty_result4());
                            }

                        }

                        System.out.println("------------------------------------------------------------------------------");
                        System.out.println("BoxNo : " + li.getBoxno());
                        System.out.println("Sku_item1 : " + li.getSku_item1());
                        System.out.println("Sku_item2 : " + li.getSku_item2());
                        System.out.println("Sku_item3 : " + li.getSku_item3());
                        System.out.println("Sku_item4 : " + li.getSku_item4());
                        System.out.println("Qty1 : " + li.getQty1());
                        System.out.println("Qty2 : " + li.getQty2());
                        System.out.println("Qty3 : " + li.getQty3());
                        System.out.println("Qty4 : " + li.getQty4());
                        System.out.println("Qty_result1 : " + li.getQty_result1());
                        System.out.println("Qty_result2 : " + li.getQty_result2());
                        System.out.println("Qty_result3 : " + li.getQty_result3());
                        System.out.println("Qty_result4 : " + li.getQty_result4());
                        System.out.println("Customer_no : " + li.getCustomer_no());
                        System.out.println("Qty : " + qty);
                        System.out.println("Qty_result : " + qty_result);
                        System.out.println("Mark : " + mark);
                        System.out.println("------------------------------------------------------------------------------");


                        sumqty_result += Integer.parseInt(qty_result);
                        sumqty += Integer.parseInt(qty);
                        sumdiff += diff;
                        summark += mark;

                    }



                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", rs.getTotalRecordsdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, datestart, datestop));
                    obj.put("recordsFiltered", rs.getFilteredRecordsdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, start, length, searchValue, datestart, datestop));
                    obj.put("data", gson.toJsonTree(list));
                    DecimalFormat df = new DecimalFormat("#,###");


                    obj.put("sumqty_result", String.valueOf(df.format(sumqty_result)));
                    obj.put("sumqty", String.valueOf(df.format(sumqty)));
                    obj.put("sumdiff", String.valueOf(df.format(sumqty - sumqty_result)));
                    obj.put("summark", String.valueOf(df.format(summark)));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getreportdetailinventories")) {
                try {

                    String customer = request.getParameter("customer").trim();
                    String destination = request.getParameter("destination").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String firstdigit = request.getParameter("firstdigit");
                    String start = request.getParameter("numberbox_start").trim();
                    String end = request.getParameter("numberbox_end").trim();
                    String po = request.getParameter("po").trim();
                    String po_old = request.getParameter("po_old").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String datestart = request.getParameter("datestart").trim();
                    String datestop = request.getParameter("datestop").trim();

                    ReportService rs = new ReportService();

                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, start, end, firstdigit, "", "", "", datestart, datestop, "", "");
                    request.setAttribute("listproduct", list);

                    request.setAttribute("po", po);


                    getServletContext().getRequestDispatcher("/report/reportinventories.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getreportdetailinventoriespdf")) {
                try {

                    String customer = request.getParameter("customer").trim();
                    String destination = request.getParameter("destination").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String firstdigit = request.getParameter("firstdigit");
                    String start = request.getParameter("numberbox_start").trim();
                    String end = request.getParameter("numberbox_end").trim();
                    String po = request.getParameter("po").trim();
                    String po_old = request.getParameter("po_old").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String datestart = request.getParameter("datestart").trim();
                    String datestop = request.getParameter("datestop").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, start, end, firstdigit, "", "", "", datestart, datestop, "", "");
                    request.setAttribute("listproduct", list);



                    getServletContext().getRequestDispatcher("/report/reportinventoriespdf.jsp").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("gettablereportviewpo")) {
                try {
                    String po = request.getParameter("po").trim();
                    String customer = request.getParameter("customer").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String datestart = request.getParameter("datestart").trim().replaceAll("-", "/");
                    String dateend = request.getParameter("dateend").trim().replaceAll("-", "/");

                    int draw = Integer.parseInt(request.getParameter("draw").trim());
                    int start = Integer.parseInt(request.getParameter("start").trim());
                    int length = Integer.parseInt(request.getParameter("length").trim());
                    String searchValue = request.getParameter("search[value]").trim();
                    String orderColumn = request.getParameter("order[0][column]").trim();
                    String orderDir = request.getParameter("order[0][dir]").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportviewpo(customer, customer_no, customer_product, datestart, dateend, start, length, searchValue, orderColumn, orderDir, po);


                    List<BCDetailBox> Alllist = new ArrayList<BCDetailBox>();
                    for (BCDetailBox z : list) {
                        String input = z.getBoxno();
                        String digits = "";
                        String letters = "";

                        for (int i = 0; i < input.length(); i++) {
                            char c = input.charAt(i);
                            if (Character.isDigit(c)) {
                                digits += c;
                            } else if (Character.isLetter(c)) {
                                letters += c;
                            }
                        }

                        BCDetailBox box = new BCDetailBox();
                        box.setBoxno(digits);
                        box.setFirstdigit(letters);
                        box.setPo(z.getPo());
                        box.setDate_create(z.getDate_create());
                        Alllist.add(box);
                    }


                    String txt = Utility.groupnumberbypo(Alllist);

                    System.out.println(txt);


                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", rs.getTotalRecords(customer, customer_no, customer_product, datestart, dateend, po));
                    obj.put("recordsFiltered", rs.getFilteredRecords(customer, customer_no, customer_product, datestart, dateend, searchValue, po));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());



                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getreporviewpo")) {
                try {
                    String customer = request.getParameter("customer").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String datestart = request.getParameter("datestart").trim().replaceAll("-", "/");
                    String dateend = request.getParameter("dateend").trim().replaceAll("-", "/");

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = null;

                    if (datestart.equals("") || dateend.equals("")) {
                        //list = rs.listreportviewpo(customer, customer_no, customer_product, "", "");
                    } else {
                        //list = rs.listreportviewpo(customer, customer_no, customer_product, datestart, dateend);
                    }

                    request.setAttribute("listproduct", list);
                    getServletContext().getRequestDispatcher("/report/reporviewpo.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getreporviewpopdf")) {
                try {
                    String customer = request.getParameter("customer").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String datestart = request.getParameter("datestart").trim().replaceAll("-", "/");
                    String dateend = request.getParameter("dateend").trim().replaceAll("-", "/");

                    ReportService rs = new ReportService();

                    List<BCDetailBox> list = null;
                    if (datestart.equals("") || dateend.equals("")) {
                        // list = rs.listreportviewpo(customer, customer_no, customer_product, "", "");
                    } else {
                        //list = rs.listreportviewpo(customer, customer_no, customer_product, datestart, dateend);
                    }

                    request.setAttribute("customer", customer);
                    request.setAttribute("listproduct", list);

                    getServletContext().getRequestDispatcher("/report/reporviewpopdf.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
