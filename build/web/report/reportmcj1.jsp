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
               
               
                content: [
                    
            <%
            int n = 0;
            for (BCDetailBox l : listbox) {


                String id1 = l.getSku_item1();
                String size1 = l.getSizen01();
                String col1 = id1.substring(0, id1.length() - size1.length());
                String qty1 = l.getQty1();

              

                int sum = Integer.parseInt(qty1)  ;


            %>
                        {
                            alignment: 'right',
                            text:"CTN : \t<%=l.getBoxno()%>" 
                        },
                        {
                            
                            columns: [
                                {
                                    alignment: 'left',
                                    width: '80%',
                                    text: 'ORDER NO \t<%=l.getPo()%>'
                                },
                                {
                                    alignment: 'right',
                                    width: '20%',
                                    text: '<%=l.getDestination()%>'
                                }
                            
                            ]
                      
                        },
                        {
                            alignment: 'center',
                            table: {
                           
                                // headers are automatically repeated if the table spans over multiple pages
                                // you can declare how many rows should be treated as headers
                                headerRows: 1,
                            
                                widths:  ["*","auto",20,20,20,"auto"],
                                body: [
                                    [ 'ART.NO/COL.', '<%=size1%>', '\t', '\t', '\t', 'TOTAL'],
                                        [ '<%=col1%>', '<%=qty1%>', '', '', '', ''],
                                            [ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', ''],
                                                 [ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', ''],
                                                    [ { text: '\t', preserveLeadingSpaces: true}, '', '', '', '', ''],
                                                        [ 'TOTAL', '', '', '', '', '<%=String.valueOf(sum)%>'],
                        
                        
                        
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
                                                fontSize: 18                                           
                                            }
                                        }
            
            
                                        pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>