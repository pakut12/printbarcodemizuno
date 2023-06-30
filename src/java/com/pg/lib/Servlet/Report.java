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
import java.io.*;
import java.net.*;

import java.sql.SQLException;
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
                            if (Integer.parseInt(li.getQty_result1()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty1()) - Integer.parseInt(li.getQty_result1());
                            }
                        } else if (li.getSku_item2().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result2();
                            qty = li.getQty2();
                            if (Integer.parseInt(li.getQty_result2()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty2()) - Integer.parseInt(li.getQty_result2());
                            }
                        } else if (li.getSku_item3().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result3();
                            qty = li.getQty3();
                            if (Integer.parseInt(li.getQty_result3()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty3()) - Integer.parseInt(li.getQty_result3());
                            }
                        } else if (li.getSku_item4().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result4();
                            qty = li.getQty4();
                            if (Integer.parseInt(li.getQty_result4()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty4()) - Integer.parseInt(li.getQty_result4());
                            }
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

                    obj.put("sumqty_result", sumqty_result);
                    obj.put("sumqty", sumqty);
                    obj.put("sumdiff", sumdiff);
                    obj.put("summark", summark);

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

                    int draw = Integer.parseInt(request.getParameter("draw").trim());
                    int start = Integer.parseInt(request.getParameter("start").trim());
                    int length = Integer.parseInt(request.getParameter("length").trim());
                    String searchValue = request.getParameter("search[value]").trim();
                    String orderColumn = request.getParameter("order[0][column]").trim();
                    String orderDir = request.getParameter("order[0][dir]").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, String.valueOf(start), String.valueOf(length), searchValue);
                    List<BCDetailBox> listsum = rs.getsumdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, String.valueOf(start), String.valueOf(length), searchValue);

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
                            if (Integer.parseInt(li.getQty_result1()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty1()) - Integer.parseInt(li.getQty_result1());
                            }
                        } else if (li.getSku_item2().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result2();
                            qty = li.getQty2();
                            if (Integer.parseInt(li.getQty_result2()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty2()) - Integer.parseInt(li.getQty_result2());
                            }
                        } else if (li.getSku_item3().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result3();
                            qty = li.getQty3();
                            if (Integer.parseInt(li.getQty_result3()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty3()) - Integer.parseInt(li.getQty_result3());
                            }
                        } else if (li.getSku_item4().equals(li.getCustomer_no())) {
                            qty_result = li.getQty_result4();
                            qty = li.getQty4();
                            if (Integer.parseInt(li.getQty_result4()) < Integer.parseInt(li.getQty1())) {
                                mark++;
                                diff = Integer.parseInt(li.getQty4()) - Integer.parseInt(li.getQty_result4());
                            }
                        }

                        sumqty_result += Integer.parseInt(qty_result);
                        sumqty += Integer.parseInt(qty);
                        sumdiff += diff;
                        summark += mark;

                    }



                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", rs.getTotalRecordsdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit));
                    obj.put("recordsFiltered", rs.getFilteredRecordsdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, startbox, endbox, firstdigit, start, length, searchValue));
                    obj.put("data", gson.toJsonTree(list));

                    obj.put("sumqty_result", sumqty_result);
                    obj.put("sumqty", sumqty);
                    obj.put("sumdiff", sumdiff);
                    obj.put("summark", summark);

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
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String start = request.getParameter("numberbox_start").trim();
                    String end = request.getParameter("numberbox_end").trim();
                    String po = request.getParameter("po").trim();
                    String po_old = request.getParameter("po_old").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String prodorder = request.getParameter("prodorder").trim();

                    ReportService rs = new ReportService();

                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, start, end, firstdigit, "", "", "");
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
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String start = request.getParameter("numberbox_start").trim();
                    String end = request.getParameter("numberbox_end").trim();
                    String po = request.getParameter("po").trim();
                    String po_old = request.getParameter("po_old").trim();
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String prodorder = request.getParameter("prodorder").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportdetailinventories(prodorder, customer, destination, po, po_old, customer_no, customer_product, pallet, start, end, firstdigit, "", "", "");
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
