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
                    width: 590,
                    height: 410
                },
                pageMargins: [ 40, 75, 10,17],
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
                        },
                        {
                            columns: [
                                {
                                    width: '*',
                                    text: [{text:'พาเลท : ',bold:true},{text:'asd'},],
                                    fontSize: 14,
                                    alignment: 'left',
                                    margin: [40,0, 0, 0]
                                             
                                },
                                {
                                    width: '*',
                                    text: [{text:'รหัสลูกค้า : ',bold:true},{text:'asd',bold:true}],
                                    fontSize: 14,
                                    alignment: 'center',
                                
                                    margin: [0,0, 0, 0]
                                },
                                {
                                    width: '*',
                                    text:[{text:'รหัสสินค้า : ',bold:true},{text:'asd'}],
                                    fontSize: 14,
                                    alignment: 'right',
                                    margin: [0,0, 40, 0]
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
                                h: 335,
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
                        table: {
                            // headers are automatically repeated if the table spans over multiple pages
                            // you can declare how many rows should be treated as headers
                            headerRows: 1,
                            widths:  [ '*', '*', '*', '*', '*', '*', '*'],
                            body: [
                                [ 'วันที่', 'PO', 'Production Order','รหัสลูกค้า','กล่องที่','จำนวน','หมายเหตุ' ],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7'],
                                [ '1', '2', '3', '4', '5', '6', '7']
                                
                            ]
                        }   
                    }
                       
                ],
                defaultStyle: {
                    font: 'THSarabunNew'
                }
            }
            
            
            pdfMake.createPdf(dd).open({}, window); 
        </script>
    </body>
</html>