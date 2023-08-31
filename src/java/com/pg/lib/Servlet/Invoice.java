/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.service.InvoiceService;
import com.pg.lib.utility.Utility;
import java.io.*;
import java.net.*;

import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author pakutsing
 */
public class Invoice extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type").trim();
            if (type.equals("addinvoice")) {
                try {

                    String invoiceno = request.getParameter("invoiceno");
                    String invoicedate = request.getParameter("invoicedate");
                    String saveingno = request.getParameter("saveingno");
                    String listpo = request.getParameter("po");

                    boolean status = InvoiceService.addinvoice(invoiceno, invoicedate, saveingno, listpo);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("gettableinvoice")) {
                try {
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    InvoiceService ivs = new InvoiceService();
                    List<BCInvoice> rows = ivs.getDataFromDatabase(start, length, searchValue, orderColumn, orderDir);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", ivs.getTotalRecords());
                    obj.put("recordsFiltered", ivs.getFilteredRecords(searchValue));
                    obj.put("data", gson.toJsonTree(rows));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("viewinvoice")) {

                try {

                    String invoiceid = request.getParameter("invoiceid").trim();
                    List<BCInvoice> listdata = InvoiceService.getDataFromDatabaseById(invoiceid);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("invoiceid", listdata.get(0).getInvoiceid());
                    obj.put("invoiceno", listdata.get(0).getInvoiceno());
                    obj.put("invoicedate", Utility.CoverDatetoInput(listdata.get(0).getInvoicedate()));
                    obj.put("saveingno", listdata.get(0).getSaveingno());
                    obj.put("data", gson.toJsonTree(listdata));

                    out.print(obj);

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
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
