/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.BCCustomerAddress;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.service.CustomerAddressService;
import com.pg.lib.service.InvoiceService;
import com.pg.lib.utility.Utility;

import java.io.*;

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
public class Invoice extends HttpServlet {

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
            if (type.equals("addinvoice")) {
                try {

                    String invoiceno = request.getParameter("invoiceno");
                    String invoicedate = request.getParameter("invoicedate");
                    String saveingno = request.getParameter("saveingno");
                    String listpo = request.getParameter("po");
                    String customer = request.getParameter("customer");
                    String shipper = request.getParameter("shipper");
                    String from = request.getParameter("from");
                    String to = request.getParameter("to");
                    String addfinal = request.getParameter("addfinal");
                   
                    boolean status = InvoiceService.addinvoice(invoiceno, invoicedate, saveingno, listpo, customer, shipper, from, to, addfinal);

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

                    String search_invoiceno = request.getParameter("search_invoiceno");
                    String search_invoicedate = request.getParameter("search_invoicedate");
                    String search_datestart = request.getParameter("search_datestart");
                    String search_dateend = request.getParameter("search_dateend");

                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    InvoiceService ivs = new InvoiceService();
                    List<BCInvoice> rows = ivs.getDataFromDatabase(start, length, searchValue, orderColumn, orderDir, search_invoiceno, search_invoicedate, search_datestart, search_dateend);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", ivs.getTotalRecords(start, length, searchValue, orderColumn, orderDir, search_invoiceno, search_invoicedate, search_datestart, search_dateend));
                    obj.put("recordsFiltered", ivs.getFilteredRecords(start, length, searchValue, orderColumn, orderDir, search_invoiceno, search_invoicedate, search_datestart, search_dateend));
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

                    List<BCCustomerAddress> list = CustomerAddressService.GetTableMIZUNOCUSTOMERADDRESS();

                    String opt = "";
                    for (BCCustomerAddress z : list) {
                        opt += "<option value='" + z.getAddress_customer() + "'>" + z.getAddress_customer() + "</option>";
                    }
                    opt = opt.replace("<option value='" + listdata.get(0).getCustomer() + "'>" + listdata.get(0).getCustomer() + "</option>", "");

                    String html = "<option value='" + listdata.get(0).getCustomer() + "'>" + listdata.get(0).getCustomer() + "</option>";
                    html += opt;

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("invoiceid", listdata.get(0).getInvoiceid());
                    obj.put("invoiceno", listdata.get(0).getInvoiceno());
                    obj.put("invoicedate", Utility.CoverDatetoInput(listdata.get(0).getInvoicedate()));
                    obj.put("saveingno", listdata.get(0).getSaveingno());
                    obj.put("data", gson.toJsonTree(listdata));
                    obj.put("datecreate", listdata.get(0).getDate_create());
                    obj.put("customer", html);
                    obj.put("shipper", listdata.get(0).getShipper());
                    obj.put("shipfrom", listdata.get(0).getShipfrom());
                    obj.put("shipto", listdata.get(0).getShipto());
                    obj.put("finald", listdata.get(0).getFinald());
                    obj.put("mfg", listdata.get(0).getMfg());

                    
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (type.equals("delinvoice")) {
                try {
                    String delid = request.getParameter("id").trim();
                    System.out.println(delid);
                    Boolean delstatus = InvoiceService.delinvoice(delid);

                    if (delstatus) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updateinvoice")) {
                try {
                    String delid = request.getParameter("id").trim();
                    String invoiceno = request.getParameter("invoiceno");
                    String invoicedate = request.getParameter("invoicedate");
                    String saveingno = request.getParameter("saveingno");
                    String listpo = request.getParameter("po");
                    String datecreate = request.getParameter("datecreate");
                    String customer = request.getParameter("customer");
                    String shipper = request.getParameter("shipper");
                    String from = request.getParameter("from");
                    String to = request.getParameter("to");
                    String finald = request.getParameter("finald");


                    System.out.println(shipper);
                    System.out.println(from);
                    System.out.println(to);


                    boolean delstatus = InvoiceService.delinvoice(delid);

                    if (delstatus) {
                        boolean status = InvoiceService.updateinvoice(invoiceno, invoicedate, saveingno, listpo, datecreate, customer, shipper, from, to, finald);
                        if (status) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                    } else {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Invoice.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Invoice.class.getName()).log(Level.SEVERE, null, ex);
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
