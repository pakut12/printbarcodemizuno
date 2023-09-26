/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCCustomer;
import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCUser;
import com.pg.lib.service.AuthenticationService;
import com.pg.lib.service.CustomerService;
import com.pg.lib.service.DetailService;
import com.pg.lib.utility.Utility;
import java.io.*;
import java.net.*;
import java.sql.SQLException;
import java.util.HashMap;
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
public class Detail extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, JSONException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type");
            if (type.equals("adddetails")) {
                try {
                    String customer = request.getParameter("customer").trim();
                    String quantity_box = request.getParameter("quantity_box").trim();
                    String initial = request.getParameter("initial").trim();
                    String numberbox_start = request.getParameter("numberbox_start").trim();
                    String numberbox_end = request.getParameter("numberbox_end").trim();
                    String po = request.getParameter("po").trim();
                    String gw = request.getParameter("gw").trim();
                    String nw = request.getParameter("nw").trim();
                    String country = request.getParameter("country").trim();
                    String quantitytotal_box = request.getParameter("quantitytotal_box").trim();
                    String description = request.getParameter("description").trim();
                    String[] customer1_id = request.getParameterValues("customer1_id[]");
                    String[] customer2_id = request.getParameterValues("customer2_id[]");
                    String[] customer3_id = request.getParameterValues("customer3_id[]");
                    String[] customer4_id = request.getParameterValues("customer4_id[]");
                    String pallet = request.getParameter("pallet").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String destination = request.getParameter("destination").trim();
                    String customer_address = request.getParameter("customer_address").trim();

                    String date = request.getParameter("date").trim();
                    String user_create = request.getParameter("user_create").trim();
                    String user_edit = request.getParameter("user_edit").trim();
                    String date_edit = request.getParameter("date_edit").trim();

                    DetailService ds = new DetailService();
                    Boolean statusdt = ds.AddDataToMIZUNONEWBARBOXDT(customer_address, "", "", customer, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id, pallet, prodorder, destination, date, user_create);
                    //Boolean statushd = ds.AddDataToMIZUNONEWBARBOXHD(customer_address, customer, quantity_box, initial, numberbox_start, numberbox_end, po, gw, nw, country, quantitytotal_box, description, customer1_id, customer2_id, customer3_id, customer4_id, pallet, prodorder, destination, date);

                    JSONObject obj = new JSONObject();
                    if (statusdt) {
                        Boolean statusresult = ds.AddDataToMIZUNONEWBARBOXRESULT(po, initial, date, numberbox_start, numberbox_end, quantitytotal_box);
                        obj.put("status", "true");

                    } else {
                        obj.put("status", "false");
                    }

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (type.equals("getdetailsall")) {
                try {
                    String posearch = request.getParameter("posearch");
                    String numstart = request.getParameter("numstart");
                    String numend = request.getParameter("numend");
                    String firstdigit = request.getParameter("firstdigit");

                    String status = "";
                    DetailService ds = new DetailService();
                    List<BCDetailBox> detailbox = ds.GetDetailBoxAll(posearch, numstart, numend, firstdigit);

                    List<BCCustomer> listcm1 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item1());
                    List<BCCustomer> listcm2 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item2());
                    List<BCCustomer> listcm3 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item3());
                    List<BCCustomer> listcm4 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item4());

                    List<BCUser> listuser_create = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_create()));
                    List<BCUser> listuser_edit = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_edit()));

                    String user_create = "";
                    String user_edit = "";

                    if (listuser_create.size() > 0) {
                        user_create = listuser_create.get(0).getUser_firstname() + listuser_create.get(0).getUser_lastname();
                    }

                    if (listuser_edit.size() > 0) {
                        user_edit = listuser_edit.get(0).getUser_firstname() + listuser_edit.get(0).getUser_lastname();
                    }


                    JSONObject obj = new JSONObject();
                    obj.put("po_old", detailbox.get(0).getPo_old());
                    obj.put("po", detailbox.get(0).getPo());
                    obj.put("boxno", detailbox.get(0).getBoxno());
                    obj.put("boxall", detailbox.get(0).getAllbox());
                    obj.put("firstdigit", detailbox.get(0).getFirstdigit());
                    obj.put("shipfrom", detailbox.get(0).getShipfrom());
                    obj.put("shipto", detailbox.get(0).getShipto());
                    obj.put("qtyperbox", detailbox.get(0).getQtyperbox());
                    obj.put("desctxt", detailbox.get(0).getDesctxt());
                    obj.put("grossweight", detailbox.get(0).getGrossweight());
                    obj.put("netweight", detailbox.get(0).getNetweight());
                    obj.put("country_origin", detailbox.get(0).getCountry_origin());
                    obj.put("allbox", detailbox.get(0).getAllbox());
                    obj.put("boxseq", detailbox.get(0).getBoxseq());

                    if (listcm1.size() > 0) {
                        obj.put("sku_item1", listcm1.get(0).getCustomer_no());
                        obj.put("upc_code1", listcm1.get(0).getCustomer_barcode());
                        obj.put("qty1", detailbox.get(0).getQty1());
                        obj.put("sizeno1", listcm1.get(0).getCustomer_size());
                        obj.put("colorno1", listcm1.get(0).getCustomer_color());
                    }
                    if (listcm2.size() > 0) {
                        obj.put("sku_item2", listcm2.get(0).getCustomer_no());
                        obj.put("upc_code2", listcm2.get(0).getCustomer_barcode());
                        obj.put("qty2", detailbox.get(0).getQty2());
                        obj.put("sizeno2", listcm2.get(0).getCustomer_size());
                        obj.put("colorno2", listcm2.get(0).getCustomer_color());
                    }
                    if (listcm3.size() > 0) {
                        obj.put("sku_item3", listcm3.get(0).getCustomer_no());
                        obj.put("upc_code3", listcm3.get(0).getCustomer_barcode());
                        obj.put("qty3", detailbox.get(0).getQty3());
                        obj.put("sizeno3", listcm3.get(0).getCustomer_size());
                        obj.put("colorno3", listcm3.get(0).getCustomer_color());
                    }
                    if (listcm4.size() > 0) {
                        obj.put("sku_item4", listcm4.get(0).getCustomer_no());
                        obj.put("upc_code4", listcm4.get(0).getCustomer_barcode());
                        obj.put("qty4", detailbox.get(0).getQty4());
                        obj.put("sizeno4", listcm4.get(0).getCustomer_size());
                        obj.put("colorno4", listcm4.get(0).getCustomer_color());
                    }

                    obj.put("pallet", detailbox.get(0).getPallet());
                    obj.put("prodorder", detailbox.get(0).getProdorder());
                    obj.put("destination", detailbox.get(0).getDestination());
                    obj.put("date_create", detailbox.get(0).getDate_create());
                    obj.put("date_modify", detailbox.get(0).getDate_modify());
                    obj.put("customer_address", detailbox.get(0).getCustomer_address());

                    obj.put("invoiceno", detailbox.get(0).getInvoiceno());
                    obj.put("invoicedate", detailbox.get(0).getInvoicedate());
                    obj.put("user_create", user_create);
                    obj.put("user_edit", user_edit);

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updatedetailsall")) {
                try {

                    String pobefore = request.getParameter("pobefore").trim();
                    String startboxbefore = request.getParameter("startboxbefore").trim();
                    String endboxbefore = request.getParameter("endboxbefore").trim();

                    String po_old = request.getParameter("po_old").trim();


                    String shipto = request.getParameter("shipto").trim();
                    String qtyperbox = request.getParameter("qtyperbox").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();

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

                    String[] listinput1 = {sku_item1, upc_code1, colorno1, sizeno1, qty1};
                    String[] listinput2 = {sku_item2, upc_code2, colorno2, sizeno2, qty2};
                    String[] listinput3 = {sku_item3, upc_code3, colorno3, sizeno3, qty3};
                    String[] listinput4 = {sku_item4, upc_code4, colorno4, sizeno4, qty4};

                    String pallet = request.getParameter("pallet").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String destination = request.getParameter("destination").trim();
                    String date = request.getParameter("date").trim();
                    String firstdigitbefore = request.getParameter("firstdigitbefore").trim();
                    String customer_address = request.getParameter("customer_address").trim();
                    String invoiceno = request.getParameter("invoiceno");
                    String invoicedate = request.getParameter("invoicedate");
                    String startbox = request.getParameter("startbox").trim();
                    String endbox = request.getParameter("endbox").trim();

                    String boxseq = request.getParameter("boxseq").trim();
                    String user_edit = request.getParameter("user_edit").trim();
                    DetailService ds = new DetailService();

                    // List<BCDetailBox> listresult = ds.GetListMIZUNONEWBARBOXRESULTOLD(po, startboxbefore, endboxbefore, firstdigitbefore);
                    //ds.DeleteListMIZUNONEWBARBOXRESULTOLD(pobefore, startboxbefore, endboxbefore, firstdigitbefore, allbox);

                    // Boolean statusresult = ds.UpdateMIZUNONEWBARBOXRESULT(listresult, endboxbefore, startboxbefore, firstdigit, po, allbox);

                    //Boolean statusupdate = ds.UpdateDetailBoxAll(customer_address, po_old, pobefore, startboxbefore, endboxbefore, shipto, qtyperbox, firstdigit, startbox, endbox, allbox, po, desctxt, grossweight, netweight, country_origin, sku_item1, upc_code1, colorno1, sizeno1, qty1, sku_item2, upc_code2, colorno2, sizeno2, qty2, sku_item3, upc_code3, colorno3, sizeno3, qty3, sku_item4, upc_code4, colorno4, sizeno4, qty4, pallet, prodorder, destination, date, firstdigitbefore);
                    // Boolean statusDT = ds.DeleteDetailBoxMIZUNONEWBARBOXDTAll(pobefore, firstdigitbefore, startboxbefore, endboxbefore);


                    Boolean statusdt = ds.UpdateDataToMIZUNONEWBARBOXDT(customer_address, po_old, pobefore, shipto, qtyperbox, firstdigit, startboxbefore, endboxbefore, po, grossweight, netweight, country_origin, allbox, desctxt, listinput1, listinput2, listinput3, listinput4, pallet, prodorder, destination, date, firstdigitbefore, startbox, endbox, boxseq, user_edit);
                    Boolean statusresult = ds.UpdateMIZUNONEWBARBOXRESULTTEST(pobefore, po, firstdigit, startboxbefore, endboxbefore, firstdigitbefore, startbox, endbox);

                    JSONObject obj = new JSONObject();

                    if (statusdt) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("deletedetailsall")) {

                try {
                    String firstdigit = request.getParameter("firstdigit").trim();
                    String pobefore = request.getParameter("posearch").trim();
                    String startbox = request.getParameter("startbox").trim();
                    String endbox = request.getParameter("endbox").trim();

                    DetailService ds = new DetailService();
                    Boolean statusDT = ds.DeleteDetailBoxMIZUNONEWBARBOXDTAll(pobefore, firstdigit, startbox, endbox);
                    // Boolean statusHD = ds.DeleteDetailBoxMIZUNONEWBARBOXHDAll(pobefore, firstdigit, startbox, endbox);
                    Boolean statusRESULT = ds.DeleteDetailBoxMIZUNONEWBARBOXRESULTAll(pobefore, firstdigit, startbox, endbox);

                    JSONObject obj = new JSONObject();
                    if (statusDT && statusRESULT) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getdetails")) {
                String posearch = request.getParameter("posearch").trim();
                String numstart = request.getParameter("numstart").trim();

                DetailService ds = new DetailService();
                List<BCDetailBox> detailbox = ds.GetDetailBox(posearch, numstart);
                List<BCCustomer> listcm1 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item1());
                List<BCCustomer> listcm2 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item2());
                List<BCCustomer> listcm3 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item3());
                List<BCCustomer> listcm4 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item4());


                List<BCUser> listuser_create = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_create()));
                List<BCUser> listuser_edit = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_edit()));

                String user_create = "";
                String user_edit = "";

                if (listuser_create.size() > 0) {
                    user_create = listuser_create.get(0).getUser_firstname() + listuser_create.get(0).getUser_lastname();
                }

                if (listuser_edit.size() > 0) {
                    user_edit = listuser_edit.get(0).getUser_firstname() + listuser_edit.get(0).getUser_lastname();
                }

                JSONObject obj = new JSONObject();
                obj.put("po", detailbox.get(0).getPo());
                obj.put("po_old", detailbox.get(0).getPo_old());
                obj.put("shipfrom", detailbox.get(0).getShipfrom());
                obj.put("shipto", detailbox.get(0).getShipto());
                obj.put("qtyperbox", detailbox.get(0).getQtyperbox());
                obj.put("boxno", detailbox.get(0).getBoxno());
                obj.put("desctxt", detailbox.get(0).getDesctxt());

                obj.put("grossweight", detailbox.get(0).getGrossweight());
                obj.put("netweight", detailbox.get(0).getNetweight());
                obj.put("country_origin", detailbox.get(0).getCountry_origin());
                obj.put("boxall", detailbox.get(0).getAllbox());

                if (listcm1.size() > 0) {
                    obj.put("sku_item1", listcm1.get(0).getCustomer_no());
                    obj.put("upc_code1", listcm1.get(0).getCustomer_barcode());
                    obj.put("qty1", detailbox.get(0).getQty1());
                    obj.put("sizeno1", listcm1.get(0).getCustomer_size());
                    obj.put("colorno1", listcm1.get(0).getCustomer_color());
                }
                if (listcm2.size() > 0) {
                    obj.put("sku_item2", listcm2.get(0).getCustomer_no());
                    obj.put("upc_code2", listcm2.get(0).getCustomer_barcode());
                    obj.put("qty2", detailbox.get(0).getQty2());
                    obj.put("sizeno2", listcm2.get(0).getCustomer_size());
                    obj.put("colorno2", listcm2.get(0).getCustomer_color());
                }
                if (listcm3.size() > 0) {
                    obj.put("sku_item3", listcm3.get(0).getCustomer_no());
                    obj.put("upc_code3", listcm3.get(0).getCustomer_barcode());
                    obj.put("qty3", detailbox.get(0).getQty3());
                    obj.put("sizeno3", listcm3.get(0).getCustomer_size());
                    obj.put("colorno3", listcm3.get(0).getCustomer_color());
                }
                if (listcm4.size() > 0) {
                    obj.put("sku_item4", listcm4.get(0).getCustomer_no());
                    obj.put("upc_code4", listcm4.get(0).getCustomer_barcode());
                    obj.put("qty4", detailbox.get(0).getQty4());
                    obj.put("sizeno4", listcm4.get(0).getCustomer_size());
                    obj.put("colorno4", listcm4.get(0).getCustomer_color());
                }

                obj.put("sfaddress1", detailbox.get(0).getSfaddress1());
                obj.put("sfaddress2", detailbox.get(0).getSfaddress2());
                obj.put("sfaddress3", detailbox.get(0).getSfaddress3());
                obj.put("sfaddress4", detailbox.get(0).getSfaddress4());
                obj.put("staddress1", detailbox.get(0).getStaddress1());
                obj.put("staddress2", detailbox.get(0).getStaddress2());
                obj.put("staddress3", detailbox.get(0).getStaddress3());
                obj.put("staddress4", detailbox.get(0).getStaddress4());

                obj.put("pallet", detailbox.get(0).getPallet());
                obj.put("prod_order", detailbox.get(0).getProdorder());
                obj.put("destination", detailbox.get(0).getDestination());

                obj.put("statusshoot", detailbox.get(0).getStatusshoot());

                obj.put("date_create", detailbox.get(0).getDate_create());
                obj.put("date_modify", detailbox.get(0).getDate_modify());
                obj.put("customer_address", detailbox.get(0).getCustomer_address());
                obj.put("invoiceno", detailbox.get(0).getInvoiceno());
                obj.put("invoicedate", detailbox.get(0).getInvoicedate());
                obj.put("boxseq", detailbox.get(0).getBoxseq());

                obj.put("user_create", user_create);
                obj.put("user_edit", user_edit);

                out.print(obj);
            } else if (type.equals("updatedetails")) {
                try {
                    String pobefore = request.getParameter("pobefore").trim();
                    String boxnobefore = request.getParameter("startboxbefore").trim();


                    String po_old = request.getParameter("po_old").trim();
                    String SHIPTO = request.getParameter("shipto").trim();
                    String QTYPERBOX = request.getParameter("qtyperbox").trim();

                    String BOXALL = request.getParameter("allbox").trim();
                    String PO = request.getParameter("po").trim();
                    String DESCTXT = request.getParameter("desctxt").trim();
                    String GROSSWEIGHT = request.getParameter("grossweight").trim();
                    String NETWEIGHT = request.getParameter("netweight").trim();
                    String COUNTRY_ORIGIN = request.getParameter("country_origin").trim();

                    String SKU_ITEM1 = request.getParameter("sku_item1").trim();
                    String UPC_CODE1 = request.getParameter("upc_code1").trim();
                    String COLORNO1 = request.getParameter("colorno1").trim();
                    String SIZENO1 = request.getParameter("sizeno1").trim();
                    String QTY1 = request.getParameter("qty1").trim();

                    String SKU_ITEM2 = request.getParameter("sku_item2").trim();
                    String UPC_CODE2 = request.getParameter("upc_code2").trim();
                    String COLORNO2 = request.getParameter("colorno2").trim();
                    String SIZENO2 = request.getParameter("sizeno2").trim();
                    String QTY2 = request.getParameter("qty2").trim();

                    String SKU_ITEM3 = request.getParameter("sku_item3").trim();
                    String UPC_CODE3 = request.getParameter("upc_code3").trim();
                    String COLORNO3 = request.getParameter("colorno3").trim();
                    String SIZENO3 = request.getParameter("sizeno3").trim();
                    String QTY3 = request.getParameter("qty3").trim();

                    String SKU_ITEM4 = request.getParameter("sku_item4").trim();
                    String UPC_CODE4 = request.getParameter("upc_code4").trim();
                    String COLORNO4 = request.getParameter("colorno4").trim();
                    String SIZENO4 = request.getParameter("sizeno4").trim();
                    String QTY4 = request.getParameter("qty4").trim();

                    String boxno = request.getParameter("boxno").trim();

                    String pallet = request.getParameter("pallet").trim();
                    String prodorder = request.getParameter("prodorder").trim();
                    String destination = request.getParameter("destination").trim();
                    String customer_address = request.getParameter("customer_address").trim();

                    String date = request.getParameter("date").trim();

                    String user_edit = request.getParameter("user_edit").trim();

                    DetailService ds = new DetailService();

                    JSONObject obj = new JSONObject();

                    Boolean status = ds.UpdateDetailBox(customer_address, po_old, BOXALL, SHIPTO, SIZENO1, SIZENO2, SIZENO3, SIZENO4, SHIPTO, SIZENO1, SIZENO2, SIZENO3, SIZENO4, QTYPERBOX, DESCTXT, GROSSWEIGHT, NETWEIGHT, COUNTRY_ORIGIN, SKU_ITEM1, UPC_CODE1, COLORNO1, SIZENO1, QTY1, SKU_ITEM2, UPC_CODE2, COLORNO2, SIZENO2, QTY2, SKU_ITEM3, UPC_CODE3, COLORNO3, SIZENO3, QTY3, SKU_ITEM4, UPC_CODE4, COLORNO4, SIZENO4, QTY4, pobefore, boxnobefore, boxno, PO, pallet, prodorder, destination, date, user_edit);

                    Boolean statusresult = ds.UpdateMIZUNONEWBARBOXRESULTBYID(pobefore, PO, boxno, boxnobefore);

                    if (status && statusresult) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("deletedetails")) {
                try {
                    String po = request.getParameter("posearch").trim();
                    String boxno = request.getParameter("boxno").trim();

                    DetailService ds = new DetailService();
                    Boolean status = ds.DeleteDetailBox(po, boxno);
                    Boolean statusresult = ds.DeleteBoxResult(po, boxno);

                    JSONObject obj = new JSONObject();
                    if (status && statusresult) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getdetailbarcode")) {
                try {

                    String po = request.getParameter("po").trim();
                    String boxstart = request.getParameter("boxstart").trim();
                    String boxend = request.getParameter("boxend").trim();
                    String firstdigit = request.getParameter("firstdigit").trim();


                    DetailService ds = new DetailService();
                    List<BCDetailBox> listbox = ds.GetDetailBoxForPrint(po, boxstart, boxend, firstdigit);
                    int n = 1;
                    String html = "";
                    html += "<table class='table table-striped  table-sm text-center text-nowrap' id='table_boxdetail'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>NO</th>";
                    html += "<th>PO</th>";
                    html += "<th>BOXNO</th>";
                    html += "<th>BOXALL</th>";
                    html += "<th>SKU_ITEM1</th>";
                    html += "<th>UPC_CODE1</th>";
                    html += "<th>QTY1</th>";
                    html += "<th>SIZENO1</th>";
                    html += "<th>COLORNO1</th>";

                    html += "<th>SKU_ITEM2</th>";
                    html += "<th>UPC_CODE2</th>";
                    html += "<th>QTY2</th>";
                    html += "<th>SIZENO2</th>";
                    html += "<th>COLORNO2</th>";

                    html += "<th>SKU_ITEM3</th>";
                    html += "<th>UPC_CODE3</th>";
                    html += "<th>QTY3</th>";
                    html += "<th>SIZENO3</th>";
                    html += "<th>COLORNO3</th>";

                    html += "<th>SKU_ITEM4</th>";
                    html += "<th>UPC_CODE4</th>";
                    html += "<th>QTY4</th>";
                    html += "<th>SIZENO4</th>";
                    html += "<th>COLORNO4</th>";

                    html += "<th>SHIPFROM</th>";
                    html += "<th>SFADDRESS1</th>";
                    html += "<th>SFADDRESS2</th>";
                    html += "<th>SFADDRESS3</th>";
                    html += "<th>SFADDRESS4</th>";
                    html += "<th>SHIPTO</th>";
                    html += "<th>STADDRESS1</th>";
                    html += "<th>STADDRESS2</th>";
                    html += "<th>STADDRESS3</th>";
                    html += "<th>STADDRESS4</th>";
                    html += "<th>QTYPERBOX</th>";
                    html += "<th>DESCTXT</th>";
                    html += "<th>GROSSWEIGHT</th>";
                    html += "<th>NETWEIGHT</th>";
                    html += "<th>COUNTRY_ORIGIN</th>";


                    html += "<th>STATUSSHOOT</th>";

                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (int i = 0; i < listbox.size(); i++) {
                        html += "<tr>";
                        html += "<td>" + n + "</td>";
                        html += "<td>" + listbox.get(i).getPo() + "</td>";
                        html += "<td>" + listbox.get(i).getBoxno() + "</td>";
                        html += "<td>" + listbox.get(i).getAllbox() + "</td>";

                        html += "<td>" + ds.ChackNull(listbox.get(i).getSku_item1()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getUpc_code1()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getQty1()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getSizen01()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getColorn01()) + "</td>";

                        html += "<td>" + ds.ChackNull(listbox.get(i).getSku_item2()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getUpc_code2()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getQty2()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getSizen02()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getColorn02()) + "</td>";

                        html += "<td>" + ds.ChackNull(listbox.get(i).getSku_item3()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getUpc_code3()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getQty3()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getSizen03()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getColorn03()) + "</td>";

                        html += "<td>" + ds.ChackNull(listbox.get(i).getSku_item4()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getUpc_code4()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getQty4()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getSizen04()) + "</td>";
                        html += "<td>" + ds.ChackNull(listbox.get(i).getColorn04()) + "</td>";

                        html += "<td>" + listbox.get(i).getShipfrom() + "</td>";
                        html += "<td>" + listbox.get(i).getSfaddress1() + "</td>";
                        html += "<td>" + listbox.get(i).getSfaddress2() + "</td>";
                        html += "<td>" + listbox.get(i).getSfaddress3() + "</td>";
                        html += "<td>" + listbox.get(i).getSfaddress4() + "</td>";
                        html += "<td>" + listbox.get(i).getShipto() + "</td>";
                        html += "<td>" + listbox.get(i).getStaddress1() + "</td>";
                        html += "<td>" + listbox.get(i).getStaddress2() + "</td>";
                        html += "<td>" + listbox.get(i).getStaddress3() + "</td>";
                        html += "<td>" + listbox.get(i).getStaddress4() + "</td>";
                        html += "<td>" + listbox.get(i).getQtyperbox() + "</td>";
                        html += "<td>" + listbox.get(i).getDesctxt() + "</td>";
                        html += "<td>" + listbox.get(i).getGrossweight() + "</td>";
                        html += "<td>" + listbox.get(i).getNetweight() + "</td>";
                        html += "<td>" + listbox.get(i).getCountry_origin() + "</td>";



                        html += "<td>" + listbox.get(i).getStatusshoot() + "</td>";

                        html += "</tr>";
                        n++;
                    }
                    html += "</tbody>";
                    html += "</table>";

                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("updateqtyfrombarcode")) {
                try {
                    String po = request.getParameter("posearch").trim();
                    String boxno = request.getParameter("boxno").trim();
                    String user_id = request.getParameter("userid").trim();

                    String qty_result1 = request.getParameter("qty_result1").trim();
                    String qty_result2 = request.getParameter("qty_result2").trim();
                    String qty_result3 = request.getParameter("qty_result3").trim();
                    String qty_result4 = request.getParameter("qty_result4").trim();
                    String date = request.getParameter("date").trim();

                    DetailService ds = new DetailService();
                    Boolean status = ds.UpdateQtyResultFromBarcode(po, boxno, qty_result1, qty_result2, qty_result3, qty_result4, date);
                    Boolean statususer = ds.UpdateUserResultFromBarcode(user_id, po, boxno);
                    
                    JSONObject obj = new JSONObject();
                    if (status && statususer) {
                        obj.put("status", "true");
                    } else {
                        obj.put("status", "false");
                    }
                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getdetailsforbarcode")) {
                try {

                    String posearch = request.getParameter("posearch").trim();
                    String numstart = request.getParameter("numstart").trim();

                    DetailService ds = new DetailService();
                    List<BCDetailBox> detailbox = ds.GetDetailBoxAllForBarcode(posearch, numstart);

                    List<BCUser> listuser_create = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_create()));
                    List<BCUser> listuser_edit = AuthenticationService.chackuser(Utility.Chacknull(detailbox.get(0).getUser_edit()));

                    String user_create = "";
                    String user_edit = "";

                    if (listuser_create.size() > 0) {
                        user_create = listuser_create.get(0).getUser_firstname() + listuser_create.get(0).getUser_lastname();
                    }

                    if (listuser_edit.size() > 0) {
                        user_edit = listuser_edit.get(0).getUser_firstname() + listuser_edit.get(0).getUser_lastname();
                    }




                    List<BCCustomer> listcm1 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item1());
                    List<BCCustomer> listcm2 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item2());
                    List<BCCustomer> listcm3 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item3());
                    List<BCCustomer> listcm4 = CustomerService.ChackDetailCustomerAll(detailbox.get(0).getSku_item4());



                    JSONObject obj = new JSONObject();
                    obj.put("po", detailbox.get(0).getPo());
                    obj.put("shipfrom", detailbox.get(0).getShipfrom());
                    obj.put("shipto", detailbox.get(0).getShipto());
                    obj.put("qtyperbox", detailbox.get(0).getQtyperbox());
                    obj.put("boxno", detailbox.get(0).getBoxno());
                    obj.put("desctxt", detailbox.get(0).getDesctxt());

                    obj.put("grossweight", detailbox.get(0).getGrossweight());
                    obj.put("netweight", detailbox.get(0).getNetweight());
                    obj.put("country_origin", detailbox.get(0).getCountry_origin());
                    obj.put("boxall", detailbox.get(0).getAllbox());

                    if (listcm1.size() > 0) {
                        obj.put("sku_item1", listcm1.get(0).getCustomer_no());
                        obj.put("upc_code1", listcm1.get(0).getCustomer_barcode());
                        obj.put("qty1", detailbox.get(0).getQty1());
                        obj.put("sizeno1", listcm1.get(0).getCustomer_size());
                        obj.put("colorno1", listcm1.get(0).getCustomer_color());
                    }
                    if (listcm2.size() > 0) {
                        obj.put("sku_item2", listcm2.get(0).getCustomer_no());
                        obj.put("upc_code2", listcm2.get(0).getCustomer_barcode());
                        obj.put("qty2", detailbox.get(0).getQty2());
                        obj.put("sizeno2", listcm2.get(0).getCustomer_size());
                        obj.put("colorno2", listcm2.get(0).getCustomer_color());
                    }
                    if (listcm3.size() > 0) {
                        obj.put("sku_item3", listcm3.get(0).getCustomer_no());
                        obj.put("upc_code3", listcm3.get(0).getCustomer_barcode());
                        obj.put("qty3", detailbox.get(0).getQty3());
                        obj.put("sizeno3", listcm3.get(0).getCustomer_size());
                        obj.put("colorno3", listcm3.get(0).getCustomer_color());
                    }
                    if (listcm4.size() > 0) {
                        obj.put("sku_item4", listcm4.get(0).getCustomer_no());
                        obj.put("upc_code4", listcm4.get(0).getCustomer_barcode());
                        obj.put("qty4", detailbox.get(0).getQty4());
                        obj.put("sizeno4", listcm4.get(0).getCustomer_size());
                        obj.put("colorno4", listcm4.get(0).getCustomer_color());
                    }

                    obj.put("sfaddress1", detailbox.get(0).getSfaddress1());
                    obj.put("sfaddress2", detailbox.get(0).getSfaddress2());
                    obj.put("sfaddress3", detailbox.get(0).getSfaddress3());
                    obj.put("sfaddress4", detailbox.get(0).getSfaddress4());
                    obj.put("staddress1", detailbox.get(0).getStaddress1());
                    obj.put("staddress2", detailbox.get(0).getStaddress2());
                    obj.put("staddress3", detailbox.get(0).getStaddress3());
                    obj.put("staddress4", detailbox.get(0).getStaddress4());

                    obj.put("pallet", detailbox.get(0).getPallet());
                    obj.put("prod_order", detailbox.get(0).getProdorder());
                    obj.put("destination", detailbox.get(0).getDestination());

                    obj.put("qty_result1", detailbox.get(0).getQty_result1());
                    obj.put("qty_result2", detailbox.get(0).getQty_result2());
                    obj.put("qty_result3", detailbox.get(0).getQty_result3());
                    obj.put("qty_result4", detailbox.get(0).getQty_result4());


                    obj.put("statusshoot", detailbox.get(0).getStatusshoot());

                    obj.put("date_create", detailbox.get(0).getDate_create());
                    obj.put("date_modify", detailbox.get(0).getDate_modify());
                    obj.put("user_create", user_create);
                    obj.put("user_edit", user_edit);

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getpalletbyid")) {
                String po = request.getParameter("po").trim();
                DetailService ds = new DetailService();

                List<String> listpallet = ds.getpalletbyid(po);

                JSONObject obj = new JSONObject();
                obj.put("listpallet", listpallet);

                out.print(obj);

            } else if (type.equals("getfirstdigit")) {
                try {

                    String po = request.getParameter("po").toUpperCase();
                    List<String> listfirstdigit = DetailService.getfirstdigit(po);

                    String html = "";
                    for (String f : listfirstdigit) {
                        html += "<option value='" + f + "'>" + f + "</option>";
                    }
                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updatepallet")) {
                try {
                    String pobefore = request.getParameter("pobefore").trim();
                    String startboxbefore = request.getParameter("startboxbefore").trim();
                    String endboxbefore = request.getParameter("endboxbefore").trim();
                    String firstdigitbefore = request.getParameter("firstdigitbefore").trim();
                    String user_edit = request.getParameter("user_edit");

                    String pallet = request.getParameter("pallet").trim();
                    String gw = request.getParameter("grossweight").trim();
                    String nw = request.getParameter("netweight").trim();

                    boolean status = DetailService.updatepallet(pobefore, startboxbefore, endboxbefore, firstdigitbefore, pallet, gw, nw, user_edit);

                    if (status) {
                        out.print("true");
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
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            try {
                processRequest(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NamingException ex) {
                Logger.getLogger(Detail.class.getName()).log(Level.SEVERE, null, ex);
            }
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
