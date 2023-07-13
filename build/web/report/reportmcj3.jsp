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
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jsbarcode/3.6.0/JsBarcode.all.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String po = request.getParameter("po").trim();

            String start = request.getParameter("startbox").trim();

            String end = request.getParameter("endbox").trim();

            String firstdigit = request.getParameter("firstdigit").trim();

            String budget_month = request.getParameter("budget_month").trim();
            DetailService ds = new DetailService();
            List<BCDetailBox> listbox = ds.GetDetailBoxForPrint(po, start, end, firstdigit);




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
                    width: 430,
                    height: 350
                },
                pageMargins: [ 10, 10, 10,10],
                <%
            if (!budget_month.isEmpty()) {
                    %>
                    
                            background: [
                            
                                {
                                    canvas: [
                                        {
                                            type: 'rect',
                                            x: 140,
                                            y: 7,
                                            w: 50,
                                            h: 25,
                                            r: 0,
                                            lineWidth: 1,
                                            lineColor: '#000000'
                                        }
                            
                                    ]
                                }
                            
                            ],
        <%            }
                %>
               
                        content: [
                    
                        
                        
            <%
            int n = 0;
            class ColSizePair {

                private String col;
                private String qty;
                private String size;

                public ColSizePair(String col, String qty, String size) {
                    this.col = col;
                    this.qty = qty;
                    this.size = size;
                }

                public String getCol() {
                    return col;
                }

                public String getQty() {
                    return qty;
                }

                public String getSize() {
                    return size;
                }
            }




            for (BCDetailBox l : listbox) {


                String id1 = l.getSku_item1();
                String size1 = l.getSizen01();
                String col1 = id1.substring(0, id1.length() - size1.length());
                String qty1 = l.getQty1();


                String id2 = l.getSku_item2();
                String size2 = l.getSizen02();
                String col2 = id2.substring(0, id2.length() - size2.length());
                String qty2 = l.getQty2();

                String id3 = l.getSku_item3();
                String size3 = l.getSizen03();
                String col3 = id3.substring(0, id3.length() - size3.length());
                String qty3 = l.getQty3();






                String widths = "['*',";
                String header = " [{ text: 'ART.NO/COL.',fontSize: 18},";
                String[] listsize = {size1, size2, size3};
                List<String> listsizeup = new ArrayList<String>();

                for (String arr : listsize) {
                    if (!listsizeup.contains(arr)) {
                        listsizeup.add(arr);
                    }

                }

                for (String arr : listsizeup) {
                    if (!header.contains("{ text: '" + arr + "',fontSize: 15}")) {
                        header += "{ text: '" + arr + "',fontSize: 15},";
                        widths += "'auto',";
                    } else {
                        header += "{ text: '\t',fontSize: 15},";
                        widths += "15,";
                    }
                }

                if (listsizeup.size() == 2) {
                    header += "{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15}, 'TOTAL'],";
                    widths += "15,15,15,'auto'],";
                } else if (listsizeup.size() == 3) {
                    header += "{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15}, 'TOTAL'],";
                    widths += "15,15,'auto'],";
                } else if (listsizeup.size() == 1) {
                    header += "{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15},{ text: '\t',fontSize: 15}, 'TOTAL'],";
                    widths += "15,15,15,15,'auto'],";
                }



                String Destination = "";
                if (l.getDestination() != null) {
                    Destination = l.getDestination();
                }


                List<ColSizePair> liststy = new ArrayList<ColSizePair>();
                liststy.add(new ColSizePair(col1, qty1, size1));
                liststy.add(new ColSizePair(col2, qty2, size2));
                liststy.add(new ColSizePair(col3, qty3, size3));

                

                // Sort the list
                

                String text = "";
                int w = 0;
                for (ColSizePair pair : liststy) {
                    String col = pair.getCol();
                    String qty = pair.getQty();
                    String size = pair.getSize();

                    if (col.equals(col1)) {
                        if (!text.contains("{ text: '" + col1 + "',fontSize: 22}")) {
                            w += 1;
                            int sum1 = 0;

                            text += "[{ text: '" + col1 + "',fontSize: 22},";
                            String xz = "";
                            int vf = 0;
                            int sty = 0;
                            
                            for (ColSizePair pair1 : liststy) {
                                String colx = pair1.getCol();
                                String qtyx = pair1.getQty();
                                String sizex = pair1.getSize();

                                if (colx.equals(col)) {
                                    text += "{ text: '" + qtyx + "',fontSize: 22},";
                                    sum1 += Integer.parseInt(qtyx);
                                    sty++;
                                } else if (sizex.equals(size1)) {

                                    if (colx.equals(col)) {
                                        text += "{ text: '" + qtyx + "',fontSize: 22},";
                                        sum1 += Integer.parseInt(qtyx);
                                        sty++;
                                    } else {
                                        sty++;
                                        continue;
                                    }

                                } else {
                                    if (listsizeup.size() == 3) {
                                        text += "'',";
                                        sty++;
                                        System.out.println(1);
                                    } else if (vf == 0) {
                                        text += "'',";
                                        vf++;
                                        sty++;
                                        System.out.println(2);
                                    } else {
                                        sty++;
                                        System.out.println(3);
                                        continue;
                                        
                                    }


                                }

                            }


                            int b = 0;
                            for (int b1 = 0; b1 <= 7; b1++) {
                                int a = b1 + sty;

                                if (a == 7) {
                                    if (listsizeup.size() == 3) {
                                        b = b1 - 2;
                                    } else if (listsizeup.size() == 2) {
                                        b = b1 - 1;
                                    } else {
                                        b = b1;
                                    }

                                }
                            }

                            System.out.println(listsizeup.size());
                            for (int v = 0; v < b; v++) {
                                text += "'',";
                            }
                            text += "{ text: '" + sum1 + "',fontSize: 25}],";
                        }

                    } else if (col.equals(col2)) {
                        if (!text.contains("{ text: '" + col2 + "',fontSize: 22}")) {
                            w += 1;
                            int sum2 = 0;

                            text += "[{ text: '" + col2 + "',fontSize: 22},";
                            String xz = "";
                            int vf = 0;
                            int sty = 0;
                            
                            for (ColSizePair pair1 : liststy) {
                                String colx = pair1.getCol();
                                String qtyx = pair1.getQty();
                                String sizex = pair1.getSize();

                                if (colx.equals(col)) {
                                    text += "{ text: '" + qtyx + "',fontSize: 22},";
                                    sum2 += Integer.parseInt(qtyx);
                                    sty++;
                                } else if (sizex.equals(size2)) {

                                    if (colx.equals(col)) {
                                        text += "{ text: '" + qtyx + "',fontSize: 22},";
                                        sum2 += Integer.parseInt(qtyx);
                                        sty++;
                                    } else {
                                        sty++;
                                        continue;
                                    }

                                } else {
                                    if (listsizeup.size() == 3) {
                                        text += "'',";
                                        sty++;
                                    } else if (vf == 0) {
                                        text += "'',";
                                        vf++;
                                        sty++;
                                    } else {
                                        sty++;
                                        continue;
                                    }


                                }

                            }


                            int b = 0;
                            for (int b1 = 0; b1 <= 7; b1++) {
                                int a = b1 + sty;

                                if (a == 7) {
                                    if (listsizeup.size() == 3) {
                                        b = b1 - 2;
                                    } else if (listsizeup.size() == 2) {
                                        b = b1 - 1;
                                    } else {
                                        b = b1;
                                    }


                                }
                            }


                            for (int v = 0; v < b; v++) {
                                text += "'',";
                            }

                            text += "{ text: '" + sum2 + "',fontSize: 25}],";
                        }
                    } else if (col.equals(col3)) {
                        if (!text.contains("{ text: '" + col3 + "',fontSize: 22}")) {
                            w += 1;
                            int sum3 = 0;

                            text += "[{ text: '" + col3 + "',fontSize: 22},";
                            String xz = "";
                            int vf = 0;
                            int sty = 0;
                            
                            for (ColSizePair pair1 : liststy) {
                                String colx = pair1.getCol();
                                String qtyx = pair1.getQty();
                                String sizex = pair1.getSize();

                                if (colx.equals(col)) {
                                    text += "{ text: '" + qtyx + "',fontSize: 22},";
                                    sum3 += Integer.parseInt(qtyx);
                                    sty++;
                                } else if (sizex.equals(size3)) {

                                    if (colx.equals(col)) {
                                        text += "{ text: '" + qtyx + "',fontSize: 22},";
                                        sum3 += Integer.parseInt(qtyx);
                                        sty++;
                                    } else {
                                        sty++;
                                        continue;
                                    }

                                } else {
                                    if (listsizeup.size() == 3) {
                                        text += "'',";
                                        sty++;
                                    } else if (vf == 0) {
                                        sty++;
                                        text += "'',";
                                        vf++;
                                    } else {
                                        sty++;
                                        continue;
                                    }
                                }

                            }

                            int b = 0;
                            for (int b1 = 0; b1 <= 7; b1++) {
                                int a = b1 + sty;

                                if (a == 7) {
                                    if (listsizeup.size() == 3) {
                                        b = b1 - 2;
                                    } else if (listsizeup.size() == 2) {
                                        b = b1 - 1;
                                    } else {
                                        b = b1;
                                    }

                                }
                            }


                            for (int v = 0; v < b; v++) {
                                text += "'',";
                            }


                            text += "{ text: '" + sum3 + "',fontSize: 25}],";

                        }

                    }




                }


                if (w == 2) {
                    text += "[ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', '', ''],";
                } else if (w == 1) {
                    text += "[ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', '', ''],";
                    text += "[ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', '', ''],";
                }


                int sum = Integer.parseInt(qty1) + Integer.parseInt(qty2) + Integer.parseInt(qty3);


            %>
                        {
                            columns: [
                                
                                {
                                    margin: [ 148, 0, 0, 0 ], 
                                    fontSize: 16,
                                    text: '<%=budget_month%>'
                                    
                                },
                                {
                                    alignment: 'right',
                                    text: "CTN : \t<%=l.getBoxno()%>"
                                }

                            ]
                           
                        },
                        {
                            
                            columns: [
                                {
                                    alignment: 'left',
                                    width: '80%',
                                    text: 'ORDER NO.<%=l.getPo()%>'
                                },
                                {
                                    alignment: 'right',
                                    width: '20%',
                                    text: '<%=Destination%>'
                                }
                            
                            ]
                      
                        },
                        {
                            alignment: 'center',
                            table: {
                           
                                // headers are automatically repeated if the table spans over multiple pages
                                // you can declare how many rows should be treated as headers
                                headerRows: 1,
                                heights: 40, 
                                widths:  <%=widths%>
                                body: [
                                            
 <%

                System.out.println(header);
                out.print(header);
                System.out.println(text);
                out.print(text);


                                            %>
                                            
                                            
                                                                    [ 'TOTAL', '', '', '', '','', { text: '<%=String.valueOf(sum)%>',fontSize: 25}],
                        
                        
                                                                        ]
                                        
                                                                    } 
                                                    <%
                if (n < listbox.size() - 1) {
                                                    %>
                                                                            ,pageBreak: 'after' 
                                                    <%                }
                                                    %>
                                                                           
                                                                        },
                   <%
                n++;
            }
            %>    
                            ],
                            styles: {
                            },
                            defaultStyle: {
                                font: 'Roboto',
                                bold:true,
                                fontSize: 22                                           
                            }
                        }
            
            
                        pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>