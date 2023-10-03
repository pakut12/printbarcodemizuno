/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.model;

/**
 *
 * @author pakutsing
 */
public class BCInvoice {

    private String invoiceid;
    private String invoiceno;
    private String invoicedate;
    private String saveingno;
    private String po;
    private String firstdigit;
    private String startbox;
    private String endbox;
    private String containerno;
    private String date_create;
    private String date_modified;
    private String customer;
    private String shipper;
    private String shipfrom;
    private String shipto;
    private String finald;
    private String mfg;
    private String user_create;
    private String user_edit;

    public String getUser_create() {
        return user_create;
    }

    public void setUser_create(String user_create) {
        this.user_create = user_create;
    }

    public String getUser_edit() {
        return user_edit;
    }

    public void setUser_edit(String user_edit) {
        this.user_edit = user_edit;
    }
    
    public String getMfg() {
        return mfg;
    }

    public void setMfg(String mfg) {
        this.mfg = mfg;
    }
    
    

    public String getFinald() {
        return finald;
    }

    public void setFinald(String finald) {
        this.finald = finald;
    }

    public String getShipfrom() {
        return shipfrom;
    }

    public void setShipfrom(String shipfrom) {
        this.shipfrom = shipfrom;
    }

    public String getShipper() {
        return shipper;
    }

    public void setShipper(String shipper) {
        this.shipper = shipper;
    }

    public String getShipto() {
        return shipto;
    }

    public void setShipto(String shipto) {
        this.shipto = shipto;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getContainerno() {
        return containerno;
    }

    public void setContainerno(String containerno) {
        this.containerno = containerno;
    }

    public String getDate_create() {
        return date_create;
    }

    public void setDate_create(String date_create) {
        this.date_create = date_create;
    }

    public String getDate_modified() {
        return date_modified;
    }

    public void setDate_modified(String date_modified) {
        this.date_modified = date_modified;
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

    public String getInvoicedate() {
        return invoicedate;
    }

    public void setInvoicedate(String invoicedate) {
        this.invoicedate = invoicedate;
    }

    public String getInvoiceid() {
        return invoiceid;
    }

    public void setInvoiceid(String invoiceid) {
        this.invoiceid = invoiceid;
    }

    public String getInvoiceno() {
        return invoiceno;
    }

    public void setInvoiceno(String invoiceno) {
        this.invoiceno = invoiceno;
    }

    public String getPo() {
        return po;
    }

    public void setPo(String po) {
        this.po = po;
    }

    public String getSaveingno() {
        return saveingno;
    }

    public void setSaveingno(String saveingno) {
        this.saveingno = saveingno;
    }

    public String getStartbox() {
        return startbox;
    }

    public void setStartbox(String startbox) {
        this.startbox = startbox;
    }
}
