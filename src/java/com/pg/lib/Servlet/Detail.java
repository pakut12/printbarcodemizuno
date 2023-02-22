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
                List<BCDetailBox> detailbox = ds.GetDetailBoxAll(posearch, numstart, numend);


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
            } else if (type.equals("updatedetailsall")) {
                String pobefore = request.getParameter("pobefore").trim();
                String startboxbefore = request.getParameter("startboxbefore").trim();
                String endboxbefore = request.getParameter("endboxbefore").trim();

                String shipto = request.getParameter("shipto").trim();
                String qtyperbox = request.getParameter("qtyperbox").trim();
                String firstdigit = request.getParameter("firstdigit").trim();
                String startbox = request.getParameter("startbox").trim();
                String endbox = request.getParameter("endbox").trim();
                String allbox = request.getParameter("allbox").trim();
                String po = request.getParameter("po").trim();
                String desctxt = request.getParameter("desctxt").trim();
                String grossweight = request.getParameter("grossweight").trim();
                String netweight = request.getParameter("netweight").trim();
                String country_origin = request.getParameter("country_origin").trim();

                String sku_item1 = request.getParameter("sku_item1").trim();
                String upc_code1 = request.getParameter("upc_code1").trim();
                String colorno1 = request.getParameter("colorno1").trim();
                String sizeno1 = request.getParameter("sizeno1").trim();
                String qty1 = request.getParameter("qty1").trim();

                String sku_item2 = request.getParameter("sku_item2").trim();
                String upc_code2 = request.getParameter("upc_code2").trim();
                String colorno2 = request.getParameter("colorno2").trim();
                String sizeno2 = request.getParameter("sizeno2").trim();
                String qty2 = request.getParameter("qty2").trim();

                String sku_item3 = request.getParameter("sku_item3").trim();
                String upc_code3 = request.getParameter("upc_code3").trim();
                String colorno3 = request.getParameter("colorno3").trim();
                String sizeno3 = request.getParameter("sizeno3").trim();
                String qty3 = request.getParameter("qty3").trim();

                String sku_item4 = request.getParameter("sku_item4").trim();
                String upc_code4 = request.getParameter("upc_code4").trim();
                String colorno4 = request.getParameter("colorno4").trim();
                String sizeno4 = request.getParameter("sizeno4").trim();
                String qty4 = request.getParameter("qty4").trim();


                DetailService ds = new DetailService();
                Boolean statusupdate = ds.UpdateDetailBoxAll(pobefore, startboxbefore, endboxbefore, shipto, qtyperbox, firstdigit, startbox, endbox, allbox, po, desctxt, grossweight, netweight, country_origin, sku_item1, upc_code1, colorno1, sizeno1, qty1, sku_item2, upc_code2, colorno2, sizeno2, qty2, sku_item3, upc_code3, colorno3, sizeno3, qty3, sku_item4, upc_code4, colorno4, sizeno4, qty4);
                JSONObject obj = new JSONObject();

                if (statusupdate) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

                out.print(obj);
            } else if (type.equals("deletedetailsall")) {
                String pobefore = request.getParameter("pobefore").trim();

                DetailService ds = new DetailService();
                Boolean statusDT = ds.DeleteDetailBoxMIZUNONEWBARBOXDTAll(pobefore);
                Boolean statusHD = ds.DeleteDetailBoxMIZUNONEWBARBOXHDAll(pobefore);
               
                JSONObject obj = new JSONObject();

                if (statusDT && statusHD) {
                    obj.put("status", "true");
                } else {
                    obj.put("status", "false");
                }

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
