/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCReportDetailsProduct;
import com.pg.lib.service.DetailService;
import com.pg.lib.service.ReportService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

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
                String customer_no = request.getParameter("customer_no").trim();
                String customer_product = request.getParameter("customer_product").trim();
                String pallet = request.getParameter("pallet").trim();
                String start = request.getParameter("start").trim();
                String end = request.getParameter("end").trim();
                String firstdigit = request.getParameter("firstdigit").trim();
                String po = request.getParameter("po").trim();

                ReportService rs = new ReportService();
                List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, start, end, firstdigit);

                request.setAttribute("pallet", pallet);
                request.setAttribute("listproduct", list);
                request.setAttribute("customer_product", customer_product);
                request.setAttribute("customer_no", customer_no);
              

                getServletContext().getRequestDispatcher("/report/reportproduct.jsp").forward(request, response);
            } else if (type.equals("gettablereport")) {
                try {
                    String customer_no = request.getParameter("customer_no").trim();
                    String customer_product = request.getParameter("customer_product").trim();
                    String pallet = request.getParameter("pallet").trim();
                    String start = request.getParameter("start").trim();
                    String end = request.getParameter("end").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String po = request.getParameter("po").trim();

                    ReportService rs = new ReportService();
                    List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, start, end, firstdigit);



                    String html = "";
                    html += "<div class='row mb-3 text-center fs-4'>";
                    html += "<div class='col-12 col-md-4 col-lg-4'>";
                    html += "<b>รหัสสินค้า : </b> " + customer_product;
                    html += "</div>";
                    html += "<div class='col-12 col-md-4 col-lg-4'>";
                    html += "<b>รหัสลูกค้า :</b> " + customer_no;
                    html += "</div>";
                    html += "<div class='col-12 col-md-4 col-lg-4'>";
                    html += " <b>พาเลท :</b> " + pallet;
                    html += " </div>";
                    html += "</div>";
                    html += "<table class='table table-hover table-bordered text-center' id='tablereport'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th scope='col'>วันที่</th>";
                    html += "<th scope='col'>PO</th>";
                    html += "<th scope='col'>Production Order</th>";
                    html += "<th scope='col'>Firstdigit</th>";
                    html += "<th scope='col'>กล่องที่</th>";
                    html += "<th scope='col'>จำนวน</th>";
                    html += "<th scope='col'>หมายเหตุ</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (BCDetailBox li : list) {
                        String mark = "";
                        String qty_result = "";

                        if (li.getSku_item1().equals(customer_no)) {
                            qty_result = li.getQty_result1();
                            if (Integer.parseInt(li.getQty_result1()) < Integer.parseInt(li.getQty1())) {
                                mark = "*";
                            }
                        } else if (li.getSku_item2().equals(customer_no)) {
                            qty_result = li.getQty_result2();
                            if (Integer.parseInt(li.getQty_result2()) < Integer.parseInt(li.getQty1())) {
                                mark = "*";
                            }
                        } else if (li.getSku_item3().equals(customer_no)) {
                            qty_result = li.getQty_result3();
                            if (Integer.parseInt(li.getQty_result3()) < Integer.parseInt(li.getQty1())) {
                                mark = "*";
                            }
                        } else if (li.getSku_item4().equals(customer_no)) {
                            qty_result = li.getQty_result4();
                            if (Integer.parseInt(li.getQty_result4()) < Integer.parseInt(li.getQty1())) {
                                mark = "*";
                            }
                        }


                        DetailService ds = new DetailService();

                        html += "<tr>";
                        html += "<td>" + ds.ChackNull(li.getDate_modify()) + "</td>";
                        html += "<td>" + ds.ChackNull(li.getPo()) + "</td>";
                        html += "<td>" + ds.ChackNull(li.getProdorder()) + "</td>";
                        html += "<td>" + ds.ChackNull(li.getBoxno().substring(0, 1)) + "</td>";
                        html += "<td>" + ds.ChackNull(li.getBoxno()) + "</td>";
                        html += "<td>" + ds.ChackNull(qty_result) + "</td>";
                        html += "<td>" + ds.ChackNull(mark) + "</td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";

                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getreportproductdetailspdf")) {
               
                String customer_no = request.getParameter("customer_no").trim();
                String customer_product = request.getParameter("customer_product").trim();
                String pallet = request.getParameter("pallet").trim();
                String start = request.getParameter("start").trim();
                String end = request.getParameter("end").trim();
                String firstdigit = request.getParameter("firstdigit").trim();
                String po = request.getParameter("po").trim();

                ReportService rs = new ReportService();
                List<BCDetailBox> list = rs.listreportproductdetails(po, customer_no, customer_product, pallet, start, end, firstdigit);

                request.setAttribute("pallet", pallet);
                request.setAttribute("listproduct", list);
                request.setAttribute("customer_product", customer_product);
                request.setAttribute("customer_no", customer_no);
                request.setAttribute("po", po);

                getServletContext().getRequestDispatcher("/report/reportproductpdf.jsp").forward(request, response);
                 
               
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
