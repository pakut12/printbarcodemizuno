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
                font-size: 6pt;
                width:6in;
                height:4in;
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
            <%if (num == 4) {%>
            <table class="table table-bordered border-dark w-100 ">
                <thead>
                    <tr>
                        <th colspan="2" class="p-2 h6 fw-bold ">
                            Ship to : <%=listbox.get(i).getShipto()%><br>
                            <%=listbox.get(i).getStaddress1()%><br>
                            <%=listbox.get(i).getStaddress2()%><br>
                            <%=listbox.get(i).getStaddress3()%><br>
                            <%=listbox.get(i).getStaddress4()%>
                            
                        </th>
                        <th colspan="2" class="p-2 h6 fw-bold  ">
                            Ship From : <%=listbox.get(i).getShipfrom()%><br>
                            <%=listbox.get(i).getSfaddress1()%><br>
                            <%=listbox.get(i).getSfaddress2()%><br>
                            <%=listbox.get(i).getSfaddress3()%><br>
                            <%=listbox.get(i).getSfaddress4()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 text-center h6 fw-bold" >
                            Qty : <%=listbox.get(i).getQtyperbox()%> UOM<br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getQtyperbox()%>'  jsbarcode-fontoptions='bold'></svg> PR  
                        </th>
                        <th class="p-1 text-center h6 fw-bold" >
                            PO : <%=listbox.get(i).getPo()%><br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getPo()%>'  jsbarcode-fontoptions='bold'></svg>   
                        </th>
                        <th class="pb-4 h6 fw-bold" colspan="2 fw-bold">
                            Description : <%=listbox.get(i).getDesctxt()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 h6 fw-bold" colspan="2">
                            CTN DIMS : 38X57X40 CMS <br>
                            G.W/N.W : <%=listbox.get(0).getGrossweight()%> KGS/<%=listbox.get(0).getNetweight()%> KGS <br>
                            CBM : 0.087 M<sup>3</sup>
                        </th>
                        <th class="pb-3 h6 fw-bold" colspan="2">
                            <div class="text-center mb-1"> Country of Origin : Thailand<br></div>
                            <div class="text-center"> Cartor : <%=listbox.get(i).getBoxno()%> of <%=listbox.get(i).getAllbox()%></div>
                        </th>
                    </tr>
                    <tr class="">
                        <th class="p-1">
                            <b>MIZUNO SKU</b>
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item1()%>
                                <div class="d-flex justify-content-between">
                                    <div class="pt-2">
                                        UPC
                                    </div>
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                               <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty1()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn01()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen01()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        
                        <th class="p-1">
                            
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item2()%>
                                <div class="d-flex justify-content-between">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty2()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn02()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen02()%>
                                    </div>
                                </div>
                            </div>
                        </th>
                        <th class="p-1">
                            
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item3()%>
                                <div class="d-flex justify-content-between">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code3()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty3()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn03()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen03()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        <th class="p-1">
                            
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item4()%>
                                <div class="d-flex justify-content-between">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code4()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty4()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn04()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen04()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                    </tr>
                </thead>
                
            </table>
            
            <%}%>
            <%if (num == 3) {%>
            <table class="table table-bordered border-dark w-100 ">
                <thead>
                    <tr>
                        <th colspan="2" class="p-2 h6 fw-bold ">
                            Ship to : <%=listbox.get(i).getShipto()%><br>
                            <%=listbox.get(i).getStaddress1()%><br>
                            <%=listbox.get(i).getStaddress2()%><br>
                            <%=listbox.get(i).getStaddress3()%><br>
                            <%=listbox.get(i).getStaddress4()%>
                            
                        </th>
                        <th colspan="2" class="p-2 h6 fw-bold  ">
                            Ship From : <%=listbox.get(i).getShipfrom()%><br>
                            <%=listbox.get(i).getSfaddress1()%><br>
                            <%=listbox.get(i).getSfaddress2()%><br>
                            <%=listbox.get(i).getSfaddress3()%><br>
                            <%=listbox.get(i).getSfaddress4()%>
                        </th>
                        
                    </tr>
                    <tr>
                        <th class="p-1 text-center h6 fw-bold" >
                            Qty : <%=listbox.get(i).getQtyperbox()%> UOM<br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getQtyperbox()%>'  jsbarcode-fontoptions='bold'></svg> PR  
                        </th>
                        <th class="p-1 text-center h6 fw-bold" >
                            PO : <%=listbox.get(i).getPo()%><br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getPo()%>'  jsbarcode-fontoptions='bold'></svg>   
                        </th>
                        <th class="pb-4 h6 fw-bold" colspan="2 fw-bold">
                            Description : <%=listbox.get(i).getDesctxt()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-2 h6 fw-bold" colspan="2">
                           
                            CTN DIMS : 38X57X40 CMS <br>
                            G.W/N.W : <%=listbox.get(0).getGrossweight()%> KGS/<%=listbox.get(0).getNetweight()%> KGS <br>
                            CBM : 0.087 M<sup>3</sup>
                        </th>
                        <th class="pb-3 h6 fw-bold" colspan="2">
                            <div class="text-center mb-1"> Country of Origin : Thailand<br></div>
                            <div class="text-center"> Cartor : <%=listbox.get(i).getBoxno()%> of <%=listbox.get(i).getAllbox()%></div>
                        </th>
                    </tr>
                    <tr class="">
                        <th class="p-1">
                            <b>MIZUNO SKU</b>
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item1()%>
                                <div class="d-flex justify-content-between">
                                    <div class="pt-2">
                                        UPC
                                    </div>
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty1()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn01()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen01()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        
                        <th class="p-1">
                            
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item2()%>
                                <div class="d-flex justify-content-between">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty2()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn02()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen02()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        <th class="p-1" >
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item3()%>
                                <div class="d-flex justify-content-center">
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='1' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code3()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty3()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn03()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen03()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        
                    </tr>
                </thead>
                
            </table>
            <%}%>
            <%if (num == 2) {%>
            <table class="table table-bordered border-dark w-100 ">
                <thead>
                    <tr>
                        <th  class="p-2 h6 fw-bold " colspan="2">
                            Ship to : <%=listbox.get(i).getShipto()%><br>
                            <%=listbox.get(i).getStaddress1()%><br>
                            <%=listbox.get(i).getStaddress2()%><br>
                            <%=listbox.get(i).getStaddress3()%><br>
                            <%=listbox.get(i).getStaddress4()%>
                            
                        </th>
                        
                        <th  class="p-2 h6 fw-bold  "  colspan="2">
                            Ship From : <%=listbox.get(i).getShipfrom()%><br>
                            <%=listbox.get(i).getSfaddress1()%><br>
                            <%=listbox.get(i).getSfaddress2()%><br>
                            <%=listbox.get(i).getSfaddress3()%><br>
                            <%=listbox.get(i).getSfaddress4()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 text-center h6 fw-bold" colspan="1" >
                            <div class="d-flex justify-content-evenly">
                                <div class=""> Qty </div>
                                <div class=""><%=listbox.get(i).getQtyperbox()%> </div>
                                <div class=""> UOM </div>
                            </div>
                            <div class="d-flex justify-content-evenly">
                                <div class=""><svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getQtyperbox()%>'  jsbarcode-fontoptions='bold'></svg>  </div>
                                <div class="mt-2"> PR </div>
                                
                            </div>
                            
                        </th>
                        <th class="p-1 text-center h6 fw-bold" colspan="1" >
                            PO : <%=listbox.get(i).getPo()%><br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getPo()%>'  jsbarcode-fontoptions='bold'></svg>   
                        </th>
                        <th class="pb-4 h6 fw-bold" colspan="2">
                            Description : <%=listbox.get(i).getDesctxt()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 h6 fw-bold" colspan="2" >
                            CTN DIMS : 38X57X40 CMS <br>
                            G.W/N.W : <%=listbox.get(0).getGrossweight()%> KGS/<%=listbox.get(0).getNetweight()%> KGS <br>
                            CBM : 0.087 M<sup>3</sup>
                        </th>
                        <th class="pb-3 h6 fw-bold" colspan="2" >
                            <div class="text-center mb-1"> Country of Origin : Thailand<br></div>
                            <div class="text-center"> Cartor : <%=listbox.get(i).getBoxno()%> of <%=listbox.get(i).getAllbox()%></div>
                        </th>
                    </tr>
                    <tr class="">
                        <th class="p-1"  colspan="2" >
                            <b>MIZUNO SKU</b>
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item1()%>
                                <div class="d-flex justify-content-center">
                                    <div class="pt-2">
                                        UPC
                                    </div>
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='2' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty1()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC :
                                    </div>
                                    
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn01()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen01()%>
                                    </div>
                                    
                                </div>
                            </div>
                        </th>
                        
                        <th class="p-1" >
                            
                            <div class="text-center">
                                <%=listbox.get(i).getSku_item2()%>
                                <div class="d-flex justify-content-center">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='30' jsbarcode-width='2' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code2()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        <b>Qty :</b>
                                    </div>
                                    <div class="ps-5">
                                        <%=listbox.get(i).getQty2()%>
                                    </div>
                                    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <div class="">
                                        DESC
                                    </div>
                                    <div class="ps-3">
                                        <%=listbox.get(i).getColorn02()%>
                                    </div>
                                    <div class="ps-1">
                                        <%=listbox.get(i).getSizen02()%>
                                    </div>
                                </div>
                            </div>
                        </th>
                        
                        
                    </tr>
                </thead>
                
            </table>
            <%}%>
            <%if (num == 1) {%>
            <table class="table table-bordered border-dark w-100 ">
                <thead>
                    <tr>
                        <th  class="p-2 h6 fw-bold " colspan="2">
                            Ship to : <%=listbox.get(i).getShipto()%><br>
                            <%=listbox.get(i).getStaddress1()%><br>
                            <%=listbox.get(i).getStaddress2()%><br>
                            <%=listbox.get(i).getStaddress3()%><br>
                            <%=listbox.get(i).getStaddress4()%>
                            
                        </th>
                        
                        <th  class="p-2 h6 fw-bold  "  colspan="2">
                            Ship From : <%=listbox.get(i).getShipfrom()%><br>
                            <%=listbox.get(i).getSfaddress1()%><br>
                            <%=listbox.get(i).getSfaddress2()%><br>
                            <%=listbox.get(i).getSfaddress3()%><br>
                            <%=listbox.get(i).getSfaddress4()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 text-center h6 fw-bold" colspan="1" >
                            <div class="d-flex justify-content-evenly">
                                <div class=""> Qty </div>
                                <div class=""><%=listbox.get(i).getQtyperbox()%> </div>
                                <div class=""> UOM </div>
                            </div>
                            <div class="d-flex justify-content-evenly">
                                <div class=""><svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getQtyperbox()%>'  jsbarcode-fontoptions='bold'></svg>  </div>
                                <div class="mt-2"> PR </div>
                                
                            </div>
                            
                        </th>
                        <th class="p-1 text-center h6 fw-bold" colspan="1" >
                            PO : <%=listbox.get(i).getPo()%><br>
                            <svg class='barcode' jsbarcode-height='15' jsbarcode-width='1' jsbarcode-displayValue='false' jsbarcode-value='<%=listbox.get(i).getPo()%>'  jsbarcode-fontoptions='bold'></svg>   
                        </th>
                        <th class="pb-4 h6 fw-bold" colspan="2">
                            Description : <%=listbox.get(i).getDesctxt()%>
                        </th>
                    </tr>
                    <tr>
                        <th class="p-1 h6 fw-bold" colspan="2" >
                            CTN DIMS : 38X57X40 CMS <br>
                            G.W/N.W : <%=listbox.get(0).getGrossweight()%> KGS/<%=listbox.get(0).getNetweight()%> KGS <br>
                            CBM : 0.087 M<sup>3</sup>
                        </th>
                        <th class="pb-3 h6 fw-bold" colspan="2" >
                            <div class="text-center mb-1"> Country of Origin : Thailand<br></div>
                            <div class="text-center"> Cartor : <%=listbox.get(i).getBoxno()%> of <%=listbox.get(i).getAllbox()%></div>
                        </th>
                    </tr>
                    <tr class="">
                        <th class="p-1"  colspan="4" >
                            
                            <div class="text-center h3 fw-bold">
                                <%=listbox.get(i).getSku_item1()%>
                                <div class="d-flex justify-content-center">
                                    
                                    <div class=""><svg class='barcode' jsbarcode-height='40' jsbarcode-width='3' jsbarcode-fontSize='10'  jsbarcode-displayValue='true' jsbarcode-value='<%=listbox.get(i).getUpc_code1()%>'  jsbarcode-fontoptions='bold'></svg></div>
                                </div>
                                
                            </div>
                        </th>
                        
                        
                        
                    </tr>
                </thead>
                
            </table>
            <%}%>
            
        </div>
        <%}%>
        <script>
            JsBarcode(".barcode").init();
            window.onafterprint = window.close;
            window.print();
        </script>
    </body>
</html>
