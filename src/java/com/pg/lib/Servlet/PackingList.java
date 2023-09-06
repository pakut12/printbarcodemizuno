/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.service.PackingListService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
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
public class PackingList extends HttpServlet {

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

            if (type.equals("checkqty")) {
                try {

                    String po = request.getParameter("po").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String STARTBOX = request.getParameter("startbox").trim();
                    String ENDBOX = request.getParameter("endbox").trim();

                    List<BCDetailBox> CheckQty = PackingListService.CheckQty(po, firstdigit, STARTBOX, ENDBOX);

                    String txt = "";


                    for (BCDetailBox box : CheckQty) {
                        int qty1 = 0;
                        int qty2 = 0;
                        int qty3 = 0;
                        int qty4 = 0;

                        if (box.getQty1() != null) {
                            qty1 = Integer.parseInt(box.getQty1());
                        }

                        if (box.getQty2() != null) {
                            qty2 = Integer.parseInt(box.getQty2());
                        }

                        if (box.getQty3() != null) {
                            qty3 = Integer.parseInt(box.getQty3());
                        }

                        if (box.getQty4() != null) {
                            qty4 = Integer.parseInt(box.getQty4());
                        }


                        if (qty1 == Integer.parseInt(box.getQty_result1()) && qty2 == Integer.parseInt(box.getQty_result2()) && qty3 == Integer.parseInt(box.getQty_result3()) && qty4 == Integer.parseInt(box.getQty_result4())) {
                        } else {
                            txt += box.getBoxno() + ",";
                        }


                        System.out.println("-------------------------------------------------------------");
                        System.out.println(box.getBoxno());
                        System.out.println(qty1);
                        System.out.println(qty2);
                        System.out.println(qty3);
                        System.out.println(qty4);
                        System.out.println(box.getQty_result1());
                        System.out.println(box.getQty_result2());
                        System.out.println(box.getQty_result3());
                        System.out.println(box.getQty_result4());
                        System.out.println("-------------------------------------------------------------");

                    }

                    System.out.println(txt);

                    String status = "";

                    if (txt.length() > 0) {
                        status = "false";
                    } else {
                        status = "true";
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("boxno", txt);
                    obj.put("status", status);

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PackingList.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PackingList.class.getName()).log(Level.SEVERE, null, ex);
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
