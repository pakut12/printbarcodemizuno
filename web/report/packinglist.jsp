<%-- 
    Document   : packinglist
    Created on : 17 ?.?. 2566, 11:43:50
    Author     : pakutsing
--%>
<%@page import="com.pg.lib.service.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="com.pg.lib.utility.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<%@page contentType="text/html" pageEncoding="TIS-620"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
        <script src="../js/pdfmake.min.js"></script>
        <script src="../js/vfs_fonts.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <script>
            <%
            String id = request.getParameter("id").trim();
            List<BCInvoice> inv = PackingListService.getPackingListByid(id);

            /*****************  set header **************/
            String invoiceno = inv.get(0).getInvoiceno();
            String pono = "";
            String ctnno = "";

            for (BCInvoice i : inv) {
                pono += i.getPo() + ",";
                ctnno += i.getFirstdigit() + i.getStartbox() + "-" + i.getFirstdigit() + i.getEndbox();
            }

            pono = pono.substring(0, pono.length());
            ctnno = ctnno.substring(0, ctnno.length());
            /*****************  end set header **************/
         
            String datatable1 = "";


            try {

                String data[];
                int totalqty = 0;
                int totalctn = 0;
                int totalnw = 0;
                int totalgw = 0;

                for (BCInvoice i1 : inv) {
   /******************************  set table1 ********************************************/
                    List<String> listseq = new ArrayList<String>();
                    List<BCDetailBox> inva = PackingListService.GroupCustomerNoByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox());


                    HashMap<String, BCDetailBox> listtotal = new HashMap<String, BCDetailBox>();

                    for (BCDetailBox ae : inva) {
                        if (!listseq.contains(ae.getBoxseq())) {
                            listseq.add(ae.getBoxseq());
                        }
                    }
                    String txt = "";
                    for (String seq : listseq) {
                        List<BCDetailBox> x = PackingListService.GroupCustomerNoBySEQ(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);

                        String group = Utility.groupnumber(x);
                        
                        List<String> grouppo = new ArrayList<String>();

                        for (BCDetailBox ae : x) {
                            String rt = ae.getPo() + "#" + ae.getFirstdigit() + "#" + ae.getBoxno();
                            grouppo.add(rt);
                        }

                        List<BCDetailBox> listsizebypo = PackingListService.GroupCustomerSizeByPO(i1.getPo(), i1.getFirstdigit(), i1.getStartbox(), i1.getEndbox(), seq);

                        HashMap<String, BCDetailBox> arrsize = new HashMap<String, BCDetailBox>();

                        for (BCDetailBox z : listsizebypo) {
                            arrsize.put(z.getCustomer_size(), z);
                        }

                        String[] size = {"XXS", "XS", "S", "M", "L", "XL", "XXL", "XXXL"};

                        String sizetxt = "";

                        int qty = 0;
                        int ctn = 0;
                        double nw = 0;
                        double gw = 0;
                        String DESTINATION = "";
                        String Color = "";

                        for (String s : size) {
                            BCDetailBox getsize = arrsize.get(s);
                            if (getsize == null) {
                                sizetxt += "{text: '',border: [false, false, false, false]},";
                            } else {

                                if (getsize.getCustomer_size().equals(getsize.getSizen01())) {
                                    qty += Integer.parseInt(getsize.getQty_result1());
                                    sizetxt += "{text: '" + getsize.getQty_result1() + "',border: [false, false, false, false]},";
                                } else if (getsize.getCustomer_size().equals(getsize.getSizen02())) {
                                    qty += Integer.parseInt(getsize.getQty_result2());
                                    sizetxt += "{text: '" + getsize.getQty_result2() + "',border: [false, false, false, false]},";
                                } else if (getsize.getCustomer_size().equals(getsize.getSizen03())) {
                                    qty += Integer.parseInt(getsize.getQty_result3());
                                    sizetxt += "{text: '" + getsize.getQty_result3() + "',border: [false, false, false, false]},";
                                } else if (getsize.getCustomer_size().equals(getsize.getSizen04())) {
                                    qty += Integer.parseInt(getsize.getQty_result4());
                                    sizetxt += "{text: '" + getsize.getQty_result4() + "',border: [false, false, false, false]},";
                                }



                                Color = getsize.getCustomer_color();
                                ctn = Integer.parseInt(getsize.getCountbox());
                                nw = Double.parseDouble(getsize.getSumnw());
                                gw = Double.parseDouble(getsize.getSumgw());
                                if (getsize.getDestination() == null) {
                                    DESTINATION = "";
                                } else {
                                    DESTINATION = getsize.getDestination();
                                }


                            }
                        }


                        txt += "[";
                        txt += "{text: '" + group + "',border: [false, false, false, false]},";
                        txt += "{text: '" + Color + "',border: [false, false, false, false]},";
                        txt += "{text: '" + i1.getPo() + "',border: [false, false, false, false]},";
                        txt += sizetxt;
                        txt += "{text: '" + DESTINATION + "',border: [false, false, false, false]},";
                        txt += "{text: '" + ctn + "',border: [false, false, false, false]},";
                        txt += "{text: '" + qty + "',border: [false, false, false, false]},";
                        txt += "{text: '" + nw + "',border: [false, false, false, false]},";
                        txt += "{text: '" + gw + "',border: [false, false, false, false]},";
                        txt += "],\n";


                        totalctn += ctn;
                        totalqty += qty;
                        totalnw += nw;
                        totalgw += gw;


                    }

                    txt += "[{text: 'TOTAL',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '',border: [false, true, false, true]},{text: '" + totalctn + "',border: [false, true, false, true]},{text: '" + totalqty + "',border: [false, true, false, true]},{text: '" + totalnw + "',border: [false, true, false, true]},{text: '" + totalgw + "',border: [false, true, false, true]}],";
                    datatable1 += txt;
                    
                       /******************************  end set table1 ********************************************/
                    
                    
                    
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

         
            /***************************** set table2 ***************************************/
           
            try {
                
                
                
                
                
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }


            /***************************** end set table2 ***************************************/

            %>
            
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
            
                var docDefinition = {
                    pageSize: {
                        width: 600,
                        height: 800
                    },
                    pageMargins: [20, 70, 30, 30 ],
                    footer: function(currentPage, pageCount) { 
                        return [
                            { 
                                width: '*',
                                text: '<%=invoiceno%>',
                                fontSize: 14,
                                alignment:'center',
                                bold: true                            
                            }
                        ]
                    },
                    header: function(currentPage, pageCount, pageSize) {
                  
                            
                        return [
                            {
                                columns: [
                                    {
                                        width: 255,
                                        alignment: 'left',
                                        text: [{text:'THAI SPORTS GARMENT CO.LTD',bold:true,fontSize:15},{text:'\n666 RAMA 3 ROAD,YANNAWA, BANGKOK 10120 THAILAND',bold:false,fontSize:12}],
                                        margin: [25, 10]
                                    },
                                    { 
                                        width: '*',
                                        alignment: 'left',
                                        text: 'PACKING LIST', 
                                        decoration: 'underline', 
                                        decorationStyle: 'double' ,
                                        bold:true,
                                        margin: [20, 10]
                                    },
                                    {
                                        width: '*',
                                        alignment: 'right',
                                        text: 'Page : '+currentPage,
                                        margin: [30, 10]
                                    },
                                ]       
                            }
                        ]
                    },
                    content: [
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'INVOICE NO. ',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'DATED ' 
                                },
                                {
                                    width: '*',
                                    text:''
                                }
                            ]
                                                
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'TERMS OF PAYMENY : T/T : SAVING NO.1140933894',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'MARKS & NOS.',
                                    alignment: 'center',
                                    bold:true
                                }
                            ]
                                           
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'ISSUED BY : BANGKOK BANK PUBLIC CO.,LTD.',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'',
                                    alignment: 'center',
                                    bold:true
                                }
                            ]  
                        },
                        {
                            style:['headercontent'],
                            columns: [
                                {
                                    width: '*',
                                    text:'\t\t\tBUKKHALO BRANCH,THAILAND',
                                    bold:true
                                },
                                {
                                    width: '*',
                                    text:'MUS\nNORCROSS,GA\nVIA DOWNEY,CA',
                                    alignment: 'center',
                                    bold:true
                                }
                            ]  
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'PO.NO. ',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'CTN.NO.',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'MADE IN THAILAND',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'CARTON MEAS : 38x57x40 CMS.'
                                },
                                {
                                    width: '*',
                                    text:'',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'VOLUMN : 0.087 M3/CARTON'
                                },
                                {
                                    width: '*',
                                    text:'SHIP PER : CCNI ANGOL V327W',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:''
                                },
                                {
                                    width: '*',
                                    text:'FROM : LAEM CHABANG,THAILAND',
                                    alignment: 'center'
                                }
                            ]
                        },
                        {
                            style:['headercontent'],
                            alignment: 'justify',
                            columns: [
                                {
                                    width: '*',
                                    text:'REMARK : ',
                                    alignment: 'center'
                                },
                                {
                                    width: '*',
                                    text:'TO : ATLANTA,USA',
                                    alignment: 'center'
                                }
                            ]
                        },
               
                        {
                            style: 'tbcontent',
                            table: {
                                headerRows: 1,
                                widths: [ '*', 'auto','*', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto' , 'auto'],
                                body: [
                                    [
                                        {text: 'CTN.\nNO.',border: [false, true, false, true]}, 
                                        {text: 'DESCRIPTION', border: [false, true, false, true]}, 
                                        {text: 'PO', border: [false, true, false, true]},
                                        {text: '.02\nXXS', border: [false, true, false, true]},
                                        {text: '.03\nXS', border: [false, true, false, true]},
                                        {text: '.04\nS', border: [false, true, false, true]},
                                        {text: '.05\nM', border: [false, true, false, true]},
                                        {text: '.06\nL', border: [false, true, false, true]},
                                        {text: '.07\nXL', border: [false, true, false, true]},
                                        {text: '.08\nXXL', border: [false, true, false, true]},
                                        {text: '.09\nXXXL', border: [false, true, false, true]},
                                        {text: '', border: [false, true, false, true]},
                                        {text: 'TOTAL\nCTN.', border: [false, true, false, true]},
                                        {text: '\nQTY', border: [false, true, false, true]},
                                        {text: 'WEIGHT\nN.W.', border: [false, true, false, true]},
                                        {text: '\nG.W.', border: [false, true, false, true]},
                                    ],
                                <%=datatable1%>
                                
                                                    ]
                                                }
                        
                                            },
                                            {
                                            
                                                style: 'tbcontent',
                                                table: {
                                                    headerRows: 1,
                                                    widths: [ '*', 'auto','*', 'auto', 'auto','auto', 'auto','auto', 'auto', 'auto','auto', 'auto','auto' ],
                                                    body: [
                                                        [
                                                            {text: 'DESCRIPTION',border: [false, true, false, true]}, 
                                                            {text: '', border: [false, true, false, true]}, 
                                                            {text: '\nSIZE', border: [false, true, false, true]},
                                                            {text: '.02\nXXS', border: [false, true, false, true]},
                                                            {text: '.03\nXS', border: [false, true, false, true]},
                                                            {text: '.04\nS', border: [false, true, false, true]},
                                                            {text: '.05\nM', border: [false, true, false, true]},
                                                            {text: '.06\nL', border: [false, true, false, true]},
                                                            {text: '.07\nXL', border: [false, true, false, true]},
                                                            {text: '.08\nXXL', border: [false, true, false, true]},
                                                            {text: '.09\nXXXL', border: [false, true, false, true]},
                                                            {text: 'TOTAL\n(PC)', border: [false, true, false, true]},
                                                            {text: '', border: [false, false, false, false]},
                                                        ],
                         
                                
                                                    ]
                                                }
                        
                                            }
                                          
                                        ],
                                        styles: {
                                            headercontent: {
                                                fontSize: 13,
                                                bold: true,
                                                margin: [45, 2] 
                                            },
                    
                                            tbcontent: {
                                                fontSize: 12,
                                                bold: true,
                                                margin: [10, 2],
                                                alignment:'center'                      
                                            }
                    
                                        },
                                        defaultStyle: {
                                            font: 'THSarabunNew',
                                            fontSize: 15,
                                            bold:true
                                        }
                                    };
                                    pdfMake.createPdf(docDefinition).open({}, window); 
        
    
    
        </script>
    </body>
</html>