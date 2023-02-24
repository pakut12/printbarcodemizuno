<%-- 
    Document   : reportbarcode
    Created on : 24 ก.พ. 2566, 9:02:23
    Author     : pakutsing
--%>
<%@page import="java.util.List"%>
<%@page import="com.pg.lib.model.BCDetailBox"%>
<%@page import="com.pg.lib.service.DetailService"%>
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
        <style>
            .pagebreak{
                page-break-after: always;
            }
            body{
                font-size: 8pt;
            }
        </style>
    </head>
    <body>
        <%
            String po = request.getParameter("po");
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            int num = Integer.parseInt(request.getParameter("num"));


            DetailService ds = new DetailService();
            List<BCDetailBox> listbox = ds.GetDetailBoxForPrint(po, start, end);
            for (int i = 0; i < listbox.size(); i++) {
        %>
        <div class="pagebreak fw-bold ">
            <div class="row ">
                <div class="col border border-dark ms ps-3">
                    Ship to : <%=listbox.get(i).getShipto()%><br>
                    <%=listbox.get(i).getStaddress1()%><br>
                    <%=listbox.get(i).getStaddress2()%><br>
                    <%=listbox.get(i).getStaddress3()%><br>
                    <%=listbox.get(i).getStaddress4()%>
                </div>
                <div class="col border border-dark ">
                    Ship to : <%=listbox.get(i).getShipto()%><br>
                    <%=listbox.get(i).getStaddress1()%><br>
                    <%=listbox.get(i).getStaddress2()%><br>
                    <%=listbox.get(i).getStaddress3()%><br>
                    <%=listbox.get(i).getStaddress4()%>
                </div>
            </div>
            <div class="row ">
                <div class="col border border-dark ps-3">
                    Qty : <%=listbox.get(i).getQtyperbox()%> UOM<br>
                    <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getQtyperbox()%>'  jsbarcode-fontoptions='bold'></svg> PR  
                </div>
                <div class="col border border-dark">
                    PO : <%=listbox.get(i).getPo()%><br>
                    <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getPo()%>'  jsbarcode-fontoptions='bold'></svg>   
                </div>
                <div class="col border border-dark">
                    Description : <%=listbox.get(i).getDesctxt()%><br>
                </div>
            </div>
            <div class="row ">
                <div class="col border border-dark ps-3">
                    CTN DIMS : 38X57X40 CMS <br>
                    G.W/N.W : <%=listbox.get(0).getGrossweight()%> KGS/<%=listbox.get(0).getNetweight()%> KGS <br>
                    CBM : 0.087 M<sup>3</sup><br>
                </div>
                <div class="col border border-dark ">
                    <div class="row justify-content-center p-1">
                        Country of Origin : Thailand
                    </div>
                    <div class="row justify-content-center  p-1">
                        Cartor : <%=listbox.get(i).getBoxno()%> of <%=listbox.get(i).getAllbox()%>
                    </div>
                </div>
            </div>
            <%if (num == 1) {%>
            <div class="row text-center">
                <div class="col-12 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item1()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        
                    </div>
                </div>
                
            </div>
            <%}%>
            <%if (num == 2) {%>
            <div class="row text-center">
                <div class="col-6 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item1()%><br>
                        UPC:  <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        QTY : <%=listbox.get(i).getQty1()%><br>
                        DESC : <%=listbox.get(i).getColorn01()%>  <%=listbox.get(i).getSizen01()%>
                    </div>
                </div>
                <div class="col-6 d-flex justify-content-center ps-3 pt-3 border border-dark">
                    <div class=""><%=listbox.get(i).getSku_item2()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg> <br>  
                        QTY : <%=listbox.get(i).getQty2()%><br>
                        DESC : <%=listbox.get(i).getColorn02()%>  <%=listbox.get(i).getSizen02()%>
                    </div>
                </div>
                
            </div>
            <%}%>
            <%if (num == 3) {%>
            <div class="row text-center">
                <div class="col-4 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item1()%><br>
                        UPC:  <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        QTY : <%=listbox.get(i).getQty1()%><br>
                        DESC : <%=listbox.get(i).getColorn01()%>  <%=listbox.get(i).getSizen01()%>
                    </div>
                </div>
                <div class="col-4 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item2()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg> <br>  
                        QTY : <%=listbox.get(i).getQty2()%><br>
                        DESC : <%=listbox.get(i).getColorn02()%>  <%=listbox.get(i).getSizen02()%>
                    </div>
                </div>
                <div class="col-4 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item3()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code3()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        QTY : <%=listbox.get(i).getQty3()%><br>
                        DESC : <%=listbox.get(i).getColorn03()%>  <%=listbox.get(i).getSizen03()%>
                    </div>
                </div>
                
            </div>
            <%}%>
            <%if (num == 4) {%>
            <div class="row text-center  border border-dark">
                <div class="col-3 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item1()%><br>
                        UPC:  <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        QTY : <%=listbox.get(i).getQty1()%><br>
                        DESC : <%=listbox.get(i).getColorn01()%>  <%=listbox.get(i).getSizen01()%>
                    </div>
                    
                </div>
                <div class="col-3 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item2()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg> <br>  
                        QTY : <%=listbox.get(i).getQty2()%><br>
                        DESC : <%=listbox.get(i).getColorn02()%>  <%=listbox.get(i).getSizen02()%>
                    </div>
                    
                </div>
                <div class="col-3 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item3()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code3()%>'  jsbarcode-fontoptions='bold'></svg>  <br> 
                        QTY : <%=listbox.get(i).getQty3()%><br>
                        DESC : <%=listbox.get(i).getColorn03()%>  <%=listbox.get(i).getSizen03()%>
                    </div>
                    
                </div>
                <div class="col-3 d-flex justify-content-center ps-3 pt-3 border border-dark ">
                    <div class=""><%=listbox.get(i).getSku_item4()%><br>
                        <svg class='barcode' jsbarcode-height='20' jsbarcode-width='1' jsbarcode-fontSize='5'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code4()%>'  jsbarcode-fontoptions='bold'></svg> <br>  
                        QTY : <%=listbox.get(i).getQty4()%><br>
                        DESC : <%=listbox.get(i).getColorn04()%>  <%=listbox.get(i).getSizen04()%>
                    </div>
                </div>
            </div>
            <%}%>
            
        </div>
        <%}%>
        
        <script>
            JsBarcode(".barcode").init();
            window.print();
        </script>
    </body>
</html>
