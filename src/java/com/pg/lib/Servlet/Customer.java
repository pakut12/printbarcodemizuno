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
import org.json.JSONException;
import org.json.JSONObject;

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type");
            if (type.equals("addCustomer")) {
                CustomerService cs = new CustomerService();

                String customer_no = request.getParameter("customer_no").trim();
                String customer_barcode = request.getParameter("customer_barcode").trim();
                String customer_color = request.getParameter("customer_color").trim();
                String customer_size = request.getParameter("customer_size").trim();
                String customer_description = request.getParameter("customer_description").trim();
                Boolean status = cs.AddDetailCustomer(customer_no, customer_barcode, customer_color, customer_size, customer_description);
                JSONObject obj = new JSONObject();
                if (status) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

                out.print(obj);

            } else if (type.equals("GetTableCustomer")) {
                CustomerService cs = new CustomerService();
                int num = 1;
                List<BCCustomer> listcustomerdetail = cs.getDetailCustomer();
                String html = "";
                html += "<table class='table table-striped table-sm' id='mytable'>";
                html += "<thead>";
                html += "<tr>";
                html += "<th>≈”¥—∫</th>";
                html += "<th>√À— ≈Ÿ°§È“</th>";
                html += "<th>√À— ∫“√Ï‚§È¥</th>";
                html += "<th>Color</th>";
                html += "<th>Size</th>";
                html += "<th>Description</th>";
                html += "<th>‡‡°È‰¢</th>";
                html += "<th>≈∫</th>";
                html += "</tr>";
                html += "</thead>";
                html += "<tbody>";
                for (BCCustomer list : listcustomerdetail) {
                    html += "<tr>";
                    html += "<td>" + num + "</td>";
                    html += "<td>" + list.getCustomer_no() + "</td>";
                    html += "<td>" + list.getCustomer_barcode() + "</td>";
                    html += "<td>" + list.getCustomer_color() + "</td>";
                    html += "<td>" + list.getCustomer_size() + "</td>";
                    html += "<td>" + list.getCustomer_description() + "</td>";
                    html += "<td><button class='btn btn-warning btn-sm' type='button' onclick='edit_customer(" + list.getCustomer_id() + ")' id='bt_edit'>‡‡°È‰¢</button></td>";
                    html += "<td><button class='btn btn-danger btn-sm' type='button'  onclick='del_customer(" + list.getCustomer_id() + ")' id='bt_del'>≈∫</button></td>";
                    html += "</tr>";
                    num++;
                }
                html += "</tbody>";
                html += "</table>";

                out.print(html);
            } else if (type.equals("del_customer")) {
                String customer_id = request.getParameter("customer_id").trim();
                CustomerService cs = new CustomerService();
                Boolean statusdel = cs.DelDetailCustomer(customer_id);
                String statusjson = "";

                if (statusdel) {
                    statusjson = "true";
                } else {
                    statusjson = "false";
                }

                JSONObject obj = new JSONObject();
                obj.put("status", statusjson);

                out.print(obj);

            } else if (type.equals("GetCustomerByID")) {
                CustomerService cs = new CustomerService();
                String id = request.getParameter("customer_id").trim();
                List<BCCustomer> listcustomerdetail = cs.getDetailCustomerByID(id);

                JSONObject obj = new JSONObject();
                obj.put("customer_id", listcustomerdetail.get(0).getCustomer_id());
                obj.put("customer_no", listcustomerdetail.get(0).getCustomer_no());
                obj.put("customer_barcode", listcustomerdetail.get(0).getCustomer_barcode());
                obj.put("customer_color", listcustomerdetail.get(0).getCustomer_color());
                obj.put("customer_size", listcustomerdetail.get(0).getCustomer_size());
                obj.put("customer_description", listcustomerdetail.get(0).getCustomer_description());

                out.print(obj);

            } else if (type.equals("update_customer")) {
                CustomerService cs = new CustomerService();
                String customer_id = request.getParameter("customer_id").trim();
                String customer_no = request.getParameter("customer_no").trim();
                String customer_barcode = request.getParameter("customer_barcode").trim();
                String customer_color = request.getParameter("customer_color").trim();
                String customer_size = request.getParameter("customer_size").trim();
                String customer_description = request.getParameter("customer_description").trim();

                Boolean statusupdate = cs.UpdateDetailCustomer(customer_id, customer_no, customer_barcode, customer_color, customer_size, customer_description);

                JSONObject obj = new JSONObject();
                if (statusupdate) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

                out.print(obj);

            } else if (type.equals("update_customer")) {
                CustomerService cs = new CustomerService();
                String customer_id = request.getParameter("customer_id").trim();
                String customer_no = request.getParameter("customer_no").trim();
                String customer_barcode = request.getParameter("customer_barcode").trim();
                String customer_color = request.getParameter("customer_color").trim();
                String customer_size = request.getParameter("customer_size").trim();
                String customer_description = request.getParameter("customer_description").trim();

                Boolean statusupdate = cs.UpdateDetailCustomer(customer_id, customer_no, customer_barcode, customer_color, customer_size, customer_description);

                JSONObject obj = new JSONObject();
                if (statusupdate) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

                out.print(obj);
            } else if (type.equals("chack_customer")) {
                String customer_id = request.getParameter("customer_id").trim();
                CustomerService cs = new CustomerService();
                List<BCCustomer> list = cs.ChackDetailCustomerAll(customer_id);
                JSONObject obj = new JSONObject();
                obj.put("customer_id", list.get(0).getCustomer_id());
                obj.put("customer_no", list.get(0).getCustomer_no());
                obj.put("customer_barcode", list.get(0).getCustomer_barcode());
                obj.put("customer_color", list.get(0).getCustomer_color());
                obj.put("customer_size", list.get(0).getCustomer_size());
                obj.put("customer_quantity", list.get(0).getCustomer_quantity());
                obj.put("customer_description", list.get(0).getCustomer_description());
                out.print(obj);
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
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
            }
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
