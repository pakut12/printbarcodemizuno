<%-- 
    Document   : packinglist
    Created on : 17 ?.?. 2566, 11:43:50
    Author     : pakutsing
--%>
<%@page import="com.pg.lib.service.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="com.pg.lib.utility.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
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

            try {
                String id = request.getParameter("id").trim();
                List<BCInvoice> inv = PackingListService.getPackingListByid(id);

                for (BCInvoice i : inv) {
                    /*
                    System.out.println("--------------------------------------------------------------------");
                    System.out.println(i.getInvoiceid());
                    System.out.println(i.getInvoiceno());
                    System.out.println(i.getInvoicedate());
                    System.out.println(i.getPo());
                    System.out.println(i.getSaveingno());
                    System.out.println(i.getFirstdigit());
                    System.out.println(i.getStartbox());
                    System.out.println(i.getEndbox());
                    System.out.println(i.getContainerno());
                    System.out.println(i.getDate_create());
                    System.out.println(i.getDate_modified());
                    System.out.println("--------------------------------------------------------------------");
                     */
                    List<BCDetailBox> getlistall = PackingListService.getPackingListByPO(i.getPo(), i.getFirstdigit());

                    for (BCDetailBox b : getlistall) {
                        System.out.println("--------------------------------------------------------------------");
                        System.out.println(b.getInvoiceid());
                     
                        System.out.println("--------------------------------------------------------------------");

                    }


                }


            } catch (Exception e) {
                e.printStackTrace();
            }

        %> 
        
    </body>
</html>