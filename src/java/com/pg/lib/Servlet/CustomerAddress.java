/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCCustomerAddress;
import com.pg.lib.service.CustomerAddressService;
import com.pg.lib.service.DetailService;
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
public class CustomerAddress extends HttpServlet {

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

            String type = request.getParameter("type");
            if (type.equals("adddataaddress")) {
                try {
                    String address_customer = request.getParameter("address_customer").trim();
                    String address_deliveredto = request.getParameter("address_deliveredto").trim();
                    String address_address1 = request.getParameter("address_address1").trim();
                    String address_address2 = request.getParameter("address_address2").trim();
                    String address_address3 = request.getParameter("address_address3").trim();
                    String address_address4 = request.getParameter("address_address4").trim();

                    CustomerAddressService cas = new CustomerAddressService();
                    Boolean status = cas.AddDataAddress(address_customer, address_deliveredto, address_address1, address_address2, address_address3, address_address4);
                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("gettablearddress")) {
                try {
                    CustomerAddressService cas = new CustomerAddressService();
                    List<BCCustomerAddress> listdata = cas.GetTableMIZUNOCUSTOMERADDRESS();

                    String html = "";
                    html += "<table class='table table-striped text-nowrap table-bordered table-sm w-100' id='mytableaddress'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>เลขที่</th>";
                    html += "<th>ลูกค้า</th>";
                    html += "<th>สถานที่ส่ง</th>";
                    html += "<th>ที่อยู่ 1</th>";
                    html += "<th>ที่อยู่ 2</th>";
                    html += "<th>ที่อยู่ 3</th>";
                    html += "<th>ที่อยู่ 4</th>";
                    html += "<th>เเก้ไข</th>";
                    html += "<th>ลบ</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (BCCustomerAddress list : listdata) {
                        html += "<tr>";
                        html += "<td>" + list.getAddress_id() + "</td>";
                        html += "<td>" + list.getAddress_customer() + "</td>";
                        html += "<td>" + list.getAddress_deliveredto() + "</td>";
                        html += "<td>" + list.getAddress_address1() + "</td>";
                        html += "<td>" + list.getAddress_address2() + "</td>";
                        html += "<td>" + list.getAddress_address3() + "</td>";
                        html += "<td>" + list.getAddress_address4() + "</td>";
                        html += "<td><button class='btn btn-warning btn-sm' type='button' onclick='edit_address(" + list.getAddress_id() + ")' id='bt_edit'>เเก้ไข</button></td>";
                        html += "<td><button class='btn btn-danger btn-sm' type='button'  onclick='del_address(" + list.getAddress_id() + ")' id='bt_del'>ลบ</button></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";
                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getaddressid")) {
                try {
                    String id = request.getParameter("address_id").trim();
                    DetailService ds = new DetailService();
                    CustomerAddressService cas = new CustomerAddressService();
                    List<BCCustomerAddress> listdata = cas.getaddressbyid(id);

                    JSONObject obj = new JSONObject();
                    obj.put("address_id", listdata.get(0).getAddress_id());
                    obj.put("address_customer", listdata.get(0).getAddress_customer());
                    obj.put("address_deliveredto", listdata.get(0).getAddress_deliveredto());
                    obj.put("address_address1", listdata.get(0).getAddress_address1());
                    obj.put("address_address2", listdata.get(0).getAddress_address2());
                    obj.put("address_address3", listdata.get(0).getAddress_address3());
                    obj.put("address_address4", listdata.get(0).getAddress_address4());

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("updateaddressid")) {
                try {
                    String edit_address_id = request.getParameter("edit_address_id").trim();
                    String edit_address_customer = request.getParameter("edit_address_customer").trim();
                    String edit_address_deliveredto = request.getParameter("edit_address_deliveredto").trim();
                    String edit_address_address1 = request.getParameter("edit_address_address1").trim();
                    String edit_address_address2 = request.getParameter("edit_address_address2").trim();
                    String edit_address_address3 = request.getParameter("edit_address_address3").trim();
                    String edit_address_address4 = request.getParameter("edit_address_address4").trim();

                    CustomerAddressService cas = new CustomerAddressService();
                    Boolean status = cas.UpdateDataAddress(edit_address_id, edit_address_customer, edit_address_deliveredto, edit_address_address1, edit_address_address2, edit_address_address3, edit_address_address4);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("deladdressid")) {
                try {
                    String address_id = request.getParameter("address_id").trim();

                    CustomerAddressService cas = new CustomerAddressService();
                    Boolean status = cas.DeleteDataAddress(address_id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getcustomer")) {
                try {
                    CustomerAddressService cas = new CustomerAddressService();
                    List<BCCustomerAddress> listdata = cas.GetTableMIZUNOCUSTOMERADDRESS();

                    String opt = "";
                    for (BCCustomerAddress z : listdata) {
                        opt += "<option value='" + z.getAddress_customer() + "'>" + z.getAddress_customer() + "</option>";
                    }
                    out.print(opt);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getdelivery")) {
                try {
                    String cms = request.getParameter("address_customer").trim();
                    CustomerAddressService cas = new CustomerAddressService();
                    List<BCCustomerAddress> listdata = cas.GetTableMIZUNOCUSTOMERADDRESS_BYCustomer(cms);

                    String opt = "";
                    for (BCCustomerAddress z : listdata) {
                        opt += "<option value='" + z.getAddress_deliveredto() + "'>" + z.getAddress_deliveredto() + "</option>";
                    }

                    out.print(opt);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getlistcustomer")) {
                try {

                    CustomerAddressService cas = new CustomerAddressService();
                    List<BCCustomerAddress> listdata = cas.GetListCustomer();

                    String opt = "";
                    opt += "<option value='MUS'>MUS</option>";
                    for (BCCustomerAddress z : listdata) {
                        if (!z.getAddress_customer().equals("MUS")) {
                            opt += "<option value='" + z.getAddress_customer() + "'>" + z.getAddress_customer() + "</option>";
                        }
                    }

                    out.print(opt);

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
            Logger.getLogger(CustomerAddress.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CustomerAddress.class.getName()).log(Level.SEVERE, null, ex);
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
