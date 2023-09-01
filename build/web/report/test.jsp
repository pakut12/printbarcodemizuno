<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="com.pg.lib.utility.*"%>
<%@page import="com.pg.lib.service.*"%>
<%@page import="com.pg.lib.model.*"%>
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
                String id = "Y111-01";
                List<BCDetailBox> listpo = ReportService.GetPOALL(id);

                List<String> listg = new ArrayList<String>();
                for (BCDetailBox x : listpo) {
                    String ad = x.getPo() + "#" + x.getFirstdigit() + "#" + x.getBoxno();
                    if (!listg.contains(ad)) {
                        listg.add(ad);
                    }
                }

                int n = 1;
                for (String g : listg) {
                    String[] box = g.split("#");
                    int no = Integer.parseInt(box[2]);
                    String f = box[1];
                    String p = box[0];
                    
                    
                    out.print(g +"<br>");
                    
                }


            } catch (Exception e) {
                e.printStackTrace();

            }




        %>
        
    </body>
</html>