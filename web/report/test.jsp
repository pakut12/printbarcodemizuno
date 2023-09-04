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
            String id = "100";
            List<BCInvoice> inv = PackingListService.getPackingListByid(id);
            String[] size = {"XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL"};

            HashMap<String, String> map = new HashMap<String, String>();
            try {
                for (BCInvoice i : inv) {
                    List<BCDetailBox> listsizebypo = PackingListService.GroupCustomeSizeTotal(i.getPo(), i.getFirstdigit(), i.getStartbox(), i.getEndbox());
                    HashMap<String, BCDetailBox> arrsize = new HashMap<String, BCDetailBox>();
                    for (BCDetailBox x : listsizebypo) {
                        
                        for (BCDetailBox z : listsizebypo) {
                            arrsize.put(z.getCustomer_color()+"#"+z.getCustomer_size(), x);
                        }
                        
                        System.out.println("---------------------------------------------------------------------");
                        System.out.println(x.getPo());
                        System.out.println(x.getCustomer_color());
                        System.out.println(x.getCustomer_size());
                        System.out.println("---------------------------------------------------------------------");
                    }

                }


            } catch (Exception e) {
                e.printStackTrace();



            }




        %>
        
    </body>
</html>