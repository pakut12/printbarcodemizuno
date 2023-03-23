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
        
        
        <script>
            
            function textToBase64Barcode(text,show){
                var canvas = document.createElement("canvas");
                if(show == 1 ){
                    JsBarcode(canvas, text, {format: "CODE39",displayValue: true,fontSize:25});
                }else{
                    JsBarcode(canvas, text, {format: "CODE39",displayValue: false});
                }
                console.log(canvas.toDataURL("image/jpg"))
                return canvas.toDataURL("image/jpg");
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
                    width: 453,
                    height: 390
                },
                pageMargins: [ 10,10,10,10],
                content: [
               
                    {image: textToBase64Barcode('1234567890',1),width: 130,height: 30}
                   
                ]
            }
            pdfMake.createPdf(dd).open({}, window); 
            
            
        </script>
    </body>
</html>