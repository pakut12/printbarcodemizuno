/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class BCCustomer {

    private String customer_id;
    private String customer_no;
    private String customer_barcode;
    private String customer_color;
    private String customer_size;
    private String customer_product;
    private int customer_quantity;
    private String customer_description;

    public String getCustomer_product() {
        return customer_product;
    }

    public void setCustomer_product(String customer_product) {
        this.customer_product = customer_product;
    }

    public String getCustomer_description() {
        return customer_description;
    }

    public void setCustomer_description(String customer_description) {
        this.customer_description = customer_description;
    }

    public int getCustomer_quantity() {
        return customer_quantity;
    }

    public void setCustomer_quantity(int customer_quantity) {
        this.customer_quantity = customer_quantity;
    }

    public String getCustomer_barcode() {
        return customer_barcode;
    }

    public void setCustomer_barcode(String customer_barcode) {
        this.customer_barcode = customer_barcode;
    }

    public String getCustomer_color() {
        return customer_color;
    }

    public void setCustomer_color(String customer_color) {
        this.customer_color = customer_color;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getCustomer_no() {
        return customer_no;
    }

    public void setCustomer_no(String customer_no) {
        this.customer_no = customer_no;
    }

    public String getCustomer_size() {
        return customer_size;
    }

    public void setCustomer_size(String customer_size) {
        this.customer_size = customer_size;
    }
}
