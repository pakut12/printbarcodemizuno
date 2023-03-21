<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.engine.util.JRLoader" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.pg.lib.utility.ConnectDB" %>
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
              
// Set up the parameters for the report
                Map<String, Object> parameters = new HashMap<String, Object>();

// Load the compiled report file
                JasperReport jasperReport = (JasperReport) JRLoader.loadObjectFromFile(application.getRealPath("/report/report1.jasper"));

// Generate the report
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, ConnectDB.getConnection());

// Export the report to PDF and write it to the response output stream
                response.setContentType("application/pdf");
                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());


            //   getServletContext().getRequestDispatcher("/Test").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>
        
    </body>
</html>
