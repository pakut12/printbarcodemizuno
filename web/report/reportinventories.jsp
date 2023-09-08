<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>
<%@page import="com.pg.lib.model.BCDetailBox"%>
<%@page import="java.util.*"%>
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
            function getDateNow() {
                const currentDate = new Date();
                const day = String(currentDate.getDate()).padStart(2, '0');
                const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Months are zero-based, so we add 1 to get the correct month.
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
                pageSize: 'A4',
                pageMargins: [ 15, 60, 30,10],
                header: function(currentPage, pageCount, pageSize) {
                    // you can apply any logic and return any valid pdfmake element
                            
                    return [   
                        {
                            columns: [
                                {
                                    width: '*',
                                    text: "ข้อมูลวันที่ ณ " +getDateNow(),
                                    fontSize: 14,
                                    alignment: 'left',
                                    bold:true,
                                    margin: [40,25, 0, 0]
                                             
                                },
                                {
                                    width: '*',
                                    text: 'รายงานสินค้าคงเหลือ',
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
                  
                            widths:  [ 50, 40, 40, "auto","auto", 60,23, 23,20,30,"auto", 20],
                            body: [
                                [ 'วันที่', 'PO', 'PO เดิม','รหัสลูกค้า','รหัสสินค้า','Production\nOrder','พาเลท', 'กล่องที่', 'จำนวนเต็ม','จำนวน\nในกล่อง','ต่าง','หมาย\nเหตุ'],
                        <%
            int marknum = 0;
            int n = 1;
            int n1 = 1;
            int sumqty = 0;
            int sumqty_result = 0;
            int sumdifferent = 0;

            List<String> boxsum = new ArrayList<String>();

            List<String> boxtotal = new ArrayList<String>();
            
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

                String D = (String) list.get(i).getDate_create();
                if (D != null) {
                    D = list.get(i).getDate_create().substring(0, 10);
                }

                if (mark.equals("*")) {
                    marknum++;
                }
                
                String po = list.get(i).getPo();
                if (po.length() > 9) {
                    po = po.substring(0, 9);
                }
                if (n <= 34) {
                    sumqty += Integer.parseInt(ds.ChackNull(qty));
                    sumqty_result += Integer.parseInt(ds.ChackNull(qty_result));
                    sumdifferent += Integer.parseInt(ds.ChackNull(String.valueOf(different)));
                    out.print("[ '" + ds.ChackNull(D) + "','" + ds.ChackNull(po) + "','" + ds.ChackNull(list.get(i).getPo_old()) + "','" + ds.ChackNull(list.get(i).getCustomer_no()) + "','" + ds.ChackNull(list.get(i).getCustomer_product()) + "','" + ds.ChackNull(list.get(i).getProdorder()) + "'," +
                            "'" + ds.ChackNull(list.get(i).getPallet()) + "','" + ds.ChackNull(list.get(i).getBoxno()) + "','" + ds.ChackNull(qty) + "','" + ds.ChackNull(qty_result) + "','" + ds.ChackNull(String.valueOf(different)) + "','" + ds.ChackNull(mark) + "'],");
                    boxsum.add(list.get(i).getBoxno());



                    n1++;
                } else if (n == 35) {
                    int ax = 0;
                    
                    for (String op : boxsum) {
                        if (!boxtotal.contains(op)) {
                            ax++;
                            boxtotal.add(op);
                        }
                    }
                    out.print("[{ text: 'รวม', colSpan: 7 }, '', '', '', '', '', '', '" + ax + "', '" + sumqty + "','" + sumqty_result + "','" + sumdifferent + "','" + (marknum - 1) + "'],");
                    sumqty = 0;
                    sumdifferent = 0;
                    sumqty_result = 0;
                    n = 0;
                    i--;
                    marknum = 0;
                    boxsum.clear();
                 
                }
                if (n1 == list.size() + 1) {
                    int ax = 0;
                   
                    for (String op : boxsum) {
                        if (!boxtotal.contains(op)) {
                            ax++;
                            boxtotal.add(op);
                        }
                    }
                    out.print("[{ text: 'รวม', colSpan: 7  }, '', '', '', '', '', '', '" + ax + "', '" + sumqty + "','" + sumqty_result + "','" + sumdifferent + "','" + (marknum) + "'],");
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
            
            
                            pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>