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
            function textToBase64Barcode(text){
                var canvas = document.createElement("canvas");
                JsBarcode(canvas, text, {format: "CODE39",displayValue: false});
                return canvas.toDataURL("image/png");
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
                    width: 460,
                    height: 390
                },
                pageMargins: [ 10,10,10,10],
                
                content: [
                    
                    {
                        columns: [
                            {
                               
                                text:"Ship To : MUS\n MIZUNO USA INC.\n BRASELTON DC\n 920 HIGHWAY 124\nBRASELTON GA 30517 USA"
                            },
                            {
                                text:"Ship From : TSG\n THAI SPORTS GARMENT CO.,LTD.\n 666 RAMA 3 ROAD\n BANGPONGPANG YANNAWA \nBANGKOK 10120 THAILAND	"
                            }
                        ]
                    },
                    {
                        width: 'auto',
                        columns: [
                            [
                                {
                                    columns: [
                                        {text: "Qty"},
                                        {text: "30"},
                                        {text: "UOM"},
                                    ]
                                },
                                {
                                    width: 'auto',
                                    columns: [
                                        {image: textToBase64Barcode("40"),width: 100, height: 20},
                                        {text: "PR"}
                                    ]
                                }
                            ],
                            [
                                {
                                    width: 'auto',
                                    columns: [
                                        {
                                            text: "171909-OP",
                                            alignment:'center'
                                        },
                                    ]
                                },
                                {
                                    width: 'auto',
                                    columns: [
                                        {
                                            image: textToBase64Barcode("123"),
                                            width: 130, 
                                            height: 20,
                                            margin: [ 5, 2, 10, 0 ]
                                        }
                                    ]
                                }
                            ],
                            {
                                text:"Description \n  PREMIER SHORT PANT DARK CHARCOAL"
                            }
                            
                        ]
                        
                    },
                    {
                        width: 'auto',
                        columns: [
                            [
                                {
                                    text: "PR"   
                                },
                                {
                                    width: 'auto',
                                    columns: [
                                        {
                                            image: textToBase64Barcode("40"),
                                            width: 100, 
                                            height: 100,
                                            alignment:'center'
                                        },
                                        
                                    ]
                                }
                            ],
                            
                        ],
                        alignment:'center'
                    },
                ]
            };
            
            pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>