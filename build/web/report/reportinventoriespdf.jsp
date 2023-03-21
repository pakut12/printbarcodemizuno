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
                pageSize: 'A4',
                pageMargins: [ 15, 60, 30,10],
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
                        }
                    ]
                },
               
                content: [
                    {
                        alignment: 'center',
                        table: {
                           
                            // headers are automatically repeated if the table spans over multiple pages
                            // you can declare how many rows should be treated as headers
                            headerRows: 1,
                  
                            widths:  [ 'auto', 'auto', 'auto', 'auto', 'auto', 'auto','auto', 'auto', 'auto', 'auto', 'auto', 'auto'],
                            body: [
                                [ 'วันที่', 'PO', 'PO เดิม','รหัสลูกค้า','รหัสสินค้า','Production Order','พาเลท', 'กล่องที่', 'จำนวนเต็ม','จำนวนในกล่อง','ต่าง','หมายเหตุ'],
                        <%
            int marknum = 0;
            int n = 1;
            int n1 = 1;
            int sumqty = 0;
            int sumqty_result = 0;
            int sumdifferent = 0;

            for (int i = 0; i < list.size(); i++) {
                String mark = "";
                String qty_result = "";
                String qty = "";
                customer_no = list.get(i).getCustomer_no();

                if (list.get(i).getSku_item1().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result1();
                    qty = list.get(i).getQty1();
                    if (Integer.parseInt(list.get(i).getQty_result1()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item2().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result2();
                    qty = list.get(i).getQty2();
                    if (Integer.parseInt(list.get(i).getQty_result2()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item3().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result3();
                    qty = list.get(i).getQty3();
                    if (Integer.parseInt(list.get(i).getQty_result3()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                } else if (list.get(i).getSku_item4().equals(customer_no)) {
                    qty_result = list.get(i).getQty_result4();
                    qty = list.get(i).getQty4();
                    if (Integer.parseInt(list.get(i).getQty_result4()) < Integer.parseInt(list.get(i).getQty1())) {
                        mark = "*";
                    }
                }

                DetailService ds = new DetailService();

                int different = Integer.parseInt(qty) - Integer.parseInt(qty_result);

                String D = (String) list.get(i).getDate_modify();
                if (D != null) {
                    D = list.get(i).getDate_modify().substring(0, 10);
                }

                if (mark.equals("*")) {
                    marknum++;
                }

                if (n <= 34) {
                    sumqty += Integer.parseInt(ds.ChackNull(qty));
                    sumqty_result += Integer.parseInt(ds.ChackNull(qty_result));
                    sumdifferent += Integer.parseInt(ds.ChackNull(String.valueOf(different)));
                    out.print("[ '" + ds.ChackNull(D) + "','" + ds.ChackNull(list.get(i).getPo()) + "','" + ds.ChackNull(list.get(i).getPo_old()) + "','" + ds.ChackNull(list.get(i).getCustomer_no()) + "','" + ds.ChackNull(list.get(i).getCustomer_product()) + "','" + ds.ChackNull(list.get(i).getProdorder()) + "'," +
                            "'" + ds.ChackNull(list.get(i).getPallet()) + "','" + ds.ChackNull(list.get(i).getBoxno()) + "','" + ds.ChackNull(qty) + "','" + ds.ChackNull(qty_result) + "','" + ds.ChackNull(String.valueOf(different)) + "','" + ds.ChackNull(mark) + "'],");
                    n1++;
                } else if (n == 35) {
                    out.print("[{ text: 'รวม', colSpan: 8 }, '', '', '', '', '', '', '', '" + sumqty + "','" + sumqty_result + "','" + sumdifferent + "','" + (marknum - 1) + "'],");
                    sumqty = 0;
                    sumdifferent = 0;
                    sumqty_result = 0;
                    n = 0;
                    i--;
                    marknum = 0;
                }
                if (n1 == list.size() + 1) {
                    out.print("[{ text: 'รวม', colSpan: 8  }, '', '', '', '', '', '', '', '" + sumqty + "','" + sumqty_result + "','" + sumdifferent + "','" + (marknum) + "'],");
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
            
            
                            pdfMake.createPdf(dd).download('<%=po%>.pdf');  
            
        </script>
    </body>
</html>