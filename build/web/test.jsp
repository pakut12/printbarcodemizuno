<%-- 
    Document   : test
    Created on : 12 ก.ย. 2566, 8:02:46
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
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
            
            try {
                String text = "310TBD2,310TBD2,";
                
                out.print(text.substring(0, text.length()-1));
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            
            
            
            
        %>
    </body>
</html>
