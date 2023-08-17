<%-- 
    Document   : packinglist
    Created on : 17 ส.ค. 2566, 11:43:50
    Author     : pakutsing
--%>
<%@page import="com.pg.lib.service.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String invoiceno = request.getParameter("invoiceno").trim();
            String invoicedate = request.getParameter("invoicedate").trim();
            
            List<BCDetailBox> list = PackingListService.getPOByInvoicenoandInvoiceDate(invoiceno, Utility.CoverDate(invoicedate));
            out.print("<br>");
            out.print(invoiceno);
            out.print("<br>");
            out.print(invoicedate);
            
        %>
       
    </body>
</html>
