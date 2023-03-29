/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class BCUser {

    private String user_id;
    private String user_user;
    private String user_pass;
    private String user_firstname;
    private String user_status;
    private String user_lastname;
    private String date_create;
    private String date_modify;

    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getDate_modify() {
        return date_modify;
    }

    public void setDate_modify(String date_modify) {
        this.date_modify = date_modify;
    }

    public String getUser_firstname() {
        return user_firstname;
    }

    public void setUser_firstname(String user_firstname) {
        this.user_firstname = user_firstname;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_lastname() {
        return user_lastname;
    }

    public void setUser_lastname(String user_lastname) {
        this.user_lastname = user_lastname;
    }

    public String getUser_pass() {
        return user_pass;
    }

    public void setUser_pass(String user_pass) {
        this.user_pass = user_pass;
    }

    public String getUser_status() {
        return user_status;
    }

    public void setUser_status(String user_status) {
        this.user_status = user_status;
    }

    public String getUser_user() {
        return user_user;
    }

    public void setUser_user(String user_user) {
        this.user_user = user_user;
    }
    
    
    

   
}
