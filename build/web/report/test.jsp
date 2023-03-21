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
                content:[
                    
                    {
                        columns: [
                            {
                                text:"Ship To : MUS\n MIZUNO USA INC.\n BRASELTON DC\n 920 HIGHWAY 124\nBRASELTON GA 30517 USA"
                            },
                            {
                                text:"Ship From : TSG\n THAI SPORTS GARMENT CO.,LTD.\n 666 RAMA 3 ROAD\n BANGPONGPANG YANNAWA \nBANGKOK 10120 THAILAND	"
                            },
                        ],
                        bold: true
                        
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
                            
                        ],
                        bold: true
                    },
             
                    {
                        
                       
                        columns: [
                            [
                                {
                                    text: "3",
                                    alignment:'left',
                                    fontSize: 8,
                                    absolutePosition: {
                                        x: 87,
                                        y: 150
                                    }
                                },
                                {
                                
                                    text: "CTN DIMES : 38X57X40 CMS\nG.W/N.W: 10.9 KGS/9.6 KGS\nCBM: 0.087 M",
                                    alignment:'left'
                                
                                },
                            ],
                            [
                                {
                                    text: "Country of Origin\nTHAILAND",
                                    alignment:'center'
                                },
                                {
                                    text: "Carton A1 of A11",
                                    alignment:'center'
                                }
                            ]
                            
                        ],
                        bold: true
                        
                    },
                    {
                       
                        columns: [
                            {
                                text:"350007.0000.03.XS",
                                alignment:'center',
                                fontSize: 20
                                
                            },
                            
                            
                        ],
                        bold: true
                        
                    },
                    {
                       
                        columns: [
                            {
                                
                                image: textToBase64Barcode("889961333248",1),
                                width: 250, 
                                height: 70,
                                margin: [ 90, 0, 0, 0 ]
                            },
                            
                            
                        ],
                        bold: true
                        
                    },
                  
                ]
            };
            
            pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>