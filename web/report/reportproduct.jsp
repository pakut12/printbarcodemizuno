<%-- 
    Document   : index
    Created on : 5 ก.ย. 2565, 19:05:01
    Author     : Gus
--%>

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
            String mrno = request.getParameter("mrno");
            String palet = request.getParameter("palet");
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
                    width: 500,
                    height: auto
                },
                pageMargins: [ 40, 40, 40,40],
               

                content: [
                    'ฟหกฟหกฟหกกฟห'
                    
                ],
                defaultStyle: {
                    font: 'THSarabunNew'
                }
            }
            
            
            pdfMake.createPdf(dd).open({}, window); 
                
            
            
        </script>
    </body>
</html>