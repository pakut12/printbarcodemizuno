<%-- 
    Document   : test
    Created on : 25 ก.ย. 2566, 13:52:30
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            double allnw = 132132132 ;
            DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
            String formattedNw = decimalFormat.format(allnw);
            
            out.print(formattedNw);

        %>
    </body>
</html>
