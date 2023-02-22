/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.service.DetailService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Detail extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, JSONException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type");
            if (type.equals("adddetails")) {

                String customer_num = request.getParameter("customer_num");
                String quantity_box = request.getParameter("quantity_box");
                String initial = request.getParameter("initial");
                String numberbox_start = request.getParameter("numberbox_start");
                String numberbox_end = request.getParameter("numberbox_end");
                String po = request.getParameter("po");
                String gw = request.getParameter("gw");
                String nw = request.getParameter("nw");
                String country = request.getParameter("country");
                String quantitytotal_box = request.getParameter("quantitytotal_box");
                String description = request.getParameter("description");
                String[] customer1_id = request.getParameterValues("customer1_id[]");
                String[] customer2_id = request.getParameterValues("customer2_id[]");
                String[] customer3_id = request.getParameterValues("customer3_id[]");
                String[] customer4_id = request.getParameterValues("customer4_id[]");

                DetailService ds = new DetailService();

                Boolean statusdt = ds.AddDataToMIZUNONEWBARBOXDT(customer_num, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id);
                Boolean statushd = ds.AddDataToMIZUNONEWBARBOXHD(customer_num, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id);
                JSONObject obj = new JSONObject();
                if (statusdt && statushd) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

                out.print(obj);
            } else if (type.equals("getdetails")) {
                String posearch = request.getParameter("posearch");
                String numstart = request.getParameter("numstart");
                String numend = request.getParameter("numend");
                String status = "";
                DetailService ds = new DetailService();
                List<BCDetailBox> detailbox = ds.GetDetailBox(posearch, numstart, numend);
                

                JSONObject obj = new JSONObject();
                obj.put("po", detailbox.get(0).getPo());
                obj.put("startbox", detailbox.get(0).getStartbox());
                obj.put("endbox", detailbox.get(0).getEndbox());
                obj.put("firstdigit", detailbox.get(0).getFirstdigit());
                obj.put("shipfrom", detailbox.get(0).getShipfrom());
                obj.put("shipto", detailbox.get(0).getShipto());
                obj.put("qtyperbox", detailbox.get(0).getQtyperbox());
                obj.put("desctxt", detailbox.get(0).getDesctxt());
                obj.put("grossweight", detailbox.get(0).getGrossweight());
                obj.put("netweight", detailbox.get(0).getNetweight());
                obj.put("country_origin", detailbox.get(0).getCountry_origin());
                obj.put("allbox", detailbox.get(0).getAllbox());
              

                obj.put("sku_item1", detailbox.get(0).getSku_item1());
                obj.put("upc_code1", detailbox.get(0).getUpc_code1());
                obj.put("qty1", detailbox.get(0).getQty1());
                obj.put("sizeno1", detailbox.get(0).getSizen01());
                obj.put("colorno1", detailbox.get(0).getColorn01());

                obj.put("sku_item2", detailbox.get(0).getSku_item2());
                obj.put("upc_code2", detailbox.get(0).getUpc_code2());
                obj.put("qty2", detailbox.get(0).getQty2());
                obj.put("sizeno2", detailbox.get(0).getSizen02());
                obj.put("colorno2", detailbox.get(0).getColorn02());

                obj.put("sku_item3", detailbox.get(0).getSku_item3());
                obj.put("upc_code3", detailbox.get(0).getUpc_code3());
                obj.put("qty3", detailbox.get(0).getQty3());
                obj.put("sizeno3", detailbox.get(0).getSizen03());
                obj.put("colorno3", detailbox.get(0).getColorn03());

                obj.put("sku_item4", detailbox.get(0).getSku_item4());
                obj.put("upc_code4", detailbox.get(0).getUpc_code4());
                obj.put("qty4", detailbox.get(0).getQty4());
                obj.put("sizeno4", detailbox.get(0).getSizen04());
                obj.put("colorno4", detailbox.get(0).getColorn04());

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
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
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
