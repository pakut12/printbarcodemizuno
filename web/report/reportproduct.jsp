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
        <script src="js/pdfmake.min.js"></script>
        <script src="js/vfs_fonts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            List<BCDetailBox> list = (List<BCDetailBox>) request.getAttribute("listproduct");
            String customer_no = (String) request.getAttribute("customer_no");
            String customer_product = (String) request.getAttribute("customer_product");
            String pallet = (String) request.getAttribute("pallet");

        %>
        <script>
           
            
            pdfMake.fonts = {
                THSarabunNew: {
                    normal: 'THSarabunNew.ttf',
                    bold: 'THSarabunNew-Bold.ttf',
                    italics: 'THSarabunNew-Italic.ttf',
                    bolditalics: 'THSarabunNew-BoldItalic.ttf'
                },
                Roboto: {
                    normal: 'Roboto-Regular.ttf',
                    bold: 'Roboto-Medium.ttf',
                    italics: 'Roboto-Italic.ttf',
                    bolditalics: 'Roboto-MediumItalic.ttf'
                }
            }
            
            var dd = {
                pageSize: {
                    width: 590,
                    height: 390
                },
                pageMargins: [ 35, 74, 40,20],
                header: function(currentPage, pageCount, pageSize) {
                    // you can apply any logic and return any valid pdfmake element
                            
                    return [   
                        {
                            columns: [
                                {
                                    width: '*',
                                    text: [],
                                    fontSize: 14,
                                    alignment: 'left',
                                    margin: [0,0, 0, 0]
                                             
                                },
                                {
                                    width: '*',
                                    text: 'รายละเอียดสินค้า',
                                    fontSize: 20,
                                    alignment: 'center',
                                    bold:true,
                                    margin: [0,25, 0, 0]
                                },
                                {
                                    width: '*',
                                    text: 'หน้า : '+currentPage+"/"+pageCount,
                                    fontSize: 14,
                                    bold:true,
                                    alignment: 'right',
                                    margin: [0,25, 40, 0]
                                }
                            
                            ]
                        },
                        {
                            columns: [
                                {
                                    width: '*',
                                    text: [{text:'รหัสลูกค้า : ',bold:true},{text:'<%=customer_no%>'}],
                                            fontSize: 14,
                                            alignment: 'center',
                                            margin: [0,0, 0, 0]
                                        },
                                        {
                                            width: '*',
                                            text:[{text:'รหัสสินค้า : ',bold:true},{text:'<%=customer_product%>'}],
                                                    fontSize: 14,
                                                    alignment: 'center',
                                                    margin: [0,0, 40, 0]
                                                },
                                                {
                                                    width: '*',
                                                    text: [{text:'พาเลท : ',bold:true},{text:'<%=pallet%>'}],
                                                            fontSize: 14,
                                                            alignment: 'center',
                                                            margin: [40,0, 0, 0]      
                                                        }
                                                    ]
                                                },
                        
                                            ]
                                        },
                                        background: [
                            
                                            {
                                                canvas: [
                                                    {
                                                        type: 'rect',
                                                        x: 20,
                                                        y: 20,
                                                        w: 550,
                                                        h: 357,
                                                        r: 0,
                                                        lineWidth: 1,
                                                        lineColor: '#000000'
                                                    },
                                                    {
                                                        type: 'rect',
                                                        x: 20,
                                                        y: 20,
                                                        w: 550,
                                                        h: 50,
                                                        r: 0,
                                                        lineWidth: 1,
                                                        lineColor: '#000000'
                                                    }
                                                ]
                                            }
                            
                                        ],
                                        content: [
                                            {
                                                alignment: 'center',
                                                table: {
                           
                                                    // headers are automatically repeated if the table spans over multiple pages
                                                    // you can declare how many rows should be treated as headers
                                                    headerRows: 1,
                  
                                                    widths:  [ '*', '*', '*', '*', '*', '*'],
                                                    body: [
                                                        [ 'วันที่', 'PO', 'Production Order','กล่องที่','จำนวน','หมายเหตุ' ],
                        <%
            for (BCDetailBox li : list) {
                String mark = "";
                String qty_result = "";

                if (li.getSku_item1().equals(customer_no)) {
                    qty_result = li.getQty_result1();
                    if (Integer.parseInt(li.getQty_result1()) < Integer.parseInt(li.getQty1())) {
                        mark = "*";
                    }
                } else if (li.getSku_item2().equals(customer_no)) {
                    qty_result = li.getQty_result2();
                    if (Integer.parseInt(li.getQty_result2()) < Integer.parseInt(li.getQty1())) {
                        mark = "*";
                    }
                } else if (li.getSku_item3().equals(customer_no)) {
                    qty_result = li.getQty_result3();
                    if (Integer.parseInt(li.getQty_result3()) < Integer.parseInt(li.getQty1())) {
                        mark = "*";
                    }
                } else if (li.getSku_item4().equals(customer_no)) {
                    qty_result = li.getQty_result4();
                    if (Integer.parseInt(li.getQty_result4()) < Integer.parseInt(li.getQty1())) {
                        mark = "*";
                    }
                }

                String D = (String) li.getDate_modify();
                if (D != null) {
                    D = li.getDate_modify().substring(0, 10);
                }
                DetailService ds = new DetailService();
                out.print("[ '" + ds.ChackNull(D) + "','" + ds.ChackNull(li.getPo()) + "','" + ds.ChackNull(li.getProdorder()) + "','" + ds.ChackNull(li.getBoxno()) + "','" + ds.ChackNull(qty_result) + "','" + ds.ChackNull(mark) + "'],");
            }
                        %>
                                                                    ]
                                                                }   
                                                            }
                       
                                                        ],
                                                        styles: {
                                   
                                                        },
                                                        defaultStyle: {
                                                            font: 'THSarabunNew'
                                                        }
                                                    }
            
            
                                                    pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>