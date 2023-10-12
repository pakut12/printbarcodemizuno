/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCDetailBox;
import com.pg.lib.model.BCInvoice;
import com.pg.lib.utility.Utility;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Font;

/**
 *
 * @author pakutsing
 */
public class ExcelService {

    private static String pathLocal = "C:/Users/pakutsing/Desktop/Github/printbarcodemizuno/web/attachfile/packinglistfile/";
    private static String pathServer = "/web/webapps/printbarcodemizuno/attachFile/";

    public static String ExportExcelComputer(String id) throws SQLException {
        String filename = "";
        String url = "";
        try {

            List<BCInvoice> inv = PackingListService.getPackingListByid(id);
            /*****************  set header **************/
            String invoiceno = inv.get(0).getInvoiceno();
            String invoicedate = Utility.CoverDate(inv.get(0).getInvoicedate().replace(" 00:00:00.0", ""));
            String saveingno = inv.get(0).getSaveingno();
            filename = inv.get(0).getInvoiceno();

            /********************** set Custome *******************/
            String cms = inv.get(0).getCustomer();
            String address1 = "";
            String address2 = "";
            String fineldeatination = "";

            HashSet<String> gd = new HashSet<String>();
            for (BCInvoice item : inv) {
                List<BCDetailBox> GroupDESCRIPTION = PackingListService.GroupDESCRIPTION(item.getPo(), item.getFirstdigit(), item.getStartbox(), item.getEndbox());

                for (BCDetailBox DG : GroupDESCRIPTION) {
                    gd.add(DG.getDestination());
                }
            }

            /********************** end Custome *******************/
            String shipper = inv.get(0).getShipper();
            String shipfrom = inv.get(0).getShipfrom();
            String shipto = inv.get(0).getShipto();
            String mfg = "";

            if (inv.get(0).getMfg() != null) {
                mfg = "(" + inv.get(0).getMfg() + ")";
            }

            DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
            DecimalFormat decimalFormat1 = new DecimalFormat("#,###");

            String pono = "PO.NO. ";
            String ctnno = "";
            List<String> getpo = new ArrayList<String>();

            for (BCInvoice i : inv) {
                if (!getpo.contains(i.getPo())) {
                    getpo.add(i.getPo());
                }
                ctnno += i.getFirstdigit() + i.getStartbox() + "-" + i.getFirstdigit() + i.getEndbox() + ",";
            }

            for (String p : getpo) {

                pono += p + ",";
            }

            pono = pono.substring(0, pono.length() - 1);
            ctnno = ctnno.substring(0, ctnno.length() - 1);


            if (cms.equals("MCJ")) {
                cms = "MC";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            } else if (cms.equals("MUS")) {
                address1 = "NORCROSS,GA";
                address2 = "VIA DOWNEY,CA";
            } else if (cms.equals("MCL")) {
                address1 = "ONTARIO";
                address2 = "";
            } else if (cms.equals("MOC")) {
                cms = pono.replace("PO.NO.", "");
                address1 = "MOC";
                address2 = "MELBOURNE";
                pono = "";
            } else if (cms.equals("TMC")) {
                cms = "TMC";
                address1 = "(IN DIA)";
                address2 = "";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            } else if (cms.equals("MKL")) {
                cms = "MKL";
                address1 = "BUSAN";
                address2 = "";
                fineldeatination += "FINAL DESTINATION : " + inv.get(0).getFinald();
            }

            if (inv.get(0).getFinald() == null) {
                fineldeatination = "";
            }

            HSSFWorkbook workbook = new HSSFWorkbook();
            HSSFSheet sheet = workbook.createSheet(filename);

            /* set header and footer  */
            HSSFSheet hssfSheet = (HSSFSheet) sheet;
            HSSFHeader header = hssfSheet.getHeader();
            HSSFFooter footer = hssfSheet.getFooter();

            header.setLeft(HSSFHeader.font("Angsana New", "Regular") + HSSFHeader.fontSize((short) 16) + "THAI SPORTS GARMENT CO., LTD.\n" + HSSFHeader.font("Angsana New", "Regular") + HSSFHeader.fontSize((short) 11) + " 666 RAMA 3 ROAD, YANNAWA, BANGKOK 10120 \nTHAILAND.");
            header.setCenter(HSSFHeader.font("Angsana New", "Regular") + HSSFHeader.fontSize((short) 16) + "PACKING LIST");
            header.setRight(HSSFHeader.font("Angsana New", "Regular") + HSSFHeader.fontSize((short) 16) + "Page : " + HSSFHeader.page());

            footer.setLeft("");
            footer.setCenter(invoiceno);
            footer.setRight("");
            /* end set header and footer */


            /* Set HeaderContent */

            HSSFFont font = workbook.createFont();
            font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);

            HSSFCellStyle style = workbook.createCellStyle();
            style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
            style.setFont(font);

            HSSFCell celltopic = null;
            HSSFRow rowtopic = null;

            /* Set Header1 */
            rowtopic = sheet.createRow(2);
            celltopic = rowtopic.createCell(1);
            celltopic.setCellValue("INVOICE NO.");
            celltopic.setCellStyle(style);
            sheet.autoSizeColumn(1);

            celltopic = rowtopic.createCell(2);
            celltopic.setCellValue(invoiceno);
            celltopic.setCellStyle(style);
            sheet.autoSizeColumn(2);

            celltopic = rowtopic.createCell(5);
            celltopic.setCellValue("DATED");
            celltopic.setCellStyle(style);
            sheet.autoSizeColumn(5);

            celltopic = rowtopic.createCell(6);
            celltopic.setCellValue(invoicedate);
            celltopic.setCellStyle(style);
            sheet.autoSizeColumn(6);
            /* End Set Header1 */

            /* Set Header2 */
            rowtopic = sheet.createRow(3);
            celltopic = rowtopic.createCell(1);
            celltopic.setCellValue("TERMS OF PAYMENT : T/T : SAVING NO. " + saveingno);
            celltopic.setCellStyle(style);
            //sheet.autoSizeColumn(1);

            celltopic = rowtopic.createCell(11);
            celltopic.setCellValue("MARKS & NOS.");
            celltopic.setCellStyle(style);
            //sheet.autoSizeColumn(1);
            /* End Set Header2 */

            /* Set Header3 */
            rowtopic = sheet.createRow(3);
            celltopic = rowtopic.createCell(1);
            celltopic.setCellValue("TERMS OF PAYMENT : T/T : SAVING NO. " + saveingno);
            celltopic.setCellStyle(style);
            //sheet.autoSizeColumn(1);

            celltopic = rowtopic.createCell(11);
            celltopic.setCellValue("MARKS & NOS.");
            celltopic.setCellStyle(style);
            //sheet.autoSizeColumn(1);
            /* End Set Header3 */
            
            /* Set Header4 */
            rowtopic = sheet.createRow(4);
            celltopic = rowtopic.createCell(1);
            celltopic.setCellValue("ISSUED BY : BANGKOK BANK PUBLIC CO.,LTD.");
            celltopic.setCellStyle(style);
            //sheet.autoSizeColumn(1);

            celltopic = rowtopic.createCell(11);
            celltopic.setCellValue(cms);
            celltopic.setCellStyle(style);
            sheet.autoSizeColumn(11);
            /* End Set Header4 */

            /* End Set HeaderContent */


            // Save the workbook to a file
            FileOutputStream fileOut = new FileOutputStream(pathLocal + filename + ".xls");
            workbook.write(fileOut);
            fileOut.close();

            url = "/printbarcodemizuno/packinglistfile/" + filename + ".xls";


        } catch (IOException e) {
            e.printStackTrace();
            url = e.getMessage();
        }

        return url;
    }
}


