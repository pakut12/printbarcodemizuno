/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.BCUser;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

import com.pg.lib.service.AuthenticationService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class User extends HttpServlet {

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
            String type = request.getParameter("type").trim();

            if (type.equals("login")) {
                String user = request.getParameter("txt_user").trim().toLowerCase();
                String pass = request.getParameter("txt_pass").trim().toLowerCase();

                Boolean statuslogin = AuthenticationService.chacklogin(user, pass);
                HttpSession session = request.getSession();
                if (statuslogin) {
                    List<BCUser> listuser = AuthenticationService.chackuser(user);
                    session.setAttribute("user", user);
                    session.setAttribute("name", listuser.get(0).getUser_firstname() + " " + listuser.get(0).getUser_lastname());
                    session.setAttribute("status", listuser.get(0).getUser_status());
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                } else {
                    getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
                }

            } else if (type.equals("logout")) {
                HttpSession session = request.getSession();
                session.invalidate();
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            } else if (type.equals("gettableuser")) {
                try {
                    List<BCUser> listuser = AuthenticationService.gettableuser();

                    String html = "";
                    html += "<table class='table table-striped text-nowrap text-center table-bordered table-sm w-100' id='mytableuser'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>No</th>";
                    html += "<th>User</th>";
                    html += "<th>Pass</th>";
                    html += "<th>Status</th>";
                    html += "<th>Firstname</th>";
                    html += "<th>Lastname</th>";
                    html += "<th>Edit</th>";
                    html += "<th>Del</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (BCUser list : listuser) {
                        String status = AuthenticationService.getstatus(list.getUser_status());
                        html += "<tr>";
                        html += "<td>" + list.getUser_id() + "</td>";
                        html += "<td>" + list.getUser_user() + "</td>";
                        html += "<td>" + list.getUser_pass() + "</td>";
                        html += "<td>" + status + "</td>";
                        html += "<td>" + list.getUser_firstname() + "</td>";
                        html += "<td>" + list.getUser_lastname() + "</td>";
                        html += "<td><button class='btn btn-warning btn-sm' type='button' onclick='edit_user(" + list.getUser_id() + ")' id='bt_edit'>‡‡°È‰¢</button></td>";
                        html += "<td><button class='btn btn-danger btn-sm' type='button'  onclick='del_user(" + list.getUser_id() + ")' id='bt_del'>≈∫</button></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";
                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("adduser")) {
                try {

                    String user = request.getParameter("add_user").trim().toLowerCase();
                    String pass = request.getParameter("add_pass").trim().toLowerCase();
                    String status = request.getParameter("add_status").trim();
                    String firstname = request.getParameter("add_firstname").trim();
                    String lastname = request.getParameter("add_lastname").trim();

                    Boolean statusadd = AuthenticationService.adduser(user, pass, status, firstname, lastname);

                    if (statusadd) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("deluser")) {
                try {
                    String userid = request.getParameter("user_id").trim();

                    Boolean statusadd = AuthenticationService.deluser(userid);

                    if (statusadd) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (type.equals("getuserbyid")) {
                try {
                    String userid = request.getParameter("user_id").trim();

                    List<BCUser> listuser = AuthenticationService.getuserbyid(userid);

                    JSONObject obj = new JSONObject();
                    obj.put("user_id", listuser.get(0).getUser_id());
                    obj.put("user_user", listuser.get(0).getUser_user().toLowerCase());
                    obj.put("user_pass", listuser.get(0).getUser_pass().toLowerCase());
                    obj.put("user_firstname", listuser.get(0).getUser_firstname());
                    obj.put("user_lastname", listuser.get(0).getUser_lastname());
                    obj.put("user_status", listuser.get(0).getUser_status());
                    obj.put("date_create", listuser.get(0).getDate_create());
                    obj.put("date_modify", listuser.get(0).getDate_modify());


                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("edituserbyid")) {
                try {
                    String edit_id = request.getParameter("edit_id").trim();
                    String edit_user = request.getParameter("edit_user").trim().toLowerCase();
                    String edit_pass = request.getParameter("edit_pass").trim().toLowerCase();
                    String edit_status = request.getParameter("edit_status").trim();
                    String edit_firstname = request.getParameter("edit_firstname").trim();
                    String edit_lastname = request.getParameter("edit_lastname").trim();

                    Boolean statusupdate = AuthenticationService.updateuser(edit_id, edit_user, edit_pass, edit_status, edit_firstname, edit_lastname);

                    if (statusupdate) {
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
            } catch (JSONException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
