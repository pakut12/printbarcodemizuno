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
            String customer = (String) request.getParameter("customer").trim();

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
                                    text: 'รายงานแสดงพีโอ',
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
                            fontSize: 20,
                            widths:  ["*","*"],
                            body: [
                                [ 'วันที่', 'PO'],
                        <%
            DetailService ds = new DetailService();

            for (int i = 0; i < list.size(); i++) {
                out.print("['" + list.get(i).getDate_create() + "','" + list.get(i).getPo() + "'],");
            }
                        %>
                                            ]
                                        
                                        }   
                                    }
                       
                                ],
                                styles: {
                                },
                                defaultStyle: {
                                    font: 'THSarabunNew',
                                    bold:true
                                }
                            }
            
            
                            pdfMake.createPdf(dd).download('<%=customer%>.pdf');  
            
        </script>
    </body>
</html>