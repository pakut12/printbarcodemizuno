<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.pg.lib.utility.ConnectDB" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            try {


// Set the report design file path
                String reportDesignFilePath = "C:/Users/pakutsing/Desktop/Github/printbarcodemizuno/web/report/report1.jrxml";
// Set the data source for the report

// Set any report parameters

                Map<String, Object> parameters = new HashMap<String, Object>();
                JasperCompileManager.compileReportToFile(reportDesignFilePath);
// Compile the report
                JasperPrint jasperPrint = JasperFillManager.fillReport(reportDesignFilePath, parameters, ConnectDB.getConnection());
// Export the report in PDF format
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline; filename=myreport.pdf");
                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());



            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
        
    </body>
</html>
