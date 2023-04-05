<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="com.pg.lib.utility.*"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String po = (String) request.getParameter("po").trim();
            String startbox = (String) request.getParameter("startbox").trim();
            String endbox = (String) request.getParameter("endbox").trim();
            String firstdigit = (String) request.getParameter("firstdigit").trim();

            try {
                Connection con = ConnectDB.getConnection();
                File reportFile = new File(application.getRealPath("report/report4.jasper"));

                Map pr = new HashMap();
                pr.put("PO", po);
                pr.put("STARTBOX", startbox);
                pr.put("ENDBOX", endbox);
                pr.put("FIRSTDIGIT", firstdigit);

                byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), pr, con);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);

                ServletOutputStream op = response.getOutputStream();
                response.getOutputStream();
                op.write(bytes, 0, bytes.length);
                op.flush();
            } catch (Exception e) {
                e.printStackTrace();
            }



        %>
        
    </body>
</html>