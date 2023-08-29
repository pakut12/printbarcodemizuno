/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.service.InvoiceService;
import java.io.*;
import java.net.*;

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
                    
                    
                    System.out.println(invoiceno);
                    System.out.println(invoicedate);
                    System.out.println(saveingno);
                    System.out.println(listpo);
                    
                    boolean status = InvoiceService.addinvoice(invoiceno, invoicedate, saveingno, listpo);

                    if(status){
                        out.print("true");
                    }else{
                        out.print("false");
                    }
                    
                    
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
