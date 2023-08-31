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
            try {
                List<String> list = new ArrayList<String>();
                list.add("A1");
                list.add("A2");
                list.add("A3");
                list.add("A4");
                list.add("A6");
                list.add("A7");
                list.add("A8");
                list.add("A9");
               
                List<String> ranges = Utility.getRanges(list);
                for (String range : ranges) {
                    System.out.println(range);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }



        %>
        
    </body>
</html>