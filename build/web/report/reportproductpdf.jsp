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
            String po = (String) request.getAttribute("po");

        %>
        <script>
            function getDateNow() {
                const currentDate = new Date();
                const day = currentDate.getDate();
                const month = currentDate.getMonth() + 1; // Months are zero-based, so we add 1 to get the correct month.
                const year = currentDate.getFullYear();

                // Format the date as "dd/mm/yyyy"
                const formattedDate = day+"/"+month+"/"+year;

                return formattedDate;
            }
            
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
                pageMargins: [ 35, 76, 40,20],
                header: function(currentPage, pageCount, pageSize) {
                    // you can apply any logic and return any valid pdfmake element
                            
                    return [   
                        {
                            columns: [
                                {
                                    width: '*',
                                    text: "ข้อมูลวันที่ ณ " +getDateNow(),
                                    fontSize: 14,
                                    bold:true,
                                    alignment: 'left',
                                    margin: [40,25, 0, 0]
                                             
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
                                    text: [{text:'พาเลท : ',bold:true},{text:'<%=pallet%>'}],
                                            fontSize: 14,
                                            alignment: 'right',
                                            margin: [0,0, 45,0]   
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
                  
                                    widths:  [ 'auto', 'auto', 'auto', 'auto', 'auto', 'auto', 'auto', '*'],
                                    body: [
                                        [ 'วันที่', 'PO','รหัสลูกค้า','รหัสสินค้า','Production Order','กล่องที่','จำนวน','หมายเหตุ' ],
                        <%
            int marknum = 0;
            int n = 1;
            int n1 = 1;
            int sum = 0;
            for (int i = 0; i < list.size(); i++) {
                String mark = "";
                String qty_result = "";
                customer_no = list.get(i).getCustomer_no();
                if (list.get(i).getSku_item1().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result1();
                    if (Integer.parseInt(list.get(i).getQty_result1()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item2().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result2();
                    if (Integer.parseInt(list.get(i).getQty_result2()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item3().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result3();
                    if (Integer.parseInt(list.get(i).getQty_result3()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item4().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result4();
                    if (Integer.parseInt(list.get(i).getQty_result4()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                }

                String D = (String) list.get(i).getDate_create();
                if (D != null) {
                    D = list.get(i).getDate_create().substring(0, 10);
                }

                if (mark.equals("*")) {
                    marknum++;
                }

                DetailService ds = new DetailService();

                if (n <= 12) {
                    sum += Integer.parseInt(ds.ChackNull(qty_result));
                    out.print("[ '" + ds.ChackNull(D) + "','" + ds.ChackNull(list.get(i).getPo()) + "','" + ds.ChackNull(list.get(i).getCustomer_no()) + "','" + ds.ChackNull(list.get(i).getCustomer_product()) + "','" + ds.ChackNull(list.get(i).getProdorder()) + "','" + ds.ChackNull(list.get(i).getBoxno()) + "','" + ds.ChackNull(qty_result) + "','" + ds.ChackNull(mark) + "'],");
                    n1++;
                } else if (n == 13) {
                    out.print("[{text: 'รวม',colSpan: 5},'" + sum + "','" + sum + "','" + sum + "','" + sum + "','" + (n - 1) + "','" + sum + "','" + (marknum - 1) + "'],");
                    sum = 0;
                    n = 0;
                    i--;
                    marknum = 0;
                }

                if (n1 == list.size() + 1) {
                    out.print("[{text: 'รวม',colSpan: 5},'" + sum + "','" + sum + "','" + sum + "','" + sum + "','" + (n) + "','" + sum + "','" + (marknum) + "'],");
                    n1 = 1;
                }
                n++;
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
            
                                    const date = new Date();
                                    const options = { day: 'numeric', month: 'numeric', year: 'numeric' };
                                    const formattedDate = date.toLocaleDateString('th-TH', options);
                                    
                                    pdfMake.createPdf(dd).download('รายละเอียดสินค้า'+formattedDate+'.pdf');  
            
        </script>
    </body>
</html>