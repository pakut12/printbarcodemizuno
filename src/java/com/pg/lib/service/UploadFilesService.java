/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.BCCustomer;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author pakutsing
 */
public class UploadFilesService {

    private final String pathAttachfileLocalhost = "C:/Users/pakutsing/Desktop/Github/printbarcodemizuno/web/attachfile/";
    private final String pathAttachfileOnServer = "/web/webapps/printbarcodemizuno/attachfile/";

    public HashMap<String, String> checkMultiContent(HttpServletRequest request, String content) throws UnsupportedEncodingException {
        HashMap<String, String> result = new HashMap<String, String>();
        String path = "";
        if (ServletFileUpload.isMultipartContent(request)) {

            try {
                //Create a factory for disk-based file and Create a new file upload handler 
                List multipart = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                Iterator iterator = multipart.iterator();

                //Loop check content FormData;
                while (iterator.hasNext()) {

                    FileItem item = (FileItem) iterator.next();

                    //Item for Upload
                    if (!item.isFormField()) {
                        if (content.equalsIgnoreCase("uploadfile")) {
                            path = uploadexcel(item);
                        }
                        //value return;
                        result.put("path", path);
                        result.put("filename", item.getName());
                    }

                    //other 
                    if (item.isFormField()) {
                        //Get value from input companyname;
                        if (item.getFieldName().equals("doc_name")) {
                            result.put("docname", item.getString("UTF-8"));
                        } else if (item.getFieldName().equals("type")) {
                            result.put("type", item.getString("UTF-8"));
                        }
                    }
                }

            } catch (FileUploadException ex) {
                ex.printStackTrace();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }

    public String uploadexcel(FileItem item) throws Exception {

        // Get Filename
        String filename = item.getName();

        // Generate Directory
        String folderName = makeDirectorySaveFile(pathAttachfileLocalhost + "upload_master/");

        // Generate path Upload
        File uploadFile = new File(pathAttachfileLocalhost + "upload_master/" + folderName + "/" + filename);

        // Upload...
        item.write(uploadFile);

        String Strpath = "upload_master/" + folderName + "/" + filename;

        return Strpath;
    }

    private String makeDirectorySaveFile(String defualtpath) {
        String currentMili = Long.toString(System.currentTimeMillis());
        String pathForUpload = defualtpath + "/" + currentMili;
        File theDir = new File(pathForUpload);

        if (!theDir.exists()) {
            theDir.mkdirs();
        } else {
            System.out.println("Could not Create The Directory... ");
        }

        return currentMili;
    }

    public List<BCCustomer> ReadFile(HashMap<String, String> order) throws IOException {

        List<BCCustomer> listorder = new ArrayList<BCCustomer>();
        try {
            FileInputStream fileInputStream = new FileInputStream(pathAttachfileLocalhost + order.get("path"));
            HSSFWorkbook workbook = new HSSFWorkbook(fileInputStream);
            HSSFSheet worksheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = worksheet.iterator();
            //Loop Row
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                //skip column name at first row

                if (row.getRowNum() == 0) {
                    continue;
                }
                Iterator<Cell> cellIterator = row.cellIterator();
                BCCustomer customer = new BCCustomer();

                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    cell.setCellType(cell.CELL_TYPE_STRING);

                    if (cell.getColumnIndex() == 0) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_no(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_no("");
                        }
                        
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 1) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_color(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_color("");
                        }
                        
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 2) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_size(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_size("");
                        }
                        
                       
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 3) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_barcode(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_barcode("");
                        }
                        
                       
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 4) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_product(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_product("");
                        }
                        
                        
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 5) {
                        if(!cell.getStringCellValue().isEmpty()){
                            customer.setCustomer_description(cell.getStringCellValue().trim().toUpperCase());
                        }else{
                            customer.setCustomer_description("");
                        }
                        
                        
                        System.out.println(cell.getStringCellValue());
                    }

                }
                System.out.println("----------------------------------------------------------------------------------------------------------");
                listorder.add(customer);
            }
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listorder;

    }
}
