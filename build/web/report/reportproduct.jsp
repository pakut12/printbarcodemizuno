<%-- 
    Document   : reportproduct
    Created on : 7 มี.ค. 2566, 14:54:55
    Author     : pakutsing
--%>
<%@page import="java.util.*"%>
<%@page import="com.pg.lib.model.BCDetailBox"%>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/jsbarcode/3.6.0/JsBarcode.all.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.1/af-2.5.1/b-2.3.3/b-colvis-2.3.3/b-html5-2.3.3/b-print-2.3.3/cr-1.6.1/date-1.2.0/fc-4.2.1/fh-3.3.1/kt-2.8.0/r-2.4.0/rg-1.3.0/rr-1.3.1/sc-2.0.7/sb-1.4.0/sp-2.1.0/sl-1.5.0/sr-1.2.0/datatables.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/jszip-2.5.0/dt-1.13.1/af-2.5.1/b-2.3.3/b-colvis-2.3.3/b-html5-2.3.3/b-print-2.3.3/cr-1.6.1/date-1.2.0/fc-4.2.1/fh-3.3.1/kt-2.8.0/r-2.4.0/rg-1.3.0/rr-1.3.1/sc-2.0.7/sb-1.4.0/sp-2.1.0/sl-1.5.0/sr-1.2.0/datatables.min.js"></script>
    </head>
    <body>
        <%
            List<BCDetailBox> listproduct = (List<BCDetailBox>) request.getAttribute("listproduct");
            int n = 0;
        %>
        <table class="table " id="mytable">
            <thead>
                <tr>
                    <th scope="col">วันที่</th>
                    <th scope="col">PO</th>
                    <th scope="col">Production Order</th>
                    <th scope="col">กล่องที่</th>
                    <th scope="col">จำนวน</th>
                    <th scope="col">หมายเหตุ</th>
                </tr>
            </thead>
            <tbody>
                <%
            for (BCDetailBox li : listproduct) {
                out.print("<tr>");
                out.print("<td>" + li.getDate_modify() + "</td>");
                out.print("<td>" + li.getPo() + "</td>");
                out.print("<td>" + li.getProdorder() + "</td>");
                out.print("<td>" + li.getBoxno() + "</td>");
                out.print("<td>" + li.getQty_result1() + "</td>");
                out.print("<td></td>");
                out.print("</tr>");
            }
                %>
                
            </tbody>
        </table>
        <script>
            
        </script>
        
    </body>
</html>
