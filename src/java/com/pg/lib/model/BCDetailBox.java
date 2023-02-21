/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class BCDetailBox {

    private String po;
    private String startbox;
    private String endbox;
    private String qtypebox;
    private String firstdigit;
    private String allbox;
    private String desctxt;
    private String gw;
    private String nw;
    private String country;
    private String customer;
    private String customer1_id;
    private String customer1_barcode;
    private String customer1_color;
    private String customer1_size;
    private String customer1_qty;
    private String customer2_id;
    private String customer2_barcode;
    private String customer2_color;
    private String customer2_size;
    private String customer2_qty;
    private String customer3_id;
    private String customer3_barcode;
    private String customer3_color;
    private String customer3_size;
    private String customer3_qty;
    private String customer4_id;
    private String customer4_barcode;
    private String customer4_color;
    private String customer4_size;
    private String customer4_qty;

    public BCDetailBox(String po, String startbox, String endbox, String qtypebox, String firstdigit, String allbox, String desctxt, String gw, String nw, String country, String customer, String customer1_id, String customer1_barcode, String customer1_color, String customer1_size, String customer1_qty, String customer2_id, String customer2_barcode, String customer2_color, String customer2_size, String customer2_qty, String customer3_id, String customer3_barcode, String customer3_color, String customer3_size, String customer3_qty, String customer4_id, String customer4_barcode, String customer4_color, String customer4_size, String customer4_qty) {
        this.po = po;
        this.startbox = startbox;
        this.endbox = endbox;
        this.qtypebox = qtypebox;
        this.firstdigit = firstdigit;
        this.allbox = allbox;
        this.desctxt = desctxt;
        this.gw = gw;
        this.nw = nw;
        this.country = country;
        this.customer = customer;
        this.customer1_id = customer1_id;
        this.customer1_barcode = customer1_barcode;
        this.customer1_color = customer1_color;
        this.customer1_size = customer1_size;
        this.customer1_qty = customer1_qty;
        this.customer2_id = customer2_id;
        this.customer2_barcode = customer2_barcode;
        this.customer2_color = customer2_color;
        this.customer2_size = customer2_size;
        this.customer2_qty = customer2_qty;
        this.customer3_id = customer3_id;
        this.customer3_barcode = customer3_barcode;
        this.customer3_color = customer3_color;
        this.customer3_size = customer3_size;
        this.customer3_qty = customer3_qty;
        this.customer4_id = customer4_id;
        this.customer4_barcode = customer4_barcode;
        this.customer4_color = customer4_color;
        this.customer4_size = customer4_size;
        this.customer4_qty = customer4_qty;
    }

    public String getAllbox() {
        return allbox;
    }

    public void setAllbox(String allbox) {
        this.allbox = allbox;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getCustomer1_barcode() {
        return customer1_barcode;
    }

    public void setCustomer1_barcode(String customer1_barcode) {
        this.customer1_barcode = customer1_barcode;
    }

    public String getCustomer1_color() {
        return customer1_color;
    }

    public void setCustomer1_color(String customer1_color) {
        this.customer1_color = customer1_color;
    }

    public String getCustomer1_id() {
        return customer1_id;
    }

    public void setCustomer1_id(String customer1_id) {
        this.customer1_id = customer1_id;
    }

    public String getCustomer1_qty() {
        return customer1_qty;
    }

    public void setCustomer1_qty(String customer1_qty) {
        this.customer1_qty = customer1_qty;
    }

    public String getCustomer1_size() {
        return customer1_size;
    }

    public void setCustomer1_size(String customer1_size) {
        this.customer1_size = customer1_size;
    }

    public String getCustomer2_barcode() {
        return customer2_barcode;
    }

    public void setCustomer2_barcode(String customer2_barcode) {
        this.customer2_barcode = customer2_barcode;
    }

    public String getCustomer2_color() {
        return customer2_color;
    }

    public void setCustomer2_color(String customer2_color) {
        this.customer2_color = customer2_color;
    }

    public String getCustomer2_id() {
        return customer2_id;
    }

    public void setCustomer2_id(String customer2_id) {
        this.customer2_id = customer2_id;
    }

    public String getCustomer2_qty() {
        return customer2_qty;
    }

    public void setCustomer2_qty(String customer2_qty) {
        this.customer2_qty = customer2_qty;
    }

    public String getCustomer2_size() {
        return customer2_size;
    }

    public void setCustomer2_size(String customer2_size) {
        this.customer2_size = customer2_size;
    }

    public String getCustomer3_barcode() {
        return customer3_barcode;
    }

    public void setCustomer3_barcode(String customer3_barcode) {
        this.customer3_barcode = customer3_barcode;
    }

    public String getCustomer3_color() {
        return customer3_color;
    }

    public void setCustomer3_color(String customer3_color) {
        this.customer3_color = customer3_color;
    }

    public String getCustomer3_id() {
        return customer3_id;
    }

    public void setCustomer3_id(String customer3_id) {
        this.customer3_id = customer3_id;
    }

    public String getCustomer3_qty() {
        return customer3_qty;
    }

    public void setCustomer3_qty(String customer3_qty) {
        this.customer3_qty = customer3_qty;
    }

    public String getCustomer3_size() {
        return customer3_size;
    }

    public void setCustomer3_size(String customer3_size) {
        this.customer3_size = customer3_size;
    }

    public String getCustomer4_barcode() {
        return customer4_barcode;
    }

    public void setCustomer4_barcode(String customer4_barcode) {
        this.customer4_barcode = customer4_barcode;
    }

    public String getCustomer4_color() {
        return customer4_color;
    }

    public void setCustomer4_color(String customer4_color) {
        this.customer4_color = customer4_color;
    }

    public String getCustomer4_id() {
        return customer4_id;
    }

    public void setCustomer4_id(String customer4_id) {
        this.customer4_id = customer4_id;
    }

    public String getCustomer4_qty() {
        return customer4_qty;
    }

    public void setCustomer4_qty(String customer4_qty) {
        this.customer4_qty = customer4_qty;
    }

    public String getCustomer4_size() {
        return customer4_size;
    }

    public void setCustomer4_size(String customer4_size) {
        this.customer4_size = customer4_size;
    }

    public String getDesctxt() {
        return desctxt;
    }

    public void setDesctxt(String desctxt) {
        this.desctxt = desctxt;
    }

    public String getEndbox() {
        return endbox;
    }

    public void setEndbox(String endbox) {
        this.endbox = endbox;
    }

    public String getFirstdigit() {
        return firstdigit;
    }

    public void setFirstdigit(String firstdigit) {
        this.firstdigit = firstdigit;
    }

    public String getGw() {
        return gw;
    }

    public void setGw(String gw) {
        this.gw = gw;
    }

    public String getNw() {
        return nw;
    }

    public void setNw(String nw) {
        this.nw = nw;
    }

    public String getPo() {
        return po;
    }

    public void setPo(String po) {
        this.po = po;
    }

    public String getQtypebox() {
        return qtypebox;
    }

    public void setQtypebox(String qtypebox) {
        this.qtypebox = qtypebox;
    }

    public String getStartbox() {
        return startbox;
    }

    public void setStartbox(String startbox) {
        this.startbox = startbox;
    }
}
