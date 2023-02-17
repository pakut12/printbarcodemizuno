/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCCustomer;
import com.pg.lib.service.CustomerService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class Customer extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type");
            if (type.equals("addCustomer")) {
                CustomerService cs = new CustomerService();

                String customer_no = request.getParameter("customer_no");
                String customer_barcode = request.getParameter("customer_barcode");
                String customer_color = request.getParameter("customer_color");
                String customer_size = request.getParameter("customer_size");
                Boolean status = cs.AddDetailCustomer(customer_no, customer_barcode, customer_color, customer_size);

                if (status) {
                    out.print("true");
                } else {
                    out.print("true");
                }
            } else if (type.equals("GetTableCustomer")) {
                CustomerService cs = new CustomerService();
                List<BCCustomer> listcustomerdetail = cs.getDetailCustomer();
                String html = "";
                html += "<table class='table table-striped' id='mytable'>";
                html += "<thead>";
                html += "<tr>";
                html += "<th>√À— ≈Ÿ°§È“</th>";
                html += "<th>√À— ∫“√Ï‚§È¥</th>";
                html += "<th>Color</th>";
                html += "<th>Size</th>";
                html += "<th>®”π«πµ—«</th>";
                html += "<th>‡‡°È‰¢</th>";
                html += "<th>≈∫</th>";
                html += "</tr>";
                html += "</thead>";
                html += "<tbody>";
                for (BCCustomer list : listcustomerdetail) {
                    html += "<tr>";
                    html += "<td>" + list.getCustomer_no() + "</td>";
                    html += "<td>" + list.getCustomer_barcode() + "</td>";
                    html += "<td>" + list.getCustomer_color() + "</td>";
                    html += "<td>" + list.getCustomer_size() + "</td>";
                    html += "<td>" + list.getCustomer_quantity() + "</td>";
                    html += "<td><button class='btn btn-warning btn-sm' type='button' id='bt_edit'>‡‡°È‰¢</button></td>";
                    html += "<td><button class='btn btn-danger btn-sm' type='button' id='bt_del'>≈∫</button></td>";
                    html += "</tr>";
                }
                html += "</tbody>";
                html += "</table>";

                out.print(html);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
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
