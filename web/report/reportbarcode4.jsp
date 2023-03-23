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
            String start = request.getParameter("start").trim();
            String end = request.getParameter("end").trim();
            String num = request.getParameter("num").trim();
            String firstdigit = request.getParameter("firstdigit").trim();

            DetailService ds = new DetailService();
            List<BCDetailBox> listbox = ds.GetDetailBoxForPrint(po, start, end, firstdigit);

        %>
        
        <script>
            function textToBase64Barcode(text,show){
                var canvas = document.createElement("canvas");
                if(show == 1 ){
                    JsBarcode(canvas, text, {format: "CODE128",displayValue: true,fontSize:30,fontOptions:"bold"});
                }else{
                    JsBarcode(canvas, text, {format: "CODE128",displayValue: false});
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
                    width: 450,
                    height: 390
                },
                pageMargins: [ 10,10,10,10],
                background: [
                    {
                        canvas: [
                            {
                                type: 'rect',
                                x: 0,
                                y: 83,
                                w: 500,
                                h: 0,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 0,
                                y: 134,
                                w: 500,
                                h: 0,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 0,
                                y: 185,
                                w: 500,
                                h: 0,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 230,
                                y: 0,
                                w: 0,
                                h: 83,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 230,
                                y: 135,
                                w: 0,
                                h: 50,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 150,
                                y: 83,
                                w: 0,
                                h: 51,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 295,
                                y: 83,
                                w: 0,
                                h: 51,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 230,
                                y: 166,
                                w: 250,
                                h: 0,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 118,
                                y: 185,
                                w: 0,
                                h: 100,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 230,
                                y: 185,
                                w: 0,
                                h: 100,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            },
                            {
                                type: 'rect',
                                x: 332,
                                y: 185,
                                w: 0,
                                h: 100,
                                r: 0,
                                lineWidth: 1,
                                lineColor: '#000000'
                            }
                           
                           
                        ]
                    }
                            
                ],
                content:[
                  <%for (int i = 0; i < listbox.size(); i++) {%>
                              {
                                  columns: [
                                      {
                                          width: '*',
                                          text:"Ship To : <%=listbox.get(i).getShipto()%>\n <%=listbox.get(i).getStaddress1()%>\n <%=listbox.get(i).getStaddress2()%>\n <%=listbox.get(i).getStaddress3()%>\n<%=listbox.get(i).getStaddress4()%>",
                                          margin: [ 0, 0,0, 5 ]
                                      },
                                      {  
                                          width: '*',
                                          text:"Ship From : <%=listbox.get(i).getShipfrom()%>\n <%=listbox.get(i).getSfaddress1()%>\n <%=listbox.get(i).getSfaddress2()%>\n <%=listbox.get(i).getSfaddress3()%>\n<%=listbox.get(i).getSfaddress4()%>",
                                          margin: [ 10, 0,0, 5 ]
                                      },
                                  ],
                                  bold: true
                              },
                              {
                                  width: '*',
                                  columns: [
                                      [
                                          {
                                              columns: [
                                                  {text: "Qty"},
                                                  {text: "<%=listbox.get(i).getQtyperbox()%>"},
                                                      {text: "UOM"},
                                                  ]
                                              },
                                              {
                                                  width: '*',
                                                  columns: [
                                                      {image: textToBase64Barcode("<%=listbox.get(i).getQtyperbox()%>"),width: 100, height: 20},
                                                          {text: "PR"}
                                                      ]
                                                  }
                                              ],
                                              [
                                                  {
                                                      width: '*',
                                                      columns: [
                                                          {
                                                              text: "<%=listbox.get(i).getPo()%>",
                                                              alignment:'center'
                                                          },
                                                      ]
                                                  },
                                                  {
                                                      width: '*',
                                                      columns: [
                                                          {
                                                              image: textToBase64Barcode("<%=listbox.get(i).getPo()%>"),
                                                              width: 130, 
                                                              height: 20,
                                                              margin: [ 5, 2, 10, 0 ]
                                                          }
                                                      ]
                                                  }
                                              ],
                                              {
                                                  width: '*',
                                                  text:"Description \n  <%=listbox.get(i).getDesctxt()%>",
                                                  margin: [ 0, 0,0, 10 ],
                                                  
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
                                                          y: 162
                                                      }
                                                  },
                                                  {
                                                      text: "CTN DIMES : 38X57X40 CMS\nG.W/N.W: \t<%=listbox.get(i).getGrossweight()%> \tKGS/\t<%=listbox.get(i).getNetweight()%>\t KGS\nCBM: 0.087 M",
                                                      margin: [ 0, 0,0, 5 ],
                                                      alignment:'left'
                                                  },
                                              ],
                                              [
                                                  {
                                                      text: [{text:"Country of Origin"},{text:"\nTHAILAND"}],
                                                      alignment:'center',
                                                      fontSize: 10
                                                 
                                                  },
                                                  {
                                                      text: "Carton <%=listbox.get(i).getBoxno()%>  of <%=listbox.get(i).getAllbox()%>",
                                                      alignment:'center',
                                                      margin: [ 0, 9,0, 0 ],
                                                      fontSize: 10
                                                  }
                                              ]
                            
                                          ],
                                          bold: true
                        
                                      },
                                      {
                                          margin: [ 0, 3,0, 0 ],
                                          text:"MIZUNO SKU",
                                          bold: true,
                                          fontSize: 10
                                      },
                                      {
                                          margin: [ 0, 1,0, 0 ],
                                          columns: [
                                              {
                                                  text:"<%=listbox.get(i).getSku_item1()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getSku_item2()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getSku_item3()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getSku_item4()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              }
                                          ],
                                          bold: true
                                      },
                                      {
                                          columns: [
                                              {
                                                  image: textToBase64Barcode("<%=listbox.get(i).getUpc_code1()%>",1),
                                                  width: 90, 
                                                  height: 50,
                                                  margin: [ 10, 0, 0, 0 ]
                                              },
                                              {
                                                  image: textToBase64Barcode("<%=listbox.get(i).getUpc_code2()%>",1),
                                                  width: 90, 
                                                  height: 50,
                                                  margin: [ 25, 0, 0, 0 ]
                                              },
                                              {
                                                  image: textToBase64Barcode("<%=listbox.get(i).getUpc_code3()%>",1),
                                                  width: 90, 
                                                  height: 50,
                                                  margin: [ 45, 0, 0, 0 ]
                                              },
                                              {
                                                  image: textToBase64Barcode("<%=listbox.get(i).getUpc_code4()%>",1),
                                                  width: 90, 
                                                  height: 50,
                                                  margin: [ 60, 0, 0, 0 ]
                                              }
                                          ],
                                          bold: true
                                           
                                      },
                                      {
                                          columns: [
                                              {
                                                  columns: [
                                                      {
                                                          text:"Qty",
                                                          alignment:'center',
                                                          fontSize: 8
                                                      },
                                                      {
                                                          text:"<%=listbox.get(i).getQty1()%>",
                                                          alignment:'center',
                                                          fontSize: 8
                                                      }                                                      
                                                  ]
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getQty2()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getQty3()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getQty4()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              }
                                              
                                          ],
                                          bold: true
                                          
                                      },
                  
                                      {
                                          columns: [
                                              {
                                                  columns: [
                                                      {
                                                          width: '*',
                                                          text:"DESC",
                                                          alignment:'center',
                                                          fontSize: 8
                                                      },
                                                      {
                                                          width: '*',
                                                          text:"<%=listbox.get(i).getColorn01()%>\t<%=listbox.get(i).getSizen01()%>",
                                                          alignment:'center',
                                                          fontSize: 8
                                                      }                                                      
                                                  ]
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getColorn02()%>\t<%=listbox.get(i).getSizen02()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getColorn03()%>\t<%=listbox.get(i).getSizen03()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              },
                                              {
                                                  text:"<%=listbox.get(i).getColorn04()%>\t<%=listbox.get(i).getSizen04()%>",
                                                  alignment:'center',
                                                  fontSize: 8
                                              }
                                              
                                          ],
                                          bold: true
                                          <%
                                         if(i != listbox.size()-1){
                                         out.print(",pageBreak: 'after'");
                                          
                                         }
                                         %>
                                      },
                  <%}%>
                                      
                                  ]
                              };
            
                              pdfMake.createPdf(dd).open({}, window); 
            
        </script>
    </body>
</html>