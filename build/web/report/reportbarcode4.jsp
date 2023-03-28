<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="com.pg.lib.model.BCDetailBox"%>
<%@page import="java.util.List"%>
<%@page import="com.pg.lib.service.DetailService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/jsbarcode/3.6.0/JsBarcode.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <title>JSP Page</title>
        
        <style>
            .pagebreak{
                page-break-after: always;
            }
            .barcode { font-family: "Free 3 of 9", "Free 3 of 9 Extended"; font-size: 30pt; }
            .barcodeupc { 
                font-family: "Free 3 of 9", "Free 3 of 9 Extended"; 
                font-size: 18pt;  
            }
            body{
                width:6in;
                height:4in;
                font: 12pt Tahoma;
            }
        </style>
    </head>
    <body>
        <%
            String po = request.getParameter("po").trim();
            String start = request.getParameter("start").trim();
            String end = request.getParameter("end").trim();
            String num = request.getParameter("num").trim();
            String firstdigit = request.getParameter("firstdigit").trim();

            DetailService ds = new DetailService();
            List<BCDetailBox> listbox = ds.GetDetailBoxForPrint(po, start, end, firstdigit);

            for (int x = 0; x < listbox.size(); x++) {

        %>
        
        <div class="m-2 pagebreak">
            <div class="row fw-bold  border-bottom border-dark">
                <div class="col-6 border-end border-dark ">
                    Ship To : <%=listbox.get(x).getShipto()%><br> <%=listbox.get(x).getStaddress1()%><br><%=listbox.get(x).getStaddress2()%><br> <%=listbox.get(x).getStaddress3()%><br><%=listbox.get(x).getStaddress4()%>
                </div>
                <div class="col-6 text-nowrap">
                    Ship From : <%=listbox.get(x).getShipfrom()%><br> <%=listbox.get(x).getSfaddress1()%><br> <%=listbox.get(x).getSfaddress2()%><br> <%=listbox.get(x).getSfaddress3()%><br><%=listbox.get(x).getSfaddress4()%>
                </div>
            </div>
            <div class="row fw-bold ">
                <div class="col-4">
                    <div class="row border-end border-dark  pt-1">
                        <div class="col-4">Qty</div>
                        <div class="col-4"><%=listbox.get(x).getQtyperbox()%></div>
                        <div class="col-4">UOM</div>
                    </div>
                </div>
                <div class="col-4 text-center border-end border-dark pt-1"><%=listbox.get(x).getPo()%></div>
                <div class="col-4 ">Description</div>
            </div>
            <div class="row border-bottom border-dark">
                <div class="col-4 border-end border-dark ">
                    <div class="row">
                        <div class="col-6 pb-2 pt-2"><div class="barcode">*<%=listbox.get(x).getQtyperbox()%>*</div></div>
                        <div class="col-6 pb-2 pt-2 fw-bold text-center">PR</div>
                    </div>
                </div>
                <div class="col-4 barcode pb-2 pt-2 text-center border-end border-dark">*<%=listbox.get(x).getPo()%>*</div>
                <div class="col-4" style="font: 9pt Tahoma;"><%=listbox.get(x).getDesctxt()%></div>
            </div>
            <div class="row fw-bold border-bottom border-dark">
                <div class="col-7 border-end border-dark pb-1 pt-1">
                    CTN DIMES : 38X57X40 CMS <br>G.W/N.W: <%=listbox.get(x).getGrossweight()%> KGS/ <%=listbox.get(x).getNetweight()%> KGS <br>CBM: 0.087 M<sup>3</sup>
                </div>
                <div class="col-5 text-center">
                    <div class="row  border-bottom border-dark">
                        <div class="col-12 pb-1 pt-1 "style="font: 9pt Tahoma;">
                            Country of Origin<br>
                            THAILAND
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-12 mt-1">
                            Carton <%=listbox.get(x).getBoxno()%>  of <%=listbox.get(x).getAllbox()%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="col-3 fw-bold  border-end border-dark pt-2" style="font: 10pt Tahoma;">MIZUNO SKU</div>
                <div class="col-3  border-end border-dark"></div>
                <div class="col-3  border-end border-dark"></div>
                <div class="col-3 "></div>
            </div>
            <div class="row text-center fw-bold" style="font: 8pt Tahoma;">
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getSku_item1()%></div>
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getSku_item2()%></div>
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getSku_item3()%></div>
                <div class="col-3"><%=listbox.get(x).getSku_item4()%></div>
            </div>
            <div class="row text-center " >
                <div class="col-3 barcodeupc p-0 border-end border-dark">*<%=listbox.get(x).getUpc_code1()%>*</div>
                <div class="col-3 barcodeupc p-0 border-end border-dark">*<%=listbox.get(x).getUpc_code2()%>*</div>
                <div class="col-3 barcodeupc p-0 border-end border-dark">*<%=listbox.get(x).getUpc_code3()%>*</div>
                <div class="col-3 barcodeupc ">*<%=listbox.get(x).getUpc_code4()%>*</div>
            </div>
            <div class="row text-center fw-bold" style="font: 10pt Tahoma;" >
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getUpc_code1()%></div>
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getUpc_code2()%></div>
                <div class="col-3  border-end border-dark"><%=listbox.get(x).getUpc_code3()%></div>
                <div class="col-3 "><%=listbox.get(x).getUpc_code4()%></div>
            </div>
            <div class="row text-center fw-bold" style="font: 5pt Tahoma;" >
                <div class="col-3  border-end border-dark">
                    <div class="row">
                        <div class="col-2">Qty</div>
                        <div class="col-10"><%=listbox.get(x).getQty1()%></div>
                    </div>
                </div>
                <div class="col-3  border-end border-dark">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getQty2()%></div>
                    </div>
                </div>
                <div class="col-3  border-end border-dark">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getQty3()%></div>
                    </div>
                </div>
                <div class="col-3 ">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getQty4()%></div>
                    </div>
                </div>
            </div>
            <div class="row fw-bold text-center" style="font: 5pt Tahoma;">
                <div class="col-3  border-end border-dark">
                    <div class="row ">
                        <div class="col-4">DESC</div>
                        <div class="col-8"><%=listbox.get(x).getColorn01()%>  <%=listbox.get(x).getSizen01()%></div>
                    </div>
                </div>
                <div class="col-3  border-end border-dark">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getColorn02()%>  <%=listbox.get(x).getSizen02()%></div>
                    </div>
                </div>
                <div class="col-3  border-end border-dark">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getColorn03()%>  <%=listbox.get(x).getSizen03()%></div>
                    </div>
                </div>
                <div class="col-3 ">
                    <div class="row">
                        <div class="col-12"><%=listbox.get(x).getColorn04()%>  <%=listbox.get(x).getSizen04()%></div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
    </body>
    <script>
        JsBarcode(".barcodetest").init();
        window.print();
        window.onafterprint = window.close; 
    </script>
</html>